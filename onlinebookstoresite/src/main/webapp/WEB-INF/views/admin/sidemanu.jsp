<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 여기부터 sidemanu -->
<div id="layoutSidenav_nav">
	<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
		<div class="sb-sidenav-menu">
			<div class="nav">
				<div class="sb-sidenav-menu-heading">administration</div>

				<!-- 주문관리 -->
				<a class="nav-link collapsed" href="#" data-toggle="collapse"
					data-target="#collapseOrder" aria-expanded="false"
					aria-controls="collapseOrder">
					<div class="sb-nav-link-icon">
						<i class="fas fa-book-open"></i>
					</div>
					주문관리
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseOrder" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="${pageContext.request.contextPath}/totalOrder">전체주문목록</a>
						<a class="nav-link" href="#">배송관리</a>
						<a class="nav-link" href="#">취소/교환/반품</a>
					</nav>
				</div>
				<!-- 주문관리 -->

				<a class="nav-link collapsed" href="#" data-toggle="collapse"
					data-target="#collapseProduct" aria-expanded="false"
					aria-controls="collapseProduct">
					<div class="sb-nav-link-icon">
						<i class="fas fa-tachometer-alt"></i>
					</div>
					상품관리
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseProduct"
					aria-labelledby="headingOne" data-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="${pageContext.request.contextPath }/booksInsert">상품등록</a>
						<a class="nav-link" href="${pageContext.request.contextPath }/booksList">등록상품조회</a>
					</nav>
				</div>

				<a class="nav-link collapsed" href="#" data-toggle="collapse"
					data-target="#collapseQNA" aria-expanded="false"
					aria-controls="collapseQNA">
					<div class="sb-nav-link-icon">
						<i class="fas fa-columns"></i>
					</div>
					QNA관리
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseQNA"
					aria-labelledby="headingOne" data-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="#">1:1문의</a>
					</nav>
				</div>

				<a class="nav-link collapsed" href="#" data-toggle="collapse"
					data-target="#collapseMember" aria-expanded="false"
					aria-controls="collapseMember">
					<div class="sb-nav-link-icon">
						<i class="fas fa-table"></i>
					</div>
					회원관리
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseMember"
					aria-labelledby="headingOne" data-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="${pageContext.request.contextPath }/membersList">회원리스트</a>
						<a class="nav-link" href="#">탈퇴회원리스트</a>
					</nav>
				</div>

				<a class="nav-link collapsed" href="#" data-toggle="collapse"
					data-target="#collapseSales" aria-expanded="false"
					aria-controls="collapseSales">
					<div class="sb-nav-link-icon">
						<i class="fas fa-chart-area"></i>
					</div> 매출관리
					<div class="sb-sidenav-collapse-arrow">
						<i class="fas fa-angle-down"></i>
					</div>
				</a>
				<div class="collapse" id="collapseSales"
					aria-labelledby="headingOne" data-parent="#sidenavAccordion">
					<nav class="sb-sidenav-menu-nested nav">
						<a class="nav-link" href="#">중고판매매출</a>
						<a class="nav-link" href="#">판매매출</a>
						<a class="nav-link" href="#">상품별매출</a>
					</nav>
				</div>

			</div>
			<!-- nav -->
		</div>
		<div class="sb-sidenav-footer">
			<div class="small">Logged in as:</div>
			Start Bootstrap
		</div>
	</nav>
</div>
<!-- 여기까지 -->