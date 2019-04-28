<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>流行</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/user/css/picture.css">
    <link rel="stylesheet" href="${path}/resources/user/css/adabase.css">
    <link rel="stylesheet" href="${path}/resources/user/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/user/chatroom/css/Lobibox.min.css"/>        
	<link rel="stylesheet" type="text/css" href="${path}/resources/user/bootstrap-fileinput/css/fileinput.min.css"/>
    <!-- 2019/2/21 因影响bootstrap导航栏样式而屏蔽 -->
   <%--  <link rel="stylesheet" href="${path}/resources/user/less/index.css"> --%>
<link rel="stylesheet" href="${path}/resources/user/otheruserpic/css/baguetteBox.min.css">
	<link rel="stylesheet" href="${path}/resources/user/otheruserpic/css/gallery-grid.css">
   <style type="text/css">
   .piclist a{
   	color:white;
   };
   .tit_s{
   visibility: hidden;
   }
   </style>
</head>
<body>
<div class="div_bg">

<% String find = (String)request.getAttribute("find"); %>

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
                        <li><a href="pic_xx.html">注销</a></li>                        
                    </ul>
                </div>
            </li>
        </ul>
        </div>
        <%} %>
        
        
    </div></div>
<input type="hidden" class="userid" value="<%=user.getId()%>">
<input type="hidden" class="username" value="<%=user.getAccount()%>">
<input type="hidden" class="userimg" value="<%=user.getImg()%>">
<div class="content" style="margin-bottom: 20px">
  
<div >
<h2 id="mintitle" style="display: inline; position: relative;top: 40px;left: 80px;">全部</h2> 
		<ul class="nav nav-pills" style="margin-left: 1100px;">
		    <li class="active headli" id="allli"><a href="${path}/pic/piclist">全部</a></li>
		    <li class="headli"><a href="#">热门</a></li>
		    <li class="headli"><a href="#">最新</a></li>
		    <li class="headli"><a href="#">关注</a></li>
		    <li class="dropdown">
		      <a class="dropdown-toggle" data-toggle="dropdown" href="#">
		        分类 <span class="caret"></span>
		      </a>
		      <ul class="dropdown-menu">		   
		      </ul>
		    </li>
		  </ul>
</div>
    
    <div class="hr_black main"></div>
    <div id="piclist" class="piclist tz-gallery" style="min-height: 500px;">
   
    </div>
    
    
    
    <!--页码-->
   <div class="column">
       
        <!--加载更多-->
<div class="yWrapp w jiazaigengduo clearfix">
   <!--  <div class="recommend-line"><a id="jiazaiDu" data-last="0" data-type="all">加载更多</a></div> -->
    <button type="button" class="btn btn-primary btn-lg btn-block" id="jiazaiDu" data-last="0" data-type="all">加载更多</button>
</div>
    </div>
 <!--页码end-->
</div>
<!-- <div class="ho_black " style="margin-bottom: 20px"></div>
<div class="footer" style="">
    <div class="main">
        <ul>
            <li><a href="">关于Mortal</a></li>
            <li><a href="">社区指南</a></li>
            <li><a href="">加入我们</a></li>
            <li><a href="">问题反馈</a></li>
            <li><a href="">Mortal blog</a></li>
            <li><a href="">官方微博</a></li>

        </ul>

        <span>Copyright &copy; Mortal.com LLC</span>
    </div>
</div> -->
</div>

<div class="modal fade" id="alter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">作品上传</h4>
      </div>
      <div class="modal-body" >
      	
      <form class="form-group" role="form" action="${path}/pic/uploads" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="">标题</label>
                                <input class="form-control" type="text" id="firstname" placeholder="请输入标题" name="name">
                            </div>
                            <div class="form-group">
                               <label for="name">简介</label>
    <textarea class="form-control" rows="3" name="description"></textarea>
                            </div>
                            <div class="form-group">
                             <label for="name">选择列表</label>
		<select class="form-control" id="genre" name="type">

		</select>
                            </div>
                           
                             <div class="form-group">
                                <label for="">作品上传</label>
                            <input type="file" class="file"  id="input-711" name="files"/>
                            </div>							                           						                                            
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="submit" class="btn btn-primary uploadbtn">确认</button>
      </div>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="${path}/resources/user/otheruserpic/js/baguetteBox.min.js"></script>
	<script type="text/javascript">
		baguetteBox.run('.tz-gallery');
	</script>
<script type="text/javascript" src="${path}/resources/user/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${path}/resources/user/js/r_f.js"></script>
	<script type="text/javascript"
		src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
	<script type="text/javascript"
		src="${path}/resources/user/js/bootstrap.min.js"></script>
	<script src="${path}/resources/user/js/lobibox.js"></script>
	<script src="${path}/resources/user/js/lobiboxDemo.js"></script>
	<script type="text/javascript" src="${path}/resources/user/js/websocket.js"></script>
	<script type="text/javascript" src="${path}/resources/user/js/piclist.js"></script>  
<script type="text/javascript" src="${path}/resources/user/bootstrap-fileinput/js/fileinput.min.js"></script>
<script type="text/javascript" src="${path}/resources/user/bootstrap-fileinput/js/fileinput_locale_zh.js"></script>
<script type="text/javascript" src="${path}/resources/user/js/upload.js"></script>  
<script>
var find ="<%=find%>";
//alert(find=="null");
$("#input-711").fileinput({
	 language: 'zh',
	 showPreview :true,
	 showUpload:false,
	 maxFileCount:1,
    allowedPreviewTypes : [ 'image' ],
    allowedFileExtensions : ["jpg", "png","gif"] 
});
</script>
</body>
</html>