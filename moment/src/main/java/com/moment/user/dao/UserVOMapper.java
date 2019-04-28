package com.moment.user.dao;

import com.moment.pic.domain.PicEX;
import com.moment.pic.domain.PicVO;
import com.moment.user.domain.UserVO;
import com.moment.user.domain.UserVOExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserVOMapper {
    int countByExample(UserVOExample example);

    int deleteByExample(UserVOExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserVO record);

    int insertSelective(UserVO record);

    List<UserVO> selectByExample(UserVOExample example);

    UserVO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserVO record, @Param("example") UserVOExample example);

    int updateByExample(@Param("record") UserVO record, @Param("example") UserVOExample example);

    int updateByPrimaryKeySelective(UserVO record);

    int updateByPrimaryKey(UserVO record);
    
    int followuser(UserVO record);
    //查询是否关注此用户
    int selectfollow(UserVO record);
    //删除用户关注   使用uservo装用户id和关注用户id id代表userid  gradeid代表fuserid
    int deleteuserfollow(UserVO p);
    
    List<UserVO> findFollowUserOnline(int id);
    
    //List<PicEX> userfollow(int id);
}