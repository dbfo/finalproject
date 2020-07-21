<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${cp }/resources/hd/datepicker/bootstrap-datepicker.css">
<script src="${cp }/resources/hd/datepicker/bootstrap-datepicker.js"></script>
<script src="${cp }/resources/hd/datepicker/bootstrap-datepicker.ko.js"></script>
	<!-- /// 최상단 tab 영역 시작 /// -->
	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a class="nav-link active" data-toggle="tab" href="#newitem">새상품</a>
		</li>
		<li class="nav-item">
			<a class="nav-link " data-toggle="tab" href="#useditem">중고상품</a>
		</li>
	</ul>    
	<!-- /// 최상단 tab 영역 끝 /// -->

	<div class="tab-content">
		<div id="newitem" class="tab-pane active">
			<div class="date_picker">
				<ul class="list-group list-group-horizontal" id="dateUl">
					<li class="list-group-item selectdate">최근 일주일</li>
					<li class="list-group-item active selectdate">1개월</li>
					<li class="list-group-item selectdate">3개월</li>
					<li class="list-group-item selectdate">6개월</li>
				</ul>
				<input type="text" id="date1" class="form-control">
				<input type="text" id="date2" class="form-control">
				<button type="button" class='btn btn-dark' id="testbtn">테스트</button>
			</div>
			<div class="tableDiv" id="tablediv">
				<table class="table" id="newTable">
					<thead class="table-dark">
						<th>주문번호</th>
						<th>주문내역</th>
						<th>주문금액</th>
						<th>주문자</th>
						<th>수령자</th>
						<th>주문일자</th>
						<th>주문상태</th>
					</thead>
					<tbody>
					
					</tbody>
				</table>
			</div>
		</div>
		<div id="useditem" class="tab-pane fade">
			 
		</div>
	</div>
<script>
	$(document).ready(function(){
		viewNewOrderlist();
		
	});
	
	var viewNewOrderlist=function(){
		$.ajax({
			url:'/finalproject/orderhistroy/newview',
			dataType:'json',
			type:'post',
			//data:{},
			success:function(data){
				console.log(data.length);
				if(data.length==0){ //값이없을때..
					var tableapp="<tr><td colspan='7'>주문내역이 없습니다.</td></tr>";
					$("#newTable > tbody").append(tableapp);
					return;
				}
				
				$(data).each(function(index,item){
					var tableapp="<tr>"
							    +"<td>"+item.ordernum+"</td>"
							    +"<td>"+item.ordername+"</td>"
							    +"<td>"+item.ordermoney+"</td>"
							    +"<td>"+item.mname+"</td>"
							    +"<td>"+item.receiver+"</td>"
							    +"<td>"+item.borderdate+"</td>"
							    +"<td>"+item.status+"</td>"
							  +"</tr>";
					$("#newTable > tbody").append(tableapp);
				})
				
			}
			
		})
		
	}
	var viewUsedOrderlist=function(){
		$.ajax({
			url:'/finalproject/orderhistroy/usedview',
			dataType:'json',
			type:'post',
			//data:{},
			success:function(data){
				
			}
		})
		
	}
	


	//ul 선택 이펙트
	$(".selectdate").click(function(){
		$(".selectdate").each(function(){
			$(this).removeClass('active')
		});
		$(this).addClass('active');
	});
	$('#testbtn').click(function(){
		$('#date1').datepicker('show');
		$('#date1').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    endDate: 'd',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		}).on("changeDate", function(e) {
	        console.log(e);// 찍어보면 event 객체가 나온다.
	        console.log(e.date);
	   });
	})
	
	
	
   
  
</script>
<style>
	.date_picker{
		margin-top: 30px;
		border:2px solid grey;
		padding:15px;
	}
	.selectdate{
		text-align:center;
		font-size:12px;
		width:100px;
		height:35px;
		padding:0px;
		padding-top:7px;
	}
	#dateUl{
		list-style-type: none;
	}
	#date1,#date2{
		width:110px;
		font-size:12px;
		display:inline-block;
	}
	#tablediv{
		margin-top: 20px;
		font-size:14px;
	}
	
	
</style>

