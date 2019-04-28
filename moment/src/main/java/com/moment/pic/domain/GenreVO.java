package com.moment.pic.domain;

public class GenreVO {

	private int id;
	private String name;
	private int state;

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}
	// 表格字段
	private String checkbox;
	private String tablestate;
	private String option;

	public String getTablestate() {
		return tablestate;
	}

	public void setTablestate(String tablestate) {
		this.tablestate = tablestate;
	}

	public String getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(String checkbox) {
		this.checkbox = checkbox;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
}
