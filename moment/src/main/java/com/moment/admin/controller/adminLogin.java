package com.moment.admin.controller;



import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moment.admin.domain.AdminVO;
import com.moment.admin.service.adminService;
import com.moment.comment.domain.CommentVO;
import com.moment.comment.service.CommentService;
import com.moment.pic.domain.GenreVO;
import com.moment.pic.domain.PicEX;
import com.moment.pic.service.PicService;
import com.moment.user.domain.UserVO;
import com.moment.user.service.UserService;

/** * @author 01fang */
@Controller
@RequestMapping("/admin")
public class adminLogin {
@Autowired	
private adminService service;
	@Autowired
	private UserService userservice;
	@Autowired
	private PicService picservice;
	@Autowired
	private CommentService commentservice;


	@RequestMapping("/login")
   public String toLogin(){
	   return "admin/login";
   }
	@RequestMapping("/admin")
	   public String admin(){
		   return "admin/admin";
	   }
	@RequestMapping("/index")
	public String index(){
		return "admin/index";
	}
	@RequestMapping("/home")
	public String home(){
		return "admin/home";
	}
	@RequestMapping("/adminimg")
	public String adminimg(){
		return "admin/adminimg";
	}
	@RequestMapping("/adminuser")
	public String adminuser(){
		return "admin/adminuser";

	}
	

	@RequestMapping("/admincate")
	public String admincate(){
		return "admin/admincate";
	}
	
	@RequestMapping("/adminreport")
	public String adminreport(){
		return "admin/adminreport";
	}

