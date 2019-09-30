<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자 페이지 메인</title>
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
/*연체 표시...*/
.pignose-calendar .pignose-calendar-unit.pignose-calendar-unit-disabled a {
	opacity: 0.9;
  	background-color: #f44336;
  	color: white;
}
</style>
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
	          <li class="breadcrumb-item active">
	            <a href="#">관리자 종합 메뉴</a>
	          </li>
	        </ol>

			<!-- Icon Cards-->
			<div class="row">
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-primary o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-comments"></i>
							</div>
							<div class="mr-5">문의사항</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="${contextPath}/bo/NoticeListAction.bo">
							<span class="float-left">View Details</span>
							<span class="float-right"> <i class="fas fa-angle-right"></i></span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-warning o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-list"></i>
							</div>
							<div class="mr-5">창고 현황 관리</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="${contextPath}/ad/listTables?category=items">
							<span class="float-left">View Details</span>
							<span class="float-right"> <i class="fas fa-angle-right"></i></span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-success o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-shopping-cart"></i>
							</div>
							<div class="mr-5">예약 내역 관리</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="${contextPath}/ad/listTables?category=reservation">
							<span class="float-left">View Details</span>
							<span class="float-right"> <i class="fas fa-angle-right"></i></span>
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-sm-6 mb-3">
					<div class="card text-white bg-danger o-hidden h-100">
						<div class="card-body">
							<div class="card-body-icon">
								<i class="fas fa-fw fa-life-ring"></i>
							</div>
							<div class="mr-5">회원 정보 관리</div>
						</div>
						<a class="card-footer text-white clearfix small z-1" href="${contextPath}/ad/member_admin">
							<span class="float-left">View Details</span>
							<span class="float-right"> <i class="fas fa-angle-right"></i></span>
						</a>
					</div>
				</div>
			</div>

			<!-- DataTables Example -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> 모든 기록
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>상태</th>
									<th>이름</th>
									<th>휴대전화</th>
									<th>이메일</th>
									<th>물품ID</th>
									<th>창고번호</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>보관 비용</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>상태</th>
									<th>이름</th>
									<th>휴대전화</th>
									<th>이메일</th>
									<th>물품ID</th>
									<th>창고번호</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>보관 비용</th>
								</tr>
							</tfoot>
							<tbody>
							<c:forEach items="${list}" var="adto">
							<fmt:formatDate value="${adto.start_day}" pattern="YYYY-MM-dd" var="start_day"/>
							<fmt:formatDate value="${adto.end_day}" pattern="YYYY-MM-dd" var="end_day"/>
							<!-- 끔찍한 구간 발생.....!!!! -->
							<c:choose>
								<c:when test="${adto.state eq '예약'}">
									<c:choose>
										<c:when test="${start_day == today}">
										<tr data-toggle="modal" class="bg-info text-white" data-target="#reservationModal" data-cate="${adto.state}" data-primary="${adto.num}">
										</c:when>
										<c:when test="${start_day < today}">
										<tr data-toggle="modal" class="bg-primary text-white" data-target="#reservationModal" data-cate="${adto.state}" data-primary="${adto.num}">
										</c:when>
										<c:otherwise>
										<tr data-toggle="modal" data-target="#reservationModal" data-cate="${adto.state}" data-primary="${adto.num}">
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${adto.state eq '보관'}">
									<c:choose>
										<c:when test="${end_day == today}">
										<tr data-toggle="modal" class="bg-warning text-dark" data-target="#itemsModal" data-cate="${adto.state}" data-primary="${adto.item}">
										</c:when>
										<c:when test="${end_day < today}">
										<tr data-toggle="modal" class="bg-danger text-white" data-target="#itemsModal" data-cate="${adto.state}" data-primary="${adto.item}">
										</c:when>
										<c:otherwise>
										<tr data-toggle="modal" data-target="#itemsModal" data-cate="${adto.state}" data-primary="${adto.item}">
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:when test="${adto.state eq '완료'}">
								<tr data-toggle="modal" data-target="#ClosedModal" data-cate="${adto.state}" data-primary="${adto.item}">
								</c:when>
							</c:choose>
									<td><c:out value="${adto.state}"/></td>
									<td><c:out value="${adto.name}"/></td>
									<td><c:out value="${adto.phone}"/></td>
									<td><c:out value="${adto.email}"/></td>
									<td><c:out value="${adto.item}"/></td>
									<td>
									<c:choose>
										<c:when test="${adto.overdue eq '-'}"><c:out value="${adto.house}"/></c:when>
										<c:otherwise><c:out value="${adto.overdue}"/></c:otherwise>							
									</c:choose>
									</td>
									<td><c:out value="${start_day}"/></td>
									<td><c:out value="${end_day}"/></td>
									<td><fmt:formatNumber value="${adto.payment}" type="currency" currencySymbol="￦"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">
					Updated <fmt:formatDate value="${updateTime}" type="both" dateStyle="full" timeStyle="short"/>
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
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>
	
	<!-- Detail Modals-->
	
	<!-- reservationModal -->
	<div class="modal fade" id="reservationModal" tabindex="-1" role="dialog" aria-labelledby="reservationModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
			<form method="post" action="">
				<div class="modal-header">
					<h5 class="modal-title" id="reservationModalLabel">예약 상세 내역</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body mx-auto container-fluid row">
					<div class="col-lg-6 mb-3 calendar" id="calendar" ></div>
					<table class='table col-lg-6 mx-auto my-auto'>
						<tr>
							<th colspan="2" class="text-center table-primary">예약 정보  ▼</th>
						</tr>
						<tr>
							<th>예약 번호</th>
							<td class="num"></td>
						</tr>
						<tr>
							<th>예약일</th>
							<td class="res_day"></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td class="start_day"></td>
						</tr>
						<tr>
							<th>예정 완료일</th>
							<td class="end_day"></td>
						</tr>
						<tr>
							<th>보관 비용</th>
							<td class="payment"></td>
						</tr>
						<tr>
							<th colspan="2" class="text-center table-primary">예약자 정보  ▼</th>
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
					<input type="hidden" name="state" value="reservation">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger sub sr-only" value="deldel">예약 삭제하기</button>
					<button type="button" class="btn btn-primary sub" value="extend">기간 연장하기</button>
					<button type="button" class="btn btn-primary sub" value="toitems">창고에 넣기</button>
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				</div>
			</form>
			</div>
		</div>
	</div>
	
	<!-- ItemsModal -->
	<div class="modal fade" id="itemsModal" tabindex="-1" role="dialog" aria-labelledby="itemsModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
			<form method="post" action="">
			<div class="modal-header">
				<h5 class="modal-title" id="itemsModalLabel">창고 상세 내역</h5>
				<button class="close" type="button" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
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
						<th>시작일</th>
						<td class="start_day"></td>
					</tr>
					<tr>
						<th>예정 완료일</th>
						<td class="end_day"></td>
					</tr>
					<tr>
						<th>보관 비용</th>
						<td class="payment"></td>
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
				<button type="button" class="btn btn-danger sub sr-only" value="overdue">연체 창고 이동</button>
				<button type="button" class="btn btn-primary sub" value="extend">기간 연장하기</button>
				<button type="button" class="btn btn-primary sub" value="toclosed">창고에서 빼기</button>
				<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
			</div>
			</form>
			</div>
		</div>
	</div>
	
	<!-- ClosedModal -->
	<div class="modal fade" id="ClosedModal" tabindex="-1" role="dialog" aria-labelledby="ClosedModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
			<form method="post" action="">
			<div class="modal-header">
					<h5 class="modal-title" id="ClosedModalLabel">완료 상세 내역</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body  mx-auto container-fluid row">
					<div class="col-lg-6 mb-3 calendar" id="calendar" ></div>
					<table class='table col-lg-6 mx-auto my-auto'>
						<tr>
							<th colspan="2" class="text-center table-primary">물품 정보  ▼</th>
						</tr>
						<tr>
							<th>물품 ID</th>
							<td class="item"></td>
						</tr>
						<tr>
							<th>시작일</th>
							<td class="start_day"></td>
						</tr>
						<tr>
							<th>예정 완료일</th>
							<td class="end_day"></td>
						</tr>
						<tr>
							<th>실제 완료일</th>
							<td class="return_day"></td>
						</tr>
						<tr>
							<th>보관 비용</th>
							<td class="payment"></td>
						</tr>
						<tr>
							<th class="text-truncate">물건 가격</th>
							<td class="item_price"></td>
						</tr>
						<tr>
							<th colspan="2" class="text-center table-primary">고객 정보  ▼</th>
						</tr>
						<tr>
							<th>이메일</th>
							<td class="email"></td>
						</tr>
						<tr>
							<th>이름</th>
							<td class="name"></td>
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
					<input type="hidden" name="state" value="closed">
				</div>
				<div class="modal-footer">
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
</body>

</html>
