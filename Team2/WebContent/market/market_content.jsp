<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%-- <fmt:formatDate value="${result.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>ITEMS - TEAM2 WAREHOUSE MARKET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
   <!-- css/cdn links -->
	<jsp:include page="market_link.jsp"></jsp:include>
	
    <script type="text/javascript">
    	
   		function caltotal(){
   			var quantity = parseInt(document.getElementById("quantity").value);
   			var price = ${mjdto.price };
   			var total = quantity * price;
   			
   			document.getElementById("totalprice").innerHTML = total;
   			document.getElementById("total").value = total;
   			document.getElementById("quantity").value = quantity;
   			document.getElementById("quantity1").value = quantity;
   			document.getElementById("quantity2").value = quantity;
   		}
   		
   		function cart(){
   			var check = confirm("이 상품을 장바구니에 담으시겠습니까?");
   			var cfrm = document.getElementById("cartForm");
   			if(check==true)	cfrm.submit();
   		}
   		
   		function buy(){
   			var check = confirm("이 상품을 주문하시겠습니까?");
   			var ofrm = document.getElementById("orderForm");
   			if(check==true)	ofrm.submit();
   		}
   		
   		function deleteitem(){
   			var check = confirm("이 아이템을 삭제하시겠습니까?");
   			var no ="${mjdto.no}";
   			if(check==true)	{location.href="${contextPath}/mk/deleteItem.do?no="+no;}
   		}
    
    </script>
    
  </head>
  <body>

	<div id="colorlib-page">
		
		<!-- navbar -->
		<jsp:include page="market_nav.jsp"></jsp:include>
		
		<div class="mt-5">
			<!-- header -->
			<jsp:include page="market_header.jsp"></jsp:include>
			
			
			<section class="ftco-section">
	    	<div class="container">
	    		<div class="row">
	    		<div class="col-lg-8 ftco-animate px-4">
	    		
	    		<!-- 게시글 영역 -->
	            <h2 class="mb-5 font-weight-bold d-inline">${requestScope.mjdto.title }</h2>
	            <p class="float-right"><small><span class="icon-calendar"></span> <fmt:formatDate value="${mjdto.date}" pattern="YYYY-MM-dd hh:mm:ss"/></small></p>
	            <p class="mt-5">
	              <img src="${contextPath }/market/uploaded/${mjdto.image }" alt="${mjdto.image }" class="img-fluid">
	            </p>
	            <div class="about-author d-flex p-4 bg-light">
	                <p style="color: #4a4a4a;">${mjdto.content }</p>
	            </div>


				<!-- 댓글 영역 -->
	            <div class="pt-5 my-5">
	              <h4 class="mb-5 font-weight-bold"><span class="icon-chat"></span> ${totalComment } Comments</h4>
	              <div class="comment-list">
	                <div class="comment">
	                <c:forEach var="mrdto" items="${replyList }">
	                	 <div class="comment-body">
		                    <h5 class="d-inline mr-5">${mrdto.name }</h5>
		                    <small>(${mrdto.email })</small>
		                    <small class='float-right'><fmt:formatDate value="${mrdto.date}" pattern="YYYY-MM-dd hh:mm:ss"/></small>
		                    <p class="mt-2">${mrdto.content } </p>
	                  	</div>
	                  	<hr>
	                </c:forEach>
	                </div>
	              </div>
	              
	              
	              <!-- 댓글 폼 -->
                 <div class="comment-form-wrap pt-5">
                   <h5 class="mb-3">Leave a comment</h5>
	                 <form action="${contextPath}/mk/addComment.do" class="p-3 bg-light" method="post">
	                   <div class="d-inline mb-1">
	                     <label for="name" class="mr-5">Name</label>
	                     <span style="color: #4a4a4a;">${mdto.name } <small> ( ${mdto.email } )</small></span>
	                   </div>
	                   <div class="float-right">
	                     <input type="submit" value="comment" class="btn-white submit" style="border: none;">
	                   </div>
	                   <div class="form-group">
	                     <label for="message">Comment</label>
	                     <textarea name="content" id="message" cols="30" rows="5" class="form-control"></textarea>
	                   </div>
                   		<input type="hidden" value="${mjdto.no }" name="board_no">
	                   	<input type="hidden" value="${mdto.name }" name="name">
	                   	<input type="hidden" value="${mdto.email }" name="email">
	                 </form>
                 </div>

	              
	              
	            </div>
	          </div>
	          
	          
	          
	          <!-- 우측메뉴 -->
	    	<div class="col-lg-4 sidebar ftco-animate bg-light">
	            <div class="sidebar-box ftco-animate mt-3">
	            	<h3 class="sidebar-heading fontcolor">SHOPPING</h3>
	              <ul class="categories mt-3">
	                <li><a>가격 <span style="color: black;">${mjdto.price }</span></a></li>
	                <li><a>구매가능수량 <span style="color: black;">${mjdto.stock }</span></a></li>
	                
	                <!-- 구매가능수량만큼 forEach -->
	                <li><a>수량선택<span><select onchange="caltotal()" id="quantity">
	             <c:forEach var="i" begin='1' end="${mjdto.stock }">
	                	<option value="${i }"/>${i }
	             </c:forEach> 	
	                </select></span></a></li>
	                <li><a>결제예상가격
	                	<span id="totalprice" style="color: #00c853; weight: bolder;">${mjdto.price }</span>
	                	</a></li>
	                <li>
	                	<div class="row px-3 mt-3">
		                	<a class="btn m-auto hover col-md-4" href="javascript:cart()"><b>장바구니</b></a>
		                	<a class="btn m-auto hover col-md-4" href="javascript:buy()"><b>바로구매</b></a>
		                	<a class="btn m-auto hover col-md-4" href="./market.do"><b>목록으로</b></a>
	                	</div>
	          	<c:set var="admin" value="${sessionScope.mdto.admin }"/>
	          		<c:if test="${admin == 1 }">
	          			<div class="row px-3 mt-3">
			        		<a class="btn m-auto hover col-md-4" href="./modifyView.do?no=${mjdto.no }"><b>아이템수정</b></a> 
			                <a class="btn m-auto hover col-md-4" href="#" onclick="deleteitem()"><b>아이템삭제</b></a>
		                </div>
	            	</c:if>
	                </li>
	              </ul>
	            </div>


				<!-- 최근 본 아이템 for문 돌릴거임 -->
	            <div class="mt-5 sidebar-box ftco-animate">
	              <h3 class="sidebar-heading fontcolor">RECENTLY</h3>
	              
	              <c:forEach var="cookieDTO" items="${requestScope.cookies }">
	              <div class="block-21 mb-4 d-flex">
	                <a class="blog-img mr-4"
	                style="background-image: url(${contextPath }/market/uploaded/${cookieDTO.image });"></a>
	                <div class="text">
	                  <h3 class="heading"><a href="${contextPath}/mk/showcontent.do?no=${cookieDTO.no}"><b>${cookieDTO.name }</b></a></h3>
	                  <div class="meta">
	                    <div class="d-block"><span class="icon-calendar"></span> <fmt:formatDate value="${cookieDTO.date}" pattern="YYYY-MM-dd"/></div>
	                    <div><i class="fas fa-won-sign"></i> ${cookieDTO.price }</div>
