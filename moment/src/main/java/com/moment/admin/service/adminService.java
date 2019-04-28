package com.moment.admin.service;

import java.util.List;
import java.util.Map;

import com.moment.admin.domain.AdminVO;
import com.moment.pic.domain.PicEX;
import com.moment.user.domain.UserVO;

/** * @author 01fang */
public interface adminService {
	public AdminVO checkLogin(String name,String password)throws Exception;
	public List<UserVO> selectuseradmin(UserVO u) throws Exception;

	public boolean deleteuserList(Integer[] idlist);

	public boolean fakedeleteuserList(Integer[] idlist);

	public List<UserVO> selectfakedeleteuser() throws Exception;

	// 还原用户
	public int allowuser(Integer id);

	public List<PicEX> selectallpic();

	// 修改图片状态
	public int updatepicstate(Map map);

	// 修改图片状态
	public int upcategory(Map map);

	// 查询是否存在分类
	public int selectcateByName(String name);
}
