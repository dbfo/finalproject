package com.jhta.finalproject.jh.vo;

import java.util.Date;
import java.util.List;

public class SellerFeepayJoinVo {
	private int bpaynum;
	private int snum;
	private int btype;
	private int bcount;
	private String baddr;
	private String bphone;
	private int bfinalmoney;
	private Date borderdate;
	private Date bpaydate;
	private int bstatus;
	private int ordermoney;
	private int mothodpayment;
	private String receiver;
	private int mnum;
	private int delfee;
	private String mname;
	private int obcnum;
	private int feepay;
	private int settlement;
	private Date feedate;
	private List<SellerOldbooksVo> sellerOldbooksVo;
	
	public SellerFeepayJoinVo() {}
	
	public SellerFeepayJoinVo(int bpaynum, int snum, int btype, int bcount, String baddr, String bphone,
			int bfinalmoney, Date borderdate, Date bpaydate, int bstatus, int ordermoney, int mothodpayment,
			String receiver, int mnum, int delfee, String mname, int obcnum, int feepay, int settlement, Date feedate,
			List<SellerOldbooksVo> sellerOldbooksVo) {
		super();
		this.bpaynum = bpaynum;
		this.snum = snum;
		this.btype = btype;
		this.bcount = bcount;
		this.baddr = baddr;
		this.bphone = bphone;
		this.bfinalmoney = bfinalmoney;
		this.borderdate = borderdate;
		this.bpaydate = bpaydate;
		this.bstatus = bstatus;
		this.ordermoney = ordermoney;
		this.mothodpayment = mothodpayment;
		this.receiver = receiver;
		this.mnum = mnum;
		this.delfee = delfee;
		this.mname = mname;
		this.obcnum = obcnum;
		this.feepay = feepay;
		this.settlement = settlement;
		this.feedate = feedate;
		this.sellerOldbooksVo = sellerOldbooksVo;
	}
	public int getBpaynum() {
		return bpaynum;
	}
	public void setBpaynum(int bpaynum) {
		this.bpaynum = bpaynum;
	}
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public int getBtype() {
		return btype;
	}
	public void setBtype(int btype) {
		this.btype = btype;
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
	public Date getBorderdate() {
		return borderdate;
	}
	public void setBorderdate(Date borderdate) {
		this.borderdate = borderdate;
	}
	public Date getBpaydate() {
		return bpaydate;
	}
	public void setBpaydate(Date bpaydate) {
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
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getObcnum() {
		return obcnum;
	}
	public void setObcnum(int obcnum) {
		this.obcnum = obcnum;
	}
	public int getFeepay() {
		return feepay;
	}
	public void setFeepay(int feepay) {
		this.feepay = feepay;
	}
	public int getSettlement() {
		return settlement;
	}
	public void setSettlement(int settlement) {
		this.settlement = settlement;
	}
	public Date getFeedate() {
		return feedate;
	}
	public void setFeedate(Date feedate) {
		this.feedate = feedate;
	}
	public List<SellerOldbooksVo> getSellerOldbooksVo() {
		return sellerOldbooksVo;
	}
	public void setSellerOldbooksVo(List<SellerOldbooksVo> sellerOldbooksVo) {
		this.sellerOldbooksVo = sellerOldbooksVo;
	}
	
}
