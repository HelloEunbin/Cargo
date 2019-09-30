<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:choose>   
	<c:when test="${sessionScope.mdto.name !=null }"><c:set var="mem_name" value="${sessionScope.mdto.name }"/></c:when>
</c:choose>

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

<body class="bg-light">
 	
<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="py-7" id="section">
    	<div class="container">
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">RESERVATION</span>
	                <h2 class="display-4">결제</h2>
	                <p class="lead">예약 및 결제정보를 확인하세요</p>
	            </div>
			</div>
						
			<form action="./doResPay.me" method="post">
			<div class="my-3 p-3 background rounded shadow-sm">
			
			    <p class="lead pb-2 mb-0"><b>예약자 정보</b></p>
			    <table class="table">
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약자명 *</p></td>
			    		<td><input type="text" class="form-control" name="name" value="${mem_name }" required=""></td>
			    		
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">E-mail *</p></td>
			    		<td><input type="text" class="form-control" name="email" value="${param.email }" required=""></td>
			    		
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">휴대전화 *</p></td>
			    		<td><input type="text" class="form-control" name="phone" placeholder="숫자만 입력 해 주십시오." required=""></td>
			    		
			    	</tr>
			    </table>
		  </div>
		  
		  <div class="my-3 p-3 background rounded shadow-sm">
			    <p class="lead pb-2 mb-0"><b>결제 정보</b></p>
			    <table class="table">
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">사용하실 공간</p></td>
			    		<td><input type="text" class="form-control" name="house" value="${param.house }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약일</p></td>
			    		<td><input type="text" class="form-control" name="res_day" value="${param.res_day }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">사용 시작일</p></td>
			    		<td><input type="text" class="form-control" name="start_day" value="${param.start_day }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">사용 종료일<br><small class="text-muted">(공간 반납일)</small></p></td>
			    		<td><input type="text" class="form-control" name="end_day" value="${param.end_day }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">총 사용 기간</p></td>
			    		<td><input type="text" class="form-control"  name="totalDay" value="${totalDay } 일" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td class=""><p class="red font-weight-bold pt-2 m-0">최종 금액</p></td>
			    		<td><input type="text" class="form-control" name="payment" value="${payment }" readOnly></td>
			    	</tr>
			    	<tr>
			    		<fmt:parseNumber var="deposit" value="${payment*0.1 }" integerOnly="true"/>
			    		<td><p class="red font-weight-bold pt-2 m-0">예약 보증금<br><small class="text-muted">최종 금액의 10%, 물건 반납시 돌려드립니다.</small></p></td>
			    		<td><input type="text" class="form-control" name="res_payment" value="${deposit }" readOnly></td>
			    	</tr>
			    	
			    	<tr>
			    		<td colspan="2" class="confirm" >
	   						<strong class="red mr-2">내용을 모두 확인 하셨으면 결제하기 버튼을 눌러주세요.</strong>
	   						<input type="submit" class="btn btn-primary" value="결제하기">
	   						<a href="javascript: history.back()" class="btn btn-secondary">돌아가기</a>
	   					</td>
			    	</tr>
			    	
			    </table>
		  </div>		
		  </form>				
	
	        </div>          
	</section>


<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

    </body>
</html>
