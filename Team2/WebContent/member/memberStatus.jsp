<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Page level plugin CSS -->
<link href="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="${contextPath}/vendor/datatables/select.bootstrap4.min.css" rel="stylesheet">

<script type="text/javascript">
	$(function(){
	    $('#dataTable').DataTable( {
	    	"sScrollX": "100%",
	        "scrollY": "500px",
	        "scrollCollapse": true
	    } );
	});

</script>
</head>
<body>
<c:choose>   
	<c:when test="${sessionScope.mdto.email==null }">
		<script type="text/javascript">
			alert("로그인 후 이용 가능합니다.");
			location.href="${contextPath}/co/login.go"
		</script>
	</c:when>
</c:choose>
	<div class="container-fuild">
		<div class="p-5 background rounded">
			<div class="m-auto">
	            <div class="col-md-7 col-sm-9 mx-auto text-center mb-5">
	                <span class="text-muted text-uppercase">
	                <c:choose>
	                	<c:when test="${requestScope.currentPage eq '사용현황' }">USAGE </c:when>
	                	<c:otherwise>RESERVATION </c:otherwise>
	                </c:choose>
	                STATUS</span>
	                <h2 class="display-4"><c:out value="${requestScope.currentPage }"/></h2>
				</div>
			</div>
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> <c:out value="${requestScope.currentPage }"/>표 
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<c:choose>
							<c:when test="${requestScope.currentPage eq '사용현황' }">
							<thead>
								<tr>
									<th>상태</th>
									<th>물품ID</th>
									<th>창고번호</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>실수령일</th>
									<th>이용금액</th>
									<th>상품가치</th>
									<th>기간연장</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach  var="adto" items="${requestScope.list}">
								<tr>
									<td><c:out value="${adto.state}"/></td>
									<td><c:out value="${adto.item}"/></td>
									<td><c:out value="${adto.house}"/></td>
									<td><fmt:formatDate value="${adto.start_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
									<td><fmt:formatDate value="${adto.end_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
									<td><fmt:formatDate value="${adto.return_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
									<td><fmt:formatNumber value="${adto.payment}" type="currency" currencySymbol="￦"/></td>
									<td><fmt:formatNumber value="${adto.item_price}" type="currency" currencySymbol="￦"/></td>
									<td>
									<c:if test="${adto.state eq '보관' }">
										<a href="${contextPath }/me/extend?category=status" class="btn-success btn-sm">연장하기</a>
									</c:if>							
									</td>
								</tr>
							</c:forEach>
							</tbody>
							</c:when>
							<c:when test="${requestScope.currentPage eq '예약현황' }">
							<thead>
								<tr>
									<th>상태</th>
									<th>물품ID</th>
									<th>창고번호</th>
									<th>예약일</th>
									<th>시작일</th>
									<th>종료일</th>
									<th>이용금액</th>
									<th>기간연장</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="adto" items="${list}" >
								<tr>
									<td><c:out value="${adto.state }"/></td>
									<td><c:out value="${adto.item}"/></td>
									<td><c:out value="${adto.house}"/></td>
									<td><fmt:formatDate value="${adto.res_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
									<td><fmt:formatDate value="${adto.start_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
									<td><fmt:formatDate value="${adto.end_day}" pattern="YYYY-MM-dd a hh:mm"/></td>
									<td><fmt:formatNumber value="${adto.payment}" type="currency" currencySymbol="￦"/></td>
									<td>
									<c:if test="${adto.state eq '예약' }">
										<a href="${contextPath }/me/extend?category=reservation" class="btn-success btn-sm">연장하기</a>
									</c:if>							
									</td>
								</tr>
							</c:forEach>
							</tbody>
							</c:when>
						</c:choose>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- Page level plugin JavaScript-->
<script src="${contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
</body>
</html>