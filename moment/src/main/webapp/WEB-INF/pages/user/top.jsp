<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*,com.moment.pic.domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>活动页面</title>
    <link href="${path}/resources/user/css/huodong.css" rel="stylesheet">
</head>
<body>
	 <%UserVO user= (UserVO)session.getAttribute("user");%>
	<% List<PicEX> plist =(List<PicEX>)request.getAttribute("top"); %>
<div class="div_bg">
   <div class="header">
    <div class="main">
        <img id="img1" src="${path}/resources/user/images/Looo.png">
        <ul>
        <li><a href="${path}/user/index">首页</a></li>
            <li class="zhaopian"><a href="${path}/pic/piclist">作品
                <!-- 下拉框 -->
                <!-- <div class="zhaopian_xl">
                    <ul>
                        <li><a href="pic_rm.html">热门</a></li>
                        <li><a href="pic_lx.html">流行</a></li>
                        <li><a href="pic_xx.html">新鲜</a></li>
                        <li><a href="pic_fg1.html">风光</a></li>
                        <li><a href="pic_rx.html">人像</a></li>
                        <li><a href="pic_hb.html">黑白</a></li>
                        <li><a href="pic_qt.html">其他</a></li>
                    </ul>
                </div> -->
            </a></li>
            <li><a href="${path}/pic/gettop">排行榜</a></li>
			<li><a href="${path}/chatroom" target="view_window">聊天室</a></li>
           
        </ul>
        <form action="${path}/pic/piclist" id="smallfind">
        <div class="div_sou"><img id="img2" src="${path}/resources/user/images/HD/hd19.png">
            <input id="sou_input" type="text" name="find">
        </div>
        </form>
       <%if(user==null){%>       
       <div class="div_dl"><a href="login.html">登录</a></div>
        <div class="div_zc"><a href="register.html">免费注册</a></div>
        <%} else{%>
        <div style="float: right;">       
        <ul >
            <li class="zhaopian"><a href="person.htm"><%=user.getAccount() %>
                <!-- 下拉框 -->
                <div class="zhaopian_xl" style="height: 160px;">
                    <ul>
                       <li><a href="${path}/user/person">个人中心</a></li>
                        <li><a <%-- href="${path}/user/upload" --%> data-toggle="modal" data-target="#alter">上传作品</a></li>
                         <li><a href="${path}/pic/userfollow?uid=<%=user.getId()%>">我的关注</a></li>
                        <li><a href="${path}/user/logout">注销</a></li>                       
                    </ul>
                </div>
            </a></li>
        </ul>
        </div>
        <%} %>
        
        
    </div>
