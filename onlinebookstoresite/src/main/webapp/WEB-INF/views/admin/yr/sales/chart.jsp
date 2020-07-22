<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container-fluid">
	<h1 class="mt-4">Charts</h1>
	<ol class="breadcrumb mb-4">
		<li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
		<li class="breadcrumb-item active">Charts</li>
	</ol>
	<div class="card mb-4">
		<div class="card-header">
			<i class="fas fa-chart-area mr-1"></i> Area Chart Example
		</div>
		<div class="card-body">
			<canvas id="myAreaChart" width="100%" height="50"></canvas>
		</div>
		<div class="card-footer small text-muted">Updated yesterday at
			11:59 PM</div>
	</div>
</div>

<script type="text/javascript">

	$(function(){
		$.ajax({
			url: "${pageContext.request.contextPath}/sales/getInfo",
			dataType : "json",
			success : function(data){
				if(data[0].code == "success"){
					draw(data[0].data);
				}else{
					alert("error")
				}
			}
		})
		
	})

	function draw(data){
		var ctx = document.getElementById("myAreaChart");

		var mychart = new Chart (ctx, {
			  type: 'line',
	 		  data: {
		        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
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
	
// 	var ctx = document.getElementById("myAreaChart");

// 	var mychart = new Chart (ctx, {
// 		  type: 'line',
// 		  data: {
// 		        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
// 		        datasets: [{
// 		            label: '# of Votes',
// 		            data: [12, 19, 3, 5, 2, 3],
// 		            borderWidth: 1
// 		        }]
// 		    },
// 		    options: {
// 		        scales: {
// 		            yAxes: [{
// 		                ticks: {
// 		                    beginAtZero: true
// 		                }
// 		            }]
// 		        }
// 		    }
// 	})

</script>

