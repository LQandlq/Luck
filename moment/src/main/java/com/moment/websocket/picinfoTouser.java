package com.moment.websocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import com.moment.user.domain.UserVO;

@Service
@ServerEndpoint(value = "/pictouser/{sender}")
public class picinfoTouser {	
	//用于转发数据(sendTo)
    private SimpMessagingTemplate template;   
    
  //静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
  	private static int onlineCount = 0;

  	//concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。若要实现服务端与单一客户端通信的话，可以使用Map来存放，其中Key可以为用户标识
  	private static CopyOnWriteArraySet<picinfoTouser> webSocketSet = new CopyOnWriteArraySet<picinfoTouser>();

  	//与某个客户端的连接会话，需要通过它来给客户端发送数据
  	private Session session;
  	
  	private String sender;
  	
  	private String userid;
  	
  	private String userimg;
  	
  	private static Map<String, Object> routeTable = new HashMap<>();
  	
  	/**
	 * 连接建立成功调用的方法
	 * @param session  可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
	 */
	@OnOpen
	public void onOpen(@PathParam(value = "sender") String sender,Session session){
		System.out.println("当前是消息通知socket:"+sender);
		this.session = session;
		//第一个为用户名第二个为userid
		String[] split = sender.split("&");
		this.userid = split[0];
		this.userimg = "/picture/" + split[1] + "/icon/" + split[2];
		this.sender = split[1];
		System.out.println("接收到的用户头像：" + userimg);
		if (!routeTable.containsKey(this.sender)) {
			routeTable.put(this.sender, this);
			addOnlineCount(); // 在线数加1
			System.out.println("当前加入用户name为：" + this.sender);
			System.out.println("当前加入用户session为：" + session);
			System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
		} else {
			routeTable.put(this.sender, this);
			System.out.println("你已加入");
			System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
		}

	}

	/**
	 * 连接关闭调用的方法
	 */
	@OnClose
	public void onClose(){
		routeTable.remove(sender);
		//webSocketSet.remove(this);  //从set中删除
		subOnlineCount();           //在线数减1
		System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
	}

	/**
	 * 收到客户端消息后调用的方法
	 * @param message 客户端发送过来的消息
	 * @param session 可选的参数
	 */
	@OnMessage
	public void onMessage(String message, List<UserVO> users){
		System.out.println("（通知socket）来自客户端的消息:" + message);
		System.out.println("（通知socket）sender:" + sender);
		boolean flag = false;
		//遍历map将消息发给除开消息作者的所有用户
		if(users==null) {
			String[] touser = message.split("-");
		//System.out.println(touser[0]+":"+touser[1]);
		//System.out.println(touser[0]+":"+touser[1]);

		for (Map.Entry<String, Object> entry : routeTable.entrySet()) {
					try {
					if (touser.length > 1) {
							if(entry.getKey().equals(touser[1])) {
								System.out.println("发消息给指定用户:"+touser[0]+":"+touser[1]);
							flag = true;
								//!#!@!作为标识符前端接收到字符串后判断前面是否有这个字符，有则是单对单聊天否则是群聊
								((picinfoTouser) entry.getValue()).sendMessage("!#!@!"+touser[0]+"|"+sender);
						}

						}
														
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		    }
			if (!flag) {
				try {
					((picinfoTouser) routeTable.get(sender)).sendMessage("!NoOnline!" + touser[1]);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}else {
			System.out.println("进入通知");
			for (UserVO user : users) {
				String username=routeTable.containsKey(user.getAccount())?user.getAccount():null;
				try {
					if(username!=null)
					//将消息发给在线的用户
					((picinfoTouser) routeTable.get(username)).sendMessage("toUser|"+message);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	/**
	 * 发生错误时调用
	 * @param session
	 * @param error
	 */
	@OnError
	public void onError(Session session, Throwable error){
		System.out.println("发生错误");
		error.printStackTrace();
	}

	/**
	 * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
	 * @param message
	 * @throws IOException
	 */
	public void sendMessage(String message) throws IOException{
		this.session.getBasicRemote().sendText(message);
		//this.session.getAsyncRemote().sendText(message);
	}

	public static synchronized int getOnlineCount() {
		return onlineCount;
	}

	public static synchronized void addOnlineCount() {
		picinfoTouser.onlineCount++;
	}

	public static synchronized void subOnlineCount() {
		picinfoTouser.onlineCount--;
	}

}
