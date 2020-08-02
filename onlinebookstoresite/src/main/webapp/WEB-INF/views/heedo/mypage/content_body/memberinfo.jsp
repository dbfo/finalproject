<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<div id="content_memberinfo">

	<div>
		<i class="fab fa-first-order-alt"></i><h4 style="display:inline"><span class="colorFont">ȸ��</span>����</h4>
	</div>
	<div>
		<table class="table">
			<tr>
				<td class="tableloc">�̸�</td>
				<td style="width:40%">${mname }</td>
				<td class="tableloc">������</td>
				<td style="width:40%">${regdate }</td>
			</tr>
			<tr>
				<td class="tableloc">���̵�</td><td>${requestScope.mid }</td><td class="tableloc">��й�ȣ</td>
				<td>
					<input type="password" id="mypwd" readonly="readonly">
					<button type="button" class="btn btn-dark changeBtn" data-toggle="modal" data-target="#pwdmodal">����</button>
				</td>
			</tr>
			<tr>
				<td class="tableloc">��ȭ��ȣ</td>
				<td>
					<span id="phone"></span>
					<button type="button" class="btn btn-dark changeBtn" data-toggle="modal" data-target="#phonemodal">����</button>
				</td>
				<td class="tableloc">
					�̸���
				</td>
				<td>
					<span id="email"></span>
					<button type="button" class="btn btn-dark changeBtn" data-toggle="modal" data-target="#emailmodal">����</button>
				</td>
			</tr>
			<tr>
				<td class="tableloc">
					�ּ�
				</td>
				<td colspan="3">
					<input type="text" id="addr1" class="textbox1" readonly="readonly">
					<button type="button" class="btn btn-dark" id="searchAddrBtn" data-toggle="modal" data-target="#addrmodal">�ּ� ����</button><br>
					<div class="addrLoc">���� �ּ�</div><input type="text" id="addr3" class="road_land_textbox" readonly="readonly"><br>
					<div class="addrLoc">���θ� �ּ�</div><input type="text" id="addr2" class="road_land_textbox" readonly="readonly"><br>
					<input type="text" id="addr4" placeholder="���ּ�" readonly="readonly">
					&nbsp<input type="text" id="addr5" placeholder="�����ּ�" readonly="readonly">
				</td>
			</tr>
		</table>
	</div>
	<div id="btndiv">
		<button type="button" class="btn btn-dark">���������� ��������</button>
	</div>
</div>
<div id="phonemodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #212529">
       <h4 class="modal-title" id="loginmodal_h4">ȸ������</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body modalbody" id="phonemodal_body">
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>��ȭ��ȣ</strong></span>
        		<input type="text" id="modalphone" class="loginmodal_input" readonly="readonly"><br>
        	</div>
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>��������ȭ��ȣ</strong></span>
        		<input type="text" id="modalphone1" class="modalphone">
        		<input type="text" id="modalphone2" class="modalphone">
        		<input type="text" id="modalphone3" class="modalphone">
        	</div>
      </div>
      <div class="modal-footer">
      	  	<button type="button" class="btn btn-dark" id="phoneconfirmBtn">����</button>
        <button type="button" class="btn btn-light" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>

  </div>
</div>

<div id="emailmodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #212529">
       <h4 class="modal-title" id="loginmodal_h4">ȸ������</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body modalbody" id="emailmodal_body">
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>�̸���</strong></span>
        		<input type="text" id="modalemail" class="emailmodal_input" readonly="readonly"><br>
        	</div>
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>�������̸���</strong></span>
        		<input type="email" id="inputemail" class="emailmodal_input"><br>
        	</div>
      </div>
      <div class="modal-footer">
      	  	<button type="button" class="btn btn-dark" id="emailconfirmBtn">����</button>
        <button type="button" class="btn btn-light" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>

  </div>
</div>