<!-- 	                    <div><a href="#"><span class="icon-chat"></span> 19</a></div> -->
	                  </div>
	                </div>
	              </div>
	              </c:forEach>
	             
	            </div>

	          </div><!-- END COL -->
	          
	    		</div>
	    	</div>
	    	
	    		 <form id="cartForm" method="post" action="${contextPath }/mk/addCart.do"> <!-- 카트폼 -->
	              		<!-- 넘길값세팅 -->
	              		<input type="hidden" name="price" id="price" value="${mjdto.price }">
	                	<input type="hidden" name="quantity" id="quantity1" value="1">
	                	<input type="hidden" name="item" value="${mjdto.item }">
	                	<input type="hidden" name="name" id="itemname" value="${mjdto.name }">
	                	<input type="hidden" name="category" value="${mjdto.category }">
	                	<input type="hidden" name="img" value="${mjdto.image }">
	              </form>
	              <form id="orderForm" method="post" action="${contextPath }/mk/payItem.do?no=${mjdto.no}"> <!-- 바로주문 폼 -->
	              		<!-- 넘길값세팅 -->
	              		<input type="hidden" name="price" value="${mjdto.price }">
	                	<input type="hidden" name="quantity" id="quantity2" value="1">
	                	<input type="hidden" name="item" value="${mjdto.item }">
	                	<input type="hidden" name="name" id="itemname" value="${mjdto.name }">
	                	<input type="hidden" name="category" value="${mjdto.category }">
	                	<input type="hidden" name="total" id="total" value="${mjdto.price }">
	              </form>
	    	
	    </section>
	    
	    <!-- navbar -->
		<jsp:include page="market_footer.jsp"></jsp:include>
	    
		</div><!-- END COLORLIB-MAIN -->
		
	</div>
		
		
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


	<jsp:include page="market_link_js.jsp"/>
	
</body>
</html>