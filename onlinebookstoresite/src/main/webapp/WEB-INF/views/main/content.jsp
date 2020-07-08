<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$('.carousel').carousel({
		interval : 500
	})
	$(document).ready(function(){
		viewBest();
		viewnew();
	});
	var bestpageNum=1;
	var viewBest=function(){
		var kind="best";
		console.log('11111')
		$.ajax({
			url:"/finalproject/home/bestlist",
			dataType:"json",
			data:{pageNum:bestpageNum,kind:kind},
			success:function(data){
				var b=$("<div id='bestprev'>"+
				"<img src='${cp }/resources/image/prevButton.png' id='bestprevimg'>"+
				"</div>").appendTo("#content-best-card");
				$(data).each(function(index,item){
						$("<div class='card'><div id='imgwrap'><img class='card-img-top' src="+item.imgsrc+
								" alt='Card image cap'></div>"+
								"<div class='card-body'><h5 class='card-title'>"+item.btitle+"</h5>"+
								"<p class='card-text'>"+item.bwriter+"<br><strong>"+item.bprice+"</stromg></p></div></div>").appendTo("#content-best-card");
				
				});
				var a=$("<div id='bestnext'>"+
				  "<img src='${cp }/resources/image/nextButton.png' id='bestnextimg'>"+
				  "</div>").appendTo("#content-best-card");
				a.click(function(){
					if(bestpageNum==2){
						bestpageNum=1;
					}else{
						bestpageNum=bestpageNum+1;
					}
					removeBest();
					viewBest();
				});
				b.click(function(){
					if(bestpageNum==1){
						bestpageNum=2;
					}else{
						bestpageNum=bestpageNum-1;
					}
					removeBest();
					viewBest();
				});
				
			}
		});	
	}
	var removeBest=function(){
		$("#content-best-card").empty();
	}
	
	var newpageNum=1;
	var viewnew=function(){
		console.log('2222')
		var kind="new"
		$.ajax({
			url:"/finalproject/home/newlist",
			dataType:"json",
			data:{pageNum:bestpageNum,kind:kind},
			success:function(data){
				var b=$("<div id='newprev'>"+
				"<img src='${cp }/resources/image/prevButton.png' id='newprevimg'>"+
				"</div>").appendTo("#content-new-card");
				$(data).each(function(index,item){
						$("<div class='card'><div id='imgwrap'><img class='card-img-top' src="+item.imgsrc+
								" alt='Card image cap'></div>"+
								"<div class='card-body'><h5 class='card-title'>"+item.btitle+"</h5>"+
								"<p class='card-text'>"+item.bwriter+"<br><strong>"+item.bprice+"</stromg></p></div></div>").appendTo("#content-new-card");
				
				});
				var a=$("<div id='newnext'>"+
				  "<img src='${cp }/resources/image/nextButton.png' id='newnextimg'>"+
				  "</div>").appendTo("#content-new-card");
				a.click(function(){
					if(newpageNum==2){
						newpageNum=1;
					}else{
						newpageNum=newpageNum+1;
					}
					removenew();
					viewnew();
				});
				b.click(function(){
					if(newpageNum==1){
						newpageNum=2;
					}else{
						newpageNum=newpageNum-1;
					}
					removenew();
					viewnew();
				});
				
			}
		});	
	}
	var removenew=function(){
		$("#content-new-card").empty();
	}
	
	
	/*$("#bestnext").click(function(){
		if(pageNum==2){
			pageNum=1;
		}else{
			pageNum=pageNum+1;
		}
		viewBest();
	});*/
