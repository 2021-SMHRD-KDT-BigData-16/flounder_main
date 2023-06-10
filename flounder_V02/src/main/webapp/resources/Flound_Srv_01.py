import cv2
import requests
import ultralytics
import os
import matplotlib.pyplot as plt
import io
import logging

from ultralytics import YOLO
from PIL import Image,ImageDraw,ImageFont
from werkzeug.utils import secure_filename
from flask import send_file
from flask import Flask, request, jsonify, redirect
from base64 import encodebytes

# model_path = 'C:/YOLO/yolov8/best_flound_15.pt'
model_path = './best_flound_15.pt'
model = YOLO(model_path)


logger = logging.getLogger(__name__)
formatter = logging.Formatter('[%(asctime)s][%(levelname)s|%(filename)s:%(lineno)s] >> %(message)s')

# handler 생성 (stream, file)
streamHandler = logging.StreamHandler()
fileHandler = logging.FileHandler('./flound_srv.log')

# logger instance에 fomatter 설정
streamHandler.setFormatter(formatter)
fileHandler.setFormatter(formatter)

# logger instance에 handler 설정
logger.addHandler(streamHandler)
logger.addHandler(fileHandler)

# logger instnace로 log 찍기
logger.setLevel(level=logging.DEBUG)
logger.debug('my DEBUG log')

app = Flask(__name__)

def html_root():
    return """<!DOCTYPE html>
            <html>
            <head> 
            <title> Test Page </title>
            </head>
            <body>

            <h1> 테스트 페이지 </h1>

            </body>
            </html>"""

@app.route('/')
def input_data():
    return html_root()

@app.route('/return_json', methods=['POST'])
def return_json():
    file = request.files['image']
    org_file_name = secure_filename(file.filename)
    save_file_name = './images/' + org_file_name

    file.save(save_file_name)
    result = model.predict(source=save_file_name, conf=0.25, save=True)

    logger.debug(f'result[0].boxes.cls : {result[0].boxes.cls}')

    names = model.names

    cls_name = []
    for c in result[0].boxes.cls:
        cls_name.append(names[int(c)])

    return {'detect_sym_code': cls_name}

@app.route('/return_image', methods=['POST'])
def return_image():
    file = request.files['image']
    org_file_name = secure_filename(file.filename)
    save_file_name = './images/' + org_file_name
    predict_file_name = './images/pred_' + org_file_name

    file.save(save_file_name)
    result = model(save_file_name)[0].plot()
    pil_image = Image.fromarray(result[:, :, ::-1])
    pil_image.save(predict_file_name)

    return send_file(predict_file_name)

def get_response_image(image_path):
    pil_img = Image.open(image_path, mode='r')
    byte_arr = io.BytesIO()
    pil_img.save(byte_arr, format='png')
    encoded_img = encodebytes(byte_arr.getvalue()).decode('ascii')
    return encoded_img

@app.route('/detect_disease', methods=['POST'])
def detect_disease():
    file = request.files['image']
    org_file_name = secure_filename(file.filename)
    save_file_name = './images/' + org_file_name
    predict_file_name = './images/pred_' + org_file_name

    file.save(save_file_name)
    result = model(save_file_name)[0].plot()
    pil_image = Image.fromarray(result[:, :, ::-1])
    pil_image.save(predict_file_name)

    result_pred = model.predict(source=save_file_name, conf=0.25, save=True)
    logger.debug(f'result[0].boxes.cls : {result_pred[0].boxes.cls}')

    names = model.names
    cls_name = []
    for c in result_pred[0].boxes.cls:
        cls_name.append(names[int(c)])

    # predict_file_name = 'C:/YOLO/yolov8/images/pred_AMA2221019_02_JPG.rf.10078aa2d64d346f04e32ec25090b38c.jpg'
    logger.debug(f'predict_file_name : {predict_file_name}')
    encoded_img = get_response_image(predict_file_name)

    # response = {'Status': 'Success', 'detect_sym_code': cls_name}
    response = {'Status': 'Success', 'detect_sym_code': cls_name, 'ImageBytes': encoded_img}
    logger.debug(f'response : {response}')
    return jsonify(response)

