<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function leave(){
		return confirm("회원을 탈퇴하시겠습니까?");
	}
</script>
<body>
<div class="container">
	<div class="row p-5 background rounded">
		<div class="col-sm-9 col-lg-6 m-auto">
			<div class="col-md-7 col-sm-9 mx-auto text-center mb-5">
				<span class="text-muted text-uppercase">LEAVE MEMBER</span>
				<h2 class="display-4">회원탈퇴</h2>
				<p class="lead">비밀번호를 한 번 더 입력하세요!</p>
	      	</div>
      		<div class="m-auto">
	      		<form action="${contextPath }/me/leaveMember" method="post" onsubmit="return leave()">
	      			<div class="form-group ml-6">
		      			<label for="checkPwd">비밀번호</label>
		      			<div class="row">
		      				<input type="hidden" name="email" value="${sessionScope.mdto.email }">
			      			<input type="password" class="form-control col-8 mr-3" id="currentPwd" name="currentPwd">
			      			<input type="submit" class="btn btn-primary btn-block btn-lg col-2" value="확인" style="height: calc(1.5em + .75rem + 2px); line-height: 0.6">
	      				</div>
	      			</div>
	      		</form>
      		</div>
   		</div>
   	</div>
</div>
</body>
</html>