<div id="pwdmodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #212529">
       <h4 class="modal-title" id="loginmodal_h4">ȸ������</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body modalbody" id="pwdmodal_body">
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>��й�ȣ</strong></span>
        		<input type="password" id="modalpwd" class="pwdmodal_input" readonly="readonly"><br>
        	</div>
        	<div class="phonemodal_div">
        		<span class="modalloc"><strong>�����Һ�й�ȣ</strong></span>
        		<input type="password" id="inputpwd" class="pwdmodal_input"><br>
        	</div>
      </div>
      <div class="modal-footer">
      	  	<button type="button" class="btn btn-dark" id="pwdconfirmBtn">����</button>
        <button type="button" class="btn btn-light" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>

  </div>
</div>

<div id="addrmodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #212529">
       <h4 class="modal-title" id="loginmodal_h4">ȸ������</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body modalbody" id="addrmodal_body">
        	�ּҺ����� �Ͻðڽ��ϱ�? 
      </div>
      <div class="modal-footer">
      	  	<button type="button" class="btn btn-dark" id="addrconfirmBtn">Ȯ��</button>
        <button type="button" class="btn btn-light" data-dismiss="modal">���</button>
      </div>
    </div>

  </div>
</div>

<div id="alertinfomodal" class="modal fade" role="dialog"> 
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header" style="background-color: #ccccff">
       <h4 class="modal-title">�˸�</h4>
        <button type="button" class="close" data-dismiss="modal">x</button>
      </div>
      <div class="modal-body" id="alertinfomodal_body">
        	
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-dismiss="modal">�ݱ�</button>
      </div>
    </div>

  </div>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		
	});
	
	var memberinfo=function(){
		$.ajax({
			url:"/finalproject/member/getinfo",
			dataType:"json",
			type:"post",
			success:function(){
				
			}
		})
	}
	
	$("#addrconfirmBtn").click(function(){
		$("#addrmodal").modal('hide')
		searchShipAddr();
	});

///////////// �ּ� API ���� ///////////////////////////////////////////////////////
	function searchShipAddr() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var roadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���� �׸� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
				var postnum=data.zonecode;
                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                $("#addr1").val(postnum);
                $("#addr2").val(roadAddr);
                $("#addr3").val(data.jibunAddress);
                
                var toproadAddr="("+postnum+")"+" "+roadAddr;
                var topjibunAddr="("+postnum+")"+" "+data.jibunAddress
                // �����׸� ���ڿ��� ���� ��� �ش� �ʵ忡 �ִ´�.
                if(roadAddr !== ''){
                   $("#addr5").val(extraRoadAddr);
                    toproadAddr+=" "+extraRoadAddr+" ";
                    topjibunAddr+=" "+extraRoadAddr+" ";
                } else {
                    
                }
                //var guideTextBox = document.getElementById("guide");
                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    //guideTextBox.innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';
                   // guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                   // guideTextBox.innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')';
                  //  guideTextBox.style.display = 'block';
                } else {
                    //guideTextBox.innerHTML = '';
                   // guideTextBox.style.display = 'none';
                }
                $("#alertinfomodal_body").text("�ּ� ����Ϸ�.")
                $("#alertinfomodal").modal('show');
                
            }
        }).open();
    }
	///////////// �ּ� API �� ///////////////////////////////////////////////////////
	
	
	
</script>

<style>
	.colorFont{
		color:#e83e8c;
	}

	#content_memberinfo{
		padding:10px;
		height:740px;
		width:920px;
		border:1px solid #dee2e6;
	}
	.addrLoc{
		font-size:13px;
		width:87px;
		height:20px;
		display:inline-block;
	}
	#addr4, #addr5{
		font-size:13px;
		height:20px;
	}
	.textbox1{
		font-size:13px;
		height:20px;
		width:100px;
	}
	.road_land_textbox{
		font-size:13px;
		height:20px;
		width:248.5px;
	}
	#mypwd{
		border:none;
	}
	#searchAddrBtn{
		padding:1.5px 1.5px;
		font-size:13px;
		width:80px;
		height:20px;
	}
	.tableloc{
		background-color: #e6f7ff;
		text-align: center;
		font-weight: bold;
		width:10%;
	}
	.changeBtn{
		padding:1.5px 1.5px;
		font-size:13px;
		width:50px;
		height:30px;
	}
	#btndiv{
		text-align: center;
	}
	.modalbody{
		text-align: center;
	}
	.modalphone{
		width: 55px;
	}
</style>