<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>관리자 - 그래프</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Custom fonts for this template-->
<link href="${contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="${contextPath}/css/sb-admin.css" rel="stylesheet">
</head>
<body id="page-top">
	<jsp:include page="Top.jsp" />
	<div id="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li>현재 페이지 :&nbsp;&nbsp;&nbsp;</li>
				<li class="breadcrumb-item active"><a href="#">그래프 보기</a></li>
			</ol>
<!-- 			<div class="card mb-3"> -->
<!-- 				<div class="card-header"> -->
<!-- 					<i class="fas fa-chart-area"></i> Area Chart Example -->
<!-- 				</div> -->
<!-- 				<div class="card-body"> -->
<%-- 					<canvas id="myAreaChart" width="100%" height="30"></canvas> --%>
<!-- 				</div> -->
<!-- 				<div class="card-footer small text-muted">Updated yesterday at -->
<!-- 					11:59 PM</div> -->
<!-- 			</div> -->

			<div class="row">
				<div class="col-lg-4">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fas fa-chart-pie"></i> 창고별 선호도 (예약 포함)
						</div>
						<div class="card-body py-0 px-0">
							<div id="piechart" style="width: 100%; height:350px;"></div>
						</div>
						<div class="card-footer small text-muted">Updated <fmt:formatDate value="${updateTime}" type="both" dateStyle="short" timeStyle="short"/></div>
					</div>
				</div>
				<div class="col-lg-8">
					<div class="card mb-3">
						<div class="card-header">
							<i class="fas fa-chart-bar"></i> 현재 이용중인 창고 수
						</div>
						<div class="card-body py-0 px-0">
							<div id="barchart" style="width: 100%; height: 350px;"></div>
						</div>
						<div class="card-footer small text-muted">Updated <fmt:formatDate value="${updateTime}" type="both" dateStyle="short" timeStyle="short"/></div>
					</div>
				</div>
			</div>
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-chart-area"></i> 매출 현황 (6개월)
				</div>
				<div class="card-body py-0 px-0">
					<div id="combochart" style="width: 100%; height: 400px"></div>
				</div>
				<div class="card-footer small text-muted">Updated <fmt:formatDate value="${updateTime}" type="both" dateStyle="short" timeStyle="short"/></div>
			</div>

			<p class="small text-center text-muted my-5">
				<em>More chart examples coming soon...</em>
			</p>

		</div>
		<!-- /.container-fluid -->

		<!-- Sticky Footer -->
		<footer class="sticky-footer">
			<div class="container my-auto">
				<div class="copyright text-center my-auto">
					<span>Copyright © Your Website 2019</span>
				</div>
			</div>
		</footer>

	</div>
	<!-- /.content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
		<i class="fas fa-angle-up"></i>
	</a>

	<!-- Bootstrap core JavaScript-->
	<script src="${contextPath}/vendor/jquery/jquery.min.js"></script>
	<script
		src="${contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
	<!-- Demo scripts for this page-->
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
	    google.charts.setOnLoadCallback(drawPieChart);
	    google.charts.setOnLoadCallback(drawBarChart);
	    google.charts.setOnLoadCallback(drawComboChart);
	
	    function drawPieChart() {
	
	      var data = google.visualization.arrayToDataTable(${chartInfo.pie});
	
	      var options = {
	        width: '100%',
            height: '100%',
            chartArea: {'width': '90%', 'height': '80%'},
            legend: {'position': 'top', 'alignment':'center'},
	      };
	
	      var chart = new google.visualization.PieChart(document.getElementById('piechart'));
	
	      chart.draw(data, options);
	      window.addEventListener('resize', function() { chart.draw(data, options); }, false);
	    }
	    
	    function drawBarChart() {
			var data = google.visualization.arrayToDataTable(${chartInfo.bar});
			
			var options = {
			        width: '100%',
		            height: '100%',
		            chartArea: {'top': 20, 'width': '80%', 'height': '80%'},
		            legend: {'position': 'none'},
		            hAxis: {
		                title: '사용중인 창고',
		                maxValue: 25,
		                viewWindowMode:'explicit',
		                viewWindow: {
		                    max: 25
		                }
		              }
			      };
			
	      	var chart = new google.visualization.BarChart(document.getElementById('barchart'));
	
	     	chart.draw(data, options);
	      	window.addEventListener('resize', function() { chart.draw(data, options); }, false);
		}
	    
	    function drawComboChart() {
	        var data = google.visualization.arrayToDataTable(${chartInfo.combo});

	        var options = {
	        		width: '100%',
		            height: '100%',
		            chartArea: {'top': 20, 'width': '90%', 'height': '80%'},
			        vAxis: {title: '수익'},
			        hAxis: {title: 'Month'},
			        seriesType: 'bars',
			        series: {4: {type: 'line'}},
			        legend: {'position': 'bottom', 'alignment':'center'}
	        };

	        var chart = new google.visualization.ComboChart(document.getElementById('combochart'));
	        chart.draw(data, options);
	        window.addEventListener('resize', function() { chart.draw(data, options); }, false);
	      }
	</script>
</body>
</html>