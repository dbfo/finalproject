<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="container-fluid ">
	<h2>배송 관리</h2>
	
	<ul class="tab">	
		<li>
			<span class="thumb"><i class="fas fa-cart-arrow-down fa-3x"></i>
				<span class = "title"><a href="#">입금 전</a></span>
			</span>	
		</li>
		<li>
			<span class="thumb"><i class="fas fa-box fa-3x"></i>
				<span class = "title"><a href="#">배송준비 중</a></span>
			</span>
		</li>
		<li>
			<span class="thumb"><i class="fas fa-shipping-fast fa-3x"></i>
				<span class = "title"><a href="#">배송 중</a></span>
			</span>
		</li>
		<li>
			<span class="thumb"><i class="fas fa-clipboard-check fa-3x"></i>
				<span class = "title"><a href="#">배송 완료</a></span>
			</span>
		</li>
	</ul>
	
	
</div>

<script type="text/javascript">
	
	$('.thumb').on('click',function(){
		$('.thumb').each(function(){
			$(this).removeClass('thumbcolor');			
		})
		$(this).addClass('thumbcolor');
	})
	
</script>


