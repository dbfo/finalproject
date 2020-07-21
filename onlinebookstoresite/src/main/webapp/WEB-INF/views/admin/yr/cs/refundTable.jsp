<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">
<h2 class="mt-4">list</h2>
<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 검색결과[0]
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
<!-- 						환불 -->
						<c:if test="${path == 4 || path == 6 }">
							<th><input type = "checkbox"></th>
						</c:if>
						<th>번호</th>
						<th>신청날짜</th>
						<th>회원번호</th>
						<th>회원이름</th>
						<th>계좌정보</th>
						<th>환불 금액</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach var="vo" items="${list}">
						<tr>
							<c:if test="${path == 4 || path == 6 }">
								<td><input type = "checkbox" id = "sechb" <c:if test = "${vo.sestatus == 1 }">disabled</c:if>></td>
							</c:if>
							<td id = "senum">${vo.senum }</td>
							<td>
								<fmt:formatDate value = "${vo.appdate}" pattern="yyyy-MM-dd"/>
							</td>
							<td id = "bpaynumId">${vo.mnum}</td>
							<td>${vo.mname }</td>
							<td>${vo.account }</td>
							<td>${vo.reqmoney }</td>
							<td>
								<c:if test="${vo.sestatus == 0 }"> 
									신청
								</c:if>
								<c:if test="${vo.sestatus == 1 }"> 
									처리 완료
								</c:if>								
							</td>
						</tr>
					</c:forEach>
						<tr>
							<td colspan="8">
								<c:if test="${path == 4 || path == 6 }">
									<input id = "refundBtn" onclick = "abcbtn(${path})" class = "btn btn-success" type = "button" value = "처리하기">
								</c:if>
							</td>
						</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">

	$(function(){
		
		
		$("#refundBtn").on('click',function(){
			
			var tdArr = new Array();
	 		var mnumArr = new Array();
	 		var priceArr = new Array();
			var checkbox = $("input[type=checkbox]:checked");
			
			checkbox.each(function(i){
				// checkbox.parent() : checkbox의 부모는 <td>이다.
				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
			
				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				var no = td.eq(1).text();
	 			var mnum = td.eq(3).text();
	 			var price = td.eq(6).text();
				
				if(no != "번호"){
					tdArr.push(no);				
	 				mnumArr.push(mnum);
	 				priceArr.push(price);
				}
				
			});
					
			ajDeposit(tdArr, mnumArr, priceArr);
		})
		
		
	})
	
		
	function ajDeposit(tdArr, mnumArr, priceArr){
		
		
		$.ajax({
			url : "${pageContext.request.contextPath}/cs/refundMoneyGoMembers",
			dataType : "json",
			data : {"senum":tdArr, "mnum" : mnumArr , "priceArr" : priceArr},
			success : function(data){
				console.log(data.code);
				if(data.code == "success"){
					alert("예치금이 전송 되었습니다.")
					window.location.reload();
				}else{
					alert("예치금 전송에 실패하였습니다.")						
				}
			}			
		
		})
	}

</script>