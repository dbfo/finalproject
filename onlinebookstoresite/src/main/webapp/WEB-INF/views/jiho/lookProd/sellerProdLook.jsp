<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 추후 css파일 분리예정 -->
<style>
	#sellerProdLook{
		border: 1px solid black;
		width: 1300px;
		height: 900px;
		margin: auto;
	}
	/*검색박스*/
	#selectBox{
		width: 1300px;
		height: 300px;
		border: 1px solid red;
	}
	#selectBox table{
		border: 1px;
	}
	.tdstyle{
		background-color: silver;
		width: 300px;
	}
	input[type="radio"] {
		width: 50px;
	}
	input[type="text"] {
		width: 300px;
	}
	input[type="text"] {
		width: 300px;
	}
	.form-control{
		width: 150px;
	}
	/*테이블박스*/
	#showTable{
		width: 1300px;
		height: 500px;
		border: 1px solid green;
	}
</style>
<script type="text/javascript">
	
</script>
<div id="sellerProdLook">
	<div><h2>상품조회/수정페이지</h2></div>
	<form action="">
		<div id="selectBox">
			<table class="table table-bordered">
				<tr>
					<td class="tdstyle" id="statusa">판매상태별 조회</td>			
					<td>
						<input type="radio" name="status" value="0">전체
						<input type="radio" name="status" value="sale">판매중
						<input type="radio" name="status" value="payWaiting">입금대기중
						<input type="radio" name="status" value="requestDelivery">배송요청중
						<input type="radio" name="status" value="shipping">배송중
						<input type="radio" name="status" value="salesCompleted">판매완료
					</td>
				</tr>
				<tr>
					<td class="tdstyle">등록일자별 조회</td>			
					<td>
						<input type="radio" name="regdate" value="0">전체
						<input type="radio" name="regdate" value="date" >일자별&nbsp;&nbsp;&nbsp;
						<input type="date" name="startDay"><span>&nbsp;~</span>
						<input type="date" name="endDay">
					</td>
				</tr>
				<tr>
					<td class="tdstyle">등록한 상품 검색</td>			
					<td>
						<div class="input-group mt-1 mb-1">
					    	<div class="input-group-prepend">
					        	<select name="field" class="form-control">
					        	<option value="0">전체</option>
								<option value="obname">상품명</option>
								<option value="obwriter">저자</option>
								<option value="obpublisher">출판사</option>
					          </select>
					      </div>
					      <input type="text" name="keyword" class="form-control" placeholder="검색어를 입력하세요.">
					    </div>
					</td>
				</tr>
			</table>
			<!-- 버튼 -->
			<input type="submit" value="검색" class="btn btn-success">
			<input type="button" value="초기화" class="btn btn-secondary">
		</div>
		<div id="showTable">
			<table class="table table-bordered">
				<tr>
					<td>NO</td>
					<td>상품명</td>
					<td>출판사</td>
					<td>저자</td>
					<td>판매상태</td>
					<td>품질</td>
					<td>판매가</td>
					<td>등록일</td>
					<td>수정</td>
					<td>삭제</td>
				</tr>
			</table>
		</div>
	</form>
</div>