<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid ">
	<h2>배송 관리</h2>

	<ul class="tab">	
		<li>
			<span class="thumb"><i class="fas fa-cart-arrow-down fa-3x"></i>
				<span class = "title"><a href="${pageContext.request.contextPath}/ship/menu?PageName=0&type=1">입금 전 
					<c:forEach items="${countList }" var="list">						
						<c:if test="${list.BSTATUS == '0'}">
							[${list['COUNT']}]
						</c:if>
					</c:forEach>
				</a></span>
			</span>	
		</li>
		<li>
			<span class="thumb"><i class="fas fa-box fa-3x"></i>
				<span class = "title"><a href="${pageContext.request.contextPath}/ship/menu?PageName=1&type=1">배송준비 중
					<c:forEach items="${countList }" var="list">						
						<c:if test="${list.BSTATUS == '1'}">
							[${list['COUNT']}]
						</c:if>
					</c:forEach>
				</a></span>
			</span>
		</li>
		<li>
			<span class="thumb"><i class="fas fa-shipping-fast fa-3x"></i>
				<span class = "title"><a href="${pageContext.request.contextPath}/ship/menu?PageName=2&type=1">배송 중
				<c:forEach items="${countList }" var="list">						
					<c:if test="${list.BSTATUS == '2'}">
						[${list['COUNT']}]
					</c:if>
				</c:forEach>
				</a></span>
			</span>
		</li>
		<li>
			<span class="thumb"><i class="fas fa-clipboard-check fa-3x"></i>
				<span class = "title"><a href="${pageContext.request.contextPath}/ship/menu?PageName=3&type=1">배송 완료
				<c:forEach items="${countList}" var="list">					
					<c:if test="${list.BSTATUS == '3'}">
						[${list['COUNT']}]
					</c:if>
				</c:forEach>
				</a></span>
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


