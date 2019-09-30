<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>        
<!DOCTYPE html>
<footer class="py-5 ftco-footer ftco-bg-dark ftco-section">
	      <div class="container">
	        <div class="row mb-4">
	          <div class="col-md">
	            <div class="ftco-footer-widget mb-4 ml-md-4">
	              <h2 class="mb-4 ftco-heading-2">Category</h2>
	              <ul class="list-unstyled categories">
	                <li><a href="${contextPath }/co/index.go">T2 WAREHOUSE Home</a></li>
	                <li><a href="${contextPath }/mk/market.do">T2 MARKET Home</a></li>
	                <li><a href="#">Cart</a></li>
	                <li><a href="#">My Page</a></li>
	              </ul>
	            </div>
	          </div>
	          <div class="col-md">
	          </div>
	          <div class="col-md">
	            <div class="ftco-footer-widget mb-4">
	            	<h2 class="mb-4 ftco-heading-2">Have a Questions?</h2>
	            	<div class="block-23 mb-3">
		              <ul>
		                <li><a href="#"><span class="icon icon-map-marker"></span><span class="text">부산광역시 부산진구 동천로 109 삼한골든게이트</span></a></li>
		                <li><a href="#"><span class="icon icon-phone"></span><span class="text">012-345-6789</span></a></li>
		                <li><a href="#"><span class="icon icon-envelope"></span><span class="text">t2warehouse@cargo.co.kr</span></a></li>
		              </ul>
		            </div>
	            </div>
	          </div>
	        </div>
	        <div class="row p-auto">
	          <div class="mx-auto">
	            <p class="d-inline mx-auto">© 2019 TEAM2 WAREHOUSE. All rights reserved.</p>
	          </div>
	        </div>
	      </div>
	    </footer>