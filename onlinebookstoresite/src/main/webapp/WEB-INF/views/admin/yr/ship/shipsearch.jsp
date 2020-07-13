<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="${pageContext.request.contextPath }/ship${path}" method="post">
<table class="table searchbox">
		<tr>
			<th class="table-active">검색어</th>
			<td colspan="3">
				<div class="form-group row">
					<div class = "col-xs-2 ">
						<select class="form-control" name = "pfield">
							<option value =''>--선택--</option>
							<option value="bpaynum">주문번호</option>
							<option value="mname">주문자명</option>
						</select>
					</div>
					<div class = "col-xs-3">
						<input class="form-control" type="text" name="pkeyword">
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th class="table-active">기간</th>
			<td colspan="3">
				<div class = "row">
					<select name = "tfield" class = "col form-control col-xs-2">
						<option value =''>--선택--</option>
						<option value="borderdate">주문일</option>
						<option value="bpaydate">결제일</option>
					</select>
					<div class='col-md-4'> 
						<input class="btn btn-outline-success btn-sm dbtn" type="button" name="today" value = "오늘">
						<input class="btn btn-outline-success btn-sm dbtn" type="button" name="tomorrow" value = "내일">
						<input class="btn btn-outline-success btn-sm dbtn" type="button" name="seven" value = "7일">
						<input class="btn btn-outline-success btn-sm dbtn" type="button" name="month" value = "1개월">
						<input class="btn btn-outline-success btn-sm dbtn" type="button" name="sixmonth" value = "6개월">
					</div>				
					<div>
						<input type="date" name = "startDate" id = "startDate">  &nbsp;~ &nbsp;
						<input type="date" name = "endDate" id = "endDate">
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th class="table-active">상품</th>
			<td colspan="3">
				
				<div class="form-group row">
					<div class = "col-xs-2 ">
						<select class="form-control" name = "bfield">
							<option value =''>--선택--</option>
							<option value="btitle">책 이름</option>
							<option value="bnum">책 번호</option>
						</select>
					</div>
					<div class = "col-xs-3">
						<input class="form-control" type="text" name="bkeyword">
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<th class="table-active">회원 / 비회원</th>
			<td>
				<input type="radio" name="mType" value="mtotal" id = "mtotal" ><label for="mtotal"> &nbsp;전체 &nbsp;&nbsp;</label>
				<input type="radio" name="mType" value="member" id = "member"><label for ="member"> &nbsp;회원 &nbsp;&nbsp;</label>
				<input type="radio" name="mType" value="nonemember" id = "nonemember"><label for="nonemember"> &nbsp;비회원 &nbsp;&nbsp;</label>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="4">
				<input  class="btn btn-outline-success float-right yrbtn" type = "reset" value = "초기화">
				<input class="btn btn-success float-right yrbtn" type = "submit" value = "검색" >
			</td>		
		</tr>
	</table>
</form>
	