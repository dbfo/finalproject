package com.jhta.finalproject.yj.vo;

import java.util.Date;

public class MembersListVO {
	private String mname;
	private String mid;
	private String email;
	private String phone;
	private Date regdate;
	private int mstatus;
	private Date birth;
	private int age;

	public MembersListVO() {
	}

	public MembersListVO(String mname, String mid, String email, String phone, Date regdate, int mstatus, Date birth,
			int age) {
		super();
		this.mname = mname;
		this.mid = mid;
		this.email = email;
		this.phone = phone;
		this.regdate = regdate;
		this.mstatus = mstatus;
		this.birth = birth;
		this.age = age;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getMstatus() {
		return mstatus;
	}

	public void setMstatus(int mstatus) {
		this.mstatus = mstatus;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
