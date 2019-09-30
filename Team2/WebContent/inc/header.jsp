<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<!-- CSS/CDN links-->
	<jsp:include page="head_css.jsp"/>
	<!-- login.css -->
	<link href="../css/member/login.css" rel="stylesheet"/>
</head>
<body onmousemove="count=0">
	<!-- 세션 타임아웃 -->
	<span data-toggle="modal" data-target="#timerModal" data-backdrop="static" id="openTimer"></span>  
	<!-- The Modal -->
	<div class="modal" id="timerModal" data-backdrop="static">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
				  <h2 class="modal-title text-danger text-center">* 알림 *</h2>
				</div>
				<!-- Modal body -->
				<div class="modal-body p-0">
					<h5 class="text-center">10분간 움직임이 없어<br> 60초 후 로그아웃 됩니다.</h5>
				 	<h3 class="text-center">남은 시간: <span id="timeMsg" class="text-danger">60초</span></h3>
				</div>
				<!-- Modal footer -->
				<div class="modal-footer pt-0 pb-2 pr-2">
					<button class="btn btn-success btn-sm" id="extendTime" data-dismiss="modal">연장하기</button>
					<a href="${contextPath}/me/logout" class="btn btn-danger btn-sm">로그아웃</a>
				</div>
	   		</div>
		</div>
	</div>
    <nav class="navbar navbar-expand-md navbar-transparent fixed-top sticky-navigation navbar-light bg-white shadow-bottom" id="lambda-navbar">
        <a class="navbar-brand" href="${contextPath }/start.jsp">
            TEAM2 WAREHOUSE
        </a>
        <button class="navbar-toggler navbar-toggler-right border-0 collapsed" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
            <line x1="3" y1="12" x2="21" y2="12"></line><line x1="3" y1="6" x2="21" y2="6"></line><line x1="3" y1="18" x2="21" y2="18"></line></svg>
        </button>
        <div class="navbar-collapse collapse" id="navbarCollapse" style="">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="${contextPath }/co/information.go">이용안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="${contextPath }/re/info.me?warehouse=A">예약안내</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link page-scroll" href="${contextPath }/mk/market.do">중고장터</a>
                </li>
				<li class="nav-item">
					<a class="nav-link page-scroll" href="${contextPath }/bo/NoticeListAction.bo">고객지원</a>
				</li>
				<c:set var="email" value="${sessionScope.mdto.email }"/>
	          	<c:set var="name" value="${sessionScope.mdto.name }"/>
	          	<c:set var="admin" value="${sessionScope.mdto.admin }"/>
	         	
				<c:if test="${admin == 1 }">
        		<li class="nav-item">
                	<a class="nav-link page-scroll" href="${contextPath}/ad/admin_main">관리자</a>
            	</li> 
	            </c:if>
               	<c:choose>
               	<c:when test="${email ne null }">
	               	<li class="nav-item dropdown">
				      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">마이페이지</a>
				      <div class="dropdown-menu" id="dropdown-menu">
				        <a class="dropdown-item" href="${contextPath }/me/mypage?category=info">내 정보</a>
				        <a class="dropdown-item" href="${contextPath }/me/memberStatus?category=status">사용 내역</a>
				        <a class="dropdown-item" href="${contextPath }/me/memberStatus?category=reservation">예약 현황</a>
				      </div>
				    </li>               
              		<a href="${contextPath }/me/logout" class="btn btn-navbar btn-primary trigger-btn">${name }님 환영합니다. 로그아웃 <i class="fas fa-sign-out-alt"></i></a>
               	</c:when>
               	<c:otherwise>
               		<div class="text-center">
						<a href="${contextPath}/co/login.go" class="btn btn-navbar btn-primary trigger-btn">로그인/회원가입</a>
					</div>
              	</c:otherwise>
       			</c:choose>
              </ul>
        </div>
    </nav>
    <c:if test="${email eq null }">
    <div id="loginModal" class="modal fade">
		<div class="modal-dialog modal-login">
			<div class="modal-content">
				<div class="modal-header">				
					<h4 class="modal-title">LOGIN</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<form action="${contextPath }/me/login" method="post" onsubmit="return login()">
						<div class="form-group">
							<input type="text" class="form-control" id="current_email" name="current_email" placeholder="EMAIL">
							<span id="current_emailErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<input type="password" class="form-control" id="current_pwd" name="current_pwd" placeholder="PASSWORD">
							<span id="current_pwdErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<input type="submit" class="btn btn-primary btn-block btn-lg" value="LOGIN">
						</div>
					</form>
					<div class="remember">
						<input type="checkbox" id="emailSaveCheck"><span class="text-muted hint-text">이메일 기억</span>
					</div>	
					<div class="hint-text">			
						<span><a href="${contextPath }/me/findMember?find=email">이메일찾기</a></span> | 
						<span><a href="${contextPath }/me/findMember?find=pwd">비밀번호찾기</a></span> | 
						<span><a href="${contextPath }/me/join">회원가입</a></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	</c:if>
	<!-- CSS/CDN links-->
	<jsp:include page="head_js.jsp"/>

	<!-- 세션 타임아웃 -->
	<c:if test="${sessionScope.mdto ne null }">
		<script>var contextPath = "${contextPath}"</script>
		<script src="${contextPath }/js/member/sessionTime.js"></script> 
	</c:if>
	<!-- login.js -->
	<script src="${contextPath }/js/member/login.js"></script> 
	
	
</body>
</html>
   