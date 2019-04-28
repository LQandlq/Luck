<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.moment.user.domain.*,com.moment.pic.domain.*,java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>个人聊天室</title>
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${path}/resources/user/chatroom/css/reset.min.css">
	<link rel="stylesheet"
	href="${path}/resources/user/chatroom/css/styleTest.css">
	<style type="text/css">
	body{overflow: hidden;}
		.container{
			width: 1200px;
		}
		.container .left{
			width: 300px;
		}
		.text{
			width: 90%;
		}
		.contant{height: 98%; }
		.left ul{
			height:600px;
			overflow-y:scroll;
			overflow-x:hidden;
		}
		.left ul::-webkit-scrollbar {display:none}
		.right ul{height: 98%;
			overflow-y:scroll;
			overflow-x:hidden;
		}
		.right ul>li{
		margin-right: 10px;
		}
		/* 滚动条隐藏 */
		.right ul::-webkit-scrollbar {display:none}
		
/*关闭按钮  */
.container .left .people .person .clossicon{
			float:left;
    		width: 15px; 
    		height: 15px;
    		position: absolute;
    		left: 5px;
    		top: 25px;
    		visibility: hidden;
    	}
    	.container .left .top{
    	padding: 15px 0px;
    	text-align: center;
    	height: 46px;
    	align-content: center;
    	background-color: #eceff1;
    	}
	</style>

