//校验文件上传不能为空
$("body").on('click','.uploadbtn',function(){
	if($("#firstname").val()==""){
		alert("标题不能为空！");
		return false;
	}
	if($("[name='description']").val()==""){
		alert("描述不能为空！");
		/*alert($(".file-preview-frame").children().length);*/
		return false;
	}
	if($(".file-preview-frame").children().length==0){
		alert("请选择自己要上传的作品！");
		return false;
	}	
});

//文本框选中后回车触发事件
	   $(".sendMessage").focus(function(){
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
	    	var img= $(".userimg").val().split("/");
	        websocket = new WebSocket("ws://localhost:8080/moment/pictouser/"+$(".userid").val()+"&"+$(".username").val()+"&"+img[4]);
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
	        /*alert("info连接成功");*/
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
	    	/*alert("接收到消息："+innerHTML);*/
	    	if(innerHTML.search("^!#!@!")>=0){
	    		//用户聊天
	    		if(confirm("有用户找你聊天！")){
	    			window.open('//localhost:8080/moment/userchat?touserMessage='+ encodeURIComponent(innerHTML.substring(5,innerHTML.length)),'tag');
	    		}
   	    	 
	    	}else{
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
	        var message = $('.sendMessage').val();
	        $('.sendMessage').val("");
	        websocket.send(message+"|"+$(".userid").val()+"|"+$(".userimg").val());
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
	    }
	    function notify(message){
	    	 Lobibox.notify('info', {
	    		 title: '更新提醒',
	  	       img: message[3],
	  	       size: 'large',
	  	       msg: '你关注的:'+message[2]+'更新了新作:'+message[5]
	  	   });
	    	 $("body").on('click','.lobibox-notify',function(){
	    		 	window.location.href='/moment/pic/single?sid='+message[4];
	    		 });
	    	 
	    }
	   
	    var hiddenProperty = 'hidden' in document ? 'hidden' :    
            'webkitHidden' in document ? 'webkitHidden' :    
            'mozHidden' in document ? 'mozHidden' :    
            null;
        var visibilityChangeEvent = hiddenProperty.replace(/hidden/i, 'visibilitychange');
        var onVisibilityChange = function(){
        	 websocket = new WebSocket("ws://localhost:8080/moment/pictouser/"+$(".userid").val()+"&"+$(".username").val()+"&"+img[4]);
            if (!document[hiddenProperty]) {    
                console.log('页面非激活');
            }else{
            	console.log('页面激活');
            	
            }
        }
        document.addEventListener(visibilityChangeEvent, onVisibilityChange);
        
        
   //搜索触发事件
        $("#img2").on('click',function(){
         	/*alert("go");*/
         	if($("#sou_input").val()!=""){
         		$('#smallfind').submit();
         	}else{
         		alert("请输入搜索内容！");
         	}                    	
         }); 
	   