<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<style>
/*정산조회 관련 css*/
#settlementContent{
	border: 1px solid black;
	width: 1300px;
	height: 1100px;
	margin: auto;
}	
/*검색박스*/
#settlementSearchBox{
	border: 1px solid red;
	height: 300px;
	width: 1300px;
	
}
#settlementTable tr th{
	background-color: silver;
	width: 300px;	
}
/*정산안내박스*/
#moneyInfoBox{
	width: 1100px;
	height: 100px;
	background-color: #CADCC6;
	margin: auto;
}


/*검색 리스트*/
#settlementList{
	border: 1px solid green;
	width: 1300px;
	height: 800px;
}
</style>
<div id="settlementContent">
<h2>정산조회</h2>
	<form action="${cp }/seller/settlementCheck">
	<div id="settlementSearchBox">
		<table class="table table-bordered" id="settlementTable"> 
			<tr>
				<th rowspan="3">판매 정산조회</th>
			</tr>
			<tr>
				<td>
					<input type="radio" name="bocomstatus" value="3">전체
					<input type="radio" name="bocomstatus" value="0">정산중
					<input type="radio" name="bocomstatus" value="1">정산완료
				</td>
			</tr>
			<tr>
				<td>
					<input type="radio" name="feedate" value="all">전체
					<input type="radio" name="feedate" value="date">일자별
					<input type="date" name="startDay">~
					<input type="date" name="endDay">
					<input type="submit" value="검색" class="btn btn-success"	id="settlementBt">
					<input type="button" value="검색조건 초기화" id="settlementResetBt"	class="btn btn-secondary">
				</td>
			</tr>
		</table>
		<div id="moneyInfoBox">
			<span>* 정산은 배송후 수령자가 구매확정을 한 후 정산처리가 이루어 집니다.</span><br>
			<span>* 정산 금액은 예치금으로 지급되며 지급된 예치금은 마이페이지에서 계좌로 신청 가능합니다.</span>
		</div>
	</div>
	<!-- 테이블 -->
	<div id="settlementList">
	<span>LIST</span>
	<table class="table table-bordered">
		<thead class="thead-dark">
			<tr style="text-align: center;">
				<th scope="col" width="60" rowspan="2">NO</th>
				<th scope="col" width="100" rowspan="2">주문번호</th>
				<th scope="col" width="380" rowspan="2">상품정보</th>
				<th scope="col" rowspan="2" width="120">구매확정일</th>
				<th scope="col" rowspan="2" width="140">처리상태</th>
				<th scope="col">판매금액</th>
				<th scope="col" rowspan="2">총 합계</th>
				<th scope="col" rowspan="2" width="120">수수료(-)</th>
				<th scope="col" rowspan="2" width="120">지급총액</th>
			</tr>
			<tr style="text-align: center;">
				<th scope="col">배송비</th>
			</tr>
		</thead>
		<c:forEach var="vo" items="${list }" varStatus="status">
			<tr>
				<td scope="col" width="60" rowspan="2" style="text-align: center;">
					${pu.totalRowCount - ((pu.pageNum-1) * 5 + status.index)}
				</td>
				<td scope="col" width="100" rowspan="2" style="text-align: center;">
					${vo.bpaynum }
				</td>
				<td scope="col" width="380" rowspan="2" style="text-align: left;">
					<c:forEach var="book" items="${vo.sellerOldbooksVo }">
						▶상품명 : ${book.obname } | 수량 : 1개 | 상품금액 : ${book.obsaleprice }원<br>
					</c:forEach>
				</td>
				<td scope="col" rowspan="2" width="120" style="text-align: center;">
					<fmt:formatDate value="${vo.feedate }" pattern="yyyy-MM-dd"/>
				</td>
				<td scope="col" rowspan="2" width="140" style="text-align: center;">
					<c:if test="${vo.bocomstatus=='0' }">
						처리중
					</c:if>
					<c:if test="${vo.bocomstatus=='1' }">
						정산완료
					</c:if>
				</td>
				<td scope="col" style="text-align: right;">${vo.ordermoney }원</td>
				<td scope="col" rowspan="2" style="text-align: right;">${vo.bfinalmoney }원</td>
				<td scope="col" rowspan="2" width="120" style="text-align: right;">${vo.feepay }원</td>
				<td scope="col" rowspan="2" width="120" style="text-align: right;">${vo.settlement }원</td>
			</tr>
			<tr>
				<td scope="col" style="text-align: right;">${vo.delfee }원</td>
			</tr>
		</c:forEach>
	</table>
	
	</div>
	</form>

</div>