package com.jhta.finalproject.jh.vo;

import java.util.Date;

public class SellerSalesJoinVo {
	private int snum;
	private String selleraddr;
	private String obname;
	private String obwriter;
	private String obpublisher;
	private Date obpdate;
	private int obstatus;
	private int oborgprice;
	private int obsaleprice;
	private int obdelfee;
	private int obsalestatus;
	private Date obregdate;
	private int bpaynum;
	private int btype;
	private int bnum;
	private int bcount;
	private String baddr;
	private String bphone;
	private int bfinalmoney;
	private int borderdate;
	private int bpaydate;
	private int bstatus;
	private int ordermoney;
	private int usedpoint;
	private int mothodpayment;
	private String receiver;
	private int mnum;
	private int delfee;
	
	public SellerSalesJoinVo() {}
	
	public SellerSalesJoinVo(int snum, String selleraddr, String obname, String obwriter, String obpublisher,
			Date obpdate, int obstatus, int oborgprice, int obsaleprice, int obdelfee, int obsalestatus, Date obregdate,
			int bpaynum, int btype, int bnum, int bcount, String baddr, String bphone, int bfinalmoney, int borderdate,
			int bpaydate, int bstatus, int ordermoney, int usedpoint, int mothodpayment, String receiver, int mnum,
			int delfee) {
		super();
		this.snum = snum;
		this.selleraddr = selleraddr;
		this.obname = obname;
		this.obwriter = obwriter;
		this.obpublisher = obpublisher;
		this.obpdate = obpdate;
		this.obstatus = obstatus;
		this.oborgprice = oborgprice;
		this.obsaleprice = obsaleprice;
		this.obdelfee = obdelfee;
		this.obsalestatus = obsalestatus;
		this.obregdate = obregdate;
		this.bpaynum = bpaynum;
		this.btype = btype;
		this.bnum = bnum;
		this.bcount = bcount;
		this.baddr = baddr;
		this.bphone = bphone;
		this.bfinalmoney = bfinalmoney;
		this.borderdate = borderdate;
		this.bpaydate = bpaydate;
		this.bstatus = bstatus;
		this.ordermoney = ordermoney;
		this.usedpoint = usedpoint;
		this.mothodpayment = mothodpayment;
		this.receiver = receiver;
		this.mnum = mnum;
		this.delfee = delfee;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getSelleraddr() {
		return selleraddr;
	}
	public void setSelleraddr(String selleraddr) {
		this.selleraddr = selleraddr;
	}
	public String getObname() {
		return obname;
	}
	public void setObname(String obname) {
		this.obname = obname;
	}
	public String getObwriter() {
		return obwriter;
	}
	public void setObwriter(String obwriter) {
		this.obwriter = obwriter;
	}
	public String getObpublisher() {
		return obpublisher;
	}
	public void setObpublisher(String obpublisher) {
		this.obpublisher = obpublisher;
	}
	public Date getObpdate() {
		return obpdate;
	}
	public void setObpdate(Date obpdate) {
		this.obpdate = obpdate;
	}
	public int getObstatus() {
		return obstatus;
	}
	public void setObstatus(int obstatus) {
		this.obstatus = obstatus;
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
	public int getObdelfee() {
		return obdelfee;
	}
	public void setObdelfee(int obdelfee) {
		this.obdelfee = obdelfee;
	}
	public int getObsalestatus() {
		return obsalestatus;
	}
	public void setObsalestatus(int obsalestatus) {
		this.obsalestatus = obsalestatus;
	}
	public Date getObregdate() {
		return obregdate;
	}
	public void setObregdate(Date obregdate) {
		this.obregdate = obregdate;
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
	public String getBaddr() {
		return baddr;
	}
	public void setBaddr(String baddr) {
		this.baddr = baddr;
	}
	public String getBphone() {
		return bphone;
	}
	public void setBphone(String bphone) {
		this.bphone = bphone;
	}
	public int getBfinalmoney() {
		return bfinalmoney;
	}
	public void setBfinalmoney(int bfinalmoney) {
		this.bfinalmoney = bfinalmoney;
	}
	public int getBorderdate() {
		return borderdate;
	}
	public void setBorderdate(int borderdate) {
		this.borderdate = borderdate;
	}
	public int getBpaydate() {
		return bpaydate;
	}
	public void setBpaydate(int bpaydate) {
		this.bpaydate = bpaydate;
	}
	public int getBstatus() {
		return bstatus;
	}
	public void setBstatus(int bstatus) {
		this.bstatus = bstatus;
	}
	public int getOrdermoney() {
		return ordermoney;
	}
	public void setOrdermoney(int ordermoney) {
		this.ordermoney = ordermoney;
	}
	public int getUsedpoint() {
		return usedpoint;
	}
	public void setUsedpoint(int usedpoint) {
		this.usedpoint = usedpoint;
	}
	public int getMothodpayment() {
		return mothodpayment;
	}
	public void setMothodpayment(int mothodpayment) {
		this.mothodpayment = mothodpayment;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getDelfee() {
		return delfee;
	}
	public void setDelfee(int delfee) {
		this.delfee = delfee;
	}
}
