<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="content_history">
	
	<div class="maintable" id="recentorderTable">
	<h5>최근주문내역(새상품)</h5>
		<table class="table table-borderd" id="ordertable">
			<thead class="table-dark">
				<th>주문번호</th>
				<th>주문내역</th>
				<th>주문일자</th>
				<th>주문상태</th>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<div class="maintable" id="recentCancelTable">
	<h5>최근취소내역</h5>
		<table class="table table-borderd">
			<thead class="table-dark">
				<th>주문번호</th>
				<th>주문내역</th>
				<th>주문일자</th>
				<th>상태</th>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			
			</tbody>
		</table>
		
	</div>
	
	<div class="maintable" id="recentQnaTable">
	<h5>최근문의내역</h5>
		<table class="table table-borderd">
			<thead class="table-dark">
				<th>문의번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>상태</th>
			</thead>
			<tbody>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
					<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		
	</div>
</div>

<style>
	#content_history{
	position: absolute;
    display: inline-block;
    border: 2px solid black;
    width: 927px;
    height: 720px;
    padding:10px
	}
	.maintable{
		height:200px;
		width:903px;
		border:1px solid grey;
		border-radius: 8px;
		 box-shadow: 0px 0px 4px grey;
		margin-bottom: 30px;
		padding:10px;
	}
</style>