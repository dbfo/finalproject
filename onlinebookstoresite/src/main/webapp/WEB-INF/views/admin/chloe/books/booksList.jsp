<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="card mb-4">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 등록상품조회
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>번호</th>
						<th>책제목</th>
						<th>미리보기</th>
						<th>작가 (지은이)</th>
						<th>출판사</th>
						<th>가격 (원)</th>
						<th>재고 (개)</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>번호</th>
						<th>책제목</th>
						<th>미리보기</th>
						<th>작가 (지은이)</th>
						<th>출판사</th>
						<th>가격 (원)</th>
						<th>재고 (개)</th>
						<th>등록일</th>

					</tr>
				</tfoot>
				<tbody>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td>${vo.bnum }</td>
							<td>${vo.btitle }</td>
							<td>
								<a href="${pageContext.request.contextPath}/preview?bnum=${vo.bnum}">미리보기</a>
							</td>
							<td>${vo.bwriter }</td>
							<td>${vo.bpublisher }</td>
							<td>${vo.bprice }</td>
							<td>${vo.bcount }</td>
							<fmt:formatDate value="${vo.bregdate }" pattern="yyyy/MM/dd"
								var="bregdate" />
							<td>${bregdate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>