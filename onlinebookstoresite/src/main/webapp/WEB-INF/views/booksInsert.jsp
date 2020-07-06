<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link href="${pageContext.request.contextPath }/resources/yjcss/css/made.css" rel="stylesheet" />
	
<div class="booksInsert container-fluid">
	<h1>상품등록</h1>
	<form method="post"
		action="${pageContext.request.contextPath }/booksInsert">
		<!-- enctype="multipart/form-data" -->
		<table class="booksInsertTable table">
			<tr>
				<th align="center" class="table-active">카테고리</th>
				<td colspan="3">
					<select>
						<option value="">선  택</option>
						<option value="100">소설</option>
					</select>
				</td>
			</tr>

			<tr>
				<th align="center" class="table-active">책제목</th>
				<td><input type="text" name="btitle" size="50"></td>
				<th align="center" class="table-active">작가</th>
				<td><input type="text" name="bwriter" size="50"></td>
			</tr>

			<!--<tr height="60">
					<th align="center" width="150">출간일</th>
					 <td width="450"><input type="text" name="bpublishdate"></td>
				</tr>-->

			<tr>
				<th align="center" class="table-active">출판사</th>
				<td colspan="3"><input type="text" name="bpublisher" size="50"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">책가격</th>
				<td><input type="text" name="bprice" size="50"></td>
				<th align="center" class="table-active">배송료</th>
				<td><input type="text" name="bshipinfo" size="50"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">적립포인트</th>
				<td colspan="3" ><input type="text" name="bpoint" size="50"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">수량</th>
				<td colspan="3" ><input type="text" name="bcount" size="50"></td>
			</tr>

			<tr>
				<th align="center" class="table-active">책설명</th>
				<td colspan="3"><textarea rows="15" cols="100" name="bcontent"></textarea></td>
			</tr>

			<tr>
				<td align="center" colspan="4"><input type="submit" value="등  록">
					<input type="reset" value="초기화"></td>
			</tr>
		</table>
	</form>
</div>