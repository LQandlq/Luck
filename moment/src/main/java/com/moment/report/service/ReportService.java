package com.moment.report.service;

import java.util.List;

import com.moment.datatables.domain.DataTablesRequest;
import com.moment.datatables.domain.DataTablesResponse;
import com.moment.pic.domain.PicEX;
import com.moment.report.domain.ReportVO;
public interface ReportService {
/*public int add(ReportVO report);
public int update(ReportVO report);
public int delete(Integer id);
public ReportVO get(Integer id);
public List<ReportVO> list(String descp);
public DataTablesResponse<ReportVO> listByPage(DataTablesRequest request) throws Throwable;*/
public List<PicEX> selectreport();
public int updatereportpic(ReportVO r);
public  int updatereportpicstate(ReportVO r);
public int addreport(ReportVO r);
}
