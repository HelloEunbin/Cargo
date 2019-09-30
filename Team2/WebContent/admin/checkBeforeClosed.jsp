<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>보관 시작하기</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Custom fonts for this template-->
<link href="${contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="${contextPath}/css/pignose.calendar.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${contextPath}/css/sb-admin.css" rel="stylesheet">

</head>
<body id="page-top">
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="YYYY-MM-dd" var="today" />
	<jsp:include page="Top.jsp"/>
	<div id="content-wrapper">

		<div class="container-fluid">

			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li>현재 페이지 :&nbsp;&nbsp;&nbsp;</li>
				<li class="breadcrumb-item"><a href="${contextPath}/ad/admin_main">관리자 종합 메뉴</a></li>
				<li class="breadcrumb-item"><a href="${contextPath}/ad/listTables?category=items">창고 현황 관리</a></li>
				<li class="breadcrumb-item active">보관 완료하기</li>
			</ol>
			
			<div class="card mb-3" id="first">
			
				<div class="card-header">
					<i class="fas"></i> 보관 중인 물건 정보
				</div>
				<div class="card-body row">
					<section class="col-lg-6">
						<h5 class="text-danger" align="center">보관 종료날짜를 선택해 주세요</h5>
						<div class="calendar"></div>
					</section>
					<section class="col-lg-6">
					<form action="${contextPath}/ad/item_to_closed" method="post" id="itoc">
						<table class="table">
							<tr>
								<th colspan="2" class="table-info">고객  정보  ▼</th>
							</tr>
							<tr>
								<th>이름(이메일)</th>
								<td>${map.name} (${map.email})</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${map.phone}</td>
							</tr>
							<tr>
								<th colspan="2" class="table-info">물품 정보  ▼</th>
							</tr>
							<tr>
								<th class="text-primary">물품 ID</th>
								<td>${map.item}</td>
							</tr>
							<tr>
								<th>창고 번호</th>
								<td>
								<c:choose>
									<c:when test="${map.overdue eq '-'}"><c:out value="${map.house}"/></c:when>
									<c:otherwise><c:out value="${map.overdue}"/></c:otherwise>							
								</c:choose>
								</td>
							</tr>
							<tr>
								<th>예정 보관 기간</th>
								<td>${map.start_day} ~ ${map.end_day}</td>
							</tr>
							<tr>
								<th>보관 종료일</th>
								<td><input type="text" class="form-control" name="return_day" id="return_day" value="${today}" readonly="readonly"></td>
							</tr>
							<tr>
								<th>물건 가격</th>
								<td><fmt:formatNumber value="${map.item_price}" type="currency" currencySymbol="￦"/></td>
							</tr>
							<tr>
								<td colspan="2" class="text-right">
									<a href="#second"><button class="btn btn-info " type="button" onclick="check();">
									보증금 계산</button></a>
									<a href="${contextPath}/ad/listTables?category=items"><input class="btn btn-secondary" type="button" value="취소하기"></a>
								</td>
							</tr>
						</table>
						<input type="hidden" name="item" value="${map.item}">
						</form>
					</section>
				</div>
				<div class="card dom"></div>
			</div>
			<div class="card mb-3" id="second">
				<div class="card-header">
					<i class="fas"></i> 보증금 확인
				</div>
				<div class="card-body row">
					<table class="table">
						<tr>
							<th>예정 보관 기간</th>
							<td>${map.start_day} ~ ${map.end_day}</td>
						</tr>
						<tr>
							<th>보관 비용</th>
							<td><fmt:formatNumber value="${map.payment}" type="currency" currencySymbol="￦"/></td>
						</tr>
						<tr class="table-secondary">
							<th>실제 종료일</th>
							<td class="return_day"></td>
						</tr>
						<tr class="ifoverdue table-warning">
							<th>연체일</th>
							<td class="overdue_day"></td>
						</tr>
						<tr class="ifoverdue table-warning">
							<th>연체 금액</th>
							<td class="arrears"></td>
						</tr>
						<tr class="bg-danger text-white">
							<th>보증금</th>
							<td class="now_deposit"></td>
						</tr>
						<tr>
							<td colspan="2" align="right">
								<button class="btn btn-warning" type="button" onclick="go();"
								data-toggle="tooltip" data-placement="left" title="보증금 계산을 마친 뒤 클릭">
								보관 종료</button>
								<A href="#first"><button class="btn btn-secondary" onclick="backtofirst();">취소하기</button></A>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->

		<!-- Sticky Footer -->
		<footer class="sticky-footer">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright © Your Website 2019</span>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i></a>
	<!-- Bootstrap core JavaScript-->
	<script src="${contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
	<script src="${contextPath}/vendor/pignose_calendar/pignose.calendar.full.min.js"></script>
	
	<!-- Custom scripts for all pages-->
	<script src="${contextPath}/js/sb-admin.js"></script>
	
	<script type="text/javascript">
	var start_day = '${map.start_day}';
	var end_day ='${map.end_day}';
	var price = ${price};
	var payment = ${map.payment};
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
		
		$('.calendar').pignoseCalendar({
	    	lang: 'ko',
	    	minDate: moment(start_day)+1,
	    	select: function(date, context) {
	             if(date[0] == null){
	            	 alert("반환 날짜를 선택하세요!");
	            	 var today=moment().format('YYYY[-]MM[-]DD');
	            	 $('.calendar').pignoseCalendar('set', today);
	            	 $('#return_day').val(today);
	             }else{
	            	 $('#return_day').val(date[0]._i);
	             }
	        }
	    });//end of pignoseCalendar
	});//end of ready
	
	function check() {
		var return_day = $('#return_day').val();
		if(return_day=="") alert("보관 종료일을 선택해 주세요!");
		else{
			var check = confirm("보관 종료일이 "+return_day+"입니까?");
			if(check){ 
				$('#first').addClass('clickX');
				$('.dom').show();
				$('#second').show();
				var return_day = $('#return_day').val();
				var overdue_day = (moment(return_day)-moment(end_day))/(60*60*24*1000);
				if(overdue_day < 0) overdue_day = 0;
				var arrears = overdue_day*price;
				var now_deposit = (payment*0.1)-arrears;

				$('.return_day').text(return_day);
				if(overdue_day > 0){
					$('.overdue_day').text(overdue_day);
					$('.arrears').text("￦"+arrears.toLocaleString()+"원");
					$('.ifoverdue').show();
				}
				
				if(now_deposit <= 0){
					$('.now_deposit').siblings('th').text('받아야 하는 연체료');
					$('.now_deposit').text("￦"+Math.abs(now_deposit).toLocaleString()+"원");
				}else{
					$('.now_deposit').siblings('th').text('돌려드릴 보증금');
					$('.now_deposit').text("￦"+now_deposit.toLocaleString()+"원");
				}
			}else return false;
		}
	}//end of check
	
	function backtofirst() {
		$('#first').removeClass('clickX');
		$('.dom').hide();
		$('#second').hide();
	}//end of backtofirst
	
	function go() {
		var check = confirm("고객과 보증금 계산을 완료하셨습니까? 자료 이동을 시작합니다.");
		if(check){
			$('#itoc').submit();
		}else return false;
	}
	</script>
</body>
</html>