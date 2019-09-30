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
            <h1 class="text-center mb-0">공지사항 - 수정</h1>
            <span class="text-muted">Notice</span>
        	</div>
        </div>
        
        <div class="container mt-5">
		    <form id="modifyForm" action="${pageContext.request.contextPath}/bo/NoticeModifyAction.bo" method="post">
		        <div class="form-group">
		        	<label for="no">No</label>  
		        	<input class="form-control" id ="no" name="no" value="${bnDTO.no}" type="text" readonly="readonly"/>
		        </div>  
				<div class="form-group">
					<label for="subject">Title</label>
					<input class="form-control" value="${bnDTO.subject}" name="subject" id="subject" type="text"/>
				</div>
		        <div class="form-group">
		        	<label for="content">Content</label>
		        	<textarea class="form-control" id="content" name="content" rows="5" cols="50">${bnDTO.content}</textarea>
		        </div>
		        <div align="right" class="mt-3">
		            <input class="btn btn-primary btn-sm" id="modifyButton" type="submit" value="글수정"/>
		            <input class="btn btn-primary btn-sm" type="reset" value="초기화"/>
		            <a class="btn btn-primary btn-sm" href="${contextPath}/bo/NoticeListAction.bo">글목록</a>
		        </div>
		    </form>
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