</head>
	<body>
	<input type="text" class="pre" value="">
	<input type="hidden" class="userid" value="${sessionScope.user.id}">
	<input type="hidden" class="userimg" value="${sessionScope.user.img}">
	<input type="hidden" class="username" value="${sessionScope.user.account}">
    <div class="wrapper">
        <div class="container">
            <div class="left">
                 <div class="top">
                    <!-- <input type="text" placeholder="Search" />
                    <a href="javascript:;" class="search"></a> -->
                    <h3 style="">聊天列表</h3>
                </div> 
                <ul class="people">
                   <%--  <li class="person" data-chat="person1">
                        <img src="${touserMessage[2]}" alt="" />
                        <span class="name">${touserMessage[3]}</span>
                        <span class="time">2:09 PM</span>
                        <span class="preview">${touserMessage[0]}</span>
                    </li>               
                    <li class="person" data-chat="person2">
                     <img src="${path}/resources/user/img/closs.png" class="clossicon" />
                        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/dog.png" alt="" />
                        <span class="name">Dog Woofson</span>
                        <span class="time">1:44 PM</span>
                        <span class="preview">I've forgotten how it felt before</span>
                    </li>
                    <li class="person" data-chat="person3">
                        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/louis-ck.jpeg" alt="" />
                        <span class="name">Louis CK</span>
                        <span class="time">2:09 PM</span>
                        <span class="preview">But we’re probably gonna need a new carpet.</span>
                    </li>
                    <li class="person" data-chat="person4">
                        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/bo-jackson.jpg" alt="" />
                        <span class="name">Bo Jackson</span>
                        <span class="time">2:09 PM</span>
                        <span class="preview">It’s not that bad...</span>
                    </li>
                    <li class="person" data-chat="person5">
                        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/michael-jordan.jpg" alt="" />
                        <span class="name">Michael Jordan</span>
                        <span class="time">2:09 PM</span>
                        <span class="preview">
                            Wasup for the third time like is
                            you blind bitch
                        </span>
                    </li>
                    <li class="person" data-chat="person6">
                        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/382994/drake.jpg" alt="" />
                        <span class="name">Drake</span>
                        <span class="time">2:09 PM</span>
                        <span class="preview">howdoyoudoaspace</span>
                    </li>--%> 
                </ul>
            </div>
            <div class="right" >
                <div class="top"><span>To: <span class="nameTop"></span></span></div>
               <!--  <div class="chat" data-chat="person1">                                           
                    <div class="bubble you">
                      	adfasfasdf
                    </div>                   
                </div> -->
                <div class="chat" data-chat="person2">
                    <div class="conversation-start">
                        <span>Today, 5:38 PM</span>
                    </div>
                    <div class="bubble you">
                        Hello, can you hear me?
                    </div>
                    <div class="bubble you">
                        I'm in California dreaming
                    </div>
                    <div class="bubble me">
                        ... about who we used to be.
                    </div>
                    <div class="bubble me">
                        Are you serious?
                    </div>
                    <div class="bubble you">
                        When we were younger and free...
                    </div>
                    <div class="bubble you">
                        I've forgotten how it felt before
                    </div>
                    <div class="bubble you">
                        Hello, can you hear me?
                    </div>
                    <div class="bubble you">
                        I'm in California dreaming
                    </div>
                    <div class="bubble me">
                        ... about who we used to be.
                    </div>
                    <div class="bubble me">
                        Are you serious?
                    </div>
                    <div class="bubble you">
                        When we were younger and free...
                    </div>
                    <div class="bubble you">
                        I've forgotten how it felt before
                    </div>
                    <div class="bubble you">
                        Hello, can you hear me?
                    </div>
                    <div class="bubble you">
                        I'm in California dreaming
                    </div>
                    <div class="bubble me">
                        ... about who we used to be.
                    </div>
                    <div class="bubble me">
                        Are you serious?
                    </div>
                    <div class="bubble you">
                        When we were younger and free...
                    </div>
                    <div class="bubble you">
                        I've forgotten how it felt before
                    </div>
                    <div class="bubble you">
                        Hello, can you hear me?
                    </div>
                    <div class="bubble you">
                        I'm in California dreaming
                    </div>
                    <div class="bubble me">
                        ... about who we used to be.
                    </div>
                    <div class="bubble me">
                        Are you serious?
                    </div>
                    <div class="bubble you">
                        When we were younger and free...
                    </div>
                    <div class="bubble you">
                        I've forgotten how it felt before
                    </div>
                    <div class="bubble you">
                        Hello, can you hear me?
                    </div>
                    <div class="bubble you">
                        I'm in California dreaming
                    </div>
                    <div class="bubble me">
                        ... about who we used to be.
                    </div>
                    <div class="bubble me">
                        Are you serious?
                    </div>
                    <div class="bubble you">
                        When we were younger and free...
                    </div>
                    <div class="bubble you">
                        I've forgotten how it felt before
                    </div>
                </div>
                <div class="chat" data-chat="person3">
                    <div class="conversation-start">
                        <span>Today, 3:38 AM</span>
                    </div>
                    <div class="bubble you">
                        Hey human!
                    </div>
                    <div class="bubble you">
                        Umm... Someone took a shit in the hallway.
                    </div>
                    <div class="bubble me">
                        ... what.
                    </div>
                    <div class="bubble me">
                        Are you serious?
                    </div>
                    <div class="bubble you">
                        I mean...
                    </div>
                    <div class="bubble you">
                        It’s not that bad...
                    </div>
                    <div class="bubble you">
                        But we’re probably gonna need a new carpet.
                    </div>
                </div>
                <div class="chat" data-chat="person4">
                    <div class="conversation-start">
                        <span>Yesterday, 4:20 PM</span>
                    </div>
                    <div class="bubble me">
                        Hey human!
                    </div>
                    <div class="bubble me">
                        Umm... Someone took a shit in the hallway.
                    </div>
                    <div class="bubble you">
                        ... what.
                    </div>
                    <div class="bubble you">
                        Are you serious?
                    </div>
                    <div class="bubble me">
                        I mean...
                    </div>
                    <div class="bubble me">
                        It’s not that bad...
                    </div>
                </div>
                <div class="chat" data-chat="person5">
                    <div class="conversation-start">
                        <span>Today, 6:28 AM</span>
                    </div>
                    <div class="bubble you">
                        Wasup
                    </div>
                    <div class="bubble you">
                        Wasup
                    </div>
                    <div class="bubble you">
                        Wasup for the third time like is <br />you blind bitch
                    </div>
                </div>
                <div class="chat" data-chat="person6">
                    <div class="conversation-start">
                        <span>Monday, 1:27 PM</span>
                    </div>
                    <div class="bubble you">
                        So, how's your new phone?
                    </div>
                    <div class="bubble you">
                        You finally have a smartphone :D
                    </div>
                    <div class="bubble me">
                        Drake?
                    </div>
                    <div class="bubble me">
                        Why aren't you answering?
                    </div>
                    <div class="bubble you">
                        howdoyoudoaspace
                    </div>
                </div>
                <div class="write" >
                    <a href="javascript:;" class="write-link attach"></a>
                    <input type="text" id="messageinput" style="width: 89%;" />
                    <a href="javascript:;" class="write-link smiley"></a>
                    <a href="javascript:;" class="write-link send" onclick="send()"></a>
                </div>
            </div>
        </div>
    </div>


	<script src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<script
		src="${path}/resources/user/chatroom/js/chatChoose.js"></script>
		<script type="text/javascript">
		//文本框选中后回车触发事件
		   $("input").focus(function(){
			   document.onkeydown =cdk; 
			   function cdk(){ 
			       if(event.keyCode ==13){
			    	   send();
			       }
			   }
			 });
		//socket连接处理
		var websocket = null;
	    //判断当前浏览器是否支持WebSocket
	    if ('WebSocket' in window) {
	    	var para =$(".userid").val()+"&"+$(".userimg").val()+"&"+$(".username").val();
	    	var img= $(".userimg").val().split("/");
	    	console.log("img:"+img);
	        websocket = new WebSocket("ws://localhost:8080/moment/pictouser/"+$(".userid").val()+"&"+$(".username").val()+"&"+img[4]);
	    }
	    else {
	        //alert('当前浏览器 Not support websocket')
	    }

	    //连接发生错误的回调方法
	    websocket.onerror = function () {
	        setMessageInnerHTML("WebSocket连接发生错误");
	    };

	    //连接成功建立的回调方法
	    websocket.onopen = function () {
	      /*   setMessageInnerHTML("WebSocket连接成功"); */
	        //alert("info连接成功");
	    }

	    //接收到消息的回调方法
	    websocket.onmessage = function (event) {
	        setMessageInnerHTML(event.data);
	    }

	    //连接关闭的回调方法
	    websocket.onclose = function () {
	        //setMessageInnerHTML("WebSocket连接关闭");
	    }

	    //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
	    window.onbeforeunload = function () {
	        closeWebSocket();
	    }
	    //将消息显示在网页上
	    function setMessageInnerHTML(innerHTML) {
	    	//alert("接收到："+innerHTML);
	    	if(innerHTML.search("^!#!@!")>=0){
	    		var mes = innerHTML.substring(5,innerHTML.length).split("|");
	    		//0:消息 1：userid  2:userimg  3:username
	    		console.log(mes);
	    		//去除非呼叫用户高亮
	  			$(".active").removeClass("active");
	  			$(".active-chat").removeClass("active-chat");
	  			console.log("判断用户的状态："+$('li[data-otheruserid='+mes[1]+']').length);
	  			if($('li[data-otheruserid='+mes[1]+']').length>0){
	  			//标亮呼叫用户
		    		$('li[data-otheruserid='+mes[1]+']').addClass("active");
		    		//更新最后一次消息时间
		    		$('li[data-otheruserid='+mes[1]+']').children("span.time").text(new Date().getHours()+':'+new Date().getMinutes());
		    		//更新最后一次消息内容
		    		$('li[data-otheruserid='+mes[1]+']').children("span.preview").text(mes[0]);
		    		$('div[data-chat='+mes[1]+']').addClass("active-chat");
		    		$('div[data-chat='+mes[1]+']').children("ul").append('<li class="bubble you">'+mes[0]+'</li>');
	  			}else{
	  				personlist(mes);
	  				var divmessage = '';
	  				if(mes[0].length>0){
	  					divmessage='<li class="bubble you">'+mes[0]+'</li>';   
	  				}
	  				var contant = '<div class="chat test1 active-chat" data-chat="'+mes[1]+'" ><ul class="messageul editor">'+divmessage+'</ul></div>';
	  				$(".write").before(contant); 
	  			
	  				$.getScript("${path}/resources/user/chatroom/js/chatChoose.js",function(){  //重新加载切换js,成功后，并执行回调函数
	  					  //alert("加载js文件");
	  					  console.log($('[data-otheruserid='+mes[1]+']'));
	  					});
	  			}
	    		
	    	}else{
	    		if(innerHTML.search("^!NoOnline!")>=0){
	    			alert(innerHTML.substring(10,innerHTML.length)+"当前不在线！");
	    		}
	    	} 
	    }
		
	    //消息发送
	    function send(){
	    	var message = $("#messageinput").val();	
	    	if(message.length>0){
	    		$('#messageinput').val("");
		    	websocket.send(message+"|"+$(".userid").val()+"|"+$(".userimg").val()+"-"+$(".active").attr("data-otherusername"));	    	
		    	var divmessage='<li class="bubble me">'+message+'</li>';
		    	$(".active-chat").find("ul").append(divmessage);
		    	 //让滚动条在最底部显示最新消息
		    	 console.log("ulTOP"+$('.active-chat').find("ul")[0].scrollTop);
		    	 console.log("ulheight"+$('.active-chat').find("ul")[0].scrollHeight);
	            $('.active-chat').find("ul")[0].scrollTop =$('.active-chat').find("ul")[0].scrollHeight;
	    	}
	    	
	    }
		</script>
				
