<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link
	href="${pageContext.request.contextPath }/resources/yjcss/css/made.css"
	rel="stylesheet" />

<div class="booksInsert container-fluid">
	<div class="card-header">
		<i class="fas fa-table mr-1"></i> 상품등록
	</div>
	<form method="post"
		action="${pageContext.request.contextPath }/booksInsert"
		enctype="multipart/form-data">
		<table class="booksInsertTable table">
			<tr>
				<th align="center" class="table-active">카테고리</th>
				<td colspan="3">
					<select name="bctg" onchange="setSelect(this)">
						<option value="">- 선택 -</option>
						<c:forEach var="big" items="${getBigctg }">
							<option value="${big.bcatenum }">${big.bcataname }</option>
						</c:forEach>
					</select>
					<select name="smctg" onchange="setSelect(this)" disabled="disabled">
						<option value="">선 택</option>
						<c:forEach var="sm" items="${getSmallctg }">
							<option value="${sm.scatenum }">${sm.scataname }</option>
						</c:forEach>
				</select>
				</td>
			</tr>

			<tr>
				<th align="center" class="table-active">책제목</th>
				<td><input type="text" name="btitle" size="50"></td>
				<th align="center" class="table-active">작가</th>
				<td><input type="text" name="bwriter" size="50"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">출간일</th>
				<td><input type="text" name="bpublishdate" value="달력띄울거야"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">출판사</th>
				<td colspan="3"><input type="text" name="bpublisher" size="50"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">책가격</th>
				<td><input type="text" name="bprice" size="50"> 원</td>
				<th align="center" class="table-active">배송료</th>
				<td><input type="text" name="bshipinfo" size="50"> 원</td>
			</tr>

			<tr>
				<th align="center" class="table-active">적립포인트</th>
				<td colspan="3"><input type="text" name="bpoint" size="50"> point</td>
			</tr>

			<tr>
				<th align="center" class="table-active">입고수량</th>
				<td colspan="3"><input type="text" name="bcount" size="50"> 개</td>
			</tr>

			<tr>
				<th align="center" class="table-active">썸네일(아직)</th>
				<td><input type="file" name="thumbnail"></td>
				<th align="center" class="table-active">이미지(안돼)</th>
				<td><input type="file" name="imgorgfilename"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">책설명</th>
				<td colspan="3"><textarea rows="15" cols="100" name="bcontent"></textarea></td>
			</tr>

			<tr>
				<td align="center" colspan="4"><input type="submit"
					value="등  록"> <input type="reset" value="초기화"></td>
			</tr>
		</table>
	</form>
</div>