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

<title>회원 정보 관리</title>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!-- Custom fonts for this template-->
<link href="${contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Page level plugin CSS-->
<link href="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<link href="${contextPath}/vendor/datatables/select.bootstrap4.min.css" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${contextPath}/css/sb-admin.css" rel="stylesheet">
</head>
<body id="page-top">
	
	<jsp:include page="Top.jsp"/>
	<div id="content-wrapper">

		<div class="container-fluid">

			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li>현재 페이지 :&nbsp;&nbsp;&nbsp;</li>
				<li class="breadcrumb-item"><a href="${contextPath}/ad/admin_main">관리자 종합 메뉴</a></li>
				<li class="breadcrumb-item active">회원 정보 관리</li>
			</ol>

			<!-- DataTables -->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fas fa-table"></i> 회원 정보  표 </div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>구분</th>
									<th>이름</th>
									<th>이메일</th>
									<th>연락처</th>
									<th>우편</th>
									<th>주소</th>
									<th>상세 주소</th>
									<th>가입일</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>구분</th>
									<th>이름</th>
									<th>이메일</th>
									<th>연락처</th>
									<th>우편</th>
									<th>주소</th>
									<th>상세 주소</th>
									<th>가입일</th>
								</tr>
							</tfoot>
							<tbody>
							<c:forEach items="${list}" var="mdto">
								<tr data-toggle="modal" data-target="#detailModal" data-cate="member" data-primary="${mdto.email}">
								<c:choose>
									<c:when test="${mdto.admin ==1}"><td><c:out value="관리자"/></td></c:when>
									<c:otherwise><td><c:out value="고객"/></td></c:otherwise>
								</c:choose>
									<td><c:out value="${mdto.name}"/></td>
									<td><c:out value="${mdto.email}"/></td>
									<td><c:out value="${mdto.phone}"/></td>
									<td><c:out value="${mdto.postCode}"/></td>
									<td><c:out value="${mdto.roadAddr}"/></td>
									<td><c:out value="${mdto.detailAddr}"/></td>
									<td><fmt:formatDate value="${mdto.reg_date}" pattern="YYYY-MM-dd a hh:mm"/></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer small text-muted">Updated <fmt:formatDate value="${updateTime}" type="both" dateStyle="full" timeStyle="short"/></div>
			</div>

			<p class="small text-center text-muted my-5">
				<em>More table examples coming soon...</em>
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
	<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">회원 정보</h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body  mx-auto container-fluid">
				<form action="../me/modifyMember" method="post" id="modify">
					<table class='table mx-auto my-auto'>
						<tr>
							<th colspan="2" class="text-center table-primary">회원 정보  ▼</th>
						</tr>
						<tr>
							<th>가입일</th>
							<td>
								<input type="text" name="reg_date" id="reg_date" class="form-control-plaintext dont" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>이름 <span class="sr-only text-danger">(관리자)</span></th>
							<td>
								<input type="text" name="name" id="name" class="form-control-plaintext" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td>
								<input type="text" name="email" id="email" class="form-control-plaintext dont" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td>
								<input type="text" name="pwd" id="pwd" class="form-control-plaintext" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>
								<input type="text" name="phone" id="phone" class="form-control-plaintext" readonly="readonly">
							</td>
						</tr>
						<tr>
							<th>우편 번호</th>
							<td class="row">
								<input type="text" name="postCode" id="postCode" class="form-control-plaintext ml-3 col-6 dont" readonly="readonly">
								<input type="hidden" class="btn btn-outline-primary col-5 modi" onclick="execPostcode()" value="우편번호 찾기">
							</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="roadAddr" id="roadAddr" class="form-control-plaintext dont" readonly="readonly">
								<input type="text" name="detailAddr" id="detailAddr" class="form-control-plaintext"  readonly="readonly">
							</td>
						</tr>
						<tr class="sr-only admin">
							<th>관리자 여부</th>
							<td class="row">
								<div class="form-check">
								  <input class="form-check-input dont" type="radio" name="admin" id="custom" value="0" checked="checked">
								  <label class="form-check-label" for="custom">
								    	고객
								  </label>
								</div>&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="form-check">
								  <input class="form-check-input dont" type="radio" name="admin" id="admin" value="1">
								  <label class="form-check-label" for="admin">
								    	관리자
								  </label>
								</div>&nbsp;&nbsp;&nbsp;&nbsp;
								<div class="form-check">
								  <input class="form-check-input dont" type="radio" name="admin" id="market" value="2">
								  <label class="form-check-label" for="market">
								    	중고장터 관리자
								  </label>
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" id="result" name="result">
					<input type="hidden" name="page" value="admin">
					</form>
				</div>
				<div class="modal-footer">
					<input class="btn btn-primary modi" type="hidden" onclick="register();" value="수정하기">
					<input class="btn btn-info" type="button" id="modistart" onclick="makeChange();" value="고객 정보 수정">
					<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="${contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Page level plugin JavaScript-->
	<script src="${contextPath}/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${contextPath}/vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Daum 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	
	<!-- Custom scripts for all pages-->
	<script src="${contextPath}/js/sb-admin.js"></script>

	<!-- Demo scripts for this page-->
	<script src="${contextPath}/js/datatables-custom.js"></script>
	
	<script type="text/javascript">
		function makeChange() {
			$('table input:not(.dont)').removeClass('form-control-plaintext').addClass('form-control').removeAttr('readonly');
			$('#modistart').attr('type', 'hidden');
			$('.modi').attr('type', 'button');
			$('.admin').removeClass('sr-only');
		}
		
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function execPostcode() {
	    	new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postCode').value = data.zonecode;
	                document.getElementById("roadAddr").value = addr;
	                
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddr").focus();
	            }
	        }).open();
	    }
		
		//수정 클릭 시 양식 체크 후 만족하면  submit
	    function register(){
			var result = 1;
			var email = $("#email").val();
			var pwd = $("#pwd").val();
			var name = $("#name").val();
			var phone = $("#phone").val();
			var postCode = $("#postCode").val();
			var detailAddr = $("#detailAddr").val();
			
			if (email == '') result = 0;
			if (pwd == '') result = 0;
			if(name=='') result = 0;
			else{
				var reg = /^[가-힣]{2,6}$/;
				if(!reg.test(name)) result=3;
			}
			if(phone =='') result = 0;
			else{ 
				var reg = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
				if(!reg.test(phone)) result = 2;
			}
			if(postCode==''||detailAddr=='') result = 0;
			
			if(result==0){
				alert("필수 사항을 기입해주세요.");
			}else if(result ==2){
				alert("전화번호 양식이 맞지 않습니다.");
			}else if(result ==3){
				alert("올바른 이름을 입력해 주세요.");
			}else{
				$("#modify").submit();
			}
		}
		
	    $(document).ready(function() {
    	  $('#detailModal').on('hide.bs.modal', function (event) {
    		  $('#postCode').siblings('input').attr('type', 'hidden');
    		  $('table input:not(.dont)').removeClass('form-control').addClass('form-control-plaintext').attr('readonly','readonly');
    		  $('.modi').attr('type', 'hidden');
    		  $('#modistart').attr('type', 'button');
    		  $('#name').closest('tr').find('span').addClass('sr-only');
    		  $('.admin').addClass('sr-only');
    		});//모달 없어졌을 때..
	    });//end of ready
	</script>
</body>
</html>