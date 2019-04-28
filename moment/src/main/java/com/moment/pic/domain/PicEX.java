package com.moment.pic.domain;

import com.moment.report.domain.ReportVO;
import com.moment.user.domain.UserEX;

public class PicEX extends PicVO {
	private UserEX user;
	private ReportVO report;
	
	// 表格按钮字符串
	private String checkbox;
	private String tablestate;
	private String option;
	

	public String getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(String checkbox) {
		this.checkbox = checkbox;
	}

	public String getTablestate() {
		return tablestate;
	}

	public void setTablestate(String tablestate) {
		this.tablestate = tablestate;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public ReportVO getReport() {
		return report;
	}

	public void setReport(ReportVO report) {
		this.report = report;
	}

	public UserEX getUser() {
		return user;
	}

	public void setUser(UserEX user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "PicEX [user=" + user + ", report=" + report + "]";
	}

	

	/*@Override
	public String toString() {
		return user.getGrade().toString();
	}*/
	
	
	
	
	
	
}
