<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>MY PAGE - TEAM2 WAREHOUSE</title>

	<!-- mypage.css -->
	<link href="${contextPath }/css/member/mypage.css" rel="stylesheet">
</head>
<body>
	
<jsp:include page="../inc/header.jsp"/>

<c:set var="content" value="${param.content}"/>
		
<c:if test="${content eq null}">
	<c:set var="content" value="memberInfo.jsp"/>
</c:if>
<c:if test="${content eq 'leave' }">
	<c:set var="content" value="leaveMember.jsp"/>
</c:if> 
<c:if test="${sessionScope.mdto.email==null }">
	<script type="text/javascript">
		alert("로그인 후 이용 가능합니다.");
		location.href="${contextPath}/co/login.go"
	</script>
</c:if>
<section>
	<div class="container-fuild">
		<div class="row">
			<div class="col-sm-2 rounded p-5 text-center" id="sidebar">
				<ul class="p-0">
					<span class="text-muted text-uppercase">MY PAGE</span>
					<h1 class="mb-4">마이페이지</h1>
					<li class="m-2"><a href="${contextPath }/me/mypage?category=info"><h4>내 정보</a></h4></li>
					<li class="m-2"><a href="${contextPath }/me/memberStatus?category=status"><h4>사용 현황</a></h4></li>
					<li class="m-2"><a href="${contextPath }/me/memberStatus?category=reservation"><h4>예약 현황</a></h4></li>
					<li class="m-2"><a href="${contextPath }/me/mypage?category=leave"><h4>회원 탈퇴</a></h4></li>
				</ul>
			</div>
			<div class="col-sm-10 mr-auto ml-auto" id="content">
				 <jsp:include page="${content }"/> 
			</div>
		</div>
	</div>
</section>
<jsp:include page="../inc/footer.jsp"/>
<!-- 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

</body>
</html>