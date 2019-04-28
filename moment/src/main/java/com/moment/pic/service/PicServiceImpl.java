package com.moment.pic.service;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.moment.common.util.ConfigUtil;
import com.moment.common.util.SearchConditionUtils;
import com.moment.common.util.TransTimestamp;
import com.moment.datatables.domain.DataTablesRequest;
import com.moment.datatables.domain.DataTablesResponse;
import com.moment.pic.dao.PicVOMapper;
import com.moment.pic.domain.CollectVO;
import com.moment.pic.domain.GenreVO;
import com.moment.pic.domain.PicEX;
import com.moment.pic.domain.PicVO;
import com.moment.pic.domain.PicVOExample;
import com.moment.pic.domain.picuserlike;
import com.moment.user.dao.UserVOMapper;
import com.moment.user.domain.UserVO;
import com.moment.websocket.picinfoTouser;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

@Service
public class PicServiceImpl implements PicService {
	@Autowired
	private PicVOMapper mapper;
	
	@Autowired
	private picinfoTouser websocket;
	
	@Autowired
	private UserVOMapper usermapper ;

	@Override
	public int addPic(PicVO pic,UserVO user) throws Throwable {
		// 用户作品数+1
		int rs = mapper.insertSelective(pic);
		System.out.println("作品上传ID"+pic.getId());
		if(rs>0) {
			List<UserVO> findFollowUserOnline = usermapper.findFollowUserOnline(pic.getUserid());
			System.out.println("查询到的关注用户"+findFollowUserOnline.toString());
			//通知用户是那个用户更新了
			String usermessage = user.getId()+"|"+user.getAccount()+"|"+user.getImg()+"|"+pic.getId()+"|"+pic.getName();
			websocket.onMessage(usermessage, findFollowUserOnline);			
		}
		return rs;
	}

	@Override
	public int deletePic(Integer id) throws Throwable {
		return mapper.deleteByPrimaryKey(id);
	}

	@Override
	public PicEX getPicById(Integer id) throws Throwable {
		return mapper.selectPicDetailById(id);
		//return mapper.selectByPrimaryKey(id);
	}

	@Override
	public int updatePicVO(PicVO pic) throws Throwable {
		return mapper.updateByPrimaryKeySelective(pic);
	}

	@Override
	public DataTablesResponse<PicVO> list(DataTablesRequest request) throws Throwable {
		PicVOExample example = new PicVOExample();
		DataTablesResponse<PicVO> response = new DataTablesResponse<PicVO>();
		SearchConditionUtils.wrapperAndCondition(example, request);// 封装查询条件
		response.setDraw(request.getDraw());
		response.setRecordsTotal(mapper.countByExample(example));
		response.setData(mapper.selectByExample(example));
		return response;
	}

	@Override
	public Response doUpload(byte[] b, PicVO pic) throws Throwable {
	

		String bucketname = "moment";
		String fileName = UUID.randomUUID().toString();
		pic.setPicpath(ConfigUtil.getValue("uri") + fileName);
		Auth auth = Auth.create(ConfigUtil.getValue("AccessKey"), ConfigUtil.getValue("SecretKey"));
		String token = auth.uploadToken(bucketname);
		UploadManager manager = new UploadManager();
		Response response = manager.put(b, fileName, token);
		
		if (response.isOK()) {
			mapper.insertSelective(pic);
		}
		return response;

	}

	@Override
	public int deletePicFromQiniu(Integer id) throws Throwable {

		//String accessKey = ConfigUtil.getValue("AccessKey");
		//String secretKey = ConfigUtil.getValue("SecretKey");

		//String bucket = "moment";
		//PicVO pic = mapper.selectByPrimaryKey(id);

		//String key = pic.getPicpath().substring(pic.getPicpath().lastIndexOf("/") + 1);
		//System.out.println(key);
		/*Auth auth = Auth.create(accessKey, secretKey);
		BucketManager bucketManager = new BucketManager(auth);
		bucketManager.delete(bucket, key);*/
		int i = mapper.deleteByPrimaryKey(id);
		return i;
	}

