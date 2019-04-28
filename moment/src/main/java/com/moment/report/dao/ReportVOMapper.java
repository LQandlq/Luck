package com.moment.report.dao;

import com.moment.pic.domain.PicEX;
import com.moment.report.domain.ReportVO;
import com.moment.report.domain.ReportVOExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ReportVOMapper {
    /*int countByExample(ReportVOExample example);

    int deleteByExample(ReportVOExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(ReportVO record);

    int insertSelective(ReportVO record);

    List<ReportVO> selectByExample(ReportVOExample example);

    ReportVO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") ReportVO record, @Param("example") ReportVOExample example);

    int updateByExample(@Param("record") ReportVO record, @Param("example") ReportVOExample example);

    int updateByPrimaryKeySelective(ReportVO record);

    int updateByPrimaryKey(ReportVO record);*/
    
    List<PicEX> selectreport();
    //修改举报表中作品的处理状态
    int updatereportpic(ReportVO r);
    //修改作品表中作品的状态
    int updatereportpicstate(ReportVO r);
    
    int addreport(ReportVO r);
}