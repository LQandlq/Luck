package com.moment.comment.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moment.common.domain.CurrentUser;
import com.moment.common.domain.JsonResult;
import com.moment.user.domain.UserVO;
import com.moment.user.service.UserService;
import com.moment.user.service.UserServiceImp;
import com.moment.comment.domain.CommentVO;
import com.moment.comment.service.CommentService;

@Controller
@RequestMapping("/pic/comment")
public class CommentController {
	@Autowired
	private UserService userservice;
	@Autowired
	private CommentService service;
	/**
	 * 查看评论
	 * @param id
	 * @param map
	 * @return
	 */
	@RequestMapping("/checkcomment")
	public @ResponseBody List<CommentVO> edit(Integer id){
		List<CommentVO> comment = new ArrayList<CommentVO>(); 
		if(id!=null){
			comment= service.get(id);
		}
		return comment;//跳转到主页面
	}
	
	@RequestMapping("/selectcomment")
	public @ResponseBody List<CommentVO> selectcomment(Integer id){
		List<CommentVO> comment = new ArrayList<CommentVO>(); 
		if(id!=null){
			comment= service.selectremark(id);
		}
		return comment;
	}
	
	
	
	@RequestMapping("/addcomment")
	public @ResponseBody void addcomment(HttpSession session,String context,int commentid,String picid,String fid){
		int rs;
		CommentVO entity = new CommentVO();
	    UserVO user =(UserVO)session.getAttribute("user");
	    entity.setUserid(user.getId());
	    entity.setUsername(user.getName());
	    entity.setUserimg(user.getImg());
	    entity.setContent(context);
	    entity.setCommentid(commentid);
	    entity.setPicid(Integer.parseInt(picid));
	    System.out.println("fid:"+fid);
	    if(fid==null) {
	    	System.out.println("fid=null");
	    	System.out.println(entity.toString());
	    	System.out.println(entity.getGradeid());
	    	System.out.println("返回："+service.add(entity));
	    	entity.setGradeid(entity.getId());
	    }else {
	    	 
	    	 service.add(entity);
	    	 entity.setGradeid(Integer.parseInt(fid));
	    }
	    
	    System.out.println("senc:"+entity.toString());
			//service.add(entity) ;
	    	
		service.add(entity);
		//System.out.println("返回："+entity.getId());
		//return rs;
	}
	
	@RequestMapping("/doEdit")
	public @ResponseBody int  doEdit(Integer picid,String content,Integer userid) throws Throwable{
		CurrentUser user=CurrentUser.getInstance();
		CommentVO commentVo = new CommentVO();
		String userimg =userservice.getUserById(userid).getImg();
		System.out.println("图片id"+picid);
		 commentVo.setUserid(Integer.valueOf(user.getUserId()));
		 commentVo.setUsername(user.getUserName());
		 commentVo.setUserimg(userimg);
		 commentVo.setPicid(picid);
		 commentVo.setContent(content);
		 service.add(commentVo);
		return 1;
	}
	
	@RequestMapping("/dorecomment")
	public @ResponseBody int  dorecomment(Integer picid,String content,Integer userid,Integer commentid,String commentname) throws Throwable{
		CurrentUser user=CurrentUser.getInstance();
		CommentVO commentVo = new CommentVO();
		
		String userimg =userservice.getUserById(userid).getImg();
		 commentVo.setUserid(Integer.valueOf(user.getUserId()));
		 commentVo.setUsername(user.getUserName());
		 commentVo.setUserimg(userimg);
		 commentVo.setPicid(picid);
		 commentVo.setContent(content);
		 commentVo.setCommentid(commentid);
		 commentVo.setCommentname(commentname);
		 service.add(commentVo);
		return 1;
	}
	
	@RequestMapping("/doDelete")
	public @ResponseBody JsonResult doDelete(String id,String picid){
		JsonResult rs=new JsonResult();
		//id 是评论id主键
		System.out.println("id==="+id+":::picid===="+picid);
		if(id!=null){
		service.delete(Integer.parseInt(id),Integer.parseInt(picid));
		rs.setStatus(1);
		rs.setMsg("删除成功！");
		System.out.println("删除成功！");
		}
		return rs;
	}
	
	@RequestMapping("/list")
	public String list(){
		return "demo/list";//跳转到分页查询页面
	}
}
