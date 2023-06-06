
</html><%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>06 share detail</title>
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


	<script type="text/javascript">
	
		
	</script>
	<style>
	.center-card {
		display: flex;
		justify-content: center;
		align-items: center;
		min-height: 80vh;
		border: 1px solid #5AD5C8;
	
	}

	.card-body {
		padding: 30px;
			}
	.btn-custom {
    background-color: #5AD5C8;
    color: #FFFFFF;
  }
.btn-primary {
  background-color: #5AD5C8;
  border-color: #5AD5C8;
  color: white;
}

.btn-primary:active {
  background-color: white;
  color: #5AD5C8;
}


</style>

</head>
<body>
    <jsp:include page="96_menu_btn.jsp" />

    <div class="card-body">
        <div style="min-height: 200px;">
            <div class="row">
                <div class="col-lg-9">
                    <div class="center-card">
                        <div class="card" style="margin: 20px;">
                            <div class="card-body" style="margin: 20px;">
                                <h4 class="card-title" style="text-align: center;">게시판 수정</h4>
                                
                                  <form id="frm" action="${cpath}/modify" method="post" enctype="multipart/form-data">
                                    <div class="form-group">
                                    <div style="display: flex; justify-content: center;">
                                    <img alt="이미지" height="300px" width="400px" src="${cpath}/resources${share_detail.img_path}" onclick="openImageOptions()">
                                </div>
                                 </div>
                                    <div class="form-group">
                                        <label>제목:</label>
                                        <input type="text" name="title" value="${mo.title}" class="form-control" />
                                    </div>
                                    <div class="form-group">
                                        <label>내용:</label>
                                        <textarea rows="10" name="c_text" class="form-control">${mo.c_text}</textarea>
                                    </div>
                                    
                                    <div class="form-group text-center">
                                        <button id="list" type="button" class="btn btn-sm btn-primary">취소</button>
                                        <button type="submit" class="btn btn-sm btn-primary">
                                            <input type="hidden" name="c_id" value="${mo.c_id}">
                                            제출
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <jsp:include page="97_right.jsp" />
                </div>
            </div>
        </div>
    </div>

    <script>
        function openImageOptions() {
            const fileInput = document.createElement("input");
            fileInput.type = "file";
            fileInput.accept = "image/*";
            fileInput.addEventListener("change", function(event) {
                const file = event.target.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        document.querySelector("img[alt='이미지']").src = e.target.result;
                    };
                    reader.readAsDataURL(file);
                }
            });
            fileInput.click();
        }
    </script>
</body>
</html>
