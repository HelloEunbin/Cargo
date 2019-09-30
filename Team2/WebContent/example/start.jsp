<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
	<!-- 위, head부분은 공통 form으로 필요할 만한 것 넣었습니다. -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Required meta tags -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<title>예시페이지 시작!</title>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<!--Google fonts-->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	
	<!--vendors styles-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
	
	<!-- Bootstrap CSS / Color Scheme -->
	<link rel="stylesheet" href="css/default.css" id="theme-color">
	<!-- font-awesome CSS -->
	<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function () {
	$("#ajaxbtn").on("click", function() {
		var go = $("#ajaxtext").val();
		$.ajax({
			type : 'POST',
			url : "${contextPath}/ex/ajax.ex",
			data : {gogo : go},
			dataType: 'text',
			success : function(r) {
				var re = JSON.parse(r);
				alert(re.result);
				$("#ajaxresult").val(re.result);
			}
		});//end of ajax
	});//end of onclick
});
</script>

</head>

<body>
	<h2>ajax 방식</h2>
		<input type="text" id="ajaxtext" value="12"><input type="button" id="ajaxbtn" value="눌러서 입력값 +20을 ajax로"> <br>
		<input type="text" id="ajaxresult" readonly="readonly" placeholder="결과값">

	<h2>다음페이지 Dispatcher 방식으로 열기</h2>
		<a href="${contextPath}/ex/dispatcher.ex?go=12"><input type="button" value="버튼을 눌러  Dispatcher"></a><br>
		<p>a태그에 설정된 경로 명: ${contextPath}/ex/dispatcher.ex?go=12</p>
		
	<h2>다음페이지 sendRedirect 방식으로 열기</h2>
		<a href="${contextPath}/ex/sendRedirect.ex?go=12"><input type="button" value="버튼을 눌러  sendRedirect"></a><br>
		<p>a태그에 설정된 경로 명: ${contextPath}/ex/sendRedirect.ex?go=12</p>
</body>
</html>