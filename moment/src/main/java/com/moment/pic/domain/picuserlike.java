package com.moment.pic.domain;

import java.util.Date;

public class picuserlike {
	private int id;
	private int picid;
	private int userid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPicid() {
		return picid;
	}
	public void setPicid(int picid) {
		this.picid = picid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	@Override
	public String toString() {
		return "picuserlike [id=" + id + ", picid=" + picid + ", userid=" + userid + "]";
	}	
	
}
