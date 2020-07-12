<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login Template</title>
<link
	href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${cp }/resources/hd/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${cp }/resources/hd/loginForm/css/login.css">
</head>
<body>
	<main class="d-flex align-items-center min-vh-100 py-3 py-md-0">
		<div class="container">
			<div class="card login-card">
				<div class="row no-gutters">
					<div class="col-md-5">
						
						<img src="${cp }/resources/hd/loginForm/images/imgtest1.jpg"
							alt="login" class="login-card-img"></a>
					</div>
					<div class="col-md-7">

						<div class="card-body">
							<div class="brand-wrapper">
								<a href="${cp }/">
								<img src="${cp }/resources/hd/img/logo2.jpg" alt="logo"
									class="logo" style="width: 200px; height: auto;"></a>
							</div>
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="tab" href="#home">회원</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="tab"
									href="#menu1">비회원 주문확인</a></li>
							</ul>

							<div class="tab-content">
								<div id="home" class="tab-pane active">
									<br>
									<p class="login-card-description">로그인</p>
									<form action="#!">
										<div class="form-group">
											<label for="email" class="sr-only">아이디</label> <input
												type="text" name="id" id="id" class="form-control"
												placeholder="아이디를 입력하세요">
										</div>
										<div class="form-group mb-4">
											<label for="password" class="sr-only">비밀번호</label> <input
												type="password" name="password" id="password"
												class="form-control" placeholder="***********">
										</div>
										<input name="login" id="login"
											class="btn btn-block login-btn mb-4" type="button"
											value="로그인">
									</form>
									<a href="#!" class="forgot-password-link">비밀번호를 잊어버리셨습니까?</a>
									<p class="login-card-footer-text">
										아이디를 가지고 있지 않습니까? <a href="#!" class="text-reset">회원가입은
											여기에서!</a>
									</p>
									<nav class="login-card-footer-nav">
										<a href="#!">Terms of use.</a> <a href="#!">Privacy policy</a>
									</nav>
								</div>
								<div id="menu1" class="tab-pane fade">
									<br>
									<p class="login-card-description">주문조회</p>
									<form action="#!">
										<div class="form-group">
											<label for="email" class="sr-only">주문번호</label> <input
												type="text" name="id" id="id" class="form-control"
												placeholder="주문번호를 입력하세요">
										</div>
										<div class="form-group mb-4">
											<label for="password" class="sr-only">비밀번호</label> <input
												type="password" name="password" id="password"
												class="form-control" placeholder="***********">
										</div>
										<input name="login" id="login"
											class="btn btn-block login-btn mb-4" type="button"
											value="확인">
									</form>
									<a href="#!" class="forgot-password-link">주문번호를 잊어버리셨습니까?</a>
									<p class="login-card-footer-text">
										잊어버리셨다면  <a href="#!" class="text-reset"> 주문번호 찾기!</a>
									</p>
									<nav class="login-card-footer-nav">
										<a href="#!">Terms of use.</a> <a href="#!">Privacy policy</a>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="${cp }/resources/hd/js/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="${cp }/resources/hd/js/bootstrap.min.js"></script>
</body>
</html>