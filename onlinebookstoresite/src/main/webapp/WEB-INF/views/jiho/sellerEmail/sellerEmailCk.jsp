<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
#injeung{
	width: 1100px;
	height: 700px;
	border: 1px solid black;
	margin: auto;
}
</style>
<div id="injeung">
	<p>전송받은 인증번호 입력해주세요</p>
	<form action="${cp }/seller/injeung" method="post">
		<input type="text" name="email_injeung">
		<input type="submit" value="입력">
	</form>
</div>
<script type="text/javascript">
	$(function(){
		$("form").submit(function() {
			var incode=$("input[name='email_injeung']").val();
			alert('${code}');
			var code='${code}';
			if(incode!=code){
				alert("인증번호가 일치하지 않습니다.");
				return false;
			}			
		});
	});
</script>