</div>
    <div class="img4">
        <div class="blank">
        
        <h1>排行榜</h1>
        <p>作品热度排行</p><br>
        
        </div> 

    </div>
    <div class="div_hd">
       <!-- <ul class="ul_hd">
            <li>全部活动</li>
            <li>正在进行</li>
            <li>已经结束</li>
        </ul>-->
        <div class="hr_black" ></div>
       <div style="width: 355px; float: left; margin-right: 30px;">
       	 <div class="div_f" style=" text-align: center; ">
                   <p><h2>总榜</h2></p>
                </div>
      
        <div class="zp_div" style="width: 350px; text-align: center;">
            <a href="${path}/pic/single?sid=<%=plist.get(0).getId()%>"><img src="<%=plist.get(0).getPicpath()%>" width="312px" height="192px" /></a>
            <div class="" style="">
            	<p><%=plist.get(6).getName()%></p>
            <div class="">           
                <div class="div_f" style="width: 200px;">
                    <img  class="img2" src="${path}/resources/user/images/HD/hd21.png"><p class="p2" ><%=plist.get(6).getPiclike()%></p>
                    <img  class="img3" src="${path}/resources/user/images/HD/hd22.png"><p class="p2"><%=plist.get(6).getCollect()%></p>                  
                </div>
                 <%-- <div class="" style="float: left; margin-top: 22px;"><p class="p1">作者：&nbsp;&nbsp;<%=plist.get(6).getUser().getName()%></p></div> --%>
            </div>
            </div>
        </div>
        <%for(int i=1;i<6;i++){ %>
        <div class="zp_div" style="width: 350px;  height: 130px; text-align: center;">
            <a href="${path}/pic/single?sid=<%=plist.get(i).getId()%>"><img src="<%=plist.get(i).getPicpath()%>" width="120px" height="120px" style="float: left;" /></a>
            <div class="" style="">
            	<p><%=plist.get(i).getName()%></p>
            	<%-- <div class="" style="float: left;"><p class="p1">作者：&nbsp;&nbsp;<%=plist.get(i).getUser().getName()%></p></div> --%>
            <div class="">           
                <div class="div_f" style="width: 200px;">
                    <img  class="img2" src="${path}/resources/user/images/HD/hd21.png"><p class="p2" ><%=plist.get(i).getPiclike()%></p>
                     <img  class="img3" src="${path}/resources/user/images/HD/hd22.png"><p class="p2"><%=plist.get(i).getCollect()%></p>                  
                </div>                
            </div>
            </div>
        </div>
        <%} %>
        
       </div>
       
        <div style="width: 355px; float: left; margin-right: 30px;">
       	 <div class="div_f" style=" text-align: center; ">
                   <p><h2>月榜</h2></p>
                </div>
      
        <div class="zp_div" style="width: 350px; text-align: center;">
              <a href="${path}/pic/single?sid=<%=plist.get(6).getId()%>"><img src="<%=plist.get(6).getPicpath()%>" width="312px" height="192px" /></a>
            <div class="" style="">
            	<p><%=plist.get(6).getName()%></p>
            <div class="">           
                <div class="div_f" style="width: 200px;">
                    <img  class="img2" src="${path}/resources/user/images/HD/hd21.png"><p class="p2" ><%=plist.get(6).getPiclike()%></p>
                    <img  class="img3" src="${path}/resources/user/images/HD/hd22.png"><p class="p2"><%=plist.get(6).getCollect()%></p>                  
                </div>
                 <%-- <div class="" style="float: left; margin-top: 22px;"><p class="p1">作者：&nbsp;&nbsp;<%=plist.get(6).getUser().getName()%></p></div> --%>
            </div>
            </div>
        </div>
        
          <%for(int i=7;i<12;i++){ %>
        <div class="zp_div" style="width: 350px;  height: 130px; text-align: center;">
            <a href="${path}/pic/single?sid=<%=plist.get(i).getId()%>"><img src="<%=plist.get(i).getPicpath()%>" width="120px" height="120px" style="float: left;" /></a>
            <div class="" style="">
            	<p><%=plist.get(i).getName()%></p>
            	<%-- <div class="" style="float: left;"><p class="p1">作者：&nbsp;&nbsp;<%=plist.get(i).getUser().getName()%></p></div> --%>
            <div class="">           
                <div class="div_f" style="width: 200px;">
                    <img  class="img2" src="${path}/resources/user/images/HD/hd21.png"><p class="p2" ><%=plist.get(i).getPiclike()%></p>
                     <img  class="img3" src="${path}/resources/user/images/HD/hd22.png"><p class="p2"><%=plist.get(i).getCollect()%></p>                  
                </div>                
            </div>
            </div>
        </div>
        <%} %>
       </div>
       
       <div style="width: 355px; float: left;">
       	 <div class="div_f" style=" text-align: center; ">
                   <p><h2>周榜</h2></p>
                </div>
      
        <div class="zp_div" style="width: 350px; text-align: center;">
           <a href="${path}/pic/single?sid=<%=plist.get(12).getId()%>"><img src="<%=plist.get(11).getPicpath()%>" width="312px" height="192px" /></a>
            <div class="" style="">
            	<p><%=plist.get(12).getName()%></p>
            <div class="">           
                <div class="div_f" style="width: 200px;">
                    <img  class="img2" src="${path}/resources/user/images/HD/hd21.png"><p class="p2" ><%=plist.get(12).getPiclike()%></p>
                    <img  class="img3" src="${path}/resources/user/images/HD/hd22.png"><p class="p2"><%=plist.get(12).getCollect()%></p>                  
                </div>
                 <%-- <div class="" style="float: left; margin-top: 22px;"><p class="p1">作者:&nbsp;&nbsp;<%=plist.get(12).getUser().getName()%></p></div> --%>
            </div>
            </div>
        </div>
        <%for(int i=13;i<plist.size();i++){ %>
        <div class="zp_div" style="width: 350px;  height: 130px; text-align: center;">
            <a href="${path}/pic/single?sid=<%=plist.get(i).getId()%>"><img src="<%=plist.get(i).getPicpath()%>" width="120px" height="120px" style="float: left;" /></a>
            <div class="" style="">
            	<p><%=plist.get(i).getName()%></p>
            	<%-- <div class="" style="float: left;"><p class="p1">作者：&nbsp;&nbsp;<%=plist.get(i).getUser().getName()%></p></div> --%>
            <div class="">           
                <div class="div_f" style="width: 200px;">
                    <img  class="img2" src="${path}/resources/user/images/HD/hd21.png"><p class="p2" ><%=plist.get(i).getPiclike()%></p>
                     <img  class="img3" src="${path}/resources/user/images/HD/hd22.png"><p class="p2"><%=plist.get(i).getCollect()%></p>                  
                </div>                
            </div>
            </div>
        </div>
        <%} %>
  
      
       </div>
        
       
       
        <div class="hr_black1" ></div>
    </div>
    
    
    
    <div class="footer">
        <ul>
            <li>关于Mortal </li>
            <li>社区指南</li>
            <li>加入我们</li>
            <li>问题反馈</li>
            <li>Mortalblog</li>
            <li>官方微博</li>
        </ul>
        <div class="footer_right">Copyright © Mortal.com LLC.</div>
    </div>
<button type="submit"></button>

</div>
<script type="text/javascript" src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
<script type="text/javascript">
/*  */
$.ajax({
	url:"/moment/pic/gettop",
	type:"post",
	success:function(data){
		console.log("获取周榜");
		console.log(data);
		
		//输出排行榜
		
		
	}
});

</script>

</body>
</html>