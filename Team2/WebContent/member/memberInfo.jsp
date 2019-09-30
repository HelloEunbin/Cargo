<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
			<div class="row p-5 rounded">
				<div class="col-sm-9 col-lg-6 mt-0 ml-auto mr-auto">
		            <div class="col-md-7 col-sm-9 mx-auto text-center mb-5">
		                <span class="text-muted text-uppercase">INFORMATION</span>
		                <h2 class="display-4">내 정보 확인</h2>
		                <p class="lead"><a href="${contextPath }/me/modifyMember">내 정보 수정하기  <i class="fas fa-arrow-alt-circle-right"></i></a></p>
					</div>
					<div class="form-group">
						<label for="email">이메일</label>
						<input type="email" class="form-control" id="email" name="email" value="${sessionScope.mdto.email }" readonly>
						<span id="emailErr" class="help-block"></span>
					</div>
					<div class="form-group">
						<label for="name">성명</label>
						<input type="text" class="form-control" id="name" name="name" value="${sessionScope.mdto.name }" readonly>
						<span id="nameErr" class="help-block"></span>
					</div>
					<div class="form-group">
						<label for="phone">휴대폰 번호</label>
						<input type="tel" class="form-control" id="phone" name="phone" value="${sessionScope.mdto.phone }" readonly>
						<span id="phoneErr" class="help-block"></span>
					</div>
					<div class="form-group">
						<label for="detailAddr">집 주소</label>
						<div class="row">
							<input type="text" id="postCode" name="postCode" class="form-control ml-3 mb-2 col-4 col-sm-3" value="${sessionScope.mdto.postCode }" readonly> &nbsp;&nbsp;
							<input type="button" onclick="execPostcode()" class="post_btn col-6 col-sm-3" value="우편번호 찾기">
						</div>
						<input type="text" id="roadAddr" name="roadAddr" class="form-control mb-2" value="${sessionScope.mdto.roadAddr }" readonly>
						<span id="guide" style="color:#999;display:none"></span>
						<input type="text" id="detailAddr" name="detailAddr" class="form-control" value="${sessionScope.mdto.detailAddr }" readonly>
						<span id="addrErr" class="help-block clear"></span>	
					</div>
				</div>						
			</div>
		</div>

</body>
</html>