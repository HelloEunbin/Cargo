<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>NOTICE - TEAM2 WAREHOUSE</title>
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<link href="${contextPath }/css/board.css" rel="stylesheet">

</head>
<body>

<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>

	<section>
		<div class="container-fuild">
		<div class="row">
		
		<!--left Menu-->
		<jsp:include page="board_menu.jsp"></jsp:include>
			
		<div class="col-sm-10 mr-auto ml-auto" id="content">
        <div class="container my-5">
      	
		<div class="row">
                <div class="col-md-7 col-sm-9 mx-auto text-center">
            <h1 class="text-center mb-0">공지사항</h1>
            <span class="text-muted">Notice</span>
        	</div>
        </div>
        
        <div class="mt-5 ml-2">
        	<h4 class="d-inline">${bnDTO.subject}</h4>
			<span class="float-right"><b>${bnDTO.name}</b><small class="text-muted ml-3">${bnDTO.date}</small></span>
		</div>	
		<hr class="mt-1">
		<div class="card-header py-5 px-4" style="min-height: 300px;">${bnDTO.content}</div>
		<hr>
		<div align="right">
      <c:if test="${sessionScope.mdto.admin==1}" >
			<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/bo/NoticeModifyFormAction.bo?no=${bnDTO.no}&email=${bnDTO.email}">수정</a>
			<a class="btn btn-primary btn-sm" id="del" href="${pageContext.request.contextPath}/bo/NoticeDelAction.bo?no=${bnDTO.no}&email=${bnDTO.email}">삭제</a>
      </c:if>
			<a class="btn btn-primary btn-sm" href="${contextPath}/bo/NoticeListAction.bo">목록</a>
		</div>
		
		</div>
      	</div>
		</div>
		</div>
	</section>

        
<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
</body>
</html>