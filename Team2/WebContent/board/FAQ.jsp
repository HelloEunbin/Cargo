<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>FAQ - TEAM2 WAREHOUSE</title>
	<meta name="description" content="Lambda is a beautiful Bootstrap 4 template for multipurpose landing pages." /> 
	
	<link href="${contextPath }/css/board.css" rel="stylesheet">
	

    <script type="text/javascript">
	
	    $(function() {
			
			$(".bt").on('click', function() {
				$(".card").attr("style", "display:none");
				var index = $(".bt").index(this);
				if (index == 0) {
					$(".card").attr("style", "display:flex");
				} else {
					index = index * 5;
					for (var i = 1; i < 10; i++) {
						$(".card:eq(" + (index - i) + ")").attr("style", "display:flex");
					}
				}
			});
		});
	</script>

</head>
<body>


<!--navigation in page-->
<jsp:include page="../inc/header.jsp"></jsp:include>

	<section>
		<div class="container-fuild">
		<div class="row">
		
		<!--left Menu-->
		<jsp:include page="board_menu.jsp"></jsp:include>
			
		<div class="col-sm-10 mr-auto ml-auto" id="content">
        <div class="container my-5">
        
            <div class="row">
                <div class="col-md-7 col-sm-9 mx-auto text-center">
                    <h1 class="mb-0">자주하는 질문</h1>
                    <span class="text-muted">Frequently Asked Questions</span>
                </div>
            </div>
                
               <!--  FAQ시작 -->
             <div class="col-md-12 bg-light mx-auto mt-5 p-5" style="box-shadow: 1px 1px 40px #e8e8e8;">
             <div id="service" class="view">
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0"><i class="fas fa-question fa-spin" style="color: black"></i> <a class="card-link" data-toggle="collapse" href="#collapse1">&nbsp; 모든 물품을 다 보관 할 수 있나요?</a></h5> 
					</div>
					<div id="collapse1" class="collapse" data-parent="#service">
						<div class="card-body">대부분의 물품은 보관 가능 합니다.<br>보관하지 못하는 물품 : 변질우려가 있는 물품, 동식물, 현금(통장)및 유가증권<br>화재의 위험이 있는 위험물, 도난물품, 도검류, 권총 등 불법 무기류와 미풍양속을 해치는 물품(확실치 않을 시 문의 바랍니다.)</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0"><i class="fas fa-question fa-spin" style="color: black"></i> <a class="card-link" data-toggle="collapse" href="#collapse2">&nbsp; 물품의 입출 가능시간은 어떻게 되나요? </a></h5>
					</div>
					<div id="collapse2" class="collapse" data-parent="#service">
						<div class="card-body">24시간 365일 언제든지 가능합니다.(단 심야 시간에는 인근주민을 배려해 주시기 바랍니다.)</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0"><i class="fas fa-question fa-spin" style="color: black"></i> <a class="card-link" data-toggle="collapse" href="#collapse3">&nbsp; 상담 및 견적은 어떻게 되나요?</a></h5>
					</div>
					<div id="collapse3" class="collapse" data-parent="#service">
						<div class="card-body">담당자에게 문의하여 주시면 친절히 안내 해 드리겠습니다.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0"><i class="fas fa-question fa-spin" style="color: black"></i> <a class="card-link" data-toggle="collapse" href="#collapse4">&nbsp; 장마철 습기 문제는 어떤가요? </a></h5>
					</div>
					<div id="collapse4" class="collapse" data-parent="#service">
						<div class="card-body">에어컨과 제습기를 이용하여 항온항습이 되도록 항상 관리하고 있습니다.</div>
					</div>
				</div>	
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0"><i class="fas fa-question fa-spin" style="color: black"></i> <a class="card-link" data-toggle="collapse" href="#collapse5">&nbsp; 보안문제는 어떤가요? </a></h5>
					</div>
					<div id="collapse5" class="collapse" data-parent="#service">
						<div class="card-body">TEAM2 WAREHOUSE는 이용고객의 소중한 물품과 개인정보 보호를 위하여 24시간 365일 유인.무인 보안체계를 갖추어 이용고객이 편리하고 안심하게 사용할 수 있게 하겠습니다. </div>
					</div>
				</div>
			</div>
			<div id="reserve" class="view">
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0"><i class="fas fa-question fa-spin" style="color: black"></i> <a class="card-link" data-toggle="collapse" href="#collapse6">&nbsp; 계약기간은 어떻게 되나요? </a></h5>
					</div>
					<div id="collapse6" class="collapse" data-parent="#reserve">
						<div class="card-body">최소 15일에서 시작됩니다. 15일 미만의 경우 별도 문의 바랍니다. </div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0"><i class="fas fa-question fa-spin" style="color: black"></i> <a class="card-link" data-toggle="collapse" href="#collapse7">&nbsp; 계약시 필요한 비용은 어떻게 되나요?</a></h5>
					</div>
					<div id="collapse7" class="collapse" data-parent="#reserve">
						<div class="card-body">창고의 크기에 따른 보증금과 이용금액이 다르니 담당자에게 문의 바랍니다. </div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0"><i class="fas fa-question fa-spin" style="color:black"></i> <a class="card-link" data-toggle="collapse" href="#collapse8">&nbsp; 중도 해약시 위약금이 있나요? </a></h5>
					</div>
					<div id="collapse8" class="collapse" data-parent="#reserve">
						<div class="card-body">별도의 위약금이 발생됩니다. 해지 수수료에 대한 내용은 담당자에 문의 바랍니다.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0"><i class="fas fa-question fa-spin" style="color: black"></i> <a class="card-link" data-toggle="collapse" href="#collapse9">&nbsp; 택배로 물건을 맡기고 찾을 수 있나요? </a></h5>
					</div>
					<div id="collapse9" class="collapse" data-parent="#reserve">
						<div class="card-body"> 택배를 이용한 박스의 입고/출고가 가능합니다. (택배비/운반비 별도)<br>직접 물품 입출고 또한 가능하며, 해당 지점 영업시간내 가능합니다.<Br>방문 수거/배송 서비스도 제공 예정입니다.</div>
					</div>
				</div>
				<div class="card">
					<div class="card-header">
						<h5 class="mb-0"><i class="fas fa-question fa-spin" style="color: black"></i> <a class="card-link" data-toggle="collapse" href="#collapse10"> 맡겨놓은 물품을 폐기하고 싶을때는 어떻게 하나요? </a></h5>
					</div>
					<div id="collapse10" class="collapse" data-parent="#reserve">
						<div class="card-body"> 폐기 서비스를 제공합니다. 10만원의 폐기비용이 발생합니다.</div>
					</div>
				</div>
			</div>
			</div>
			 
		</div>
      	</div>
		</div>
		</div>
	</section>

<!--footer -->
<jsp:include page="../inc/footer.jsp"></jsp:include>

</body>
</html>