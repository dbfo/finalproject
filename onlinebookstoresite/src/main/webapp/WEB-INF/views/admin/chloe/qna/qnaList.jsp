<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> Q&A관리
	</div>

	<h1>미답변</h1>
	<table class="table">
		<thead>
			<tr class="table-active">
				<th>번호</th>
				<th>작성자(id)</th>
				<th>제목</th>
				<th>작성일</th>
				<th>답변달기</th>
			</tr>
		</thead>
		<tfoot>
			<tr class="table-active">
				<th>번호</th>
				<th>작성자(id)</th>
				<th>제목</th>
				<th>작성일</th>
				<th>답변달기</th>
			</tr>
		</tfoot>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td>${vo.qnanum }</td>
					<td>${vo.mnum }</td>
					<td>${vo.qnatitle }배송관련</td>
					<fmt:formatDate value="${vo.qnadate }" pattern="yyyy/MM/dd"
						var="qnadate" />
					<td>${qnadate }</td>
					<td><a href="${pageContext.request.contextPath}/qnaReply">답변달기(모달)</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>