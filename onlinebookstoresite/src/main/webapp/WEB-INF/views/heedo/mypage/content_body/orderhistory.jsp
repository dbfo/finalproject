<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${cp }/resources/hd/datepicker/jquery-ui.css">
<script src="${cp }/resources/hd/datepicker/jquery-ui.js"></script> 
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<%-- <script src="${cp }/resources/hd/datepicker/bootstrap-datepicker.ko.js"></script> --%>
<div id="content_history">	
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
					<li class="list-group-item selectdate" onclick="changeDate(7,0)">최근 일주일</li>
					<li class="list-group-item active selectdate" onclick="changeDate(0,1)">1개월</li>
					<li class="list-group-item selectdate" onclick="changeDate(0,3)">3개월</li>
					<li class="list-group-item selectdate" onclick="changeDate(0,6)">6개월</li>
				</ul>
				<input type="text" id="date1" class="form-control" readonly="readonly">
				<i class="far fa-calendar-alt fa-2x calenderIcon" id="startday"></i>
				&nbsp&nbsp<span>~</span>&nbsp&nbsp
				<input type="text" id="date2" class="form-control" readonly="readonly">
				<i class="far fa-calendar-alt fa-2x calenderIcon" id="endday"></i>
				
				<button type="button" class='btn btn-dark' id="researchBtn">조회</button>
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
				<div class="pagingDiv" id="newPaging">
					
				</div>
			
		</div>
		<div id="useditem" class="tab-pane fade">
			 
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		defaultDate();
		var startDay=$("#date1").val();
		var endDay=$("#date2").val();
		viewNewOrderlist(startDay,endDay);	
	});
	var viewNewOrderlist=function(startDay,endDay,pageNum){
		clearNewlist();
		if(pageNum==null){
			pageNum=1;
		}
		console.log('pp2:'+pageNum);
		var paginationapp="<ul class='pagination pageul'>"
			+"<li class='page-item'><a class='page-link' href='#'><<</a></li>"
			+"<li class='page-item disabled'><a class='page-link' href='#'>1</a></li>"
			+"<li class='page-item'><a class='page-link' href='#'>>></a></li>"
			$("#newPaging").append(paginationapp);
		$.ajax({
			url:'/finalproject/orderhistroy/newview',
			dataType:'json',
			type:'post',
			data:{startDay:startDay,endDay:endDay,pageNum:pageNum},
			success:function(data){
				if(data.length==0){ //값이없을때..
					var tableapp="<tr><td colspan='7'>주문내역이 없습니다.</td></tr>";
					$("#newTable > tbody").append(tableapp);
					
						return;
				}
				
				$(data).each(function(index,item){
					if(index==data.length-1){
						$("#newPaging").empty();
						var paginationapp="<ul class='pagination pageul'>"
										+"<li class='page-item '><a class='page-link pageli' href='#'><<</a></li>";
						for(let i=item.startPageNum;i<=item.endPageNum;i++){
							var yy=item.startDay;
							var mm=item.endDay;
							
							paginationapp+="<li class='page-item'><a class='page-link pageli' "
							paginationapp+="href='javascript:viewNewOrderlist(\""+yy+"\",\""+mm+"\","+i+")'>"+i+"</a></li>"
							
						}
						paginationapp+="<li class='page-item'><a class='page-link pageli' href='#'>>></a></li>";
						$("#newPaging").append(paginationapp);
						return;
						
					}
					var date=new Date(Date.parse(item.borderdate));
					console.log(date);
					var tableapp="<tr>"
							    +"<td><a href='${cp}/orderhistory/detailview?bpaynum="+item.ordernum+"'>"+item.ordernum+"</a></td>"
							    +"<td><a href='#'>"+item.ordername+"</a></td>"
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
	var clearNewlist=function(){
		$("#newTable > tbody").empty();
		$("#newPaging").empty();
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
	//============ 데이트 피커 설정 시작 ==================//
	$("#startday").click(function(){
		$("#date1").datepicker('show')
	})
	$("#endday").click(function(){
		$("#date2").datepicker('show')
	})
	$("#date1, #date2").datepicker({
			showOn: "none",
			buttonText: "Calendar",
			dateFormat:"yy/mm/dd",
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
			yearSuffix: "년",
			showMonthAfterYear: true,
			maxDate:0,
			
	});
	$("#date1").datepicker("option","onClose",function(d){
		$("#date2").datepicker("option","minDate",d);
	});
	$("#date2").datepicker("option","onClose",function(d){
		$("#date1").datepicker("option","maxDate",d);
	});
	//처음 날짜 지정.
	var defaultDate=function(){
		var date=new Date();
		var year=date.getFullYear();
		var month1=date.getMonth();
		var month=date.getMonth()+1;
		var day=date.getDate();
		if((month+"").length<2){ 
			month="0"+month;
		}
		if((day+"").length<2){ 
			day="0"+day;
		}
		var today=year+"/"+month+"/"+day;
		$("#date2").val(today);
		date.setMonth(month1-1);
		var year1=date.getFullYear();
		var month2=date.getMonth()+1;
		var day1=date.getDate();
		if((month2+"").length<2){ 
			month2="0"+month2;
		}
		if((day1+"").length<2){ 
			day1="0"+day1;
		}
		var day1=year1+"/"+month2+"/"+day1;
		$("#date1").val(day1);
	}
	//li버튼 클릭시 날짜변경이벤트.
	var changeDate=function(vdate,vmonth){
		var date=new Date();
		var day=date.getDate();
		if(vdate!=null&&vdate!=0){
			date.setDate(day-7);
		}
		var month=date.getMonth();
		if(vmonth!=null&&vmonth!=0){
			date.setMonth(month-vmonth);
		}
		var year=date.getFullYear();
		var month1=date.getMonth()+1;
		var day1=date.getDate();
		if((month1+"").length<2){ 
			month1="0"+month1;
		}
		if((day1+"").length<2){ 
			day1="0"+day1;
		}
		var today=year+"/"+month1+"/"+day1;
		
		var todate=new Date();
		var toyear=todate.getFullYear();
		var tomonth=todate.getMonth()+1;
		var dayto=todate.getDate();
		if((tomonth+"").length<2){ 
			tomonth="0"+tomonth;
		}
		if((dayto+"").length<2){ 
			dayto="0"+dayto;
		}
		var today1=toyear+"/"+tomonth+"/"+dayto;
		$("#date2").val(today1);
		$("#date1").val(today);	 
	};
	//============ 데이트 피커 설정 끝 ==================//
	$("#dateUl li").on('click',function(){
		var startDay=$("#date1").val();
		var endDay=$("#date2").val();
		console.log('startDay:'+date1);
		console.log('endDay:'+date2);
		clearNewlist();
		viewNewOrderlist(startDay,endDay);
	});
	$("#researchBtn").on('click',function(){
		var startDay=$("#date1").val();
		var endDay=$("#date2").val();
		console.log('startDay:'+date1);
		console.log('endDay:'+date2);
		clearNewlist();
		viewNewOrderlist(startDay,endDay);
	});
	

	
	
	
   
  
</script>
<style>
	#content_history{
	position: absolute;
    display: inline-block;
    border: 2px solid black;
    width: 920px;
    height: 670px;
	}
	#newitem{
		padding:0px 10px;
	}
	.calenderIcon{
		position:relative;
		top:8px;
	}
	.list-group{
		display:inline-flex;
	}
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
		border:2px solid pink;
		width:896px;
		height:435px;
		
	}
	#newPaging{
		text-align: center;
	}
	.pageul{
	
	}
	.pageli{
		width:34px;
	}
	#newPaging{
		position:absolute;
		top:620px;
		left:370px;
		border:2px solid black;
	}
	
	
	
</style>

