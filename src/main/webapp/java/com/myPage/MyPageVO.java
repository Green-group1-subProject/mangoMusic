package com.myPage;

import java.sql.Timestamp;

public class MyPageVO {
	private int mNo;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String membership;
	private String tel;
	private Timestamp regdate;
	private int playCount;
	
	
	public MyPageVO() {
		
	}
	
	public MyPageVO(int mNo, String id, String pwd, String name, String email, String membership, String tel,
			Timestamp regdate, int playCount) {
		super();
		this.mNo = mNo;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.membership = membership;
		this.tel = tel;
		this.regdate = regdate;
		this.playCount = playCount;
	}
	
	

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMembership() {
		return membership;
	}

	public void setMembership(String membership) {
		this.membership = membership;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getPlayCount() {
		return playCount;
	}

	public void setPlayCount(int playCount) {
		this.playCount = playCount;
	}

	@Override
	public String toString() {
		return "MyPageVO [mNo=" + mNo + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", membership=" + membership + ", tel=" + tel + ", regdate=" + regdate + ", playCount=" + playCount
				+ "]";
	}
}
