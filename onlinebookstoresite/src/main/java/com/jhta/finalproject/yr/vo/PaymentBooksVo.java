package com.jhta.finalproject.yr.vo;

public class PaymentBooksVo {
//	BPAYNUM	NUMBER
//	BTYPE	NUMBER
//	BNUM	NUMBER
//	BCOUNT	NUMBER
	
	private int bpaynum;
	private int btype;
	private int bnum;
	private int bcount;
	private String btitle; 
	private int bprice;
	private int type;
	
	
	public PaymentBooksVo() {
	}
	


	public PaymentBooksVo(int bpaynum, int btype, int bnum, int bcount, String btitle, int bprice, int type) {
		super();
		this.bpaynum = bpaynum;
		this.btype = btype;
		this.bnum = bnum;
		this.bcount = bcount;
		this.btitle = btitle;
		this.bprice = bprice;
		this.type = type;
	}



	public int getBpaynum() {
		return bpaynum;
	}
	public void setBpaynum(int bpaynum) {
		this.bpaynum = bpaynum;
	}
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public int getBprice() {
		return bprice;
	}

	public void setBprice(int bprice) {
		this.bprice = bprice;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}



	@Override
	public String toString() {
		return "PaymentBooksVo [bpaynum=" + bpaynum + ", btype=" + btype + ", bnum=" + bnum + ", bcount=" + bcount
				+ ", btitle=" + btitle + ", bprice=" + bprice + ", type=" + type + "]";
	}

	

}
