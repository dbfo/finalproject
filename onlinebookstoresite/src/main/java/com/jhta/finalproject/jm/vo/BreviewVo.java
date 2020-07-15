package com.jhta.finalproject.jm.vo;

import java.util.Date;

public class BreviewVo {

	private int reviewnum;
	private int mnum;
	private int bnum;
	private String reviewcontents;
	private int bscore;
	private Date breviewregdate;
	
	public BreviewVo() {}

	public BreviewVo(int reviewnum, int mnum, int bnum, String reviewcontents, int bscore, Date breviewregdate) {
		super();
		this.reviewnum = reviewnum;
		this.mnum = mnum;
		this.bnum = bnum;
		this.reviewcontents = reviewcontents;
		this.bscore = bscore;
		this.breviewregdate = breviewregdate;
	}

	public int getReviewnum() {
		return reviewnum;
	}

	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
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

	public String getReviewcontents() {
		return reviewcontents;
	}

	public void setReviewcontents(String reviewcontents) {
		this.reviewcontents = reviewcontents;
	}

	public int getBscore() {
		return bscore;
	}

	public void setBscore(int bscore) {
		this.bscore = bscore;
	}

	public Date getBreviewregdate() {
		return breviewregdate;
	}

	public void setBreviewregdate(Date breviewregdate) {
		this.breviewregdate = breviewregdate;
	}
	
}
