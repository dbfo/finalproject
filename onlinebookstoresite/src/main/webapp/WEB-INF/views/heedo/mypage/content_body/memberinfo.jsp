<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<div id="content_memberinfo">

	<div>
		<i class="fab fa-first-order-alt"></i><h4 style="display:inline"><span class="colorFont">ȸ��</span>����</h4>
	</div>
	<div>
		<table class="table">
			<tr>
				<td class="tableloc">�̸�</td>
				<td style="width:40%"></td>
				<td class="tableloc">������</td>
				<td style="width:40%"></td>
			</tr>
			<tr>
				<td class="tableloc">���̵�</td><td></td><td class="tableloc">��й�ȣ</td>
				<td>
					<input type="password" value="" id="mypwd" readonly="readonly">
					<button type="button" class="btn btn-dark changeBtn">����</button>
				</td>
			</tr>
			<tr>
				<td class="tableloc">��ȭ��ȣ</td>
				<td>
					<span id="phone"></span>
					<button type="button" class="btn btn-dark changeBtn">����</button>
				</td>
				<td class="tableloc">
					�̸���
				</td>
				<td>
					<span id="email"></span>
					<button type="button" class="btn btn-dark changeBtn">����</button>
				</td>
			</tr>
			<tr>
				<td class="tableloc">
					�ּ�
				</td>
				<td colspan="3">
					<input type="text" id="addr1" class="textbox1" readonly="readonly">
					<button type="button" class="btn btn-dark" id="searchAddrBtn"  onclick="searchShipAddr()">�ּ� ����</button><br>
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
</style>