@app.route('/detect_dis', methods=['POST'])
def detect_dis():
    msg = 'start'
    logger.debug(f'detect_dis : {msg}')
    file = request.files['org_image']
    # dd_email = request.form['dd_email']
    # logger.debug(f'dd_email : {dd_email}')

    org_file_name = secure_filename(file.filename)
    save_file_name = 'org_' + org_file_name
    predict_file_name = 'pred_' + org_file_name

    file = request.files['org_image']
    dd_email = request.form['dd_email']
    logger.debug(f'dd_email : {dd_email}')

    file.save(save_file_name)
    result = model(save_file_name)[0].plot()
    pil_image = Image.fromarray(result[:, :, ::-1])
    pil_image.save(predict_file_name)

    result_pred = model.predict(source=save_file_name, conf=0.25, save=True)
    logger.debug(f'result[0].boxes.cls : {result_pred[0].boxes.cls}')

    names = model.names
    cls_name = []
    for c in result_pred[0].boxes.cls:
        cls_name.append(names[int(c)])

    logger.debug(f'predict_file_name : {predict_file_name}')
    encoded_img = get_response_image(predict_file_name)

    response = {'Status': 'Success', 'detect_sym_code': cls_name, 'pred_file_name': predict_file_name}
    logger.debug(f'response : {response}')
    # return jsonify(response)

    dict_dis = {'PO':'정상', 'VI': '비브리오증', 'SP': '연쇄구균병', 'MA': '스쿠티카병'}

    dis_name=dict_dis[cls_name[0][0:2]]

    logger.debug(f'pred_img : {predict_file_name}, org_img={save_file_name}')
    return redirect(f"http://121.179.7.40:8081/flounder_V02/detect_reg?pred_image={predict_file_name}&org_image={save_file_name}&dis_name={dis_name}")
    # return redirect(f"http://121.179.7.40:8081/flounder_V02/detect_reg?pred_img={predict_file_name}&org_img={org_file_name}")
    # return redirect(f"http://121.179.7.40:8081/flounder_V02/detect_reg?pred_file={predict_file_name}&org_file={org_file_name}")


    # if request.method == 'POST':
    #     user = request.form['nm']
    #     return redirect(url_for('success', name=user))
    # else:
    #     user = request.args.get('nm')
    #     return redirect(url_for('success', name=user))

    # response = {'Status': 'Success', 'detect_sym_code': cls_name, 'ImageBytes': predict_file_name}
    # logger.debug(f'response : {response}')
    # return jsonify(response)
    # field = {'appType': 'P', 'custNum': cls_name}
    # res = requests.post(url=_url, headers=_headers, data=field.encode("utf8"))


# @app.route(‘/handle_form’, methods=[‘POST’])
# def handle_form():
# print(“Posted file: {}”.format(request.files[‘file’]))
# file = request.files[‘file’]
# files = {‘file’: file.read()}
# r = requests.post(“http://127.0.0.1:8000/upload/”, files=files)
# if r.ok:
#     return "File uploaded!"
# else:
#     return "Error uploading file!"

# import requests
#
# _url = "https://mydomain.com/some-api/sample"
# _headers = {
# 	"Content-Type": "application/json",
# 	"x-client-key": "my-sample-key",
# 	... }
# _data = '{\"data1\":\"value1\",\"data2\":{\"data21\":\"value21\"},\"data3\":[31,\"value32\"]}'
#
# res = requests.post(url=_url, headers=_headers, data=_data.encode("utf8"))
#
# from requests_toolbelt import MultipartEncoder
# import requests
# import json
#
#
# def post(url, field_data):
#     m = MultipartEncoder(fields=field_data)
#     headers = {'Content-Type': m.content_type}
#     res = requests.post(url, headers=headers, data=m)
#     return res.status_code, res.json()
#
#
# def get_login_info(cust_num, id, pw):
#     field = {'appType': 'P', 'custNum': cust_num, 'userID': id, 'userPW': pw}
#     return post('https://test.test.test/Account/Login', field)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)






# dict_dis = {'PO':'정상', 'VI': '비브리오증', 'SP': '연쇄구균병', 'MA': '스쿠티카병'}
#
# print(dict_dis)
#
# test = "MADAO"
#
# print(test)
#
# print(test[0:2])
#
# dict_dis[test[0:2]]