<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
/*중고판매자 이메일인증 css관련*/
#emailContent{
	width: 1300px;
	height: 1000px;
	border: 1px solid black;
	margin: auto;
}

</style>
<div id="emailContent">
	<h1>중고판매자 이메일인증</h1>
	<p>판매자 인증 후 사용가능 합니다.</p>
	<form action="${cp }/seller/mail" method="post">
		<input type="text" name="email1">
		<input type="submit" value="이메일인증">
	</form>
</div>