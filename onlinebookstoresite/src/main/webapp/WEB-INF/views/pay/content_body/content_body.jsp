<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table class="table">
	<thead class="thead-dark">
		<tr>
			<th><input  style='zoom:1.5;' type="checkbox"></th>
			<th colspan="2">상품명</th>
			<th>판매가</th>
			<th>적립포인트</th>
			<th>수랑</th>
			<th>합계</th>
			<th>주문</th>
		</tr>
	</thead>
	<tbody>
	
	</tbody>
	<tfoot>
		<tr>
			<td colspan="8" align="right">
			상품 총 금액 : <strong><span id="total value"></span></strong>원  
			| 포인트 총 적립액 : <strong><span id="total point"></strong>원</td>
		</tr>
	</tfoot>
</table>
<script>
	$(document).ready(function() {
		viewCart();
	})
	var viewCart=function(){
		console.log('223232')
		$.ajax({
			url:"/finalproject/pay/cartlist",
			dataType:"json",
			success:function(data){
				$(data).each(function(index,item){
					console.log('111233')
					var tableapp="<tr>"
								+"<td><input  style='zoom:1.5;' type='checkbox'></td>"
								+"<td><img src="+item.imgsrc+" class='cartlistimg'></td>"
								+"<td>"+item.btitle+"</td>"
								+"<td>"+item.bprice+"</td>"
								+"<td>"+item.bpoint+"</td>"
								+"<td>"+item.bcount+"</td>"
								+"<td><strong>"+(item.bcount*item.bprice)+"</strong></td>"
								+"<td><button type='button' class='btn btn-dark'>주문하기</button><br>"
								+"<button type='button' class='btn btn-light'>삭제하기</button></td>";
					$("tbody").append(tableapp);
				});
			}
		})
	}


</script>

