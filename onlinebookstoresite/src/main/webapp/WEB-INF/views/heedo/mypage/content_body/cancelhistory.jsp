<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="content_history">	
		<div class="date_picker">
			<ul class="list-group list-group-horizontal" id="dateUl">
				<li class="list-group-item selectdate cancelselect" onclick="changeDate(7,0)">최근 일주일</li>
				<li class="list-group-item active selectdate cancelselect" onclick="changeDate(0,1)">1개월</li>
				<li class="list-group-item selectdate cancelselect" onclick="changeDate(0,3)">3개월</li>
				<li class="list-group-item selectdate cancelselect" onclick="changeDate(0,6)">6개월</li>
			</ul>
			<input type="text" id="date1" class="form-control" readonly="readonly">
			<i class="far fa-calendar-alt fa-2x calenderIcon" id="startday"></i>
			&nbsp&nbsp<span>~</span>&nbsp&nbsp
			<input type="text" id="date2" class="form-control" readonly="readonly">
			<i class="far fa-calendar-alt fa-2x calenderIcon" id="endday"></i>
			<button type="button" class='btn btn-dark' id="researchBtn">조회</button>
		</div>
			
		<div class="tableDiv" id="tablediv">
			<div style="text-align: right" id="selectboxdiv">
				</div>
				<table class="table" id="cancelTable">
					<thead class="table-dark">
						<th style="text-align:center;">주문번호</th>
						<th>주문내역</th>
						<th>주문금액</th>
						<th>주문일자</th>
						<th>상태</th>
					</thead>
					<tbody>
					
					</tbody>
				</table>
		</div>
			<div class="pagingDiv" id="cancelPaging">
							
			</div>
</div>

<script>
//ul 선택 이펙트
	$(".canselselect").click(function(){
		$(".canselselect").each(function(){
			$(this).removeClass('active')
		});
		$(this).addClass('active');
	});
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
		$("#date2).val(today);
		
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
	
	$("#dateUl li").on('click',function(){
		var startDay=$("#date1").val();
		var endDay=$("#date2").val();
		clearCancellist();
		viewCancelOrderlist(startDay,endDay,1);
	});
	$("#researchBtn").on('click',function(){
		var startDay=$("#date1").val();
		var endDay=$("#date2").val();
		clearCancellist();
		viewCancelOrderlist(startDay,endDay,1,value);
	});
	

</script>