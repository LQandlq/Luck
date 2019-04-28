package com.moment.pic.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.moment.pic.domain.CollectVO;
import com.moment.pic.domain.GenreVO;
import com.moment.pic.domain.PicEX;
import com.moment.pic.domain.PicVO;
import com.moment.pic.domain.PicVOExample;
import com.moment.pic.domain.picuserlike;

public interface PicVOMapper {
    int countByExample(PicVOExample example);

    int deleteByExample(PicVOExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(PicVO record);

    int insertSelective(PicVO record);

    List<PicEX> selectPicDetailByExample(PicVOExample example);
    
    List<PicVO> selectByExample(PicVOExample example);
    List<PicEX> selecttypelist(PicVO example);
    
    List<PicEX> selectmypic(Integer id);
    List<PicEX> selectcollectpic(Integer id);

    PicVO selectByPrimaryKey(Integer id);
    
    PicEX selectPicDetailById(Integer id);

    int updateByExampleSelective(@Param("record") PicVO record, @Param("example") PicVOExample example);

    int updateByExample(@Param("record") PicVO record, @Param("example") PicVOExample example);

    int updateByPrimaryKeySelective(PicVO record);

    int updateByPrimaryKey(PicVO record);
    
    List<GenreVO> selectgenre();
    
    //向用户点赞关系记录表中插入用户点赞记录
    int insertlikepic(PicVO record);
    //删除点赞记录
    int deletelikepic(PicVO record);
    List<PicEX> selectlist(int id);
    
    
    int insertcollectpic(PicVO record);
    
    int deletecollectpic(PicVO record);
    
    CollectVO selectcollectpicuser(CollectVO c);
    
    List<PicEX> selecthotpic(PicVO c);
    
    picuserlike selectlikepic(picuserlike p);
    
    //查询周榜作品
    List<PicEX> select_top(PicVO c);
    
    List<PicEX> userfollow(int id);    
    //查询作者的其他作品
    List<PicEX> selectother4(PicVO c); 
    
    int deletegenre(int id);
    
    int insertgenre(String name);
    
    int deletepicreport(int id);
    
    int deletepiccomment(int id);

	List<PicEX> selectPicFromoUser(Map map);
}