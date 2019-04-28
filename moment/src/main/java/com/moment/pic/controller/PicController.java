package com.moment.pic.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.moment.common.domain.CurrentUser;
import com.moment.common.domain.JsonResult;
import com.moment.common.util.PicCropper;
import com.moment.grade.domain.GradeVO;
import com.moment.pic.domain.CollectVO;
import com.moment.pic.domain.Cropper;
import com.moment.pic.domain.GenreVO;
import com.moment.pic.domain.PicEX;
import com.moment.pic.domain.PicVO;
import com.moment.pic.domain.picuserlike;
import com.moment.pic.service.PicService;
import com.moment.user.domain.UserVO;
import com.moment.user.service.UserService;

@Controller
@RequestMapping("/pic")
public class PicController {
	@Autowired
	private PicService service;

	@Autowired
	private UserService userservice;

	@RequestMapping("/upload")
	public String upload() {
		return "pic/upload";
	}
	
	@RequestMapping("/otheruserpic")
	public String otheruserpic(String userid,Map map) {
		try {
			System.out.println("用户id："+userid);
			List<PicEX> userPicList = service.selectmypic(Integer.parseInt(userid));	
			UserVO auther = userservice.getUserById(userPicList.get(0).getUserid());
			map.put("userPicList", userPicList);
			map.put("auther", auther);
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "user/otheruserpic";
	}

	@Transactional
	@RequestMapping("/doupload")
	public @ResponseBody JsonResult doUpload(MultipartFile file, PicVO pic,HttpSession session,String imgdata) throws Throwable {
		CurrentUser cuser = CurrentUser.getInstance();
		Cropper cropper=JSONObject.parseObject(imgdata,Cropper.class);
		service.updateUserGrade(cuser.getCurrentUser());
		GradeVO grade = cuser.getGrade();
		JsonResult result = new JsonResult();
		int test = service.getPicnumByDate(cuser.getUserId()) ;
		int test2 = grade.getUploadnum() ;
		if (service.getPicnumByDate(cuser.getUserId()) < grade.getUploadnum()) {
			//实现图片的裁剪
			System.out.println("裁剪前："+file.getSize());
			//Cropper cropper=JSONObject.parseObject(imgdata,Cropper.class);
			System.out.println("file:"+file);
			System.out.println("cropper x:"+cropper.getX());
			System.out.println("cropper y:"+cropper.getY());
			System.out.println("cropper w:"+cropper.getWidth());
			System.out.println("cropper h:"+cropper.getHeight());
			MultipartFile file2=PicCropper.cut(file, cropper.getX(),cropper.getY(),cropper.getWidth(),cropper.getHeight(),"sdfa"); 
			byte[] newFile = file2.getBytes();
			pic.setUserid(cuser.getUserId());
			service.doUpload(newFile , pic);

			result.setMsg("上传成功");
			result.setStatus(1);
			UserVO user = userservice.getUserById(cuser.getUserId());
			user.setPicnum(user.getPicnum() + 1);
			// 用户数据表中的上传图片数量改变
			userservice.updateUser(user);
			
			List<PicVO> picList = (List<PicVO>) session.getAttribute("picList") ;
			picList.add(0, pic);
			
			List<PicVO> cuserList = (List<PicVO>) session.getAttribute("cuserList") ;
			cuserList.add(0,pic);
			return result;

		} else {
			result.setMsg("你今天的上传数量已经全部用完");
			result.setStatus(0);
			return result;
		}
	
	}
	
	
//作品删除
	@RequestMapping("/delete")
	public @ResponseBody JsonResult delete(String id) {
		JsonResult result = new JsonResult();
		System.out.println("进入删除操作");
		System.out.println(id);
		try {
			//删除作品
			int i = service.deletePicFromQiniu(Integer.parseInt(id));
			//删除作品的所有举报信息
			service.deletepicreport(Integer.parseInt(id));
			//删除作品的所有评论
			service.deletepiccomment(Integer.parseInt(id));
			result.setStatus(i);
			result.setMsg("删除成功");
		} catch (Throwable e) {
			result.setStatus(0);
			result.setMsg("删除失败");
			return result;
		}
		return result;
	}
	
	
	//删除收藏作品
		@RequestMapping("/deletecollect")
		public @ResponseBody JsonResult deletecollect(String id,HttpSession session) {
			UserVO user = (UserVO) session.getAttribute("user");
			JsonResult result = new JsonResult();
			System.out.println("进入收藏删除操作");
			//System.out.println(id);
			PicVO p = new PicVO();
			p.setUserid(user.getId());
			p.setId(Integer.parseInt(id));
			try {
				int i = service.deletecollectpic(p);
				result.setStatus(i);
				result.setMsg("删除成功");
			} catch (Throwable e) {
				result.setStatus(0);
				result.setMsg("删除失败");
				return result;
			}
			return result;
		}

	@RequestMapping("/doEdit")
	public String doEdit(PicVO pic) {
		try {
			service.updatePicVO(pic);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return "";
	}
	
	//查询特定类别的图片
	@RequestMapping("/getPicList")
	public  @ResponseBody List<PicEX> getPicList(String type,String type2){
		//type是作品分类   type2是热度或者最新分类
		PicVO p = new PicVO();
		
		if(type2!=null) {
			System.out.println(type2);
		if(type2.equals("热门推荐")) {
			p.setIspublic("piclike");

		}
		if(type2.equals("新鲜出炉")) {
			p.setPicpath("time");
		}
		}
		System.out.println(p.getEd());
		List<PicEX> picList = null ;		
		if(type!=null){
			
			p.setType(type);
		}
		System.out.println(p.toString());
		try {
			//picList = service.getPicList(type) ;
			picList =service.selecttypelist(p);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		System.out.println("plclist: "+picList.size());
		return picList;
	}
	
	//检索出带是否点赞标记的所有作品列表
		@RequestMapping("/getPicList1")
		public  @ResponseBody List<PicEX> getPicList1(HttpSession session){
			List<PicEX> picList = null ;
			UserVO  user = (UserVO) session.getAttribute("user");
			try {
				picList = service.selectlist(user.getId()) ;
			} catch (Throwable e) {
				e.printStackTrace();
			}
			//System.out.println("plclist: "+picList);
			return picList;
		}
	
	//查询个人作品
	@RequestMapping("/getmyPicList")
	public  @ResponseBody List<PicEX> getmyPicList(String oid,HttpSession session){
		//如果oid不为空则表示查询其他用户的个人作品	
		UserVO user = null;
		if(oid!=null) {
			user = new UserVO();
			user.setId(Integer.parseInt(oid));
		}else {
			user=(UserVO) session.getAttribute("user");
		}
		
		List<PicEX> picList = null ;
		try {
			picList = service.selectmypic(user.getId());
		} catch (Throwable e) {
			e.printStackTrace();
		}			
		//System.out.println("plclist: "+picList);
		return picList;
	}
	
	//查询收藏作品
		@RequestMapping("/getcollectPicList")
		public  @ResponseBody List<PicEX> getcollectPicList(String id,HttpSession session){
			UserVO user = (UserVO) session.getAttribute("user");
			List<PicEX> picList = null ;
			try {
				picList = service.selectcollectpic(user.getId());
			} catch (Throwable e) {
				e.printStackTrace();
			}			
			//System.out.println("plclist: "+picList);
			return picList;
		}
	
	@RequestMapping("/piclist")
	public String piclist(HttpServletRequest request,String find){
		System.out.println("进入piclist");
		if(find!=null) {
			request.setAttribute("find", find);
		}
		return "user/piclist";
	}
	
	
	
	@RequestMapping("/single")
	public String single(String sid,HttpSession session,HttpServletRequest request){	
		//查询图片信息
		/*System.out.println(sid);*/
		int id = Integer.parseInt(sid);
		PicEX pic = getPicById(id);
		//System.out.println("userid:"+pic.getUserid());
		session.setAttribute("picbyid",pic);
		CollectVO c=new CollectVO();
		UserVO user = (UserVO) session.getAttribute("user");
		c.setCollectid(user.getId());
		c.setPicid(pic.getId());
		System.out.println("userid:"+user.getId());
		System.out.println("picid:"+pic.getId());
		System.out.println(c.toString());
		picuserlike p1 = new picuserlike();
		p1.setUserid(user.getId());
		p1.setPicid(pic.getId());
		try {
			picuserlike pp = service.selectlikepic(p1);
			CollectVO a = service.selectcollectpicuser(c);
			if(a!=null&&a.getId()>0) {
				System.out.println("有收藏记录");
				session.setAttribute("collect", "true");
			}else {
				System.out.println("mei有收藏记录");
				session.setAttribute("collect", null);
			}
			if(pp!=null&&pp.getId()>0) {
				System.out.println("有点赞");
				session.setAttribute("piclike", "true");
			}else {
				System.out.println("mei有点赞");
				session.setAttribute("piclike", null);
			}
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//获取用户的其他作品
		try {
			List<PicEX> other4 =service.selectother4(pic);
			System.out.println(other4.size());
			request.setAttribute("other4", other4);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "user/shop-single";
		// return "user/personalpage";
	}
	
	//点赞收藏操作
	@RequestMapping("/change")
	public @ResponseBody int likeAndcollect(String imgid,String liketype,String num,String rs,HttpSession session){	
		UserVO user = (UserVO) session.getAttribute("user");
		//查询图片信息
		/*System.out.println(sid);*/
		PicVO pic = new PicVO();
		int id = Integer.parseInt(imgid);
		pic.setId(id);
		//向点赞关系表中插入数据，用picid存储userID
		pic.setUserid(user.getId());
		if(liketype.equals("piclike")) {
			//rs表示点赞还是取消点赞，1为+ 负1为-
			//点赞操作
			int num1 = Integer.parseInt(num);
			System.out.println(num1);
			pic.setPiclike(num1+Integer.parseInt(rs));
			
			System.out.println(id);
			doEdit(pic);
							
			try {
				
				if(rs.equals("1")) {
					pic.setUserid(user.getId());
					System.out.println(pic);
					System.out.println("+1caozuo");					
				service.insertlikepic(pic);
				
				}else {
					pic.setUserid(user.getId());
					System.out.println(pic);
					System.out.println("-1caozuo");
				service.deletelikepic(pic);
				}
				
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else {
			//收藏操作
			try {
				if(rs.equals("1")) {
				service.insertcollectpic(pic);
				}else {
				service.deletecollectpic(pic);
				}
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		/*注释时间 21日 18.35
		 * pic.setId(id);
		System.out.println(id);
		doEdit(pic);*/
		return 0;
		
	}
	
	
	@RequestMapping("/getPicById")
	public  @ResponseBody PicEX getPicById(int id){
		PicVO p = new PicVO();
		p.setId(id);
		PicEX pic=null;
		try {
			 pic= service.getPicById(id);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return pic;
	}
	/**
	 * 根据条件查找图片
	 * @param pickey
	 * @return
	 */
	@RequestMapping("/getPicListByCondition")
	public @ResponseBody List<PicEX> getPicListByCondition(String type,String offset){
		List<PicEX> picList = null ;
		int set=-1;
		if(type==null){
			type = "" ;
		}
		if(offset!=null&&offset.equals("")) {
			set = Integer.parseInt(offset);
		}
		System.out.println("搜索条件："+type);
		System.out.println("搜索位置："+set);
		System.out.println("位置："+offset);
		try {
			picList = service.getPicListByCondition(type,16,Integer.parseInt(offset)) ;
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return picList;
		
	}
//	查询图片类别
	@RequestMapping("/getgenre")
	public @ResponseBody List<GenreVO> getgenre(){
		List<GenreVO> genreList = null ;		
		try {
			genreList = service.selectgenre();
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return genreList;
		
	}
	
//	删除图片类别
	@RequestMapping("/deletegenre")
	public @ResponseBody int deletegenre(String sid){
		int id = Integer.parseInt(sid);
		int rs=0; 
		try {
			rs=service.deletegenre(id);
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return rs;		
	}
	
//	添加图片类别
	@RequestMapping("/addgenre")
	public @ResponseBody int addgenre(String name){
			int rs = 0;
		try {
			rs = service.insertgenre(name);
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return rs;		
	}
	
	
	private String filePath1="E:\\picture\\";
	private String filepath2="\\picture\\";
	/**
	 * 多文件上传
	 */
	@RequestMapping(value = "/uploads")
	public String doUploads(@RequestParam("files") MultipartFile[] files,PicVO pic, HttpServletRequest request,HttpSession session) throws Exception{ 
		System.out.println("进入多文件上传");
		//System.out.println(request.getParameter("files").length());
		System.out.println("文件大小"+files.length);
		UserVO user1=(UserVO) request.getSession().getAttribute("user");
		String filePath = filePath1 +user1.getAccount()+ "\\upload";
		File dir=new File(filePath);
		System.out.println("文件夹是否存在:"+dir.exists());
        if(!dir.exists()) {
            dir.mkdir();		
        }
		for(int i=0;i<files.length;i++) {
			String savepath = filePath +"\\"+files[0].getOriginalFilename();
			files[0].transferTo(new File(savepath));  
			System.out.println(savepath);
			//数据库中保存地址
			String dbpath=filepath2+user1.getAccount()+ "\\upload"+"\\"+files[0].getOriginalFilename();;
		    //文件传入数据库的操作 
			pic.setPicpath(dbpath);
			pic.setUserid(user1.getId());
			try {
				int flag = service.addPic(pic,(UserVO)session.getAttribute("user"));
				//如果添加成功就查询是否有关注此上传用户的其他用户并进行通知
				
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println(pic.toString());
		
		return "redirect:/pic/piclist";
			}
	
	@RequestMapping("/selecthotpic")
	public @ResponseBody List<PicEX> selecthotpic(String type,String piclike,String ispublic,String ed){
		List<PicEX> picList = null ;
		//ed为获取数据条数，ispublic不为空最新排序，piclike根据点赞排序l,type为分类
		PicVO c = new PicVO();
		
		if(type!=null&&!"null".equals(type)&&!type.equals("")){
			System.out.println("type赋值");
			if ("全部".equals(type))
				c.setType(null);
			else
				c.setType(type);
		}
		if(piclike!=null&&!"null".equals(piclike)&&!piclike.equals("")){
			System.out.println("热度排序");
			c.setPiclike(Integer.parseInt(piclike));
		}
		if(ispublic!=null&&!"null".equals(ispublic)&&!ispublic.equals("")){
			System.out.println("时间排序");
			c.setIspublic(ispublic);
		}
		if(ed!=null&&!"null".equals(ed)&&!ed.equals("")&&Integer.parseInt(ed)!=0){
			c.setEd(Integer.parseInt(ed));
			c.setState(16);
		}else {
			c.setEd(0);
			c.setState(16);
		}
		
		
		System.out.println(c);
		System.out.println("当前数据条数：" + c.getEd());
		System.out.println("搜索piclike：" + c.getPiclike());
		System.out.println("搜索ispublic：" + c.getIspublic());
		System.out.println("搜索类别："+type);
		//System.out.println(type+1);
		try {
			picList = service.selecthotpic(c);
			if (ispublic != null && !"".equals(ispublic)&& !ispublic.equals("sadf")
					&& Integer.parseInt(ispublic) > 0) {
				// 如果传入值不为sadf则展示用户关注作品
				Map map = new HashMap<>();
				map.put("userid", c.getIspublic());
				map.put("type", c.getType());
				picList = service.selectPicFromoUser(map);
			} else {
				System.out.println("关注用户作品查询");

			}


			System.out.println("查询数据条数：" + picList.size());
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return picList;
		
	}
	
	
	@RequestMapping("/gettop")
	public String gettop(HttpServletRequest request, PicVO pic) {
		List<PicEX> picList = null ;
		try {
			// piclike和ispublic都为null则总榜 is周榜like月榜
			// 查询总榜
			pic.setPiclike(null);
			pic.setIspublic(null);
			picList =service.select_top(pic);
			//查询月榜并将两个list合并
			pic.setIspublic(null);			
			pic.setPiclike(1);
			picList.addAll(service.select_top(pic));
			// 查询周榜
			pic.setIspublic("1");
			pic.setPiclike(null);
			picList.addAll(service.select_top(pic));

			request.setAttribute("top", picList);
			System.out.println("picController-475roll:"+picList.get(11));
		} catch (Throwable e) {
			e.printStackTrace();
		}
		return "user/top";
	}
	
	@RequestMapping("/userfollow")
	public  String userfollow(HttpServletRequest request,HttpSession session) throws Throwable {
		List<PicEX> picList = null ;
		///int id = Integer.parseInt(uid);
		UserVO user = (UserVO) session.getAttribute("user");
		picList=service.userfollow(user.getId());
		request.setAttribute("userfollow", picList);
		/*System.out.println(picList.size());
		System.out.println(picList.get(0));*/
			return "user/author";
	}
	
	@RequestMapping("/picdown")
	public ResponseEntity<byte[]> picdown(String filepath) throws Throwable {
		System.out.println("wenjiandizhi:" + filepath);
		// 图片下载
		HttpHeaders headers = new HttpHeaders();
		// String path = "E:\\picture\\963@qq.com\\upload\\1 (2).jpg";
		String path = "E:" + filepath;
		File file = new File(path);
		String[] downName = path.split("\\\\");
		String fileName = downName[downName.length - 1];
		System.out.println("filename:" + fileName);
		// headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		// headers.setContentDispositionFormData("attachment", downName[downName.length
		// - 1]);
		// return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
		// headers, HttpStatus.CREATED);

		// 方法2
		String fileName1 = new String(fileName.getBytes("UTF-8"), "iso-8859-1");//
		// 解决文件名乱码

		headers.setContentDispositionFormData("attachment", fileName1);
		// application/octet-stream二进制流数据（最常见的文件下载）。
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

		// 方法3

		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.OK);
	}
	


}
