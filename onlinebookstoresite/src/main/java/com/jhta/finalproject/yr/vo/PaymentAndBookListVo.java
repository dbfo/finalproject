package com.jhta.finalproject.yr.vo;

import java.util.Date;
import java.util.List;

public class PaymentAndBookListVo {
	private int bpaynum; // 지불번호
	private String baddr; // 주문자 집 주소
	private String bphone; // 주문자 전화번호
	private int bfinalmoney; // 결제금액
	private Date borderdate; // 주문날짜
	private Date bpaydate; // 결제 날짜
	private int bstatus; // 상태 (0:주문(입금전), 1:결제완료,2:배송중,3:수령완료(구매확정),4:cs상태)
	private int odermoney; // 주문금액
	private int usedpoint; // 포인트 사용량
	private int methodpayment; // 지불방법(0:카드,1:무통장)
	private String receiver;// 수령인
	private int mnum; // 회원 번호
	private String mname;// 회원이름(주문자이름)
	private int type; // cs타입
	private String btitle; // 책이름
	private List<PaymentBooksVo> paymentbook;
	private List<BooksVO> bookinfo;

	


	@Override
	public String toString() {
		return "PaymentAndBookListVo [bpaynum=" + bpaynum + ", baddr=" + baddr + ", bphone=" + bphone + ", bfinalmoney="
				+ bfinalmoney + ", borderdate=" + borderdate + ", bpaydate=" + bpaydate + ", bstatus=" + bstatus
				+ ", odermoney=" + odermoney + ", usedpoint=" + usedpoint + ", methodpayment=" + methodpayment
				+ ", receiver=" + receiver + ", mnum=" + mnum + ", mname=" + mname + ", type=" + type + ", btitle="
				+ btitle + ", paymentbook=" + paymentbook + ", bookinfo=" + bookinfo + "]";
	}




	public PaymentAndBookListVo(int bpaynum, String baddr, String bphone, int bfinalmoney, Date borderdate,
			Date bpaydate, int bstatus, int odermoney, int usedpoint, int methodpayment, String receiver, int mnum,
			String mname, int type, String btitle, List<PaymentBooksVo> paymentbook, List<BooksVO> bookinfo) {
		super();
		this.bpaynum = bpaynum;
		this.baddr = baddr;
		this.bphone = bphone;
		this.bfinalmoney = bfinalmoney;
		this.borderdate = borderdate;
		this.bpaydate = bpaydate;
		this.bstatus = bstatus;
		this.odermoney = odermoney;
		this.usedpoint = usedpoint;
		this.methodpayment = methodpayment;
		this.receiver = receiver;
		this.mnum = mnum;
		this.mname = mname;
		this.type = type;
		this.btitle = btitle;
		this.paymentbook = paymentbook;
		this.bookinfo = bookinfo;
	}




	public PaymentAndBookListVo() {
		super();
	}

	
	
	
	public String getBtitle() {
		return btitle;
	}



	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}



	public Date getBorderdate() {
		return borderdate;
	}

	public void setBorderdate(Date borderdate) {
		this.borderdate = borderdate;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getBpaynum() {
		return bpaynum;
	}

	public void setBpaynum(int bpaynum) {
		this.bpaynum = bpaynum;
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

	public Date getborderdate() {
		return borderdate;
	}

	public void setborderdate(Date borderdate) {
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

	public int getOdermoney() {
		return odermoney;
	}

	public void setOdermoney(int odermoney) {
		this.odermoney = odermoney;
	}

	public int getUsedpoint() {
		return usedpoint;
	}

	public void setUsedpoint(int usedpoint) {
		this.usedpoint = usedpoint;
	}

	public int getMethodpayment() {
		return methodpayment;
	}

	public void setMethodpayment(int mothodpayment) {
		this.methodpayment = mothodpayment;
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

	public List<PaymentBooksVo> getPaymentbook() {
		return paymentbook;
	}

	public void setPaymentbook(List<PaymentBooksVo> paymentbook) {
		this.paymentbook = paymentbook;
	}

	public List<BooksVO> getBookinfo() {
		return bookinfo;
	}

	public void setBookinfo(List<BooksVO> bookinfo) {
		this.bookinfo = bookinfo;
	}

}
