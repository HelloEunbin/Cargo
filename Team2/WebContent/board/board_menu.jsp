<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
    
<!DOCTYPE html>

<div class="col-sm-2 rounded p-5 text-center" id="sidebar">
	<ul class="p-0">
			<span class="text-muted text-uppercase">customer</span>
			<h1 class="mb-4">고객지원</h1>
		<li class="m-2"><h4><a href="${contextPath}/bo/NoticeListAction.bo">공지사항</a></h4></li>
		<li class="m-2"><h4><a href="${contextPath}/bo/FAQ.bo">자주하는 질문</a></h4></li>
		<li class="m-2"><h4><a href="${contextPath}/bo/QuestionListAction.bo">문의하기</a></h4></li>
		<li class="m-2"><h4><a href="${contextPath}/bo/ViewMap.bo">오시는 길</a></h4></li>
	</ul>
</div>
	<!-- 1:1채팅 -->
	<div id="plusfriend-chat-button" style="position: fixed; bottom: 15px; right: 25px;"></div>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type='text/javascript'>
	//<![CDATA[
	  // 사용할 앱의 JavaScript 키를 설정해 주세요.
	  Kakao.init('421ef65f051ad3badd2314b50a343d37');
	  // 플러스친구 1:1채팅 버튼을 생성합니다.
	  Kakao.PlusFriend.createChatButton({
	    container: '#plusfriend-chat-button',
	    plusFriendId: '_xhxdZxnT' // 플러스친구 홈 URL에 명시된 id로 설정합니다.
	  });
	//]]>
	</script>
