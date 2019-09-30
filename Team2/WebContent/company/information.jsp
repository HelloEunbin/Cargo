<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회사소개 - TEAM2 WAREHOUSE</title>

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>INFORMATION - TEAM2 WAREHOUSE</title>
<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 

<style type="text/css">
   	#inputArea{
	   	background-color: rgba(108, 117, 125, 0.2);
   	}
   	
   	section{
		background-image: url(../img/reservation2.jpg);
		background-size: cover;
	}
	.background{
		background-color: rgba( 10, 10, 10, 0.9);
	}
	
	.info{
		max-width: 75%;
		margin: auto auto;
	}
	.border{
		border-right: 2px solid #ffffff;
		border-left: none;
	}
	
	.text-gray{
		color: #868e96;
	}
</style>

</head>

<body>
<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>

<section class="py-7">
	<div class="info">	
        <div class="row">
          <div class="col-md-7 col-sm-9 mx-auto text-center">
              <span class="text-muted text-uppercase">INFORMATION</span>
              <h2 class="display-4 text-white">HOUSE INFORMATION</h2>
          </div>
		</div>

        <div class="row px-5 mt-5 background raised-box rounded">
        	
        	<div class="row col-lg-12 my-5 mx-auto">
        		<div class="col-lg-7 py-4">
       				<img class="col-lg-6 pl-0 pr-4 float-left" alt="houseA" src="../img/houseA_i.png">
       				
       				<div class="d-inline-block m-auto py-7">
	       				<h1 class="text-white">HOUSE A</h1>
	       				<span class="text-gray mt-4 d-inline-block">
	        				<h4 class="mb-0 text-gray">HOUSE SIZE</h4>
	        				<hr class="mt-0" style="border: solid 1px white;">
							면적: 3㎡ (2m x 1.5m)
							높이: 2m
							<hr style="border: solid 1px white;">
							개인용 원룸 이사짐 (책장, 침대세트,책상 등)<br>
							계절용품 등 1 톤 화물차 1대 적재 분량의 크기<br>
	       				</span>
       				</div>
       				
        		</div>
        		<div class="text-center col-lg-5">
        			<h1 class="text-white d-inline">HOUSE B</h1>
        			<img class="mt-3 col-lg-10 mx-auto d-block" alt="houseB" src="../img/houseB_i.png">
        			<span class="text-gray mt-4 d-inline-block">
         				<h4 class="mb-0 text-gray d-inline mr-3">HOUSE SIZE</h4>
         				면적: 6㎡ (3m x 2m), 높이: 2m
         				<hr class="mt-0" style="border: solid 1px white;">
						10평형대 아파트 이삿짐 (소형 장롱, 2인용 소파, 침대세트 등)<br>
						1톤 화물차 2대 적재 분량의 크기
				</span>
				</div>
        	</div>
        	
			<div class="text-center row col-lg-12 mb-5 mx-auto">
          		<div class="col-lg-6">
          			<h1 class="text-white d-inline">HOUSE C</h1>
          			<img class="mt-3 col-lg-8 mx-auto d-block" alt="houseC" src="../img/houseC_i.png">
          			<span class="text-gray mt-4 d-inline-block">
           				<h4 class="mb-0 text-gray d-inline mr-3">HOUSE SIZE</h4>
           				면적: 8㎡ (4m x 2m), 높이: 2m
           				<hr class="mt-0" style="border: solid 1px white;">
						20평형대 아파트 이삿짐 (장롱, 3인용 소파, 침대세트 등)<br>
						2.5톤 화물차 적재 분량의 크기
					</span>
          		</div>
          		<div class="col-lg-6">
        			<h1 class="text-white d-inline">HOUSE D</h1>
        			<img class="mt-3 col-lg-11 mx-auto d-block" alt="houseD" src="../img/houseD_i.png">
        			<span class="text-gray mt-4 d-inline-block">
          				<h4 class="mb-0 text-gray d-inline mr-3">HOUSE SIZE</h4>
          				면적: 15㎡ (6m x 2.5m), 높이: 2.5m
          				<hr class="mt-0" style="border: solid 1px white;">
						30평형대 아파트 이사짐, 대형 가구 등<br>
						2.5톤 화물차 적재 분량 이상의 크기
					</span>
				</div>
			</div>
        </div>          
	</div>
</section>

<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.7.0/feather.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
</body>
</html>