<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
#settlementContent{
	border: 1px solid black;
	width: 1300px;
	height: 1000px;
	margin: auto;
}	
#settlementSearchBox{
	border: 1px solid red;
	height: 200px;
	width: 1300px;
	
}
#settlementTable tr th{
	background-color: silver;
	width: 300px;	
}
#settlementList{
	border: 1px solid green;
	width: 1300px;
	height: 700px;
}
</style>
<div id="settlementContent">
<h2>정산조회</h2>
	<div id="settlementSearchBox">
		<table class="table table-bordered" id="settlementTable"> 
			<tr>
				<th rowspan="3">판매 정산조회</th>
			</tr>
			<tr>
				<td>
					<input type="radio" name="status">전체
					<input type="radio" name="status">정산중
					<input type="radio" name="status">정산완료
				</td>
			</tr>
			<tr>
				<td>
					<input type="radio" name="feedate">전체
					<input type="radio" name="feedate">일자별
					<input type="date" name="startDay">~
					<input type="date" name="endDay">
					
					<input type="submit" value="검색" class="btn btn-success"	id="settlementBt">
							<input type="button" value="검색조건 초기화" id="settlementResetBt"	class="btn btn-secondary">
					
				</td>
			</tr>
		</table>
	</div>
	<!-- 테이블 -->
	<div id="settlementList">
	<span>LIST</span>
	<table class="table table-bordered">
		<thead class="thead-dark">
			<tr class="toptr">
				<th scope="col" width="60" rowspan="2">NO</th>
				<th scope="col" width="100" rowspan="2">주문번호</th>
				<th scope="col" width="400" rowspan="2">상품정보</th>
				<th scope="col" rowspan="2" width="120">구매확정일</th>
				<th scope="col">판매금액</th>
				<th scope="col" rowspan="2">총 합계</th>
				<th scope="col" rowspan="2" width="120">수수료(-)</th>
				<th scope="col" rowspan="2" width="120">지급총액</th>
			</tr>
			<tr class="toptr">
				
				<th scope="col">배송비</th>
			</tr>
		</thead>
	</table>
	
	
	
	</div>


</div>