	@Override
	public int getPicnumByDate(Integer id) throws Throwable {
		// 获取当前时间，并将时间数设为00：00：00
		Date date1 = new Date();
		date1.setHours(0);
		date1.setMinutes(0);
		date1.setSeconds(0);
		// 获取时间，并将时间数设为00：00：00
		TransTimestamp ts = new TransTimestamp();
		Date date2 = ts.getTomorrow(date1);
		PicVOExample example = new PicVOExample();
		// 获取在这时间范围内的图片,可以使用链式结构
		example.createCriteria().andTimeBetween(date1, date2).andUseridEqualTo(id);
		List<PicVO> list = mapper.selectByExample(example);
		
		return list.size();
	}

	@Override
	public void updateUserGrade(UserVO user) throws Throwable {
		Integer picnum = user.getPicnum() ;
		if((picnum>=30)&&(picnum<60)){
			user.setGradeid(2);
			usermapper.updateByPrimaryKeySelective(user);
		}else if((picnum>=60)&&(picnum<100)){
			user.setGradeid(3);
			usermapper.updateByPrimaryKeySelective(user);
		}else if((picnum>=100)){
			user.setGradeid(4);
			usermapper.updateByPrimaryKeySelective(user);
		}else{			
			user.setGradeid(1);
			usermapper.updateByPrimaryKeySelective(user);
		}			
	}

	@Override
	public List<PicEX> getPicList(String type) throws Throwable {
		PicVOExample example = new PicVOExample();
		example.createCriteria().andTypeLike("%"+type+"%") ;
		example.setOrderByClause("time desc");
		return mapper.selectPicDetailByExample(example);
	}
	

	@Override
	public List<PicVO> getUserPicList(Integer id) throws Throwable {
		PicVOExample example = new PicVOExample() ;
		example.createCriteria().andUseridEqualTo(id) ;
		example.setOrderByClause("time desc");
		return mapper.selectByExample(example);
		
	}
	@Override
	public List<PicEX> getPicListByCondition(String key,int limit,int offset) throws Throwable {
		PicVOExample example = new PicVOExample();
		example.createCriteria().andDescriptionLike("%" + key + "%") ;
		example.or().andNameLike("%" + key + "%") ;
		example.setOrderByClause("time desc");
		example.setFindkey("%" + key + "%");
		if(offset>0) {
			example.setOffset(offset);
		}
		example.setLimit(limit);
		
		return mapper.selectPicDetailByExample(example);
	}

	@Override
	public List<GenreVO> selectgenre() throws Throwable {
		// TODO Auto-generated method stub
		return mapper.selectgenre();
	}

	@Override
	public List<PicEX> selectmypic(Integer id) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.selectmypic(id);
	}

	@Override
	public int insertlikepic(PicVO record) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.insertlikepic(record);
	}

	@Override
	public int deletelikepic(PicVO record) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.deletelikepic(record);
	}

	@Override
	public List<PicEX> selectlist(int id) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.selectlist(id);
	}

	@Override
	public int insertcollectpic(PicVO record) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.insertcollectpic(record);
	}

	@Override
	public int deletecollectpic(PicVO record) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.deletecollectpic(record);
	}

	@Override
	public CollectVO selectcollectpicuser(CollectVO c) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.selectcollectpicuser(c);
	}

	@Override
	public List<PicEX> selectcollectpic(int id) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.selectcollectpic(id);
	}

	@Override
	public List<PicEX> selecttypelist(PicVO example) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.selecttypelist(example);
	}

	@Override
	public List<PicEX> selecthotpic(PicVO c) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.selecthotpic(c);
	}

	@Override
	public picuserlike selectlikepic(picuserlike p) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.selectlikepic(p);
	}

	@Override
	public List<PicEX> select_top(PicVO c) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.select_top(c);
	}

	@Override
	public List<PicEX> userfollow(int id) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.userfollow(id);
	}

	@Override
	public List<PicEX> selectother4(PicVO p) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.selectother4(p);
	}

	@Override
	public int deletegenre(int id) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.deletegenre(id);
	}

	@Override
	public int insertgenre(String name) throws Throwable {
		// TODO Auto-generated method stub
		return mapper.insertgenre(name);
	}

	@Override
	public int deletepicreport(int id) {
		// TODO Auto-generated method stub
		return mapper.deletepicreport(id);
	}

	@Override
	public int deletepiccomment(int id) {
		// TODO Auto-generated method stub
		return mapper.deletepiccomment(id);
	}

	@Override
	public List<PicEX> selectPicFromoUser(Map map) {
		return mapper.selectPicFromoUser(map);
	}
	
}
