package com.moment.websocket;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class websocketController {
	@Autowired
	private websocketservice ws;
	
	@RequestMapping("/chatroom")
	public String tochatroom(String otheruser,Map map) {
		map.put("reserve", otheruser);
		System.out.println(otheruser);
		return "user/chatroom";
	}
	
	@RequestMapping("/userchat")
	public String userchat(String reviewer, String touserMessage, Map map, HttpSession session) {
		System.out.println("2人聊天接收消息：" + reviewer);
		//String[] messageinfo = touserMessage.split("\\|");
//		for (String string : messageinfo) {
//			System.out.println(string);
//		}
		// 被叫用户开启页面
		if (touserMessage != null)
			map.put("touserMessage", URLEncoder.encode(touserMessage));
		// 主动点击别人聊天（聊天对象名字，图片）
		if (reviewer != null)
			map.put("chatperson", URLEncoder.encode(reviewer));
		return "user/userchat";
	}
	
	@RequestMapping("/tomcat")
	@ResponseBody
	public String cha() {
		ws.onMessage("tomcat", null);
		return "";
	}

}