<script type="text/javascript">
//消息处理js
var texted=$("pre").val();
//记录用户信息
var list;
//主动点击别人聊天（聊天对象名字，图片）
var chatuser=decodeURIComponent('${chatperson}');
if(chatuser.length>0){
	//alert("主叫事件");
list = chatuser.split("\|");
}

var message=decodeURIComponent('${touserMessage}');
if(message.length>0){
	//alert("被叫事件");
	list = message.split("\|");
	console.log(message);	
			
}
console.log("list:"+list);
console.log($('[data-otheruserid='+list[1]+']'));
//如果左边已经存在此用户了就不创建了 data-chat:记录被叫用户id
if($('[data-chat='+list[1]+']').length==0){
	personlist(list);
}
//添加用户
function personlist(list){
	var person=' <li class="person active" data-chat="'+list[1]+'" data-otherusername="'+list[3]+'" data-otheruserid="'+list[1]+'">'+
	'  <img src="${path}/resources/user/img/closs.png" class="clossicon" /> <img src="'+list[2]+'" alt="" />'+
	' <span class="name">'+list[3]+'</span>'+
	'<span class="time">'+new Date().getHours()+':'+new Date().getMinutes()+'</span>'+
	'<span class="preview">'+list[0]+'</span> </li>';
	$(".people").append(person);
}
	
	//判断是主动和别人联系还是被别人消息唤起界面的
	//如果有需要展示的消息就展示
		var divmessage = '';
		if(list[0].length>0){
			divmessage='<li class="bubble you">'+list[0]+'</li>';   
		}
		var contant = '<div class="chat test1 active-chat" data-chat="'+list[1]+'" ><ul class="messageul editor">'+divmessage+'</ul></div>';
		$(".write").before(contant); 
	
		$.getScript("${path}/resources/user/chatroom/js/chatChoose.js",function(){  //重新加载切换js,成功后，并执行回调函数
			  //alert("加载js文件");
			  console.log($('[data-otheruserid='+list[1]+']'));
			});
		//关闭按钮显示事件
		$(".person").hover(
			    function(){
			    	//alert("你进入了 p1!");
			    	$(this).find(".clossicon").css("visibility","visible");    
			    },
			    function(){
			    	$(this).find(".clossicon").css("visibility","hidden"); 
			    }
			);
		//关闭按钮点击事件
		$(".clossicon").on('click',function(){
			alert($(this).parent().attr("data-chat"));
			var e = $(this).parent().attr("data-chat");	
			$('[data-chat='+e+']').remove();	
			$.getScript("${path}/resources/user/chatroom/js/chatChoose.js",function(){  //重新加载切换js,成功后，并执行回调函数
				  //alert("加载js文件");
				  console.log($('[data-otheruserid='+list[1]+']'));
				});
			$(".people").children().first().addClass("active");
			var mesli = $(".people").children().first().attr("data-chat");
			$('[data-chat='+mesli+']').addClass("active-chat"); 
		});

</script>
	<!--这行代码可以去掉-->
	<a href="http://www.bootstrapmb.com" style="display: none">bootstrapmb</a>

</body>
</html>
