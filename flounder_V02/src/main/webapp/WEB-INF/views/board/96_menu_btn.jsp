<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<style>
  .nav-item:hover .nav-link::after {
    content: attr(data-korean-name); /* Show Korean translation as pseudo-element content */
    position: absolute;
    top: 100%;
    left: 50%;
    transform: translateX(-50%);
    background-color: #5AD5C8; /* Set background color to #000A2E */
    color: white;
    padding: 5px;
    border-radius: 3px;
    font-size: 12px;
    opacity: 0;
    transition: opacity 0.3s;
    
  }
</style>



<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #5AD5C8;">
  <a class="navbar-brand" href="#" onClick="location.href='./02'">Home</a>
  <a class="navbar-toggler" type="a" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </a>
  <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
    <ul class="navbar-nav">
    	<c:if test="${!empty mvo}">
	    	<li class="nav-item">
	        <a class="nav-link" href="#" onMouseOver="showKoreanText(this, '질병감지')" onMouseOut="showKoreanText(this, 'Disease Detection')" onClick="location.href='./03'">Disease Detection</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#" onMouseOver="showKoreanText(this, '히스토리')" onMouseOut="showKoreanText(this, 'History')" onClick="location.href='./07'">Disease History</a>
	      </li>
      </c:if>
      <li class="nav-item">
        <a class="nav-link" href="#" onMouseOver="showKoreanText(this, '질병정보')" onMouseOut="showKoreanText(this, 'Disease information')" onClick="location.href='./04'">Disease Search</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onMouseOver="showKoreanText(this, '커뮤니티')" onMouseOut="showKoreanText(this, 'Community')" onClick="location.href='./05'">Information Sharing</a>
      </li>
   </ul>
   
  </div>
  
 <div class="form-inline my-2 my-lg-0">
    <c:choose>
        <c:when test="${!empty mvo}">
            <a class="btn btn-outline-light my-2 my-sm-0 mr-2" onMouseOver="showKoreanText(this, '로그아웃')" onMouseOut="showKoreanText(this, 'Logout')" type="a" onClick="location.href='${cpath}/logout'">Logout</a>
        </c:when>
        <c:otherwise>
            <a class="btn btn-outline-light my-2 my-sm-0 mr-2" onMouseOver="showKoreanText(this, '로그인')" onMouseOut="showKoreanText(this, 'Login')" type="a" onClick="location.href='${cpath}/login'">Login</a>
        </c:otherwise>
    </c:choose>
    <a class="btn btn-outline-light my-2 my-sm-0" type="a" data-toggle="collapse" data-target="#menuCollapse" aria-controls="menuCollapse" aria-expanded="false">
        <span class="navbar-toggler-icon"></span>
    </a>
</div>


</nav>

<script>
  function showKoreanText(element, text) {
    element.textContent = text;
  }
</script>
    </ul>
    <div class="form-inline my-2 my-lg-0" style="position: absolute; right: 20px;">
      <a class="btn btn-outline-light my-2 my-sm-0" type="a" data-toggle="collapse" data-target="#menuCollapse" aria-controls="menuCollapse" aria-expanded="false">
        <span class="navbar-toggler-icon"></span>
      </a>
    </div>

