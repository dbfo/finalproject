package com.jhta.finalproject.yj.vo;

import java.util.Date;

public class BooksVO {
	private int bnum; // 책번호
	private String btitle; // 책제목
	private String bwriter; // 작가
	private Date bpublishdate; // 출간일
	private String bpublisher; // 출판사
	private int bprice; // 가격
	private int bpoint; // 적립포인트
	private int bshipinfo; // 배송료
	private int bcount; // 수량
	private String bcontent; // 책설명
	private int bhit; // 조회수
	private int scatenum; // 작은카테고리번호
	private Date bregdate; // 책등록일

	public BooksVO() {
	}

	public BooksVO(int bnum, String btitle, String bwriter, Date bpublishdate, String bpublisher, int bprice,
			int bpoint, int bshipinfo, int bcount, String bcontent, int bhit, int scatenum, Date bregdate) {
		super();
		this.bnum = bnum;
		this.btitle = btitle;
		this.bwriter = bwriter;
		this.bpublishdate = bpublishdate;
		this.bpublisher = bpublisher;
		this.bprice = bprice;
		this.bpoint = bpoint;
		this.bshipinfo = bshipinfo;
		this.bcount = bcount;
		this.bcontent = bcontent;
		this.bhit = bhit;
		this.scatenum = scatenum;
		this.bregdate = bregdate;
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

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public Date getBpublishdate() {
		return bpublishdate;
	}

	public void setBpublishdate(Date bpublishdate) {
		this.bpublishdate = bpublishdate;
	}

	public String getBpublisher() {
		return bpublisher;
	}

	public void setBpublisher(String bpublisher) {
		this.bpublisher = bpublisher;
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

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public int getBhit() {
		return bhit;
	}

	public void setBhit(int bhit) {
		this.bhit = bhit;
	}

	public int getScatenum() {
		return scatenum;
	}

	public void setScatenum(int scatenum) {
		this.scatenum = scatenum;
	}

	public Date getBregdate() {
		return bregdate;
	}

	public void setBregdate(Date bregdate) {
		this.bregdate = bregdate;
	}
}
