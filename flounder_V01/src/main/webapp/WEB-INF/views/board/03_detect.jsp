<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${cpath}/resources/css/style.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script
    src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script
    src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    .custom-file-input {
      cursor: pointer;
      height: 100%;
      position: absolute;
      top: 0;
      right: 0;
      z-index: 2;
      opacity: 0;
    }
  
    .custom-file-label {
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
  
     .feed-section {
    display: flex;
    justify-content: center;
    flex-direction: column;
    align-items: center;
  }
  
    .inner-box {
    border: 1px solid #5AD5C8;
    border-radius: 10px;
    padding: 70px;
    margin: 10px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

    .nav-link{
      display: flex;
      justify-content: center;
    }
    .form-group {
  margin-top: 20px;
  width: 100%;
  box-sizing: border-box;
}


.form-group2 {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.form-group3 {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: 100%;
  box-sizing: border-box;
}
.btn-primary {
	background-color: #5AD5C8;
	border-color: #5AD5C8;
	color: white;
	width: 300%; 
	height: 40px; 
	font-size: 0.8em;
}
.btn-primary:active,
  .btn-primary:focus,
  .btn-primary:hover {
    background-color: transparent;
    color: #5AD5C8;
  }
  </style>
  
  <script>
    function readImage(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          document.getElementById('preview_img').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
      } else {
        document.getElementById('preview_img').src = "";
      }
    }
  </script>
</head>
<body>
  <jsp:include page="96_menu_btn.jsp" />
  <div class="card-body">
    <div class="row">
      <div class="col-lg-9">
        <div class="card">
          <div class="feed-section">
          <br />
            <div class="inner-box">
             <h5 class="header" style="text-align: center; margin-bottom: 20px;"><strong>질병검사</strong></h5>
            
              <div class="form-group1">
                <br />
                <label>검사가 필요한 광어 사진:</label>
                <br />
                <input type="file" name="file" id="file" accept="image/*" onchange="readImage(this);" />
              </div>
              <div class="form-group2">
                <br />
                <img id="preview_img" height="200px" />
              </div>
              <div class="form-group">
                <br/>               
                <label>증상 입력:</label>
                <br />
                <textarea rows="3" name="dd_comment" id="content" class="form-control"></textarea>
              </div>
              <div class="form-group3">
                <button type="submit" class="btn btn-sm btn-primary mr-2">등록 하기</button>
              </div>
            </div>
          </div>
          <a class="nav-link" href="#" onClick="location.href='./51'">파이썬 플라스크 연동 테스트</a>
          <br />
        </div>
      </div>
      <div class="col-lg-3">
        <jsp:include page="97_right.jsp" />
      </div>
    </div>
  </div>
</body>

</html>

