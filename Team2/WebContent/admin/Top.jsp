<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="${contextPath}/start.jsp">TEAM2 WAREHOUSE</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>

		<!-- Navbar -->
		<ul class="navbar-nav ml-auto ml-md-0">
			<li class="nav-item">
				<a class="nav-link" href="${contextPath}/me/mypage?category=info">
					<i class="fas fa-user-circle fa-fw"></i>MY PAGE
				</a>
			</li>
		</ul>

	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active">
				<a class="nav-link" href="${contextPath}/ad/admin_main">
					 <span>관리자 종합 메뉴</span>
				</a>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="admin-start.jsp"
				id="listTables" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">
					<i class="fas fa-fw fa-boxes"></i> <span>창고 상세 보기</span>
				</a>
				<div class="dropdown-menu" aria-labelledby="listTables">
						<a class="dropdown-item" href="${contextPath}/ad/listTables?category=items">창고 현황 관리</a> 
						<a class="dropdown-item" href="${contextPath}/ad/overdue_admin">연체 관리</a>
				</div>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${contextPath}/ad/listTables?category=reservation">
					<i class="fas fa-fw fa-calendar-alt"></i> <span>예약 내역 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${contextPath}/ad/listTables?category=closed">
					<i class="fas fa-fw fa-book-open"></i> <span>종료된 기록 열람</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${contextPath}/ad/member_admin">
					<i class="fas fa-fw fa-user-cog"></i> <span>회원 정보 관리</span>
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${contextPath}/ad/show_charts">
					<i class="fas fa-fw fa-chart-area"></i> <span>그래프 보기</span>
				</a>
			</li>
			
		</ul>
		