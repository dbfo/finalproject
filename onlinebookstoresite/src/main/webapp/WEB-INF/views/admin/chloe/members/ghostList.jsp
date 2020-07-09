<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 리스트 -->
<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 탈퇴 회원 목록
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>휴대전화</th>
						<th>나이</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>이름</th>
						<th>아이디</th>
						<th>휴대전화</th>
						<th>나이</th>
						<th>가입일</th>
					</tr>
				</tfoot>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo. mname}</td>
							<td>${vo. mid}</td>
							<td>${vo. phone}</td>
							<fmt:formatDate value="${vo.birth}" pattern="yyyy/MM/dd"
								var="birth" />
							<td>${vo.age}</td>
							<fmt:formatDate value="${vo.regdate}" pattern="yyyy/MM/dd"
								var="regdate" />
							<td>${regdate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>