	// 新后台模板
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
	}

	// 首页
	@RequestMapping("/admin1")
	public String admin1() {
		return "admin1/adminIndex";
	}

	// 欢迎页面
	@RequestMapping("/adminwelcome")
	public String adminwelcome() {
		return "admin1/welcome";
	}

	// 举报页面
	@RequestMapping("/adminrepot")
	public String adminrepot() {
		return "admin1/picture-reportlist";
	}

	// 用户列表
	@RequestMapping("/adminuserlist")
	public String adminuserlist() {
		return "admin1/member-list";
	}

	// 图片列表
	@RequestMapping("/adminpic")
	public String adminpic() {
		return "admin1/picture-list";
	}

	// 评论列表
	@RequestMapping("/admincomment")
	public String admincomment(int picid, Map map) {
		map.put("picid", picid);
		return "admin1/feedback-list";
	}

	// 用户删除界面
	@RequestMapping("/adminuserdelete")
	public String adminuserdelete() {
		return "admin1/member-del";
	}

	// 用户信息修改和添加用户界面
	@RequestMapping("/adminuserinfo")
	public String adminuserinfo(String userid, Map map) {
		try {
			if (userid != null) {
			UserVO user = userservice.getUserById(Integer.parseInt(userid));
			map.put("userinfo", user);
			}
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "admin1/member-add";
	}

	// 用户密码修改界面
	@RequestMapping("/changeuserpassword")
	public String changeuserpassword(String userid, Map map) {
		map.put("userid", userid);
		return "admin1/change-password";
	}

	// 分类管理页面
	@RequestMapping("/admincategory")
	public String admincategory() {
		return "admin1/product-category";
	}

	@RequestMapping("/dologin")
 	public String login(String name,String password,ModelMap map,HttpSession session) throws Exception{
		AdminVO adminvo=service.checkLogin(name, password);
 		if(adminvo!=null){
 			session.setAttribute("admin",adminvo);
			return "redirect:admin1";
 		}
		return "redirect:login.action";
 	}
	
	//检索出带是否点赞标记的所有作品列表
			@RequestMapping("/getuserlist")
	public @ResponseBody List<UserVO> getPicList1(HttpSession session, String account, Map map) {
				List<UserVO> userList = null ;
				UserVO  user = (UserVO) session.getAttribute("user");
				UserVO  user1 = new UserVO();
				if(account!=null&&!account.equals("")) {
					user1.setAccount(account);
				}
				try {
					userList = service.selectuseradmin(user1) ;
				} catch (Throwable e) {
					e.printStackTrace();
				}
				//System.out.println("plclist: "+picList);
				return userList;
			}

	// 获取用户列表
	@RequestMapping("/getuserlistnew")
	@ResponseBody
	public Map getPicListnew(HttpSession session, String account) {
		Map map = new HashMap<>();
		List<UserVO> userList = null;
		UserVO user = (UserVO) session.getAttribute("user");
		UserVO user1 = new UserVO();
		if (account != null && !account.equals("")) {
			user1.setAccount(account);
		}
		try {
			userList = service.selectuseradmin(user1);
			// 格式化时间
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			for (int i = 0; i < userList.size(); i++) {
				String icon = null;
				String mes = null;
				if (userList.get(i).getScore() == 1) {
					// 启用按钮
					icon = "<a style=\"text-decoration:none\" onClick=\"member_start(this,id)\" data-userid='"
							+ userList.get(i).getId()
							+ "' href=\"javascript:;\" title=\"启用\"><i class=\"Hui-iconfont\">&#xe6e1;</i></a>";
					mes = "<span class=\"label label-defaunt radius\">已停用</span>";
				} else {
					// 停用按钮
					icon = "<a style=\"text-decoration:none\" onClick=\"member_stop(this,'10001')\" data-userid='"
							+ userList.get(i).getId()
							+ "' href=\"javascript:;\" title=\"停用\"><i class=\"Hui-iconfont\">&#xe631;</i></a>";
					mes = "<span class=\"label label-success radius\">已启用</span>";

				}

				userList.get(i)
						.setPassword(
								"<input type=\"checkbox\" value=\"" + userList.get(i).getId() + "\" name=\"user\">");
				userList.get(i).setSalt(mes);
				userList.get(i).setImg(
						icon + "<a title=\"编辑\" href=\"javascript:;\" onclick=\"member_edit('编辑','/moment/admin/adminuserinfo?userid="
								+ userList.get(i).getId()
								+ "','4','','510')\" class=\"ml-5\" style=\"text-decoration:none\"><i class=\"Hui-iconfont\">&#xe6df;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"change_password('修改密码','/moment/admin/changeuserpassword?userid="
								+ userList.get(i).getId()
								+ "','10001','600','270')\" href=\"javascript:;\" title=\"修改密码\"><i class=\"Hui-iconfont\">&#xe63f;</i></a> <a title=\"删除\" href=\"javascript:;\" data-userid=\""
								+ userList.get(i).getId()
								+ "\" onclick=\"member_del(this,'1')\" class=\"ml-5\" style=\"text-decoration:none\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>");
			}
		} catch (Throwable e) {
			e.printStackTrace();
		}
		// System.out.println("plclist: "+picList);
		map.put("data", userList);
		return map;
	}

	// 更新用户信息
	@RequestMapping("/updateUserInfo")
	@ResponseBody
	public int updateUserInfo(UserVO user) {
		System.out.println("接收用户更行：" + user);
		try {
			userservice.updateUser(user);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	// 删除用户BY ID
	@RequestMapping("/deleteuserbyID")
	@ResponseBody
	public int deleteuserbyID(Integer id) {
		System.out.println("接收用户更行：" + id);
		Integer[] idlist = new Integer[] { id };
		boolean deleteuserList = service.deleteuserList(idlist);
		System.out.println(deleteuserList);
		if (deleteuserList)
			return 0;
		else
			return -1;
	}

	// 批量删除用户
	@RequestMapping("/deleteuserlist")
	@ResponseBody
	public int deleteuser(@RequestParam("idlist[]") Integer[] idlist) {
		System.out.println("接收用户更行：" + Arrays.toString(idlist));
		boolean deleteuserList = service.deleteuserList(idlist);
		System.out.println(deleteuserList);
		if (deleteuserList)
			return 0;
		else
			return -1;
	}

	// 批量假删除用户
	@RequestMapping("/fakedeleteuserlist")
	@ResponseBody
	public int fakedeleteuser(@RequestParam("idlist[]") Integer[] idlist) {
		System.out.println("接收用户更行：" + Arrays.toString(idlist));
		boolean deleteuserList = service.fakedeleteuserList(idlist);
		System.out.println(deleteuserList);
		if (deleteuserList)
			return 0;
		else
			return -1;
	}

	// 获取假删除用户列表
	@RequestMapping("/getfakedeleteuserlist")
	@ResponseBody
	public Map getfakedeleteuserlist(HttpSession session, String account) {
		Map map = new HashMap<>();
		try {
			List<UserVO> userlist = service.selectfakedeleteuser();
			for (int i = 0; i < userlist.size(); i++) {
				int userid =userlist.get(i).getId();
				userlist.get(i).setPassword(
						"<input type=\"checkbox\" value=\"" + userlist.get(i).getId() + "\" name=\"user\">");
				userlist.get(i).setSalt("<span class=\"label label-danger radius\">已删除</span>");
				userlist.get(i).setImg(
						"<a style=\"text-decoration:none\" href=\"javascript:;\" onClick=\"member_huanyuan(this,'1')\" data-userid="
								+ userid
								+ " title=\"还原\"><i class=\"Hui-iconfont\">&#xe66b;</i></a> <a title=\"删除\" data-userid="
								+ userid
								+ " href=\"javascript:;\" onclick=\"member_del(this,'1')\" class=\"ml-5\" style=\"text-decoration:none\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>");
			}
			map.put("data", userlist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	// 还原用户
	@RequestMapping("/allowuser")
	@ResponseBody
	public int allowuser(Integer id) {
		System.out.println("接收用户更行：" + id);
		int allowuser = service.allowuser(id);
		if (allowuser > 0)
			return 0;
		else
			return -1;
	}

	// 获取所有图片
	@RequestMapping("/getpiclist")
	@ResponseBody
	public Map getpiclit() {
		Map map = new HashMap<>();
		List<PicEX> selectallpic = service.selectallpic();
		for (int i = 0; i < selectallpic.size(); i++) {
			PicEX picEX = selectallpic.get(i);
			int picid = picEX.getId();

			picEX.setCheckbox("<input name=\"\" type=\"checkbox\" data-picid=\"" + picid + "\" value=\"\">");
			picEX.setPicpath("<a href=\"" + picid
					+ "\"><img width=\"210\" class=\"picture-thumb\" src=\"" + picEX.getPicpath() + "\"></a>");
			if (picEX.getIspublic().equals("0")) {
				picEX.setIspublic("<span class=\"label label-success radius\">已发布</span>");
				picEX.setOption(
						"<a style=\"text-decoration:none\" onClick=\"picture_stop(this,'10001')\" href=\"javascript:;\" data-picid=\""
								+ picid
								+ "\" title=\"下架\"><i class=\"Hui-iconfont\">&#xe6de;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"picture_edit('评论管理','/moment/admin/admincomment?picid="
								+ picid
								+ "','10001')\" href=\"javascript:;\" title=\"评论管理\"><i class=\"Hui-iconfont\">&#xe6df;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"picture_del(this,'10001')\" href=\"javascript:;\" data-picid=\""
								+ picid + "\" title=\"删除\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>");
			} else {
				picEX.setIspublic("<span class=\"label label-defaunt radius\">已下架</span>");
				picEX.setOption(
						"<a style=\"text-decoration:none\" onClick=\"picture_start(this,id)\" href=\"javascript:;\" data-picid=\""
								+ picid
								+ "\" title=\"发布\"><i class=\"Hui-iconfont\">&#xe603;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"picture_edit('评论管理','/moment/admin/admincomment?picid="
								+ picid
								+ "','10001')\" href=\"javascript:;\" title=\"评论管理\"><i class=\"Hui-iconfont\">&#xe6df;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"picture_del(this,'10001')\" href=\"javascript:;\" data-picid=\""
								+ picid + "\" title=\"删除\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>");
			}
		}
		map.put("data", selectallpic);
		return map;
	}

	// 下架图片
	@RequestMapping("/updatepicstate")
	@ResponseBody
	public int updatepicstate(String idlist, String del, String ispublic) {
		Map map = new HashMap<>();
		String[] ids = idlist.split(",");
		int[] result = new int[ids.length];// int类型数组
		for (int i = 0; i < ids.length; i++) {
			result[i] = Integer.parseInt(ids[i]);// 整数数组
		}
		map.put("array", result);
		map.put("del", del);
		map.put("ispublic", ispublic);
		int rs = service.updatepicstate(map);
		return rs;
	}

	// 图片删除(批量单个同时)
	@RequestMapping("/deletepic")
	@ResponseBody
	public int deletepic(String idlist, String del, String ispublic) {
		String[] ids = idlist.split(",");
		for (int i = 0; i < ids.length; i++) {
			try {
				picservice.deletePic(Integer.parseInt(ids[i]));
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;

	}

	// 获取评论列表
	@RequestMapping("/getCommentlist")
	@ResponseBody
	public Map getCommentlist(String picid) {
		Map map = new HashMap<>();
		List<CommentVO> remarks = commentservice.selectremark(Integer.parseInt(picid));
		for (CommentVO commentVO : remarks) {
			commentVO.setCheckbox("<input type=\"checkbox\" data-commentid=\"" + commentVO.getId() + "\" name=\"\">");
			commentVO.setUserimg(
					"<i class=\"avatar size-L radius\"><img alt=\"\" src=\"" + commentVO.getUserimg() + "\"></i>");
			commentVO.setOption(
					"<a title=\"禁止登陆\" href=\"javascript:;\" onclick=\"member_banlog(this,'1')\" data-userid=\""
							+ commentVO.getUserid()
							+ "\" style=\"text-decoration:none\"><i class=\"Hui-iconfont\">&#xe6df;</i></a> <a title=\"删除\" href=\"javascript:;\" data-commentid=\""
							+ commentVO.getId()
							+ "\" onclick=\"member_del(this,'1')\" class=\"ml-5\" style=\"text-decoration:none\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>");
		}
		map.put("data", remarks);
		return map;
	}

	// 获取分类列表
	@RequestMapping("/getcategory")
	@ResponseBody
	public Map getcategory() {
		Map map = new HashMap<>();
		try {
			List<GenreVO> category = picservice.selectgenre();
			for (GenreVO genreVO : category) {
				genreVO.setCheckbox(
						"<input name=\"catecheckbox\" type=\"checkbox\" value=\"" + genreVO.getId() + "\">");
				if (genreVO.getState() == 0) {
					genreVO.setTablestate("<span class=\"label label-success radius\">已启用</span>");
					genreVO.setOption(
							"<a style=\"text-decoration:none\" onClick=\"cate_stop(this,id)\" href=\"javascript:;\" data-cateid=\""
									+ genreVO.getId()
									+ "\" title=\"停用\"><i class=\"Hui-iconfont\">&#xe631;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"active_del(this,'10001')\" href=\"javascript:;\" data-cateid=\""
									+ genreVO.getId() + "\" title=\"删除\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>");

				} else {
					genreVO.setOption("<a style=\"text-decoration:none\" onClick=\"cate_start(this,id)\" data-cateid=\""
							+ genreVO.getId()
							+ "\" href=\"javascript:;\" title=\"启用\"><i class=\"Hui-iconfont\">&#xe6e1;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"active_del(this,'10001')\" href=\"javascript:;\" "
							+ "data-cateid=\"" + genreVO.getId()
							+ "\" title=\"删除\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>");
					genreVO.setTablestate("<span class=\"label label-defaunt radius\">已停用</span>");
				}

			}
			map.put("data", category);
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}

	// 删除分类
	@RequestMapping("/delcategory")
	@ResponseBody
	public int delcategory(String idlist) {
		System.out.println("idlist:" + idlist);
		String[] ids = idlist.split(",");
		int rs = 0;
		try {
			for (int i = 0; i < ids.length; i++) {
				rs = picservice.deletegenre(Integer.parseInt(ids[i]));
			}
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	// 修改分类
	@RequestMapping("/upcategory")
	@ResponseBody
	public int upcategory(String idlist, String state) {
		Map map = new HashMap<>();
		String[] split = idlist.split(",");
		int[] result = new int[split.length];// int类型数组
		for (int i = 0; i < split.length; i++) {
			result[i] = Integer.parseInt(split[i]);// 整数数组
		}
		map.put("array", result);
		map.put("state", Integer.parseInt(state));
		return service.upcategory(map);
	}

	// 根据名字查询分类
	@RequestMapping("/findcateByName")
	@ResponseBody
	public int findcateByName(String catename, HttpServletResponse response) {
		response.setHeader("Content-type", "text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		int rr = 0;
		int rs = 0;
		try {
			rr = service.selectcateByName(catename);
			if (rr == 0) {
				picservice.insertgenre(catename);
			}
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rr;
	}

}
