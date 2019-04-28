<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*,com.moment.pic.domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>关注</title>
    <link rel="stylesheet" href="${path}/resources/user/css/sheyou.css">
    <script type="text/javascript" src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
</head>
<body>
<% List<PicEX> plist =(List<PicEX>)request.getAttribute("userfollow");%>
<div class="div_bg">
    <div class="header">
     <div class="main">
        <img id="img1" src="${path}/resources/user/images/Looo.png">
        <ul>
        <li><a href="${path}/user/index">首页</a></li>
            <li class="zhaopian"><a href="${path}/pic/piclist">作品           
            </a></li>
            <li><a href="${path}/pic/gettop">排行榜</a></li>
			<li><a href="${path}/chatroom" target="view_window">聊天室</a></li>
           
        </ul>
        <form action="${path}/pic/piclist" id="smallfind">
        <div class="div_sou"><img id="img2" src="${path}/resources/user/images/HD/hd19.png">
            <input id="sou_input" type="text" name="find">
        </div>
        </form>
       <%
       UserVO user= (UserVO)session.getAttribute("user");
       if(user==null){%>       
       <div class="div_dl"><a href="login.html">登录</a></div>
        <div class="div_zc"><a href="register.html">免费注册</a></div>
        <%} else{%>
        <div style="float: right;">       
        <ul >
            <li class="zhaopian"><%=user.getAccount() %>
                <!-- 下拉框 -->
                <div class="zhaopian_xl" style="height: 160px;">
                     <ul>
                        <li><a href="${path}/user/person">个人中心</a></li>
                        <li><a <%-- href="${path}/user/upload" --%> data-toggle="modal" data-target="#alter">上传作品</a></li>
                         <li><a href="${path}/pic/userfollow?uid=<%=user.getId()%>">我的关注</a></li>
                        <li><a href="${path}/user/logout">注销</a></li>                        
                    </ul>
                </div>
            </li>
        </ul>
        </div>
        <%} %>
        
        
    </div>
</div>

    <div class="div_hd">
        <div class="main">
        <h2>关注</h2>
        <ul class="ul_hd">
            <li id="li_first">本周最热</li>
            <li class="li2">上升最快</li>
            <li class="li2">总体排行</li>
            <li class="li2">最新加入</li>
        </ul>
        <div class="hr_black" ></div>
            <div class="content" style="height: 500px; overflow:auto">
            <% int flag=-1;//标识是否是同一个作者的图片
            for(int i=0;i<plist.size();i++){ 
               if(flag!=plist.get(i).getUserid()){ 
               		if(flag!=-1){%>                
                </div>
               </div>  
               	     <%}%>   
                <div class="div_1">
                    <div class="div_2">
                    <a href="${path}/pic/otheruserpic?userid=<%=plist.get(i).getUser().getId()%>" target="view_frame"><img class="img3" src="<%=plist.get(i).getUser().getImg() %>" width="100px" height="100px"></a>
                    <div class="div_gz" data-uid="<%=plist.get(i).getUserid() %>">取消关注</div>
                </div>
                    <div class="div_3">
                        <p class="p1"><%=plist.get(i).getUser().getName() %></p>
                        <p class="p2"><%=plist.get(i).getUser().getAccount()%></p>
                    </div>
                    <div class="ho_black"></div>
                     <div class="div_4">
                           <a href="${path}/pic/single?sid=<%=plist.get(0).getId()%>"><img  class="div_img" src="<%=plist.get(i).getPicpath()%>"></a>
                       <%
               			flag=plist.get(i).getUserid();        
               }else{ %>                   
                         <a href="${path}/pic/single?sid=<%=plist.get(0).getId()%>"><img  class="div_img" src="<%=plist.get(i).getPicpath()%>"></a>                                 
               <%} if(i+1==plist.size()){%>
            	   </div>
               </div>                           	   
           <%} }%>
               
               
               
                </div>
           <!--  <div class="col black">
                <div class="pager">
                    <ul>
                        <li><em class="current"><b>1</b></em>
                            <span><a href="http://eput.com/user/recommend/2">2</a></span>
                            <span><a href="http://eput.com/user/recommend/3">3</a></span>
                            <span><a href="http://eput.com/user/recommend/4">4</a></span>
                            <span><a href="http://eput.com/user/recommend/5">5</a></span>
                            <span><a href="http://eput.com/user/recommend/6">6</a></span>
                            <span><a href="http://eput.com/user/recommend/7">7</a></span>
                            <span><a href="http://eput.com/user/recommend/8">8</a></span>
                            <span><a href="http://eput.com/user/recommend/9">9</a></span>
                            <span><a href="http://eput.com/user/recommend/10">10</a></span>
                            <span><a href="http://eput.com/user/recommend/11">11</a></span>
                            <span class="next_page" id="next"><a href="http://eput.com/user/recommend/2"></a></span>
                            <span style="display:none"><a href="http://eput.com/user/recommend/14">末页</a></span>
                        </li>
                    </ul>
                </div>
            </div> -->
        <div class="hr_black1" ></div>
    </div>
    </div>
    <div class="footer">
        <ul>
            <li>关于Mortal </li>
            <li>社区指南</li>
            <li>加入我们</li>
            <li>问题反馈</li>
            <li>Mortal blog</li>
            <li>官方微博</li>
        </ul>
        <div class="footer_right">Copyright © Mortal.com LLC.</div>
    </div>


</div>
<script>
	$(".div_gz").on("mouseover",function(){
		$(this).css("cursor","pointer");
	});	
	$(".div_gz").on("click",function(){
		var uid = $(this).attr("data-uid");
		if(confirm("确认取消关注吗？")){
			$.ajax({
				url:"//localhost:8080/moment/user/deleteuserfollow?uid="+uid,
				type:"post"				
			});
			window.location.reload();
		//window.location.href="http://localhost:8080/moment/user/deleteuserfollow?uid="+uid;
		}	
	});	
</script>

</body>
</html>