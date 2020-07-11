package com.jhta.finalproject.hd.vo;

import java.util.ArrayList;
import java.util.List;

public class OrderParameterVo {  // 장바구니에서 주문하기 넘어갈때 책이 여러개 있을수 있으므로 List로 받음.. 
	private List bnum; //책번호 
	private List bcount;  //수량
	private List cartNum; //카트번호
	
	public OrderParameterVo() {
		bnum=new ArrayList();
		bcount=new ArrayList();
		cartNum=new ArrayList();
	}
	public List getBnum() {
		return bnum;
	}

	public void setBnum(List bnum) {
		this.bnum = bnum;
	}

	public List getBcount() {
		return bcount;
	}

	public void setBcount(List bcount) {
		this.bcount = bcount;
	}

	public List getCartNum() {
		return cartNum;
	}

	public void setCartNum(List cartNum) {
		this.cartNum = cartNum;
	}
	

	
}
