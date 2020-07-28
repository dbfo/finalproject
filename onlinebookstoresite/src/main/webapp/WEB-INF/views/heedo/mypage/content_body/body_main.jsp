<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content_history">
	
	<div class="maintable shadow" id="recentorderTable">
	<h5>최근주문내역</h5>
		<table class="table table-borderd" id="ordertable">
			<thead class="table-dark">
				<th style="width:10%">주문번호</th>
				<th style="width:65%;text-align: center;">주문내역</th>
				<th style="width:15%">주문일자</th>
				<th style="width:10%">상태</th>
			</thead>
			<tbody>
				<c:forEach var="ovo" items="${orderlist }">
					<tr>
						<td style="text-align:center">${ovo.ordernum }</td>
						<td style="text-align:center">${ovo.ordername }</td>
						<td>${ovo.borderdate }</td>
						<td>${ovo.statusStr }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div class="maintable shadow" id="recentCancelTable">
	<h5>최근취소내역</h5>
		<table class="table table-borderd">
			<thead class="table-dark">
				<th style="width:10%">주문번호</th>
				<th style="width:65%;text-align: center;">주문내역</th>
				<th style="width:15%">주문일자</th>
				<th style="width:10%">상태</th>
			</thead>
			<tbody>
				<c:forEach var="cvo" items="${cancellist }">
					<tr>
						<td style="text-align:center">${cvo.ordernum }</td>
						<td style="text-align:center">${cvo.ordername }</td>
						<td>${cvo.borderdate }</td>
						<td>${cvo.statusStr }</td>
					</tr>
				</c:forEach>
			
			</tbody>
		</table>
		
	</div>
	
	<div class="maintable shadow" id="recentQnaTable">
	<h5>최근문의내역</h5>
		<table class="table table-borderd">
			<thead class="table-dark">
				<th style="width:10%">문의번호</th>
				<th style="width:65%;text-align: center;">제목</th>
				<th style="width:15%">작성일</th>
				<th style="width:10%">상태</th>
			</thead>
			<tbody>
				<c:forEach var="qvo" items="${qnalist }">
					<tr>
						<td style="text-align:center">${qvo.qnanum }</td>
						<td style="text-align:center">${qvo.qnatitle }</td>
						<td>${qvo.qnadate }</td>
						<td>${qvo.statusStr }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</div>
</div>

<style>
	#content_history{
	position: absolute;
    display: inline-block;
   	border-top:1px solid #dee2e6;
    width: 927px;
    height: 720px;
    padding:10px
	}
	.maintable{
		height:200px;
		width:903px;
		border:1px solid grey;
		border-radius: 8px;
		margin-bottom: 30px;
		padding:10px;
	}
</style>