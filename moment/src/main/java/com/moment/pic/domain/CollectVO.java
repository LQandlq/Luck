package com.moment.pic.domain;

import java.util.Date;

public class CollectVO {
	private int id;
	private int picid;
	private int collectionid;	
	private Date time;
	
	
	private int value;	
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}


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
	public int getCollectid() {
		return collectionid;
	}
	public void setCollectid(int collectionid) {
		this.collectionid = collectionid;
	}
	@Override
	public String toString() {
		return "CollectVO [id=" + id + ", picid=" + picid + ", collectid=" + collectionid + ", time=" + time + ", value="
				+ value + "]";
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	
}