</script>
<div class="container">
	<div id="carosel_wrap">
		<div class="center-block">
			<div id="imgslide" class="carousel slide" data-ride="carousel">
				<!-- 인디케이터 -->
				<ol class="carousel-indicators">
					<li data-target="#imgslide" data-slide-to="0" class="active"></li>
					<!--0번부터시작-->
					<li data-target="#imgslide" data-slide-to="1"></li>
					<li data-target="#imgslide" data-slide-to="2"></li>
				</ol>
				<!-- 인디케이터 끝 -->
				<div class="carousel-inner">
					<!-- 슬라이드 쇼 -->
					<div class="carousel-item active" id="slideForm">
						<!--가로-->
						<img class="d-block w-100"
							src="${cp }/resources/img/slide/test1.svg" alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${cp }/resources/img/slide/test2.svg" alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="${cp }/resources/img/slide/test3.svg" alt="Third slide">
					</div>
					<!-- / 슬라이드 쇼 끝 -->
					<!-- 왼쪽 오른쪽 화살표 버튼 -->
					<a class="carousel-control-prev" href="#imgslide" role="button"
						data-slide="prev"> <span class="carousel-control-prev-icon"
						aria-hidden="true"></span>

					</a> <a class="carousel-control-next" href="#imgslide" role="button"
						data-slide="next"> <span class="carousel-control-next-icon"
						aria-hidden="true"></span>

					</a>
					<!-- / 화살표 버튼 끝 -->

				</div>
			</div>
		</div>
	</div>
	<div id="content-mid-best">
		<h3>베스트셀러</h3>
		<div id="content-best-card">
			<!-- 
			<div id="bestprev">
				<img src="${cp }/resources/image/prevButton.png">
			</div>
			<div class="card">
				<div id="imgwrap">
					<img class="card-img-top"
						src="${cp }/resources/image/cover1.jpg" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title">전쟁의 미래</h5>
					<p class="card-text">
						로렌스 프리드먼 <br> <strong>14000원</strong>
					</p>
				</div>
			</div>
			<div class="card">
				<div id="imgwrap">
					<img class="card-img-top"
						src="${cp }/resources/image/cover2.jpg" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title">실패도감</h5>
					<p class="card-text">
						오노 마사토<br> <strong>11520원</strong>
					</p>
				</div>
			</div>
			<div class="card">
				<div id="imgwrap">
					<img class="card-img-top"
						src="${cp }/resources/image/cover3.jpg" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title">카레가 보글보글</h5>
					<p class="card-text">
						구도 노리코 <br> <strong>10800원</strong>
					</p>
				</div>
			</div>
			<div class="card">
				<div id="imgwrap">
					<img class="card-img-top"
						src="${cp }/resources/image/cover4.jpg" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title">루즈벨트 게임</h5>
					<p class="card-text">
						이케이도 준<br> <strong>13500원</strong>
					</p>
				</div>
			</div>
			<div class="card">
				<div id="imgwrap">
					<img class="card-img-top"
						src="${cp }/resources/img/product/1.jpg" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title">제목제목제목</h5>
					<p class="card-text">
						저자저자저자<br> <strong>343434원</strong>
					</p>
				</div>
			</div>
			<div id="bestnext">
				<img src="${cp }/resources/image/nextButton.png">
			</div>-->
		</div> 

	</div>
	<br>
	<div id="content-mid-new">
		<h3>신간</h3>
		<div id="content-new-card">
			<!--  
			<div id="newprev">
				<img src="${cp }/resources/image/prevButton.png">
			</div>
			<div class="card">
				<div id="imgwrap">
					<img class="card-img-top"
						src="${cp }/resources/image/cover1.jpg" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title">전쟁의 미래</h5>
					<p class="card-text">
						로렌스 프리드먼 <br> <strong>14000원</strong>
					</p>
				</div>
			</div>

			<div class="card">
				<div id="imgwrap">
					<img class="card-img-top"
						src="${cp }/resources/image/cover2.jpg" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title">실패도감</h5>
					<p class="card-text">
						오노 마사토<br> <strong>11520원</strong>
					</p>
				</div>
			</div>

			<div class="card">
				<div id="imgwrap">
					<img class="card-img-top"
						src="${cp }/resources/image/cover3.jpg" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title">카레가 보글보글</h5>
					<p class="card-text">
						구도 노리코 <br> <strong>10800원</strong>
					</p>
				</div>
			</div>

			<div class="card">
				<div id="imgwrap">
					<img class="card-img-top"
						src="${cp }/resources/image/cover4.jpg" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title">루즈벨트 게임</h5>
					<p class="card-text">
						이케이도 준<br> <strong>13500원</strong>
					</p>
				</div>
			</div>

			<div class="card">
				<div id="imgwrap">
					<img class="card-img-top"
						src="${cp }/resources/img/product/1.jpg" alt="Card image cap">
				</div>
				<div class="card-body">
					<h5 class="card-title">제목제목제목</h5>
					<p class="card-text">
						저자저자저자<br> <strong>343434원</strong>
					</p>
				</div>
			</div>
			<div id="newnext">
				<img src="${cp }/resources/image/nextButton.png">
			</div>

		</div>-->
	</div>
</div>
<br>
<br>