</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<head>
<title>08 history detail</title>
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

<style>
.container {
	border: 1px solid #5AD5C8;
	border-radius: 10px;
	
}

.card2 {
	margin-bottom: 20px;
	border-radius: 10px;
	overflow: hidden;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: 100%;
	margin: 0 auto;
	background-color: white;
	padding: 10px;
	border: 1px solid #5AD5C8;
	
}



.btn-primary {
	background-color: #5AD5C8;
	border-color: #5AD5C8;
	color: white;
}
 .btn-primary:hover {
    background-color: transparent;
    color: #5AD5C8;
}
 
</style>
</head>

<body>
	<jsp:include page="96_menu_btn.jsp" />

	<div class="card-body">
		<div class="row">
			<div class="col-lg-9 " >
				<div class="card">
			
	<div class="row justify-content-center mt-4">
		<div class="col-lg-6">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">게시글 작성</h4>
					<form action="${cpath}/write" method="post" enctype="multipart/form-data">
					
						<div class="form-group">
							<label for="content">내용</label>
							<textarea class="form-control" id="content" name="content" rows="5" required></textarea>
						</div>
						<div class="form-group">
							<label for="author">작성자</label>
							<input type="text" class="form-control" id="author" name="author" required>
						</div>
						<div class="form-group">
							<label for="media">미디어 (이미지 또는 동영상)</label>
							<input type="file" class="form-control-file" id="media" name="media" accept="image/*,video/*" required>
						</div>
						<div class="d-flex justify-content-end">
										<button data-btn="list" class="btn btn-sm btn-primary mr-2">목록</button>
										<button type="submit" class="btn btn-sm btn-primary mr-2">제출</button>
									</div>
					</form>
							
				</div>
			</div>
				<br />		
		</div>
	</div>
</div>
					
							
						</div>
	
			
			<div class="col-lg-3">
					<jsp:include page="97_right.jsp" />
			</div>
		</div>
	</div>

</body>

</html>
