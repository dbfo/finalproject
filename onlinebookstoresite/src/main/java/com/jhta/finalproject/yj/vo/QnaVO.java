package com.jhta.finalproject.yj.vo;

import java.util.Date;

public class QnaVO {
	private int qnanum;
	private int mnum;
	private String qnatitle;
	private String qnacontent;
	private int qnastatus; // 0: 미답변, 1: 답변
	private Date qnadate;

	public QnaVO() {
	}

	public QnaVO(int qnanum, int mnum, String qnatitle, String qnacontent, int qnastatus, Date qnadate) {
		super();
		this.qnanum = qnanum;
		this.mnum = mnum;
		this.qnatitle = qnatitle;
		this.qnacontent = qnacontent;
		this.qnastatus = qnastatus;
		this.qnadate = qnadate;
	}

	public int getQnanum() {
		return qnanum;
	}

	public void setQnanum(int qnanum) {
		this.qnanum = qnanum;
	}

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getQnatitle() {
		return qnatitle;
	}

	public void setQnatitle(String qnatitle) {
		this.qnatitle = qnatitle;
	}

	public String getQnacontent() {
		return qnacontent;
	}

	public void setQnacontent(String qnacontent) {
		this.qnacontent = qnacontent;
	}

	public int getQnastatus() {
		return qnastatus;
	}

	public void setQnastatus(int qnastatus) {
		this.qnastatus = qnastatus;
	}

	public Date getQnadate() {
		return qnadate;
	}

	public void setQnadate(Date qnadate) {
		this.qnadate = qnadate;
	}
}