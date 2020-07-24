<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
</head>
<body>
<div style="width: 75%; margin : 0 auto;">
	<canvas id = "chart_canvas" class = "chartjs" style="display: block; width: 100%; height: 100%;"></canvas>
</div>
</body>
<script type="text/javascript">
	var ctx = document.getElementById("chart_canvas");

	var mychart = new Chart (ctx, {
		  type: 'line',
		  data: {
		        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
		        datasets: [{
		            label: '# of Votes',
		            data: [12, 19, 3, 5, 2, 3],
		            borderWidth: 1
		        }]
		    },
		    options: {
		        scales: {
		            yAxes: [{
		                ticks: {
		                    beginAtZero: true
		                }
		            }]
		        }
		    }
	})

</script>
</html>