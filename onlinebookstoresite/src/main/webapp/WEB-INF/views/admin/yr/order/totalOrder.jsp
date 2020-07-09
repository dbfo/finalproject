<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<div class="container-fluid ">
	<h2>전체주문관리</h2>
	<form action="${pageContext.request.contextPath }/yr/orderSearch" method = "post">
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
						<div class='col-md-3'> 
							<input class="btn btn-outline-success btn-sm dbtn" type="button" name="today" value = "오늘">
							<input class="btn btn-outline-success btn-sm dbtn" type="button" name="tomorrow" value = "내일">
							<input class="btn btn-outline-success btn-sm dbtn" type="button" name="seven" value = "7일">
							<input class="btn btn-outline-success btn-sm dbtn" type="button" name="month" value = "1개월">
							<input class="btn btn-outline-success btn-sm dbtn" type="button" name="sixmonth" value = "6개월">
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
				<th class="table-active">주문상태</th>
				<td colspan="3">
					<input type="checkbox" name= "pstatus" value="pstotal" id = "pstotal"><label for="pstotal"> &nbsp;전체 &nbsp;&nbsp;</label>
					<input type="checkbox" name= "pstatus" value="beforeShip" id = "beforeShip"><label for="beforeShip"> &nbsp;배송전&nbsp;&nbsp;</label>
					<input type="checkbox" name= "pstatus" value="shipping" id = "shipping"><label for="shipping"> &nbsp;배송중&nbsp;&nbsp;</label>
					<input type="checkbox" name= "pstatus" value="completeShip" id = "completeShip"><label for="completeShip"> &nbsp;배송 완료&nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr>
				<th class="table-active">cs주문상태</th>
				<td colspan="3">
					<input type="checkbox" name= "cpstatus" value="cpstotal" id = "cpstotal"><label for="cpstotal"> &nbsp;전체 &nbsp;&nbsp;</label>
					<input type="checkbox" name= "cpstatus" value="cancle" id = "cancle"><label for="cancle"> &nbsp;취소 &nbsp;&nbsp;</label>
					<input type="checkbox" name= "cpstatus" value="exchange" id = "exchange"><label for="exchange"> &nbsp;교환 &nbsp;&nbsp;</label>
					<input type="checkbox" name= "cpstatus" value="return" id = "return"><label for="return"> &nbsp;반품 &nbsp;&nbsp;</label>
				</td>
			</tr>
			<tr>
				<th class="table-active">입금 / 결제 상태</th>
				<td>
					<input type="radio" name="payType" value="ptotal" id = "ptotal" ><label for="ptotal"> &nbsp;전체 &nbsp;&nbsp;</label>
					<input type="radio" name="payType" value="pbefore" id = "pbefore"><label for="pbefore"> &nbsp;입금 전 &nbsp;&nbsp;</label>
					<input type="radio" name="payType" value="pafter" id = "pafter"><label for ="pafter"> &nbsp;입금 완료 &nbsp;&nbsp;</label>
				</td>
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
</div>

<script type="text/javascript">

// 	1. 전체 누르면 전부다 클릭 되도록, 2. '전체'눌려져 있을때 다른거 누르면 전체 체크 해제
	$("input[type=checkbox]").on('click',function(){
		var value = $(this).val();
		if(value == 'pstotal' || value == 'cpstotal'){
			var c = $(this).prop('checked');
			$('input[name='+$(this).attr('name')+']').each( function(idx, item){
					$(this).prop('checked',c);
				}
			)
			return;
		}else{
			if($('input[name='+$(this).attr("name")+']').first().prop('checked')){
				$('input[name='+$(this).attr("name")+']').first().prop('checked',false);
			}
		}
	})
	

	//[오늘, 내일, 7일, 1개월, 6개월]버튼 클릭하면 색 바뀜
	$('.dbtn').on('click', function() {
		var clickbtn = $(this);

		$('.dbtn').each(function(idx, item) {
			if (clickbtn != $(this)) {
				$(this).removeClass('btn-success');
				$(this).addClass('btn-outline-success');
			}
		})

		$(this).removeClass('btn-outline-success');
		$(this).addClass('btn-success');
		
// 		test
		$('table>tbody').empty();
	})
	
	

</script>
