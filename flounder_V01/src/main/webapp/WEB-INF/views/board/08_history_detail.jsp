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

.card2 .content .title {
	font-weight: bold;
	margin-bottom: 10px;
	color: white;
}

.card2 .content .name {
	font-size: 14px;
	color: white;
}

.card2 img {
	width: 100%;
	height: auto;
	margin-bottom: 10px;
}

.content-text {
	text-align: center;
	color: white;
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
  .table {
        border-collapse: collapse;
    }

    .table th,
    .table td {
        border: 1px solid #dee2e6;
    }

    .table th {
        background-color: #f8f9fa;
    }
</style>
</head>

<body>
	<jsp:include page="96_menu_btn.jsp" />

	<div class="card-body">
		<div class="row">
			<div class="col-lg-9">
				<div class="card">
					<br />
					<div class="card-body">
						<div class="container">
							<br />
							<div class="row">

								<div class="col-md-6">
									<div class="card2">
										<!-- First image here -->
										<img alt="이미지"
											style="object-fit: cover; width: 100%; height: auto; margin-bottom: 10px; margin: auto;"
											src="${cpath}/resources${history_detail.org_img}">
									</div>
								</div>
								<div class="col-md-6">
									<div class="card2">
										<!-- Second image here -->
										<img alt="이미지"
											style="object-fit: cover; width: 100%; height: auto; margin-bottom: 10px; margin: auto;"
											src="${cpath}/resources${history_detail.dt_img}">
									</div>
								</div>
							</div>
							<br />
							<div class="row">
								<div class="col-md-12">
									<div class="card2">
									  <div style="width: 30%;">
        <table class="table text-center">
										<!-- Feed content here -->
										<table class="table text-center">
											
											<tr>
												<td>내용</td>
												<td class="content-text">${fn:replace(history_detail.dd_comment, newLineChar, "<br/>")}</td>
												<!-- vo.content에서 \n를 찾아 <br>로 바꾼다. -->
											</tr>
											<tr>
												<td>작성자</td>
												<td>${history_detail.m_name}</td>
											</tr>
											<tr>
												<td>작성일</td>
												<td><fmt:formatDate value="${history_detail.dd_date}"
														pattern="yyyy-MM-dd HH:mm:ss" /></td>
											</tr>
										</table>
										 </div>
										 <div>
											<form id="frm" action="${cpath}/history" method="GET" style="display: inline;>
									    <button type="submit" data-btn="list" class="btn btn-sm btn-primary">목록</button>
											</form>
											<span>&nbsp;</span> 				
											<form id="frm" action="${cpath}/remove" method="POST" style="display: inline;">
										    <input type="hidden" name="c_id" value="${share_detail.c_id}">
										    <button type="submit" data-btn="remove" class="btn btn-sm btn-primary">삭제</button>
										</form>
										</div>
									</div>
								</div>
							</div>
							<br />

						</div>
						<br />
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
