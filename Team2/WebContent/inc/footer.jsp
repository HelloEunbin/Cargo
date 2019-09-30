<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE>
        <footer class="pt-4 bg-black">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-sm-6">
                        <h5 class="text-white mb-4">About TEAM2 WAREHOUSE</h5>
                        <p class="about">
                        	TEAM2 WAREHOUSE는<BR>
                        	여러분의 생활 공간을 쾌적한 환경으로 변화시켜드립니다.<BR>
							잠시 불필요한 짐을 보관하고 나만의 공간을 마련해 보세요.<br>
							여러분의 삶에 변화가 찾아옵니다!
                        </p>
                    </div>
                    <div class="col-md-2 col-sm-6 ml-auto text-center">
                        <h5 class="text-white">TEAM2</h5>
                        <ul class="list-unstyled mt-4">
                            <li><a href="#">회사소개</a></li>
                            <li><a href="${contextPath}/bo/NoticeListAction.bo">공지사항</a></li>
                            <li><a href="${contextPath}/bo/FAQ.bo">FAQ</a></li>
                        </ul>
                    </div>
                    <div class="col-md-2 col-sm-6 mx-auto text-center">
                        <h5 class="text-white">WAREHOUSE</h5>
                        <ul class="list-unstyled mt-4">
                        	<li><a href="${contextPath }/me/join">회원가입</a></li>
                            <li><a href="${contextPath }/co/information.go">이용안내</a></li>
                            <li><a href="${contextPath }/re/info.me?warehouse=A">예약안내</a></li>
                            <li><a href="${contextPath }/mk/market.do">중고장터</a></li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 text-muted text-center small-xl">
                        <p>&copy; 2019 TEAM2 WAREHOUSE. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </footer>