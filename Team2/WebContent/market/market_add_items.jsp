<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>중고장터 아이템 추가 페이지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- css/cdn links -->
<jsp:include page="market_link.jsp" />
<link href="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="${contextPath}/vendor/datatables/select.bootstrap4.min.css" rel="stylesheet">
<link href="${contextPath}/css/bootstrap/bootstrap.min.css">

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
						<div class="col-lg-12 ftco-animate">
							<div class="comment-form-wrap pt-5">
								<h2 class="mb-3 font-weight-bold"><i class='fas fa-plus'></i> 추가하기 <span class="text-muted" style="font-size: 0.5em">물품 ID는 자동으로 생성됩니다.</span></h2>
								<div class="table-responsive">
								<form method="post">
								<table class="mb-3 table table-bordered add">
									<thead>
									<tr>
										<td><input type="text" name="name" id="name" class="form-control" placeholder="이름"></td>
										<td><input type="text" name="price" id="price" class="form-control cur" placeholder="가격"></td>
										<td>
											<select class="custom-select-lg" name="category" id="category">
											  <option value="fur">가구</option>
											  <option value="mat">공구</option>
											  <option value="elec">전자제품</option>
											  <option selected value="oth">기타</option>
											</select>
										</td>
										<td><input type="text" name="stock" id="stock" class="form-control cur" placeholder="재고"></td>
										<td align="center" ><input type="button" class="btn btn-success" value="입력" onclick="addItem(this);"></td>
									</tr>
									</thead>
								</table>
								</form>
								</div>
								
								<h2 class="mb-3 font-weight-bold"><i class="fas fa-table"></i> ITEMS TABLE</h2>
								<div class="table-responsive">
								<table class="table table-bordered" id="dataTable">
									<thead>
										<tr>
											<th>물품ID</th>
											<th>이름</th>
											<th>가격</th>
											<th>카테고리</th>
											<th>재고</th>
											<th class="no-sort">수정</th>
											<th class="no-sort">삭제</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="idto" items="${list}">
												<c:if test="${idto.category eq 'fur'}"><c:set var="c" value="가구"/></c:if> 
												<c:if test="${idto.category eq 'mat'}"><c:set var="c" value="공구"/></c:if>
												<c:if test="${idto.category eq 'elec'}"><c:set var="c" value="전자제품"/></c:if>
												<c:if test="${idto.category eq 'oth'}"><c:set var="c" value="기타"/></c:if> 
										<tr>
											<td class="item">${idto.item}</td>
											<td class="name">${idto.name}</td>
											<td class="price">${idto.price}</td>
											<td class="category">${c}</td>
											<td class="stock">${idto.stock}</td>
											<td><input type="button" class="btn btn-sm btn-outline-info modi" value="수정"></td>
											<td><button type="button" class="btn btn-sm btn-danger del">삭제</button></td>
										</tr>
									</c:forEach>
									</tbody>
									<tfoot>
										<tr>
											<th>물품ID</th>
											<th>이름</th>
											<th>가격</th>
											<th>카테고리</th>
											<th>재고</th>
											<th>수정</th>
											<th>삭제</th>
										</tr>
									</tfoot>
								</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<form method="post" id="go" class="sr-only"></form>
			</section>

			<!-- footer -->
			<jsp:include page="market_footer.jsp"></jsp:include>

		</div>
		<!-- END COLORLIB-MAIN -->
	</div>
	
	<jsp:include page="market_link_js.jsp"/>
	<script src="${contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script type="text/javascript">
	function addItem(s) {
		var price = $("#price").val();
		var name = $("#name").val();
		var category = $("#category").val();
		var stock = $("#stock").val();
		
		if(price=='') alert("가격을 입력하세요");
		else if(name=='') alert("이름을 입력하세요");
		else if(stock=='') alert("재고를 입력하세요");
		else{
			var button = $(s);
			var nearForm = button.closest('form');
			nearForm.attr("action", "../mk/add_item.do");
			nearForm.submit();
		}
	}

	$(document).ready(function() {
		//Call the dataTables jQuery plugin
		var table = $('#dataTable').DataTable({
	        "columnDefs": [ {
	            "targets": 'no-sort',
	            "width": "2%",
	            "orderable": false
	      } ]
	  	});
		
		$(document).on('keyup', '.cur', function() {
			$(this).val($(this).val().replace(/[^0-9]/g,''));
		});
		
		$(document).on( 'click', '.del', function () {
			var tr = $(this).closest('tr');
			var name = tr.find(".name").text();
			if(name =='') name=tr.find(".name input").val();
			var check = confirm(name+"을 삭제하시겠습니까?");
			
			if(check){
				var item = tr.find(".item").text();
				if(item =='') item=tr.find(".item input").val();
				
				$('<input>').attr({
				    type: 'hidden',
				    name: 'item',
				    value: item
				}).appendTo('#go');
				$('#go').attr("action", "../mk/del_item.do");
				$('#go').submit();
			}
		});
		$(document).on( 'click', '.modi',function () {
			var input = $(this);
			var tr = input.closest('tr');
			
			if(input.hasClass('btn-outline-info')){
				input.removeClass('btn-outline-info').addClass('btn-info');
				input.val("완료");
				
				var item = tr.find(".item");
				var name = tr.find(".name");
				var price = tr.find(".price");
				var category = tr.find(".category");
				var stock = tr.find(".stock");
				
				item.html($('<input>').attr({
				    type: 'text',
				    name: 'item',
				    value: item.text(),
				    class: 'form-control-plaintext',
				    readonly: 'readonly'
				}));
				name.html($('.add #name').clone().val(name.text()));
				price.html($('.add #price').clone().val(price.text()));
				
				var cate = category.text();
				category.html($('.add #category').clone()).find('option:contains("'+cate+'")').attr('selected','selected');
				stock.html($('.add #stock').clone().val(stock.text()));
				
			}else if(input.hasClass('btn-info') && input.val()=='완료'){
				var price = tr.find("#price").val();
				var name = tr.find("#name").val();
				var category = tr.find("#category").val();
				var stock = tr.find("#stock").val();
				
				if(price=='') alert("가격을 입력하세요");
				else if(name=='') alert("이름을 입력하세요");
				else if(stock=='') alert("재고를 입력하세요");
				else{
					tr.appendTo('#go');
					$('#go').attr("action", "../mk/modi_item.do");
					$('#go').submit();
				}
			}
		});
		
		$('#dataTable tbody').on( 'click', 'tr', function () {
		    if ( $(this).hasClass('selected') ) {
		        $(this).removeClass('selected');
		    }
		    else {
		        table.$('tr.selected').removeClass('selected');
		        $(this).addClass('selected');
		    }
		});//table tr 클릭시 강조	
	});
	</script>
</body>
</html>