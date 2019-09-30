<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%	request.setCharacterEncoding("utf-8"); %>  

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>CUSTOMER SUPPORT - TEAM2 WAREHOUSE</title>
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
       <style>
           
   #page-wrapper {
    padding-left: 250px;
  	padding-top: 83px;
  	background-color: #999;
   }
  
  #sidebar-wrapper {
    position: fixed;
    width: 200px;
    height: 100%;
    margin-left: -250px;
    background: white;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 200px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #399;
  }
  
  .sidebar-nav li a:hover {
    color: #ff6600;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
 
  }
     
   </style>
   
   
</head>
<body data-spy="scroll" data-target="#lambda-navbar" data-offset="0">

<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>

<!-- 왼쪽메뉴 -->
<nav id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="CustomerSupport.jsp">고객지원</a>
      </li>
		<li><a href="${contextPath}/bo/NoticeListAction.bo">공지사항</a></li>
		<li><a href="${contextPath}/bo/FAQ.bo">자주하는 질문</a></li>
		<li><a href="${contextPath}/bo/QuestionListAction.bo">문의 하기</a></li>
		<li><a href="#">1:1 실시간 상담</a></li>
		<li><a href="ViewMap.jsp">오시는 길</a></li>
    </ul>
  </div>
  <!-- /사이드바 -->
</nav>
<!-- 왼쪽메뉴 -->

        
  <!-- company section -->
        <section class="py-7 bg-light" id="company">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 col-sm-9 mx-auto text-center">
                    <span class="text-muted text-uppercase">고객의 취지에 맞게 설계하여 보관하는 공간! warehouse!</span>
                        <h2 class="display-4">고객지원</h2>
                        <p class="lead">사용상의 문제 및 보관까지 고객지원팀에서 언제나 신속하게 도와드립니다</p>
                    </div>
                </div>
                <div class="row p-4 mt-5 bg-white raised-box rounded">
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                               <!-- <img src="./img/roomsize.PNG"> -->
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3"><polygon points="14 2 18 6 7 17 3 17 3 13 14 2"></polygon><line x1="3" y1="22" x2="21" y2="22"></line></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">공지 사항</h4>
                        <a href="Question.jsp" class="btn btn-primary btn-sm">공지사항</a>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-thumbs-up"><path d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">자주하는 질문</h4>
                        <a href="FAQ.jsp" class="btn btn-primary btn-sm">FAQ</a>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">고객상담</h4>
                       <a href="${contextPath}/bo/QuestionListAction.bo" class="btn btn-primary btn-sm">문의 하기</a>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">오시는 길</h4>
                        <a href="ViewMap.jsp" class="btn btn-primary btn-sm">지도 보기</a>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">실시간 상담</h4>
                        <a href="#" class="btn btn-primary btn-sm">1 : 1 상담하기</a>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-rotate-ccw"><polyline points="1 4 1 10 7 10"></polyline><path d="M3.51 15a9 9 0 1 0 2.13-9.36L1 10"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">회원 정보 변경</h4>
                        <a href="#" class="btn btn-primary btn-sm">정보 변경하기</a>
                    </div>
                </div>
                <div class="row press mt-5">
                    <div class="col-12 text-muted small-xl text-uppercase text-center mb-5">We have got our clients covered in</div>
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-1.png" alt=""></a></div>
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-2.png" alt=""></a></div>
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-3.png" alt=""></a></div>                                 
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-4.png" alt=""></a></div> 
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-5.png" alt=""></a></div>
                    <div class="press-item col-lg-2 col-md-4 col-6"><a href="#"><img class="img-fluid" src="img/press/press-6.png" alt=""></a></div>
                </div>
            </div>
        </section>


	
<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>
     

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>