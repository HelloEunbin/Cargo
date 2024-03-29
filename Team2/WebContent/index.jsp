<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>TEAM2 WAREHOUSE</title>
        <meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 

         <!-- CSS/CDN links-->
		<jsp:include page="inc/head_css.jsp"></jsp:include>
		<!-- login.css -->
		
		<link href="${contextPath }/css/member/login.css" rel="stylesheet"/>
		
		<!-- CSS/CDN links 밑에 자바 스크립트 때문에 위로 올려둠-->
		<jsp:include page="inc/head_js.jsp"/>
		
        <style>
        	/* 중고 장터 */
        	.market-go{
        		font-size: 25px;
   				font-weight: 600;
    			margin: 40px 0;
        	}
        	.quote{
	        	display:block;
			 	overflow: hidden; 
			 	
			  	text-overflow: ellipsis;
			  	white-space: nowrap; 
			  	
				white-space: normal; 
				line-height: 1.2; 
				height: 3.6em; 
				text-align: left;
				word-wrap: break-word; 
				display: -webkit-box; 
				-webkit-line-clamp: 3; 
				-webkit-box-orient: vertical;
				text-align: center;
			}					 	
        </style>
        
        <script type="text/javascript"> //login.js
			$(function(){
			 	/* 마이 페이지 hover */
			 	$("#navbardrop").mouseenter(function(){
			 		
			 		
			 		$(".dropdown-menu").addClass("show");
			 	});
			 	$("#dropdown-menu").mouseleave(function(){
			 		$(this).removeClass("show");
			 	});
	
				if(${param.login!=null}){
					$("#loginModal").modal('toggle');
				}
				
				
				/* 간편견적 */
				var go;
				var day;
				
				//창 열기 버튼을 클릭했을경우
	            $("#ajaxbtn").on("click",function(){
	            	if($("#size").val()==""){
	            		alert("사이즈를 선택하세요.");
	            	}else if($("#minday").val()==""){
	            		alert("이용하실 일 수를 입력하세요.");
	            	}else if(parseInt($("#minday").val())<15){
	            		alert("최소 15일 이상 사용가능합니다.");
	            	}else{
	            		go = $("#size").val(); //A,B,C,D
						day = $("#minday").val();
						//var AllData = {'minday': day,'house': go};
						$.ajax({
							type : 'POST',
							url : "${contextPath}/re/simplepayment.me",
							data : {house : go},
							dataType: 'text',
							success : function(r) {
								var re = JSON.parse(r);
								$("#ajaxresult").val(re.price * day);
								$("#rsname").val($("#name").val());
								$("#rssize").val($("#size").val());
								$("#rsminday").val($("#minday").val());
							}
						});//end of ajax
	            		$("#dialog").dialog("open"); //다이얼로그창 오픈                
	            	}
	            });
				
	          //$("#dialog").dialog();
	            $("#dialog").dialog({
	                autoOpen:false, //자동으로 열리지않게
	                position:[100,200], //x,y  값을 지정
	                //"center", "left", "right", "top", "bottom"
	                modal:true, //모달대화상자
	                resizable:false, //크기 조절 못하게
	                width: 350,
	                height: 525,
	                buttons:{
	                    "확인" : function(){
	                    	location.href='${contextPath}/re/info.me?warehouse='+$("#rssize").val();
	                    },"취소" : function(){
	                        $(this).dialog("close");
	                    }
	                }
	            });
	            
       		});
			
			function inNumber(){
		        if(event.keyCode<48 || event.keyCode>57){
		           alert("숫자만 입력가능합니다.");
		           event.returnValue=false;
		        }
		    }
		</script>

    </head>
