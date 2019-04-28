package com.moment.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.moment.admin.domain.AdminVO;
import com.moment.admin.domain.AdminVOExample;
import com.moment.pic.domain.PicEX;
import com.moment.user.domain.UserVO;

public interface AdminVOMapper {
    int countByExample(AdminVOExample example);

    int deleteByExample(AdminVOExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(AdminVO record);

    int insertSelective(AdminVO record);

    List<AdminVO> selectByExample(AdminVOExample example);

    AdminVO selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") AdminVO record, @Param("example") AdminVOExample example);

    int updateByExample(@Param("record") AdminVO record, @Param("example") AdminVOExample example);

    int updateByPrimaryKeySelective(AdminVO record);

    int updateByPrimaryKey(AdminVO record);
    List<UserVO> selectuseradmin(UserVO u);

	// 批量删除用户
	public boolean fakedeleteuserList(Integer[] arr);

	// 批量假删除用户
	public boolean deleteuserList(Integer[] arr);

	// 查询假删除用户
	public List<UserVO> selectfakedeleteuser();

	// 还原用户
	public int allowuser(Integer id);

	// 查询所有图片
	public List<PicEX> selectallpic();

	// 修改图片状态
	public int updatepicstate(Map map);

	// 修改图片状态
	public int upcategory(Map map);

	// 查询是否存在分类
	public int selectcateByName(String name);
}