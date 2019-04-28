package com.moment.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moment.admin.dao.AdminVOMapper;
import com.moment.admin.domain.AdminVO;
import com.moment.admin.domain.AdminVOExample;
import com.moment.pic.domain.PicEX;
import com.moment.user.domain.UserVO;


/** * @author 01fang */
@Service
public class adminServiceImpl implements adminService {
	@Autowired
	private AdminVOMapper map;
	@Override
	public AdminVO checkLogin(String name, String password) throws Exception {
		AdminVOExample example=new AdminVOExample();
		List<AdminVO> list=map.selectByExample(example);
		for(AdminVO vo:list){
			if(name.equals(vo.getName())&&password.equals(vo.getPassword())){
				return vo;
			}
		}
		return null;
	
	}
	@Override
	public List<UserVO> selectuseradmin(UserVO u) throws Exception {
		// TODO Auto-generated method stub
		return map.selectuseradmin(u);
	}

	@Override
	public boolean deleteuserList(Integer[] arr) {
		return map.deleteuserList(arr);
	}

	@Override
	public boolean fakedeleteuserList(Integer[] idlist) {
		return map.fakedeleteuserList(idlist);
	}

	@Override
	public List<UserVO> selectfakedeleteuser() throws Exception {
		return map.selectfakedeleteuser();
	}

	@Override
	public int allowuser(Integer id) {
		return map.allowuser(id);
	}

	@Override
	public List<PicEX> selectallpic() {
		return map.selectallpic();
	}

	@Override
	public int updatepicstate(Map para) {
		return map.updatepicstate(para);
	}

	@Override
	public int upcategory(Map para) {
		// TODO Auto-generated method stub
		return map.upcategory(para);
	}

	@Override
	public int selectcateByName(String name) {
		// TODO Auto-generated method stub
		return map.selectcateByName(name);
	}

}
