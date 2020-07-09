package com.jhta.finalproject.hd.vo;

public class CartListVo {
	private int mnum;  //ȸ����ȣ
	private int bnum;  //å��ȣ
	private String btitle; //å����
	private int bprice; //å����
	private int bpoint; //��������Ʈ
	private int bshipinfo; //��۷�
	private int stored; //���
	private int bcount;  //īƮ�� ���� ����
	private String imgsavefilename;
	
	public CartListVo() {}

	public CartListVo(int mnum, int bnum, String btitle, int bprice, int bpoint, int bshipinfo, int stored, int bcount,
			String imgsavefilename) {
		super();
		this.mnum = mnum;
		this.bnum = bnum;
		this.btitle = btitle;
		this.bprice = bprice;
		this.bpoint = bpoint;
		this.bshipinfo = bshipinfo;
		this.stored = stored;
		this.bcount = bcount;
		this.imgsavefilename = imgsavefilename;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
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

	public int getBpoint() {
		return bpoint;
	}

	public void setBpoint(int bpoint) {
		this.bpoint = bpoint;
	}

	public int getBshipinfo() {
		return bshipinfo;
	}

	public void setBshipinfo(int bshipinfo) {
		this.bshipinfo = bshipinfo;
	}

	public int getStored() {
		return stored;
	}

	public void setStored(int stored) {
		this.stored = stored;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getImgsavefilename() {
		return imgsavefilename;
	}

	public void setImgsavefilename(String imgsavefilename) {
		this.imgsavefilename = imgsavefilename;
	}
	
	
	
}
