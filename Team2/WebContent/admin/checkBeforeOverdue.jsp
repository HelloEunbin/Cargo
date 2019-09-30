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

<title>연체 창고로 옮기기</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Custom fonts for this template-->
<link href="${contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="${contextPath}/css/pignose.calendar.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${contextPath}/css/sb-admin.css" rel="stylesheet">
<style type="text/css">
/*연체 표시...*/
.pignose-calendar .pignose-calendar-unit.pignose-calendar-unit-disabled a {
	opacity: 0.9;
  	background-color: #f44336;
  	color: white;
}
</style>
</head>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="YYYY-MM-dd" var="today" />
<body id="page-top">
	<jsp:include page="Top.jsp"/>
	<div id="content-wrapper">

		<div class="container-fluid">

			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li>현재 페이지 :&nbsp;&nbsp;&nbsp;</li>
				<li class="breadcrumb-item"><a href="${contextPath}/ad/admin_main">관리자 종합 메뉴</a></li>
				<li class="breadcrumb-item"><a href="${contextPath}/ad/overdue_admin">연체 관리</a></li>
				<li class="breadcrumb-item active">연체 창고로 옮기기</li>
			</ol>
			
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas"></i> 보관 중인 물건 정보
				</div>
				<div class="card-body row">
					<section class="col-lg-6">
						<div class="calendar"></div>
					</section>
					<section class="col-lg-6">
					<form action="${contextPath}/ad/move_to_overdue" method="post" id="ito">
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
										<c:when test="${map.overdue eq '-'}"><c:out value="${map.house}"></c:out></c:when>
										<c:otherwise><c:out value="${map.overdue}"></c:out></c:otherwise>
									</c:choose>
								</td>
							</tr>
							<tr>
								<th>결제한 가격</th>
								<td><fmt:formatNumber value="${map.payment}" type="currency" currencySymbol="￦"/></td>
							</tr>
							<tr>
								<th>예정 보관 기간</th>
								<td>${map.start_day} ~ ${map.end_day}</td>
							</tr>
							<tr class="table-secondary">
								<th>연체일</th>
								<td>${map.overdue_day}</td>
							</tr>
							<tr class="table-secondary">
								<th>연체료</th>
								<td><fmt:formatNumber value="${map.arrears}" type="currency" currencySymbol="￦"/></td>
							</tr>
							<tr class="bg-danger text-white"> 
								<th>남은 보증금</th>
								<td><fmt:formatNumber value="${map.now_deposit}" type="currency" currencySymbol="￦"/></td>
							</tr>
							<tr>
								<th>이동 후 창고</th>
								<td>
									<select id="overdue" name="overdue" class="form-control">
										<option value="D26" selected="selected">D26</option>
										<option value="D27">D27</option>
										<option value="D28">D28</option>
										<option value="D29">D29</option>
										<option value="D30">D30</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="text-right">
									<button class="btn btn-info " type="button" onclick="check();"
									data-toggle="tooltip" data-placement="left" title="옮기려는 창고 위치를 다시 확인해 주세요.">
									연체 창고로 이동</button>
									<input class="btn btn-secondary" type="button" value="취소하기" onclick="history.back();">
								</td>
							</tr>
						</table>
						<input type="hidden" name="item" value="${map.item}">
						</form>
					</section>
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
	
	$(document).ready(function() {
		$('[data-toggle="tooltip"]').tooltip();
		
		$('.calendar').pignoseCalendar({
			lang: 'ko',
			multiple: true,
			disabledRanges: [
				[moment(end_day)+1, moment()]
				],
			init: function(context){
				$(this).pignoseCalendar('set', start_day+'~'+end_day);
			}//end of init
		});//end of pignoseCalendar
		
		//날짜는 클릭 못하게 여기서는 보여주는것만 하는거
		$('.pignose-calendar-body').addClass('clickX');
	});//end of ready
	
	function check() {
		var overdue= $('#overdue option:selected').val();
		
		var check = confirm("보관 장소를 "+overdue+"로 바꾸시겠습니까?");
		if(check) $('#ito').submit();
		else return false;
		
	}
	</script>
</body>
</html>