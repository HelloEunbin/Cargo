<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    

<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>RESERVATION - TEAM2 WAREHOUSE</title>
        <meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
        
		    <link href="${contextPath}/css/reservation.css" rel="stylesheet">
 
</head>

<body>
 	
<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="py-7" id="section">
    	<div class="container">
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">RESERVATION</span>
	                <h2 class="display-4">예약확인</h2>
	                <p class="lead">성공적으로 예약되셨습니다!</p>
	            </div>
			</div>
		  
		  <div class="my-3 pt-5 pb-2 bg-white rounded shadow-sm">
			    <table class="table">
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약자명</p></td>
			    		<td><input type="text" class="form-control" name="name" value="${param.name }(${param.email })" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">휴대전화</p></td>
			    		<td><input type="text" class="form-control" name="phone" value="${param.phone}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">사용하실 공간</p></td>
			    		<td><input type="text" class="form-control" name="house" value="${param.house }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약일</p></td>
			    		<td><input type="text" class="form-control" name="res_day" value="${param.res_day }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">사용기간</p></td>
			    		<td><input type="text" class="form-control" name="start_day" value="${param.start_day } ~ ${param.end_day } (총 ${param.totalDay })" readOnly></td>
			    	</tr>
			    	
			    	<tr>
			    		<td><p class="red font-weight-bold pt-2 m-0">예약 보증금<br><small class="text-muted">결제하신 금액, 최종 금액의 10%</small></p></td>
			    		<td><input type="text" class="form-control" name="res_payment" value="${param.res_payment }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td class=""><p class="red font-weight-bold pt-2 m-0">최종 금액<br><small class="text-muted">물건 입고시 결제하실 금액</small></p></td>
			    		<td><input type="text" class="form-control" name="payment" value="${param.payment }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td colspan="2"><a href="${contextPath }/co/index.go" class="btn btn-primary">메인으로 돌아가기</a></td>
			    	</tr>
			    	
			    </table>
		  </div>		
	
	        </div>          
	</section>



<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

    </body>
</html>
