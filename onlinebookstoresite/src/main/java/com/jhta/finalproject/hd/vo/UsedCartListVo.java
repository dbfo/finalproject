package com.jhta.finalproject.hd.vo;

public class UsedCartListVo {
	private int cartnum;
	private int bcount;
	private int obnum;
	private String imgsavefilename;
	private int oborgprice;
	private int obsaleprice;
	private int obstatus;
	private int snum;
	
	public UsedCartListVo() {}

	public UsedCartListVo(int cartnum, int bcount, int obnum, String imgsavefilename, int oborgprice, int obsaleprice,
			int obstatus, int snum) {
		super();
		this.cartnum = cartnum;
		this.bcount = bcount;
		this.obnum = obnum;
		this.imgsavefilename = imgsavefilename;
		this.oborgprice = oborgprice;
		this.obsaleprice = obsaleprice;
		this.obstatus = obstatus;
		this.snum = snum;
	}

	public int getCartnum() {
		return cartnum;
	}

	public void setCartnum(int cartnum) {
		this.cartnum = cartnum;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public int getObnum() {
		return obnum;
	}

	public void setObnum(int obnum) {
		this.obnum = obnum;
	}

	public String getImgsavefilename() {
		return imgsavefilename;
	}

	public void setImgsavefilename(String imgsavefilename) {
		this.imgsavefilename = imgsavefilename;
	}

	public int getOborgprice() {
		return oborgprice;
	}

	public void setOborgprice(int oborgprice) {
		this.oborgprice = oborgprice;
	}

	public int getObsaleprice() {
		return obsaleprice;
	}

	public void setObsaleprice(int obsaleprice) {
		this.obsaleprice = obsaleprice;
	}

	public int getObstatus() {
		return obstatus;
	}

	public void setObstatus(int obstatus) {
		this.obstatus = obstatus;
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}
	
	
}
