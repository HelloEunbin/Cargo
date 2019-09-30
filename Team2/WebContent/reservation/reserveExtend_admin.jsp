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
        <title>예약 연장(관리자 확인)  - TEAM2 WAREHOUSE</title>

		<link href="${contextPath}/css/reservation.css" rel="stylesheet">
		
 
</head>

<body>
 	
<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="py-7 bg-light">
    	<div class="container">
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">EXTENSION</span>
	                <h2 class="display-4">예약 연장 확인</h2>
	                <p class="lead text-danger">고객님의 예약 연장 정보입니다. <br> 고객님이 결제를 완료하시면 예약 확정 버튼을 눌러주세요</p>
	            </div>
			</div>
		  
		  <div class="my-3 p-3 bg-white rounded shadow-sm">
		  <form method="post" id="exinfo">
			    <table class="table">
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약자명</p></td>
			    		<td>
			    			<input type="text" class="form-control-plaintext" value="${param.name}(${param.email})" readOnly>
			    			<input type="hidden" name="name" value="${param.name}">
			    			<input type="hidden" name="email" value="${param.email}">
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
			    			<input type="hidden" name="start_day" value="${param.start_day}">
			    			<input type="hidden" name="end_day" value="${param.end_day}">
			    			<input type="hidden" name="totalDay" value="${param.totalDay}">
			    		</td>
			    	</tr>
			    	<tr>
			    		<td><p class="text-info font-weight-bold pt-2 m-0">추가 보증금<br><small class="text-muted">비용의 10%</small></p></td>
			    		<td><input type="text" class="form-control-plaintext" name="res_payment" value="${param.res_payment}" readOnly></td>
			    	</tr>
			    	<tr>
			    		<td class=""><p class="text-info font-weight-bold pt-2 m-0">추가 금액<br></p></td>
			    		<td><input type="text" class="form-control-plaintext" name="payment" value="${param.payment}" readOnly></td>
			    	</tr>
			    	<tr bgcolor="#f2f2f2">
			    		<td class=""><p class="red font-weight-bold pt-2 m-0">총 납부 금액<br><small class="text-muted">고객님이 결제하셔야 하는 금액</small></p></td>
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
			    			<input type="button" class="btn btn-danger" value="예약 확정" onclick="check();"> 
			    			<a href="${contextPath}/ad/admin_main" class="btn btn-primary">메인으로 돌아가기</a>
			    		</td>
			    	</tr>
			    </table>
			    <input type="hidden" name="state" value="${param.state}">
				<c:choose>
					<c:when test="${param.state eq 'reservation'}"><input type="hidden" name="num" value="${param.num}"></c:when>
					<c:otherwise><input type="hidden" name="item" value="${param.item}"></c:otherwise>
				</c:choose>
			    </form>
		  </div>		
	
	        </div>          
	</section>



<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

        <script type="text/javascript">
        function check() {
			var check = confirm("고객님이 결제를 완료하셨습니까?");
			
			if(check){
		        var nearForm = $('#exinfo');
		    	nearForm.attr("action", "../re/reserv_ext_confirm");
		    	nearForm.submit();
			}else{
				return false;
			}
		}
        </script>
    </body>
</html>
