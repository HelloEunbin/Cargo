<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>SIGN UP - TEAM2 WAREHOUSE</title>
		
	<!-- modifyMember.css -->
	<link href="${contextPath }/css/member/join.css" rel="stylesheet">
	
</head>
<body>
<jsp:include page="../inc/header.jsp"/>
	<section class="py-7">
		<div class="container">
			<div class="row p-5 mt-5 background raised-box rounded">
	            <div class="col-md-7 col-sm-9 mx-auto text-center mb-5">
	                <span class="text-muted text-uppercase">JOIN US</span>
	                <h2 class="display-4">회원가입</h2>
	                <p class="lead">회원이 되어 다양한 혜택을 누리세요!</p>
	            </div>
	            <br>
				<div class="col-sm-9 col-lg-6 m-auto">
					<form action="${contextPath }/me/join?join=do" method="post" onsubmit="return register()">
						<div class="form-group">
							<label for="email">이메일</label>
							<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해 주세요">
							<input type="button" id="postAuth"class="email-auth" value="이메일 인증" onclick="emailAuth()">
							<div id="auth">
								<input type="email" id="emailAuthNum" name="emailAuthNum" placeholder="인증번호 입력">
								<button type="button" class="authCheck" onclick="authCheck()">인증 확인</button>
							</div>
							<span id="emailErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="pwd">비밀번호<span class="help-block">(영문/숫자/특수문자 혼합하여 8자이상 20글자 이하)</span></label> 
							<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력해 주세요">
							<span id="pwdErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="pwdCheck">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwd2" placeholder="비밀번호를 다시한번 입력 해 주세요">
							<span id="pwd2Err" class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="name">성명</label>
							<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해 주세요">
							<span id="nameErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="phone">휴대폰 번호<span class="help-block">(010-1234-1234 형식)</span></label>
							<input type="tel" class="form-control" id="phone" name="phone" placeholder="휴대폰 번호를 입력해주세요">
							<span id="phoneErr" class="help-block"></span>
						</div>
						<div class="form-group">
							<label for="detailAddr">집 주소</label>
							<div class="row">
								<input type="text" id="postCode" name="postCode" class="form-control ml-3 mb-2 col-4 col-sm-3" placeholder="우편번호" readonly> &nbsp;&nbsp;
								<input type="button" onclick="execPostcode()" class="post_btn col-6 col-sm-3" value="우편번호 찾기">
							</div>
							<div style="width:100%; margin-bottom: 5px;">
								<input type="text" id="roadAddr" name="roadAddr" class="form-control mb-2" placeholder="도로명주소" readonly>
							</div>
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="detailAddr" name="detailAddr" class="form-control" placeholder="상세주소">
							<span id="addrErr" class="help-block clear"></span>	
						</div>
						<br>
						<div class="form-group text-center">
							<button class="btn btn_submit btn-success">
								회원가입 <i class="fa fa-check spaceLeft"></i>
							</button>&nbsp;&nbsp;
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execPostcode() {
    	new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("roadAddr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddr").focus();
            }
        }).open();
    }
</script>
<!-- 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- join.js -->
<script src="${contextPath }/js/member/join.js"></script>
</body>
</html>