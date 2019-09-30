<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
 
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>예약 연장 완료 - TEAM2 WAREHOUSE</title>

		<link href="${contextPath}/css/reservation.css" rel="stylesheet">	
 
</head>

<body>
 	
<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="py-7" id="section_ex">
    	<div class="container">
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">EXTENSION</span>
	                <h2 class="display-4">예약 연장 확인</h2>
	                <p class="lead">성공적으로 예약되셨습니다!</p>
	                
	            </div>
			</div>
		  
		  <div class="my-3 pt-5 pb-2 bg-white rounded shadow-sm">
			    <table class="table">
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약자명</p></td>
			    		<td>
			    			<input type="text" class="form-control-plaintext" value="${param.name}(${param.email})" readOnly>
			    		</td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">휴대전화</p></td>
			    		<td><input type="text" class="form-control-plaintext" name="phone" value="${param.phone}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">사용하실 공간</p></td>
			    		<td><input type="text" class="form-control-plaintext" name="house" value="${param.house}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">총 사용 기간</p></td>
			    		<td>
				    		<input type="text" class="form-control-plaintext" value="${param.start_day} ~ ${param.end_day} (${param.totalDay}일 연장)">
			    		</td>
			    	</tr>
			    	<tr>
			    		<td><p class="text-info font-weight-bold pt-2 m-0">추가 보증금<br><small class="text-muted">비용의 10%</small></p></td>
			    		<td><input type="text" class="form-control-plaintext" value="${param.res_payment}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td class=""><p class="text-info font-weight-bold pt-2 m-0">추가 금액<br></p></td>
			    		<td><input type="text" class="form-control-plaintext" value="${param.payment}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td class=""><p class="red font-weight-bold pt-2 m-0">총 납부 금액<br><small class="text-muted">고객님이 결제하신 총 금액</small></p></td>
		    	<c:choose>
			    	<c:when test="${param.state =='reservation'}">
			    		<td><input type="text" class="form-control-plaintext" value="${param.res_payment}" readOnly></td>
			    	</c:when>
			    	<c:when test="${param.state =='items'}">
			    		<td><input type="text" class="form-control-plaintext" value="${param.res_payment + param.payment}" readOnly></td>
			    	</c:when>
		    	</c:choose>
			    	</tr>
			    	<tr>
			    		<td colspan="2">
			    			<a href="../index.jsp" class="btn btn-primary">메인으로 돌아가기</a>
			    		<c:if test="${sessionScope.mdto.admin ==1}">
			    			<a href="${contextPath}/ad/admin_main" class="btn btn-primary">관리자 메인으로</a>
			    		</c:if>
			    		</td>
			    	</tr>
			    </table>
		  </div>		
	
	        </div>          
	</section>



<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
        
    </body>
</html>
