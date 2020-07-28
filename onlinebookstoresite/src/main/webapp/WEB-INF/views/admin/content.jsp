<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 여기부터 main -->
<main>
<div class="container-fluid">
<!-- 	<h1 class="mt-4">오늘 매출 현황</h1> -->
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item active">오늘 매출 현황</li>
	</ol>
	<div class="row">
		<div class="col-xl-3 col-md-6">
			<div class="card mb-4 text-center">
				<div class="card-body " >
					<span class = "count">${ordercount}</span>		
					<strong class = "cardTitle">주문</strong>
				</div>
				<div
					class="card-footer active d-flex align-items-center justify-content-between">
					<a class="small stretched-link" href="#">> 주문으로 바로가기</a>
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-md-6">
			<div class="card text-center mb-4">
				<div class="card-body">
					<span class = "count">${paymentcount}</span>	
					<strong class = "cardTitle">결제</strong>
				</div>
				<div
					class="card-footer active d-flex align-items-center justify-content-between">
					<a class="small stretched-link" href="#">> 결제바로가기</a>
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-md-6">
			<div class="card text-center mb-4">
				<div class="card-body">
					<span class = "count">${cscount }</span>	
					<strong class = "cardTitle">CS</strong>
				</div>
				<div
					class="card-footer active d-flex align-items-center justify-content-between">
					<a class="small stretched-link" href="#">> CS관리 바로가기</a>
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-3 col-md-6">
			<div class="card text-center mb-4">
				<div class="card-body">
					<span class = "count">${qnacount }</span>	
					<strong class = "cardTitle">미답변</strong>
				</div>
				<div
					class="card-footer active d-flex align-items-center justify-content-between">
					<a class="small stretched-link" href="#">> QnA관리 바로가기</a>
					<div class="small text-white">
						<i class="fas fa-angle-right"></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item active">최근 3일 매출 현황</li>
	</ol>
	
	<div class="row">
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-area mr-1"></i> Area Chart Example
				</div>
				<div class="card-body">
					<canvas id="myAreaChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
		<div class="col-xl-6">
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-chart-bar mr-1"></i> Bar Chart Example
				</div>
				<div class="card-body">
					<canvas id="myBarChart" width="100%" height="40"></canvas>
				</div>
			</div>
		</div>
	</div>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-table mr-1"></i> 결제수단별 주문현황 
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%"
					cellspacing="0" style="text-align :center">
					<thead>
						<tr>
							<th class="table-active" rowspan="3" >구분</th>
						</tr>
						<tr>
							<th class="table-active" colspan="2" id = "day1">날짜1</th>
							<th class="table-active" colspan="2" id = "day2">날짜2</th>
							<th class="table-active" colspan="2" id = "day3">날짜3</th>
						</tr>
						<tr>
							<th class="table-active" >건수</th>
							<th class="table-active" >금액</th>
							<th class="table-active">건수</th>
							<th class="table-active">금액</th>
							<th class="table-active">건수</th>
							<th class="table-active">금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:set var = "length" value = "${fn:length(mivo)}"/>
							<th class="table-active">무통장</th>
							<c:forEach var="days" items="${days }">
								<c:set var = "j" value = "0"/>
								<c:forEach var="mivo" items="${mivo }">
									<c:set var = "j" value = "${j+1}"/>
									<c:if test="${mivo.methodpayment == 0}">
										<c:choose>
											<c:when test="${days == mivo.bpayment }">
												<td>${mivo.count}</td>																				
												<td>${mivo.price}</td>																				
											</c:when>
											<c:when test = "${length-1 == j }">
												<td>0</td>										
												<td>0</td>																				
											</c:when>
										</c:choose>							
									</c:if>
								</c:forEach>
									<c:if test = "${length-1 == j }">
										<td>0</td>										
										<td>0</td>																				
									</c:if>
							</c:forEach>
						</tr>
						<tr >
							<th class="table-active">카드</th>
							<c:forEach var="days" items="${days}">
								<c:set var="i" value="0"/>
								<c:set var = "i" value = "${i+1}"/>
								<c:forEach var="mivo" items="${mivo }">
									<c:if test="${mivo.methodpayment == 1}">
										<c:choose>
											<c:when test="${days == mivo.bpayment }">
												<td>${mivo.count}</td>																				
												<td>${mivo.price}</td>																				
											</c:when>
											<c:when test = "${length-1 == i }">
												<td>0</td>										
												<td>0</td>										
											</c:when >
										</c:choose>							
									</c:if>
								</c:forEach>
								<c:if test = "${length-1 == i}">
									<td>0</td>										
									<td>0</td>																				
								</c:if>
							</c:forEach>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
</main>
<!-- 여기까지 -->

<script type="text/javascript">

$(function(){
	
	ajChartdraw();
	
	var date = new Date();
	
	for (var dv = 0; dv < 3; dv++) {
		
		var yyyy = date.getFullYear();
		var mm = (date.getMonth()+1) > 9 ? (date.getMonth()+1) : '0' + (date.getMonth()+1);
		var dd = date.getDate()-dv > 9 ? date.getDate()-dv : '0' + (date.getDate()-dv);
	
		$("#day"+(dv+1)).text(yyyy+"-"+mm+"-"+dd);
	}
		
})

function ajChartdraw(){
	$.ajax({
		url: "${pageContext.request.contextPath}/sales/getInfo",
		dataType : "json",
		data : {menu:"0"},
		success : function(data){
			if(data[0].code == "success"){
				lineDraw(data[0].label,data[0].data);
				barDraw(data[0].label,data[0].data);
			}else{
				alert("error")
			}
		}
	})
}

function lineDraw(label,data){
	
	var ctx = document.getElementById("myAreaChart");

	var mychart = new Chart (ctx, {
		  type: 'line',
 		  data: {
	        labels: label,
	        datasets: [{
	            label: '# 결제금액',
	            data: data,
	            borderWidth: 1
	        }]
	    },
		  options : {
 		        scales: {
 		            yAxes: [{
 		                ticks: {
 		                    beginAtZero: true
 		                }
 		            }]
 		        }
 		    }
	})
}


function barDraw(label,data){
	
	var ctx = document.getElementById("myBarChart");

	var mychart = new Chart (ctx, {
		  type: 'bar',
 		  data: {
	        labels: label,
	        datasets: [{
	            label: '# of Votes',
	            data: data,
	            borderWidth: 1
	        }]
	    },
		  options : {
 		        scales: {
 		            yAxes: [{
 		                ticks: {
 		                    beginAtZero: true
 		                }
 		            }]
 		        }
 		    }
	})
}



</script>