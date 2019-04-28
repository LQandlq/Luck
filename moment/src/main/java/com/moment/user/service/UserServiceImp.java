package com.moment.user.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moment.common.util.ConfigUtil;
import com.moment.common.util.MD5Util;
import com.moment.common.util.SearchConditionUtils;
import com.moment.datatables.domain.DataTablesRequest;
import com.moment.datatables.domain.DataTablesResponse;
import com.moment.user.dao.UserVOMapper;
import com.moment.user.domain.UserVO;
import com.moment.user.domain.UserVOExample;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;


@Service
public class UserServiceImp implements UserService {

	@Autowired
	private UserVOMapper mapper;
	
	@Override
	public int addUser(UserVO user) throws Throwable {
		String salt=UUID.randomUUID().toString();
		/*
		 * user.setSalt(salt); user.setPassword(MD5Util.md5(user.getPassword() + salt));
		 * // 密码加密
		 */
		user.setGradeid(1);// 添加等级为LV0
		return mapper.insertSelective(user);
	}

	@Override
	public int deleteUser(Integer id) throws Throwable {
		return mapper.deleteByPrimaryKey(id);

	}

	@Override
	public int updateUser(UserVO user) throws Throwable {
	/*	String salt=UUID.randomUUID().toString();
		user.setSalt(salt);
		user.setPassword(MD5Util.md5(user.getPassword()+salt));	//密码加盐
*/		return mapper.updateByPrimaryKeySelective(user);

	}

	

	@Override
	public UserVO getUserById(Integer id) throws Throwable {
		return mapper.selectByPrimaryKey(id);
		
	}

	@Override
	public UserVO getUserByAccount(String account) throws Throwable {
		UserVOExample example = new UserVOExample();
		example.createCriteria().andAccountEqualTo(account);
		List<UserVO> list = mapper.selectByExample(example);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	

	@Override
	public DataTablesResponse<UserVO> list(DataTablesRequest request) throws Throwable {
		UserVOExample example = new UserVOExample();
		DataTablesResponse<UserVO> response = new DataTablesResponse<UserVO>();
		SearchConditionUtils.wrapperAndCondition(example, request);// 封装查询条件
		response.setDraw(request.getDraw());
		response.setRecordsTotal(mapper.countByExample(example));
		response.setData(mapper.selectByExample(example));
		return response;
	}

	@Override
	public List<UserVO> getUserByName(String name) throws Throwable {
		UserVOExample example = new UserVOExample();
		example.createCriteria().andAccountLike(name);
		List<UserVO> list = mapper.selectByExample(example);
		return list;
	}

	@Override
	public UserVO checkLogin(String account, String password) throws Throwable {
		UserVO user=this.getUserByAccount(account);
		if(user!=null){
			System.out.println("取到相同账号用户");
			// String inputPwd=MD5Util.md5(password+user.getSalt());
			// System.out.println(inputPwd);
			// System.out.println(user.getPassword());
			if(user.getPassword().equals(password)){//验证通过
				return user;
			}
		}
		return null;
	}
	//上传用户头像
	@Override
	public String  doUpload(byte[] b) throws Throwable {
		String bucketname = "moment";
		String fileName = UUID.randomUUID().toString();
		Auth auth = Auth.create(ConfigUtil.getValue("AccessKey"), ConfigUtil.getValue("SecretKey"));
		String token = auth.uploadToken(bucketname);
		UploadManager manager = new UploadManager();
		Response response = manager.put(b, fileName, token);
		if(response.isOK()){
			String path=ConfigUtil.getValue("uri") + "a.jpg";
			return path;
		}
		return null;

	}

	@Override
	public boolean validate(Integer id, String password) throws Throwable {
		UserVO user=this.getUserById(id);
		boolean flag=false;
		if(user!=null){
			String inputPwd=MD5Util.md5(password+user.getSalt());
			if(user.getPassword().equals(password)){//验证通过
				flag=true;
			}
		}
		return flag;
	}

	@Override
	public int followuser(UserVO u) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.followuser(u);
	}

	@Override
	public int selectfollow(UserVO record) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.selectfollow(record);
	}

	@Override
	public int deleteuserfollow(UserVO p) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.deleteuserfollow(p);
	}

	@Override
	public List<UserVO> findFollowUserOnline(int id) {
		// TODO Auto-generated method stub
		return mapper.findFollowUserOnline(id);
	}

	/*@Override
	public List<PicEX> userfollow(int id) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.userfollow(id);
	}*/
	
}
