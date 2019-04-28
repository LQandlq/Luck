<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*,com.moment.pic.domain.*,java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>聊天室</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${path}/resources/user/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/user/chatroom/css/style.css">
    <link rel="stylesheet" href="${path}/resources/user/chatroom/css/style1.css" />
    <link rel="stylesheet" href="${path}/resources/user/chatroom/css/Lobibox.min.css"/>
	
	<style type="text/css">
		.meg{
			max-width: 1000px;
		}
		.container{
		width: 1270px;
		height: 660px;
		}
	</style>
	
</head>
<body>
<%UserVO user= (UserVO)session.getAttribute("user");%>
<input type="hidden" class="userid" value="<%=user.getId()%>">
<input type="hidden" class="userimg" value="<%=user.getImg()%>">
<input type="hidden" class="username" value="<%=user.getAccount()%>">
<c:if test="${reserve!=null}">
	<input type="hidden" class="reservie" value="${reserve}">
</c:if>
    <div class="wrapper">
        <div class="container">            
            <div class="right">
                <div class="top" style="text-align: center;"><span class="name username" >聊天室</span></div>                                    
                                <!-- <h4 class="card-title box-title">Live Chat</h4> -->
                                <div class="card-content">
                                    <div class="messenger-box" >
                                        <ul style="height:500px; overflow-y:scroll;">
                                                                                                                           
                                        </ul>
										<div class="write">
										    
										    <input type="text" class="sendMessage" />
										  
										    <a href="javascript:;" class="write-link send"  onclick="send()"></a>
										</div>
                                        <!-- <div class="send-mgs write">
                                            <div class="yourmsg">
                                                <input class="form-control" type="text">
                                            </div>
                                            <button class="btn msg-send-btn" onclick="send()">
                                                <i class="pe-7s-paper-plane"> <a href="javascript:;" class="write-link send"></a></i>
                                            </button>
                                        </div> -->
                                    </div><!-- /.messenger-box -->
                                </div>
                           
                        
                
            </div>
        </div>
    </div>
   
   

	 <script src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="${path}/resources/user/js/lobibox.js"></script>
	<script src="${path}/resources/user/js/lobiboxDemo.js"></script>
   <script type="text/javascript">
      
   var sender = $(".sender").text();
   
   //文本框选中后回车触发事件
   $("input").focus(function(){
	   document.onkeydown =cdk; 
	   function cdk(){ 
	       if(event.keyCode ==13){
	    	   send();
	       }
	   }
	 });
    var websocket = null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket = new WebSocket("ws://localhost:8080/moment/websocket/"+$(".username").val()+"&"+$("#userid").val());
    }
    else {
        alert('当前浏览器 Not support websocket')
    }

    //连接发生错误的回调方法
    websocket.onerror = function () {
        setMessageInnerHTML("WebSocket连接发生错误");
    };

    //连接成功建立的回调方法
    websocket.onopen = function () {
      /*   setMessageInnerHTML("WebSocket连接成功"); */
        //alert("WebSocket连接成功");
    }

    //接收到消息的回调方法
    websocket.onmessage = function (event) {
        setMessageInnerHTML(event.data);
    }

    //连接关闭的回调方法
    websocket.onclose =function (e) {
    	  console.log('websocket 断开: ' + e.code + ' ' + e.reason + ' ' + e.wasClean)
    	  console.log(e)
    	}

    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
    window.onbeforeunload = function () {
        closeWebSocket();
    }

    //将消息显示在网页上
    function setMessageInnerHTML(innerHTML) {
    	console.log("收到消息"+innerHTML);
    	console.log("正则："+innerHTML.search("^!#!@!"));
    	if(innerHTML.search("^!#!@!")>=0){
    		//确定是2人聊天后，判断当前页面是否是对应页面
    		var a = location.href;
    	    var b = a.split("/");
    	    var c = b.slice(b.length-1, b.length).toString(String).split(".");
    	     console.log(c.slice(0, 1)=="chatroom");
    	 	var message = innerHTML.substring(5,innerHTML.length-1).split("|");
    		console.log("展示message："+message);
    		//判断当前是否在2人聊天界面不再就打开新页面，在就消息展示
    	     if(c.slice(0, 1)=="userchat"){    	      	   
    	    	//2人聊天
 				//消息展示
    	    		  var li = '<li><div class="msg-received msg-container"> '+
    	            '<div class="avatar">'+
    	            '<img src="'+message[2]+'" alt="">'+
    	            ' <div class="send-time">'+new Date().getHours()+':'+new Date().getMinutes()+'</div></div>'+
    	            	'<div class="msg-box">'+
    	            	'<div class="inner-box">'+
    	            	' <div class="name">'+message[3]+'</div>'+
    	            	'<div class="meg">'+message[0]+
    	            	'</div></div></div></div></li>';
    	            $("ul").append(li);
    	       
    	            //让滚动条在最底部显示最新消息
    	            $('ul')[0].scrollTop =$('ul')[0].scrollHeight;
    	     }else{
    	    	 alert(innerHTML.substring(5,innerHTML.length));
    	    	 window.open('${path}/userchat?touserMessage='+ encodeURIComponent(innerHTML.substring(5,innerHTML.length)),'tag');
    	     }  		
    		
    	}else{
		//群聊 	
    	var message = innerHTML.split("|");
    	console.log(message);
    	console.log(message[0]=="touser");
    	if(message[0]=="toUser"){
    		notify(message);
    	}else{
    		console.log(message);
       	 var li = '<li><div class="msg-received msg-container"> '+
            '<div class="avatar">'+
            '<img src="'+message[2]+'" alt="">'+
            ' <div class="send-time">'+new Date().getHours()+':'+new Date().getMinutes()+'</div></div>'+
            	'<div class="msg-box">'+
            	'<div class="inner-box">'+
            	' <div class="name">'+message[3]+'</div>'+
            	'<div class="meg">'+message[0]+
            	'</div></div></div></div></li>';
            $("ul").append(li);
       
            //让滚动条在最底部显示最新消息
            $('ul')[0].scrollTop =$('ul')[0].scrollHeight;
    	}
   	
    	}
    	
    }
    //关闭WebSocket连接
    function closeWebSocket() {
        websocket.close();
    }

    //发送消息
    function send() {
    	var reserve = $(".reservie").val();
    	console.log(reserve);
    	console.log(typeof(reserve)!="undefined");
    	var message = $('.sendMessage').val();
    	$('.sendMessage').val("");
    	if(message.length>0){ 
    		
    		if((reserve!=null||typeof(reserve)!="undefined")&&reserve!=""){
    			 websocket.send(message+"|"+$(".userid").val()+"|"+$(".userimg").val()+"-"+reserve);
        	}else{   		        	
    		     websocket.send(message+"|"+$(".userid").val()+"|"+$(".userimg").val());   		            	        	
        	}
    		var li = '<li><div class="msg-sent msg-container"> '+
            '<div class="avatar">'+
            '<img src="'+$(".userimg").val()+'" alt="">'+
            ' <div class="send-time">'+new Date().getHours()+':'+new Date().getMinutes()+'</div></div>'+
            	'<div class="msg-box">'+
            	'<div class="inner-box">'+
            	' <div class="name">'+$(".username").text()+'</div>'+
            	'<div class="meg">'+message+
            	'</div></div></div></div><div style="clear:both"></div></li>';
            $("ul").append(li);
            //让滚动条在最底部显示最新消息
            $('ul')[0].scrollTop =$('ul')[0].scrollHeight;
    	}else{
    		alert("请输入内容！");
    	}
    	
    }
    
    function notify(message){
    	 Lobibox.notify('info', {
    		 title: '更新提醒',
  	       img: message[3],
  	       size: 'large',
  	       msg: '<a href="/moment/pic/single?sid='+message[4]+'">'+'你关注的用户:'+message[2]+'更新了新作：</br>'+message[5]+'</a>'
  	   });	 
    }
   
</script>
	
    <!--这行代码可以去掉-->
    <a href="http://www.bootstrapmb.com" style="display:none">bootstrapmb</a>

</body>
</html>