<body data-spy="scroll" data-target="#lambda-navbar" data-offset="0" onmousemove="count=0">
<!-- 세션 타임아웃 -->
<span data-toggle="modal" data-target="#timerModal" data-backdrop="static" id="openTimer"></span>      
  <!-- The Modal -->
  <div class="modal" id="timerModal">
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

   <!--navigation-->
   <nav class="navbar navbar-expand-md navbar-dark navbar-transparent fixed-top sticky-navigation" id="lambda-navbar">
       <a class="navbar-brand" href="${contextPath }/start.jsp">
           TEAM2 WAREHOUSE
       </a>
       <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse" 
               data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
           <span data-feather="menu"></span>
       </button>
       <div class="collapse navbar-collapse" id="navbarCollapse">
           <ul class="navbar-nav ml-auto">
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#company">회사소개</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#houseinfo">이용안내</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#reservation">예약안내</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#market">중고장터</a>
               </li>
               <li class="nav-item">
                   <a class="nav-link page-scroll" href="#faq">고객지원</a>
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
              		<a href="${contextPath }/me/logout" class="btn btn-outline-secondary btn-navbar">${name }님 환영합니다. 로그아웃 <i class="fas fa-sign-out-alt"></i></a>
               	</c:when>
               	<c:otherwise>
               		<div class="text-center">
						<a href="#loginModal" class="btn btn-outline-secondary btn-navbar trigger-btn" data-toggle="modal">로그인/회원가입</a>
					</div>
              	</c:otherwise>
       		</c:choose>
          	</ul>
        </div>
    </nav>

     <!-- 간편견적 -->
     <section class="py-7 py-md-0 bg-hero" id="home" style="background-image: linear-gradient(to right, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0.1)), url(${contextPath}/img/main-1.jpg)">
         <div class="container">
             <div class="row vh-md-100">
                 <div class="col-md-7 my-md-auto text-center text-md-left">
                     <h1 class="display-3 text-white font-weight-bold">간편견적</h1>
                     <p class="lead text-light my-4">다양한 크기의 스토리지와 예상 비용을 빠르게 확인하실 수 있습니다.</p>
                   	<!-- 간편검색 --> 
                    	<div class="ml-auto">
                     <div class="card">
                     <div class="card-body p-4">
                        <form class="signup-form">
                            <div class="form-group">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Customer Name">
                            </div>
                            <div class="form-group row">
                           	<div class="col-md-6">
                                <select class="form-control" id="size" name="size">
                                    <option value="">사이즈선택</option>
                                    <option value="A">A - 3㎡ : 2m x 1.5m x 2m</option>
                                    <option value="B">B - 6㎡ : 3m x 2m x 2m</option>
                                    <option value="C">C - 8㎡ : 4m x 2m x 2m</option>
                                    <option value="D">D - 15㎡ : 6m x 2.5m x 2.5m</option>
                                </select>
                             </div>
                             <div class="col-md-6 form-group form-row">
                             	<input type="text" id="minday" name="minday" onkeypress="inNumber();" class="form-control" placeholder="최소 대여기간 15일">
                             </div>
                            </div>
                            <div class="form-group">
                                <input type="button" id="ajaxbtn" value="계산하기" class="btn btn-primary btn-block">
                            </div>
                        </form>
                     </div>
                     </div>
                    </div>
                 </div>
             </div>
         </div>
         <!-- 간편견적 다이알로그 -->
		<div id="dialog" title="간편견적">
			<label for="rsname"><small>Name</small></label>
			<input type="text" class="form-control" id="rsname" readonly="readonly">
			<label for="rssize"><small>Size</small></label>
		    <input type="text" class="form-control" id="rssize" readonly="readonly">
		    <label for="rsminday"><small>Using day</small></label>
		    <input type="text" class="form-control" id="rsminday" readonly="readonly">
		    <label for="ajaxresult"><small>Price</small></label>
		    <input type="text" class="form-control" id="ajaxresult" readonly="readonly" placeholder="예상견적"><br>
		    <div class="text-center"><small><b>※ 확인을 눌러 예약페이지에서 예약해주세요.</b></small></div>
		</div>
     </section>
        
        
        
        

       <!-- 회사소개 -->
        <section class="py-7 bg-light" id="company">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 col-sm-9 mx-auto text-center">
                        <span class="text-muted text-uppercase">Company</span>
                        <h2 class="display-4">TEAM2 WAREHOUSE</h2>
                        <p class="lead">고객이 필요로하는 다양한 크기의 공간을 제공하는 스토리지 기업</p>
                    </div>
                </div>
                <div class="row p-4 mt-5 bg-white raised-box rounded">
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3"><polygon points="14 2 18 6 7 17 3 17 3 13 14 2"></polygon><line x1="3" y1="22" x2="21" y2="22"></line></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">다양한 크기의 공간</h4>
                        <p>작은 창고부터 컨테이너 사이즈까지,<br>필요한 크기의 공간을<br>자유롭게 선택하실 수 있습니다.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-thumbs-up"><path d="M14 9V5a3 3 0 0 0-3-3l-4 9v11h11.28a2 2 0 0 0 2-1.7l1.38-9a2 2 0 0 0-2-2.3zM7 22H4a2 2 0 0 1-2-2v-7a2 2 0 0 1 2-2h3"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">안전한 보관</h4>
                        <p>보관물 손상걱정 NO!<br>온,습도 감지 센서를 이용한 실시간 관리로<br>안전하게 보관하고있습니다.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">사전예약 시스템</h4>
                        <p>사전 예약 시스템으로<br>더욱 정확하고 편리하게<br>이용가능합니다.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe"><circle cx="12" cy="12" r="10"></circle><line x1="2" y1="12" x2="22" y2="12"></line><path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">중고장터 / 판매대행</h4>
                        <p>더 이상 필요없는 물건은<br>저희에게 맡겨주세요.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-star"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">방문 입·출고 서비스</h4>
                        <p>무게, 크기, 시간 걱정마세요.<br>TEAM2 WAREHOUSE가<br>도와드리겠습니다!</p>
                    </div>
                    <div class="col-md-4 col-sm-6 mb-5 text-center">
                        <div class="icon-box">
                            <div class="icon-box-inner small-xs text-primary">
                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-rotate-ccw"><polyline points="1 4 1 10 7 10"></polyline><path d="M3.51 15a9 9 0 1 0 2.13-9.36L1 10"></path></svg>
                            </div>
                        </div>
                        <h4 class="mt-2">온라인 실시간 문의</h4>
                        <p>TEAM2 WAREHOUSE에게<br>궁금한 점이 있다면<br>언제든 문의주세요!</p>
                    </div>
                </div>
            </div>
        </section>


        

        <!-- 이용안내 -->
        <section class="py-7" id="houseinfo">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mx-auto text-center">
                        <span class="text-muted text-uppercase">Information</span>
                        <h2 class="display-4">이용안내</h2>
                        <p class="lead">
                            TEAM2 WAREHOUSE의 보관 공간을 소개합니다.
                        </p>
                    </div>
                </div>
                
                <div class="row mt-5">
                    <div class="col-md-11 mx-auto">
                        <div class="card-group pricing-table">
                            <div class="card text-center bg-light">
                                <div class="card-body">
                                    <h4 class="card-title pt-3">HOUSE A</h4>
                                    <h2 class="card-title text-primary pt-4">￦55,000</h2>
                                    <div class="text-muted">per day</div>
                                    <ul class="list-unstyled pricing-list mt-4">
                                        <li>
                                        	<b>3㎡</b><br>
                                        	<small>2m x 1.5m x 2m</small>
                                        </li>
                                        <li>SMALL</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card bg-primary text-white text-center">
                                <div class="card-body">
                                    <h4 class="card-title text-white pt-3">HOUSE B</h4>
                                    <h2 class="card-title text-white pt-4">￦150,000</h2>
                                    <div class="text-light">per day</div>
                                    <ul class="list-unstyled pricing-list mt-4">
                                        <li>
                                        	<b>6㎡</b><br>
                                        	<small>3m x 2m x 2m</small>
                                        </li>
                                        <li>MEDIUM</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card text-center bg-light">
                                <div class="card-body">
                                    <h4 class="card-title pt-3">HOUSE C</h4>
                                    <h2 class="card-title text-primary pt-4">￦350,000</h2>
                                    <div class="text-muted">per day</div>
                                    <ul class="list-unstyled pricing-list mt-4">
                                        <li>
                                        	<b>8㎡</b><br>
                                        	<small>4m x 2m x 2m</small>
                                        </li>
                                        <li>LARGE</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="card bg-primary text-white text-center">
                                <div class="card-body">
                                    <h4 class="card-title text-white pt-3">HOUSE D</h4>
                                    <h2 class="card-title text-white pt-4">￦500,000</h2>
                                    <div class="text-light">per day</div>
                                    <ul class="list-unstyled pricing-list mt-4">
                                        <li>
                                        	<b>15㎡</b><br>
                                        	<small>6m x 2.5m x 2.5m</small>
                                        </li>
                                        <li>CONTAINER</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
                <div class="row mt-5">
	                 <div class="mx-auto">
	                 	<a href="${contextPath }/co/information.go"class="btn btn-lg btn-primary mx-auto">자세히 보러가기</a>
	                </div>
                </div>
            </div>
        </section>
        
        
        <!--예약안내-->
        <section class="py-7 bg-light" id="reservation">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 my-auto">
                        <img src="${contextPath }/img/feature1.png" class="img-fluid d-block mx-auto" alt="Feature 1" />
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-left pt-5 pt-md-0">
                        <h2 class="display-4">예약안내</h2>
                        <ul class="features-list">
                            <li>작은 창고부터 컨테이너 사이즈까지!<br>크기별로 4종류에 이르는 공간을 보유하고있는 <br>TEAM2 WAREHOUSE는 사전예약제로 운영되고 있습니다.<br>지금 바로 필요한 날짜와 공간을 확인 해 보세요!</li>
                        </ul>
                        <p class="lead mt-3">
                            <a href="${contextPath }/re/info.me?warehouse=A" class="btn btn-primary btn-sm d-inline-flex flex-row align-items-center">
                              	 예약하러가기 <span class="ml-1" width="18" height="18" data-feather="chevron-right"></span>
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        
        <!-- 중고장터 -->
        <section class="py-7" id="market">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-8 mx-auto text-center">
                        <span class="text-muted small-xl text-uppercase">TEAM2 WAREHOUSE MARKET</span>
                        <h2 class="display-4">중고장터</h2>
                    </div>
                </div>
                <div class="row mt-5">
                	<div class="col-lg-4 bg-dark rounded">
                		<div class="mx-auto review-wrapper">
                			<div class="card border-0 review p-5 bg-dark">
                				<div class="card-body">
                					<img src="${contextPath }/img/online-shop.png" class="col-lg-12 rounded-circle d-block mx-auto"/>
									<p class="market-go text-white">중고 장터</p>
									<p class="text-white">미수령하신 물건들을<br>중고장터에서 판매 해 드립니다!</p>
									<a href="${contextPath }/mk/market.do" class="btn btn-primary btn-lg text-white">T2 MARKET <i class="far fa-arrow-alt-circle-right"></i></a>
                				</div>	
                			</div>
                		</div>
                	</div>
                	<div class="col-lg-8 col-sm-12">
	                    <div class="col-md-12 mx-auto review-wrapper slick-reviews">
	                      <c:forEach var="bdto" items="${requestScope.boardList }">
	                           <div class="card border-0 review p-5 raised-box">
	                               <div class="card-body col-sm-12">
	                               		<a href="${contextPath }/mk/showcontent.do?no=${bdto.no}"><img src="${contextPath}/market/uploaded/${bdto.image }" 
	                               		class="img mx-auto col-md-10" style="max-height: 350px;"/></a>
	                               </div>
	                               <div>
										<h5>${bdto.title }</h5>
		                                <h5 style="color: #00c853">￦ ${bdto.price }</h5>
	                               </div>
	                           </div>
                          </c:forEach>
	                    </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- FAQ -->
        <section class="py-7 bg-light" id="faq">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 mx-auto text-center">
                        <span class="text-muted text-uppercase">Customer Support</span>
                        <h2 class="display-4">FAQ</h2>
                    </div>
                </div>
                <div class="row mt-5">
                    <div class="col-md-9 mx-auto">
                        <div class="row mt-4">
                            <div class="col-md-6 mb-4">
                                <h5>보관 불가능한 물품은 어떤것이 있나요? </h5>
                                <p class="text-muted">
                               	변질우려가 있는 물품, 동식물, 현금(통장)및 유가증권<br>
								화재의 위험이 있는 위험물, 도난물품, 도검류, 권총 등 <Br>
								 불법 무기류와 미풍양속을 해치는 물품 등이 있습니다.
                                </p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5>견적은 어떻게 계산되나요?</h5>
                                <p class="text-muted">
                                    	보관기간과 용량에 따라 달라지니 <br>
                                    	자세한 사항은 문의게시판에 질문해주시면 상세하게 답변 드리겠습니다.
                                </p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5>창고의 보안은 어떤가요?</h5>
                                <p class="text-muted">
                                   	이용고객의 소중한 물품과 개인정보 보호를 위하여 <br>
                                   24시간 365일 유인.무인 보안체계를 갖추어 이용고객이 편리하고 안심하게 사용할 수 있습니다
                                </p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5>온도, 습도는 어떻게 관리하나요?</h5>
                                <p class="text-muted">
                                   	고객님의 물품을 최상의 상태로 유지하기 위해,<br>
                                   	온,습도 감지 센서를 이용해 실시간으로 관리하고 있습니다.
                                </p>
                            </div>
                        </div>
                        <div class="row text-center my-5">
                            <div class="col-lg-6 col-md-8 mx-auto">
                                <div class="font-weight-bold lead">더 자세하게 알아보려면?</div>
                                <p class="text-muted"></p>
                                <a href="${contextPath}/bo/NoticeListAction.bo" class="btn btn-primary btn-sm">
                                    	고객지원 페이지로 이동
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div id="plusfriend-chat-button" style="position: fixed; bottom: 15px; right: 65px;"></div>
        <!--footer / contact-->
		<jsp:include page="inc/footer.jsp"></jsp:include>

        <!--scroll to top-->
        <div class="scroll-top">
            <i class="fa fa-angle-up" aria-hidden="true"></i>
        </div>
        
        <!-- LOGIN MODAL -->	
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
		
		<!-- 세션 타임아웃 -->
  		<c:if test="${sessionScope.mdto ne null }">
  			<script>var contextPath = "${contextPath}"</script>
   			<script src="${contextPath }/js/member/sessionTime.js"></script> 
  		</c:if>
  		<!-- login.js -->
  		<script src="${contextPath }/js/member/login.js"></script>

        <script src="${contextPath }/js/scripts.js"></script>
        
        <!-- 1:1채팅 -->
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
        
    </body>
</html>