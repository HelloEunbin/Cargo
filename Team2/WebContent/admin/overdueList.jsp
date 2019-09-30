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

<title>연체 관리</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Custom fonts for this template-->
<link href="${contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="${contextPath}/vendor/datatables/select.bootstrap4.min.css" rel="stylesheet">
<link href="${contextPath}/css/pignose.calendar.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${contextPath}/css/sb-admin.css" rel="stylesheet">
<style type="text/css">
.pignose-calendar .pignose-calendar-unit.pignose-calendar-unit-disabled a {
	opacity: 0.9;
  	background-color: #f44336;
  	color: white;
}
</style>
</head>
<body id="page-top">
	
	<jsp:include page="Top.jsp"/>
	<div id="content-wrapper">

		<div class="container-fluid">

			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li>현재 페이지 :&nbsp;&nbsp;&nbsp;</li>
				<li class="breadcrumb-item"><a href="${contextPath}/ad/admin_main">관리자 종합 메뉴</a></li>
				<li class="breadcrumb-item active">연체 관리</li>
			</ol>

			<!-- DataTables -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> 연체 관리  표 </div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>종료일</th>
									<th>연체일</th>
									<th>연체료</th>
									<th>남은 보증금</th>
									<th>이름</th>
									<th>메일</th>
									<th>연락처</th>
									<th>창고</th>
									<th>물품ID</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>종료일</th>
									<th>연체일</th>
									<th>연체료</th>
									<th>남은 보증금</th>
									<th>이름</th>
									<th>메일</th>
									<th>연락처</th>
									<th>창고</th>
									<th>물품ID</th>
								</tr>
							</tfoot>
							<tbody>
							<c:forEach items="${list}" var="odto">
								<tr data-toggle="modal" data-target="#detailModal" data-cate='overdue' data-primary ="${odto.item}">
									<td><fmt:formatDate value="${odto.end_day}" pattern="YYYY-MM-dd"/></td>
									<td><c:out value="${odto.overdue_day}"/></td>
									<td><fmt:formatNumber value="${odto.arrears}" type="currency" currencySymbol="￦"/></td>
									<td><fmt:formatNumber value="${odto.now_deposit}" type="currency" currencySymbol="￦"/></td>
									<td><c:out value="${odto.name}"/></td>
									<td><c:out value="${odto.email}"/></td>
									<td><c:out value="${odto.phone}"/></td>
									<c:choose>
										<c:when test="${odto.overdue eq '-'}">
											<td class="text-danger font-weight-bold"><c:out value="${odto.house}"/></td>
										</c:when>
										<c:otherwise>
											<td><c:out value="${odto.overdue}"/></td>
										</c:otherwise>
									</c:choose>
									<td><c:out value="${odto.item}"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated <fmt:formatDate value="${updateTime}" type="both" dateStyle="full" timeStyle="short"/></div>
			</div>

			<p class="small text-center text-muted my-5">
				<em>More table examples coming soon...</em>
			</p>

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
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>

	<!-- Detail Modal-->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="detailModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="detailModalLabel">연체 상세 정보</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form action="" method="post">
				<div class="modal-body  mx-auto container-fluid row">
					<div class="col-lg-6 mb-3 calendar" id="calendar" ></div>
						<table class='table col-lg-6 mx-auto my-auto'>
							<tr>
								<th colspan="2" class="text-center table-primary">창고 정보  ▼</th>
							</tr>
							<tr>
								<th>물품 ID</th>
								<td class="item"></td>
							</tr>
							<tr>
								<th>창고 번호</th>
								<td class="house"></td>
							</tr>
							<tr>
								<th>결제 가격</th>
								<td class="payment"></td>
							</tr>
							<tr>
								<th>예정 보관 기간</th>
								<td class="duration"></td>
							</tr>
							<tr class="table-secondary">
								<th>연체일</th>
								<td class="overdue_day"></td>
							</tr>
							<tr class="table-secondary">
								<th>연체료</th>
								<td class="arrears"></td>
							</tr>
							<tr class="bg-danger text-white"> 
								<th>남은 보증금</th>
								<td class="now_deposit"></td>
							</tr>
							<tr>
								<th class="text-truncate">보관중인 물건 가격</th>
								<td class="item_price"></td>
							</tr>
							<tr>
								<th colspan="2" class="text-center table-primary">고객 정보  ▼</th>
							</tr>
							<tr>
								<th>이름</th>
								<td class="name"></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td class="email"></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td class="phone"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td class="addr"></td>
							</tr>
						</table>
						<input type="hidden" class="result" name="result">
						<input type="hidden" name="state" value="items">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger sub" value="overdue">연체 창고 이동</button>
					<button type="button" class="btn btn-primary sub" value="extend">예약 연장</button>
					<button type="button" class="btn btn-primary sub" value="toclosed">창고에서 빼기</button>
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				</div>
				</form>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="${contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="${contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
	<script src="${contextPath}/vendor/pignose_calendar/pignose.calendar.full.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${contextPath}/js/sb-admin.js"></script>

	<!-- Demo scripts for this page-->
	<script src="${contextPath}/js/datatables-custom.js"></script>
	<script type="text/javascript">
	
	</script>
</body>
</html>