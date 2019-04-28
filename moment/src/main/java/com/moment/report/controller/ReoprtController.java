package com.moment.report.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.moment.pic.domain.PicEX;
import com.moment.report.domain.ReportVO;
import com.moment.report.service.ReportService;



/** * @author 01fang */
@Controller
@RequestMapping("/report")
public class ReoprtController {
	@Autowired
	private ReportService service;
	
/*	举报按钮/链接
	 * 传入picid值到编辑页面
	@RequestMapping("/reportlist")
	public String reportlist(){
		return "toReport";跳转到举报页面
	}
	
	
	
	通过异步更新操作执行举报操作
	 *在表report中插入举报的具体信息
	@RequestMapping("/doReport")
	public @ResponseBody JsonResult add(ReportVO reportVO) throws Throwable{
		reportVO.setUserid(CurrentUser.getInstance().getUserId());
		if(reportVO.getId()!=null){
			service.update(reportVO);
		}else {
			service.add(reportVO);	
		}
		JsonResult jsonresult=new JsonResult();
		jsonresult.setMsg("举报成功");
		jsonresult.setStatus(1);
		return jsonresult;
	}
	
	
	在后台系统显示举报的具体信息
	@RequestMapping("/deal")
	public String deal(ModelMap map){
		List<ReportVO> list=service.list("%");
		map.addAttribute("list", list);
		return "admin/dealreport";跳转到后台系统页面
		
	}
	删除已经处理的举报
	@RequestMapping("doDelete")
	public String doDelete(Integer id,ModelMap map){
		if(id!=null){
			service.delete(id);
		}
		List<ReportVO> list=service.list("%");
		map.addAttribute("list", list);
	    return "admin/dealreport";
	}
	@RequestMapping("/doSearch")
	public @ResponseBody DataTablesResponse<ReportVO> page(
			@RequestBody DataTablesRequest request) throws Throwable{
		return service.listByPage(request);
		
		
	}*/
	
	@RequestMapping("/selectport")
	public @ResponseBody Map selectport() {
		Map map = new HashMap<>();
		List<PicEX> reports = service.selectreport();
		for (PicEX picEX : reports) {
			int picid = picEX.getId();
			picEX.setCheckbox("<input name=\"\" type=\"checkbox\" data-picid=\"" + picid + "\" value=\"\">");
			picEX.setPicpath("<a href=\"" + picid + "\"><img width=\"210\" class=\"picture-thumb\" src=\""
					+ picEX.getPicpath() + "\"></a>");
			if (picEX.getIspublic().equals("0")) {
				picEX.setIspublic("<span class=\"label label-success radius\">已发布</span>");
				picEX.setOption(
						"<a style=\"text-decoration:none\" onClick=\"picture_stop(this,'10001')\" href=\"javascript:;\" data-picid=\""
								+ picid
								+ "\" title=\"下架\"><i class=\"Hui-iconfont\">&#xe6de;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"picture_del(this,'10001')\" href=\"javascript:;\" data-picid=\""
								+ picid + "\" title=\"删除\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>");
			} else {
				picEX.setIspublic("<span class=\"label label-defaunt radius\">已下架</span>");
				picEX.setOption(
						"<a style=\"text-decoration:none\" onClick=\"picture_start(this,id)\" href=\"javascript:;\" data-picid=\""
								+ picid
								+ "\" title=\"发布\"><i class=\"Hui-iconfont\">&#xe603;</i></a> <a style=\"text-decoration:none\" class=\"ml-5\" onClick=\"picture_del(this,'10001')\" href=\"javascript:;\" data-picid=\""
								+ picid + "\" title=\"删除\"><i class=\"Hui-iconfont\">&#xe6e2;</i></a>");
			}
		}
		map.put("data", reports);
		return map;
	}
	//修改作品举报记录
	@RequestMapping("/updaterport")
	public @ResponseBody int updaterport(String sid,String state){
		ReportVO r = new ReportVO();
		int rs= 0;	
		r.setPicid(Integer.parseInt(sid));
		if(state.equals("下架")) {
			r.setId(1);
			r.setState("已下架");
		}else {
			r.setId(0);
			r.setState("已发布");
		}
		int r1 = service.updatereportpic(r);
		int r2 = service.updatereportpicstate(r);
		System.out.println(r1+":"+r2);
		if(r1!=0&&r2!=0) {
			rs=1;
		}
		return rs;		
	}
	
	//提交举报信息
	@RequestMapping("/addreport")
	public @ResponseBody int addreport(ReportVO r){
		
		return service.addreport(r);
		
	}
	

}
