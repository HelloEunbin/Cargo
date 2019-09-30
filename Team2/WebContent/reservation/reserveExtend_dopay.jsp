<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>RESERVATION - TEAM2 WAREHOUSE</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<c:choose>
	<c:when test="${param.state eq 'reservation'}"><c:set var="pay" value="${param.res_payment}"/></c:when>
	<c:otherwise><c:set var="pay" value="${param.res_payment + param.payment}"/></c:otherwise>
</c:choose>
	<script type="text/javascript">
	
	history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
	};
	
    $(function(){
    	
        var IMP = window.IMP; // 생략가능
        IMP.init('imp82807865'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        var success = 0;
        
        IMP.request_pay({
            pg : 'html5_inicis',
           	// pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '${param.house} : ${param.start_day} ~ ${param.end_day}',
            amount : ${pay},
            buyer_email : '${param.email}',
            buyer_name : '${param.name}',
            buyer_tel : '${param.phone}',
            //m_redirect_url : 'http://www.naver.com' 카카오페이는 필요없음
        }, function(rsp) {
            if ( rsp.success ) {
            	success = 1;
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                $("#frm").submit();	// 결제 성공시 하단 form submit
            } else {
                msg = '결제에 실패하였습니다. ';
                msg += rsp.error_msg;
                alert(msg);
                location.href="../re/info.me?warehouse=A";
            }
        });
        
    });
    </script>


</head>
<body>
	<form id="frm" action="../re/reserv_ext_confirm" method="post">
		
		<input type="hidden" name="state" value="${param.state}">
	<c:choose>
		<c:when test="${param.state eq 'reservation'}"><input type="hidden" name="num" value="${param.num}"></c:when>
		<c:otherwise><input type="hidden" name="item" value="${param.item}"></c:otherwise>
	</c:choose>
		<input type="hidden" name="email" value="${param.email}">
		<input type="hidden" name="start_day" value="${param.start_day}">
		<input type="hidden" name="end_day" value="${param.end_day}">
		<input type="hidden" name="payment" value="${param.payment}">
		<input type="hidden" name="house" value="${param.house}">
		<input type="hidden" name="name" value="${param.name}">
		<input type="hidden" name="phone" value="${param.phone}">
		<input type="hidden" name="totalDay" value="${param.totalDay}">
		<input type="hidden" name="res_payment" value="${param.res_payment}">
	</form>
</body>
</html>