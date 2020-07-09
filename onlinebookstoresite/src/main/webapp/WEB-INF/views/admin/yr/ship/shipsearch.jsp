<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table class="table searchbox">
		<tr>
			<th class="table-active">검색어</th>
			<td colspan="3">
				<div class="form-group row">
					<div class = "col-xs-2 ">
						<select class="form-control" name = "pfield">
							<option value="ordernum">주문번호</option>
							<option value="">주문자명</option>
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
						<option value="ordernum">주문일</option>
						<option value="">결제일</option>
					</select>
					<div class='col-md-4'> 
						<input class="btn btn-outline-success btn-sm dbtn" type="button" name="today" value = "오늘">
						<input class="btn btn-outline-success btn-sm dbtn" type="button" name="tomorrow" value = "내일">
						<input class="btn btn-outline-success btn-sm dbtn" type="button" name="seven" value = "7일">
						<input class="btn btn-outline-success btn-sm dbtn" type="button" name="month" value = "1개월">
						<input class="btn btn-outline-success btn-sm dbtn" type="button" name="sixmonth" value = "6개월">
					</div>
					
					<div class='col-md-3 col-xs-4'> 
						<div class="form-group"> 
							<div class="input-group date" id="datetimepicker1" data-target-input="nearest"> 
								<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker1" value="01/11/2020"> 
									<div class="input-group-append" data-target="#datetimepicker1" data-toggle="datetimepicker"> 
										<div class="input-group-text"><i class="fa fa-calendar"></i></div> 
									</div> 
							</div> 
						</div> 
					</div> 
					&nbsp;-&nbsp;
					<div class='col-md-3 col-xs-4'> 
						<div class="form-group"> 
							<div class="input-group date" id="datetimepicker2" data-target-input="nearest"> 
								<input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker2" value="01/15/2020"> 
									<div class="input-group-append" data-target="#datetimepicker2" data-toggle="datetimepicker"> 
										<div class="input-group-text"><i class="fa fa-calendar"></i></div> 
									</div> 
							</div> 
						</div> 
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
							<option value="">책 이름</option>
							<option value="">책 번호</option>
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