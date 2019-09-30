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

    
  </head>
  <body>

	<div id="colorlib-page">
		
		<!-- navbar -->
		<jsp:include page="market_nav.jsp"></jsp:include>
		
		<div class="mt-5">
		
			<!-- header -->
			<jsp:include page="market_header.jsp"></jsp:include>
			
			
		<section class="ftco-section">
	    	<div class="container mb-5">
	    		<div class="row">
	    			<div class="col-lg-12 ftco-animate pt-2">
	            

	              <h3 class="font-weight-bold"><i class="far fa-check-circle fontcolor"></i> YOUR ORDER</h3>
	              <table class="table text-center">
	              <thead>
	              	<tr class="text-center font-weight-bold bg-light" style="font-family: 'Jeju Gothic' !important;">
		              	<td width='5%'>주문번호</td>
	              		<td width="55%">상품명</td>
	              		<td width='15%'>가격</td>
	              		<td width='10%'>수량</td>
	              		<td width='15%'>총 가격</td>
	              	</tr>
	              </thead>
	              <tbody style="color: rgba(0, 0, 0, 0.8);">
	            <c:forEach var="odto" items="${requestScope.oList }">
	            	<tr>
	           		<c:choose>
	           			<c:when test="${odto.order_id eq order_id_p }">
	           				<td></td>
	           			</c:when>
	           			<c:otherwise>
	           				<td style="vertical-align: middle;">${odto.order_id }</td>
	           			</c:otherwise>
	           		</c:choose>
	              		<td width="55%">${odto.name }</td>
	              		<td width='15%'>${odto.price }</td>
	              		<td width='10%'>${odto.quantity }</td>
	              		<td width='15%'><h5>${odto.price * odto.quantity }</h5></td>
	            	</tr>
	            	<c:set var="order_id_p" value="${odto.order_id }"/>
	            </c:forEach> 		
	            		
	            		
	            		
	              </tbody>
	              </table>
	          </div>
	    		</div>
	    	</div>
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