<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>TEAM2 WAREHOUSE RESERVATION</title>
	
	<!-- findMember.css -->
	<link href="${contextPath }/css/member/findMember.css" rel="stylesheet">	
</head>

<body class="bg-light">

<!--navigation in page-->
<jsp:include page="../inc/header.jsp"/>
<section class="py-7">
	<div class="container">
		<div class="row p-5 mt-5 background raised-box rounded">
            <div class="col-md-7 col-sm-9 mx-auto text-center mb-5">
                <span class="text-muted text-uppercase">SEARCH MEMBERSHIP</span>
                <h2 class="display-4">회원정보 검색</h2>
			</div>
			<div class="col-sm-9 col-lg-6 m-auto">
				<c:if test="${param.find eq 'email' }">
				<div class="tab">
					<button class="tablinks active" onclick="location.href='${contextPath}/me/findMember?find=email'">이메일 찾기</button>
					<button class="tablinks" onclick="location.href='${contextPath}/me/findMember?find=pwd'">비밀번호 찾기</button>
				</div>
				<div id="emailSearch" class="tabcontent">
				<c:choose>
					<c:when test="${empty requestScope.emailList }">
					<div id="emailSearchShow">
						<p class="text-center font-weight-bold small">- <mark class="text-danger">이름</mark>과 <mark class="text-danger">전화번호</mark>를 통해 이메일을 찾을 수 있습니다 -</p>
						<form action="${contextPath }/me/emailSearch" method="post" onsubmit="return emailSearch()">
							<div class="form-group">
								<label for="name">이름</label>
								<input type="text" class="form-control" id="name" name="name" placeholder="NAME">
								<span id="nameErr" class="help-block"></span>
							</div>
							<div class="form-group">
								<label for="phone">휴대폰 번호<span class="help-block">(010-1234-1234 형식)</span></label>
								<input type="text" class="form-control" id="phone" name="phone" placeholder="PHONE(010-1234-1234 형식)">
								<span id="phoneErr" class="help-block"></span>
							</div>
							<div class="form-group">
								<button class="btn btn-primary btn-block btn-lg mt-5">이메일 찾기</button>
							</div>
						</form>
					</div>
					</c:when>
					<c:otherwise>
						<div id="emailSearchResult">
							<h5 class="text-center font-weight-bold mt-3"><c:out value="${requestScope.emailList.list[0].name }"/>회원님의 이메일 주소</h5>
							<div class="text-center" id="memberEmailList">
							<c:set var="startNum" value="0"/>
							<c:forEach var="i" items="${requestScope.emailList.list }">
								<c:set var="startNum" value="${startNum+1 }"/>
								<span class="text-center font-weight-bold mr-4"><span id="memberEmail"><c:out value="${startNum }"/>. <c:out value="${i.email }"/></span></span>
								<span class="text-center text-danger">가입날짜: <span id="memberReg_date"><fmt:formatDate value="${i.reg_date}" pattern="YYYY-MM-dd a hh시 mm분"/></span></span><br>
							</c:forEach>
							<a href="${contextPath }/co/login.go" class="btn btn-primary btn-block btn-lg mt-3">로그인 하러 가기</a>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				</div>
				</c:if>
				<c:if test="${param.find eq 'pwd' }">
				<div class="tab">
					<button class="tablinks" onclick="location.href='${contextPath}/me/findMember?find=email'">이메일 찾기</button>
					<button class="tablinks active" onclick="location.href='${contextPath}/me/findMember?find=pwd'">비밀번호 찾기</button>
				</div>		
				<div id="pwdSearch" class="tabcontent">
					<p class="text-center font-weight-bold small">- <mark class="text-danger">이메일</mark>을 통해 임시 비밀번호를 보내드립니다 - </p>
		 			<div class="form-group">
		 				<label for="email">이메일</label>
		 				<input type="text" class="form-control" id="email" placeholder="EMAIL">
		 				<span id="emailErr" class="help-block"></span>
		 			</div>
					<div class="form-group">
						<input type="button" class="btn btn-primary btn-block btn-lg mt-5" onclick="pwdSearch()" value="임시 비밀번호 발송">
					</div>
				</div>
				</c:if>
			</div>
		</div>
	</div>
</section>
<!-- findMember.js -->
<script>var contextPath = "${contextPath}"</script>
<script src="${contextPath }/js/member/findMember.js"></script>
</body>
</html>