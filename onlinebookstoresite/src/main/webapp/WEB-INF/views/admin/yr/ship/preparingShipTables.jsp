<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container-fluid ">
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
							<th><input type="checkbox"></th>
							<th>주문번호</th>
							<th>주문일(결제일)</th>
							<th>주문자</th>
							<th>운송장정보</th>
							<th>책 제목</th>
							<th>수량</th>
							<th>판매가</th>
							<th>총 실제 결제 금액</th>

						</tr>
					</thead>
					<tbody>
						
						<c:forEach var="vo" items="${list }">
							<tr>
								<td rowspan="2"><input type="checkbox"></td>
								<td rowspan="2">${vo.bpaynum}</td>
								<td rowspan="2">${vo.borderdate}</td>
								<td rowspan="2">${vo.mname }</td>
								<td rowspan="1">
									<select name="courier">
										<option>--택배사 선택--</option>
										<option>CJ대한통운</option>
										<option>우체국</option>
										<option>자체배송</option>
									</select>
									<br>
									<input type="text" name = "transportNumber">
									<input class = "btn btn-success btn-sm" type = "button" value = "저장" id = "saveBtn">
								</td>
								<td rowspan="1">${vo.btitle }</td>
								<td rowspan="1">수량?????</td>
								<td rowspan="1">판매가!!</td>
								<td rowspan="2">${vo.bfinalmoney}</td>
							</tr>
							<tr>
								<td colspan="4">
									수령인 : <br>
									전화번호 : <br>
									주소 : <br>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>