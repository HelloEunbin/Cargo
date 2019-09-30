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
	<title>QUESTION - TEAM2 WAREHOUSE</title>
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
            <h1 class="text-center mb-0">문의</h1>
            <span class="text-muted">Question</span>
        	</div>
        </div>

            <table class="table mt-5 table-hover table-bordered">
            	<tr class="text-center bg-light">
                    <th width="5%">번호</th>  
                    <th width="60%">제목</th>
                    <th width="10%">작성자</th>
                    <th width="10%">작성일</th>
                    <th width="6%" >비밀글</th>
                </tr>
                
		     <c:forEach var="boardq" items="${list}">
		         <tr>
		            <td class="text-center">${boardq.no}</td>
		            <td>
		            <c:choose>
			            <c:when test="${boardq.re_lev > 0 }">
				            <c:forEach begin="0" step="1" end="${boardq.re_lev}" >
				            <span style="padding-left: 10px"></span>   
				            </c:forEach>
			            	<span style="font-size: 12px;">ㄴ</span>
			               	<a href="${pageContext.request.contextPath}/bo/QuestionViewAction.bo?no=${boardq.no}">
			               		${boardq.subject}
			               	</a>
			            </c:when>
			            <c:otherwise>
			            	<a href="${pageContext.request.contextPath}/bo/QuestionViewAction.bo?no=${boardq.no}">
			               		${boardq.subject}
			               	</a>
			            </c:otherwise>
		            </c:choose>
		            </td>
		            <td class="text-center">${boardq.name}</td>
		            <td class="text-center"><fmt:formatDate value="${boardq.date}"/></td>
		            <td class="text-center">
		            <c:choose>
		            	<c:when test="${boardq.secret==1 }"><i class="fas fa-lock"></i></c:when>
		            	<c:otherwise><i class="fas fa-lock-open"></i></c:otherwise>
		            </c:choose>
		            </td>
		         </tr>
		     </c:forEach>
            </table>
               
            <div class="col-md-8 float-left mr-auto my-1">
	             <ul class="pagination">
            	<c:if test="${currentPage > 1}">
                	<li class="page-item">
                		<a class="page-link" href="${pageContext.request.contextPath}/bo/QuestionListAction.bo?currentPage=${currentPage-1}">&lt;</a>
                	</li>
            	</c:if>               	 
                    <li class="page-item d-inline-block">
                    	<a class="page-link" href="${pageContext.request.contextPath}/bo/QuestionListAction.bo?currentPage=${currentPage}"> ${currentPage} </a>
                    </li>
            	<c:if test="${currentPage < lastPage}"> 
                    <li class="page-item">
                    	<a class="page-link" href="${pageContext.request.contextPath}/bo/QuestionListAction.bo?currentPage=${currentPage+1}">&gt;</a>
                    </li>
            	</c:if>                                                     
                </ul>
             </div>
                                           
               <form action="${pageContext.request.contextPath}/bo/QuestionSearchAction.bo" class="d-inline-block col-md-4 px-0">
               <c:choose>
               		<c:when test="${bqDTO.email != sessionScope.mdto.email}">
               			<input type="text" name="search" class="form-control d-inline col-md-6">
                		<input type="submit" value="검색" class="btn btn-primary btn-md col-md-2">
                		<a href="${contextPath}/bo/QuestionAddForm.bo" class="btn btn-primary btn-md col-md-3">문의하기</a>
                	</c:when>
                	<c:otherwise>
                		<input type="text" name="search" class="form-control d-inline col-md-7">
                		<input type="submit" value="검색" class="btn btn-primary btn-md col-md-4">
                	</c:otherwise>
               </c:choose>
			  </form>
        
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