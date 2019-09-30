<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>POST - TEAM2 WAREHOUSE MARKET</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- css/cdn links -->
	<jsp:include page="market_link.jsp"></jsp:include>
    
    <script type="text/javascript">
    	function getTitle(select){
    		var itemid = select.value;
    		var itemname = document.getElementById(itemid).value;
    		document.getElementById("title").value = itemname;
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
			
			<section class="ftco-section mb-5">
	    		<div class="container">
	    		<div class="row">
	    		<div class="col-lg-12 ftco-animate pt-2">
	            
					<h3 class="mb-5 font-weight-bold"><i class="fas fa-clone"></i> POST</h3>
	                
	                <div class="p-3 p-md-5 bg-light rounded" style="box-shadow: 3px 3px 20px #e9e9e9;">
	                <form action="${contextPath }/mk/postItem.do" enctype="multipart/form-data" method="post">
	                
	                  <c:forEach items="${requestScope.itemList }" var="idto">
		                  	<input type="hidden" id="${idto.item}" value="${idto.name }">
		              </c:forEach>
		              
	                  <div class="row">
		                  <div class="form-group col-md-5">
		                    <label for="name">Item *</label>
		                    <select class="form-control" name="item" onchange="getTitle(this)">
		                    
			             	<c:forEach items="${requestScope.itemList }" var="idto">
			             		<option value="${idto.item }">${idto.item } : ${idto.name }</option>
		                	</c:forEach>
		                
		                    </select>
		                  </div>
		                  <div class="form-group col-md-7">
		                    <label for="name">Title *</label>
		                    <input type="text" class="form-control" name="title" id="title" value="${itemList[0].name }" readOnly>
		                  </div>
	                  </div>
	                  
	                  <div class="form-group">
		                  <label for="name">Image *</label>
		                  <input type="file" class="form-control" name="image">
	                  </div>
	                  <div class="form-group">
		                  <label for="message">Content *</label>
		                  <textarea name="content" cols="30" rows="10" class="form-control"></textarea>
	                  </div>
	                  <div class="form-group">
	                  	  <input type="submit" value="POST ITEM" class="btn py-3 px-4 btn-primary mx-auto">
	                  </div>
	                  
	                </form>
	                </div>
	                
	            </div>
	    		</div>
	    		</div>
	   		</section>
	    
	   <!-- footer -->
		<jsp:include page="market_footer.jsp"></jsp:include>
		
		</div><!-- END COLORLIB-MAIN -->
	</div>
		
		  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


<!-- bottom link -->
<jsp:include page="market_link_js.jsp"></jsp:include>
    
		

</body>
</html>