<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:choose>   
	<c:when test="${sessionScope.mdto.name !=null }"><c:set var="mem_name" value="${sessionScope.mdto.name }"/></c:when>
</c:choose>
 

<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>예약 연장</title>

		<!-- Page level plugin CSS-->
		<link href="${contextPath}/css/pignose.calendar.css" rel="stylesheet">
		<link href="${contextPath}/css/reservation.css" rel="stylesheet">		

 
</head>

<body class="bg-light">
 	
<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="py-7" id="section_ex">
    	<div class="container">
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">EXTENSION</span>
	                <h2 class="display-4">예약 연장</h2>
	                <p class="lead">예약 연장 및 추가 결제 정보를 확인하세요</p>
	            </div>
			</div>
						
			<form action="" method="post" id="payInfo">
			<div class="my-3 p-3 background rounded shadow-sm">
			
			    <p class="lead pb-2 mb-0"><b>예약자 정보</b></p>
			    <table class="table">
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">예약자명</p></td>
			    		<td><input type="text" class="form-control-plaintext" name="name" value="${dto.name}" readonly="readonly"></td>
			    		
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">E-mail</p></td>
			    		<td><input type="text" class="form-control-plaintext" name="email" value="${dto.email}" readonly="readonly"></td>
			    		
			    	</tr>
			    	<tr>
			    		<td><p class="font-weight-bold pt-2 m-0">휴대전화</p></td>
			    		<td><input type="text" class="form-control-plaintext" name="phone" value="${dto.phone}" readonly="readonly"></td>
			    	</tr>
			    </table>
		  </div>
		  
		  <div class="my-3 p-3 background rounded shadow-sm">
			    <p class="lead pb-2 mb-0"><b>추가 결제 정보</b>
			    <br><small class="text-danger">
			    <c:choose>
					<c:when test="${state eq 'reservation'}">추가 보증금 10%가 결제됩니다.</c:when>
					<c:otherwise>추가보증금 10%와 비용 모두 결제하셔야 합니다.</c:otherwise>
				</c:choose>
			    </small></p>
			    <div class="row">
			    	<div class="col-lg-5 mx-auto">
				    	<div class="mb-3 calendar" id="calendar" ></div>
				    </div>
				    <div class="col-lg-7 mx-auto">
				    <table class="table">
				    
				    	<tr>
				    		<td><p class="font-weight-bold pt-2 m-0">사용하실 공간</p></td>
				    		<td><input type="text" class="form-control-plaintext" name="house" value="${dto.house}" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td><p class="font-weight-bold pt-2 m-0">사용 시작일</p></td>
				    		<td><input type="text" class="form-control-plaintext" name="start_day" value="${dto.start_day}" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td><p class="font-weight-bold pt-2 m-0">현재 종료일<br></p></td>
				    		<td><input type="text" class="form-control-plaintext" value="${dto.end_day}" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td><p class="font-weight-bold pt-2 m-0">연장 선택일<br><small class="text-muted">(공간 반납일)</small></p></td>
				    		<td><input type="text" class="form-control" id="end_day" name="end_day" value="${dto.end_day}" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td><p class="font-weight-bold pt-2 m-0">총 연장 기간</p></td>
				    		<td><input type="text" class="form-control" id="totalDay" name="totalDay" value="0" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td class=""><p class="red font-weight-bold pt-2 m-0">추가 금액</p></td>
				    		<td><input type="text" class="form-control" name="payment" id="payment" value="0" readonly="readonly"></td>
				    	</tr>
				    	<tr>
				    		<td><p class="red font-weight-bold pt-2 m-0">예약 보증금<br><small class="text-muted">최종 금액의 10%, 물건 반납시 돌려드립니다.</small></p></td>
				    		<td><input type="text" class="form-control" id="res_payment" name="res_payment" value="0" readOnly></td>
			    		</tr>
				    	<tr>
				    		<td colspan="2" class="confirm" >
				    		<c:choose>
				    			<c:when test="${sessionScope.mdto.admin ==1}">
			   						<strong class="red mr-2">최종 내역 페이지로 이동합니다</strong>
			   						<input type="button" class="btn btn-primary" value="예약 연장 확인" onclick="payIt('admin');">
			   						<c:if test="${sessionScope.mdto.email eq dto.email}">
			   							<input type="button" class="btn btn-primary" value="결제하기" onclick="payIt('custom');">
			   						</c:if>
				    			</c:when>
				    			<c:otherwise>
			   						<strong class="red mr-2">내용을 모두 확인 하셨으면 결제하기 버튼을 눌러주세요.</strong>
			   						<input type="button" class="btn btn-primary" value="결제하기" onclick="payIt('custom');">
		   						</c:otherwise>
		   					</c:choose>
		   						<a href="javascript: history.back()" class="btn btn-secondary">돌아가기</a>
		   					</td>
				    	</tr>
				    </table>
				    <input type="hidden" name="state" value="${state}">
				    <c:choose>
						<c:when test="${state eq 'reservation'}"><input type="hidden" name="num" value="${dto.num}"></c:when>
						<c:otherwise><input type="hidden" name="item" value="${dto.item}"></c:otherwise>
					</c:choose>
				    </div>
			    </div>
		  </div>		
		  </form>				
	
	        </div>          
	</section>



<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

		<!-- Page level plugin JavaScript-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
		<script src="${contextPath}/vendor/pignose_calendar/pignose.calendar.full.min.js"></script>
	
	
		<!-- scripts for this page-->
        <script type="text/javascript">
        function payIt(who) {
        	if($('#payment').val() == 0){
        		alert("예약에 변화가 없습니다!");
        	}else if(who== 'admin'){
				$('#payInfo').attr('action','../re/reserv_ext_admin');
				$('#payInfo').submit();
        	}else{
				$('#payInfo').attr('action','../re/reserv_ext_pay');
				$('#payInfo').submit();
        	}
		}//end of payIt
        
        var price = ${price};
        var start_day = '${dto.start_day}';
        var end_day = '${dto.end_day}';
        var disable = ${maxDate};
        $(document).ready(function() {
        	
        	$('#calendar').pignoseCalendar({
            	lang: 'ko',
            	multiple: true,
            	minDate: moment(start_day)-1,
            	maxDate: disable,
        		init: function(context){
					$(this).pignoseCalendar('set', start_day+'~'+end_day);
       			    $('.pignose-calendar-body div[data-date='+start_day+']').addClass("clickX");
        	   },
               select: function(date, context) {
                    var $this = $(this);
                    var $element = context.element;
                    var $calendar = context.calendar;
                    
                    var end = date[0]._i
                    if(moment(end_day)>moment(end)){
                    alert("기간은 줄일 수 없습니다!");
                    $('#calendar').pignoseCalendar('set', start_day+'~'+end_day);
                    }else{
                    var totalDay = (moment(end)-moment(end_day))/1000/60/60/24;	
                    
                    $('#calendar').pignoseCalendar('set', start_day+'~'+end);
                    $('#end_day').val(end);
                    $('#totalDay').val(totalDay);
                    $('#payment').val(totalDay*price);
                    $('#res_payment').val(totalDay*price*0.1);
                    }
               	}
            	});//end of pignoseCalendar

        });//end of onload
        </script>
    </body>
</html>
