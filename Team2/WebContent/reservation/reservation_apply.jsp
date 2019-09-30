<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%	request.setCharacterEncoding("utf-8"); %>  

<c:choose>   
	<c:when test="${sessionScope.mdto.email != null }"><c:set var="mem_email" value="${sessionScope.mdto.email }"/></c:when>
</c:choose>
    
<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>RESERVATION - TEAM2 WAREHOUSE</title>
    <meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<!-- Page level plugin CSS-->
	<link href="${contextPath}/css/pignose.calendar.css" rel="stylesheet">
	<link href="${contextPath}/css/reservation.css" rel="stylesheet">
    
</head>

    <body class="bg-light">
	
	<!--navigation in page-->
	<jsp:include page="../inc/header.jsp"></jsp:include>
	<section class="py-7"  id="section">
    	<div class="container">
           	<div class="row">
	            <div class="col-md-7 col-sm-9 mx-auto text-center">
	                <span class="text-muted text-uppercase">RESERVATION</span>
	                <h2 class="display-4">예약하기</h2>
	                <p class="lead">예약을 원하는 날짜를 선택하세요.</p>
	            </div>
			</div>
             <div class="row p-5 mt-5 background raised-box rounded">
             	<div class="m-auto">
					<c:set var="hn" value="${fn:substring(param.house,0,1)}"/>
					<img class="" alt="house${hn}" src="../img/house${hn}.png">
				</div>	
				<div class="float-right m-auto col-lg-6">
				<form class="form-group" method="post" action="./reserveCheck.me">
					<ul class="list-group rounded mb-3">
						<li class="list-group-item text-center">
						  <div>
						 	 <b>공간명</b>
						    <h4 id="houseName" class="my-0">${param.house }</h4>
						    <input type="hidden" name="house" value="${param.house }">
						  </div>
						</li>
						<li class="list-group-item">
				          <div>
							<label for="email" class="mt-1"><b>E-mail</b></label>
								<input type="text" class="form-control" id="email" name="email" value="${mem_email }" readonly=""><br>
							<label for="res_day" class="mt-1"><b>예약일</b></label>
								<input type="text" class="form-control" id="res_day" name="res_day" value="${res_day}" readonly=""><br>
							<label for="start_day" class="mt-1 strong"><b>사용 시작일</b><small class="text-muted ml-2">오늘 날짜 이후로 선택 가능합니다.</small></label>
							    <input type="text" class="form-control calendar" id="start_day" name="start_day" readonly="readonly" placeholder="CLICK!"><br>
							<label for="end_day" class="mt-1"><b>사용 종료일</b><small class="text-muted ml-2">보관 최소기간은 15일입니다.</small></label>
							    <input type="text" class="form-control" id="end_day" name="end_day" readonly="readonly"><br>
				          </div>
				        </li>
						<li class="list-group-item text-center">
						  <input type="submit" class="mx-auto col-md-5 btn btn-primary" value="최종 금액 계산">
						</li>
					</ul>
				</form>
				</div>
	         </div>          
		</div>
	</section>

<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

		<!-- Page level plugin JavaScript-->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
		<script src="${contextPath}/vendor/pignose_calendar/pignose.calendar.full.min.js"></script>

<script type="text/javascript">
    
    $(function() {
    	
    	$('#start_day').val("");
    	$('#end_day').val("");
    	
    	var dateRange = [];
		var innerDateRange = [];
		
   		<c:forEach var="idto" items="${rList }">
   			innerDateRange.push("${idto.start_day}");
   			innerDateRange.push("${idto.end_day}");
   			dateRange.push(innerDateRange);
   			innerDateRange = [];
   		</c:forEach>
		<c:forEach var="rdto" items="${rList2 }">
			innerDateRange.push("${rdto.start_day}");
			innerDateRange.push("${rdto.end_day}");
			dateRange.push(innerDateRange);
			innerDateRange = [];
   		</c:forEach>
		
		console.log(dateRange);
		
		var start = "";
		var end = "";
		
		$('input.calendar').pignoseCalendar({
			format: 'YYYY-MM-DD', // date format string. (2017-02-02)
			lang: 'ko',
			multiple: true,
			minDate: moment().add(1, 'd').format("YYYY-MM-DD"),
			disabledRanges: dateRange,
			buttons: true,
			select: function(date, context){
				
				if(date[0] != null) start = date[0]._i;
			 	if(date[1] != null) end = date[1]._i; 
				
				if(!start==""){
					if(moment.duration(moment(end).diff(moment(start))).asDays()<15){
						alert("최소 보관기간은 15일 입니다.");
						$('input.calendar').pignoseCalendar('set', start);
					}
				} 
			}, 
			apply: function(date, context) {
				
				end = date[1]._i; 
			 	start = date[0]._i;
				
				if(moment.duration(moment(end).diff(moment(start))).asDays()<15){
					alert("최소 보관기간은 15일 입니다.");
 					$('#start_day').val("");
 			    	$('#end_day').val("");
				}else{
	 				$('#start_day').val(start);
	 				$('#end_day').val(end);
				}
				console.log('일 차이: ', moment.duration(moment(end).diff(moment(start))).asDays());
			}
		});
    }); // function() - 끝
    
</script>

        
    </body>
</html>