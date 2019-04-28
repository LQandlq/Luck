<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*,com.moment.pic.domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Dizital HTML Template | Shop Single</title>
<!-- Stylesheets -->
<link href="${path}/resources/user/css/bootstrap.min.css" rel="stylesheet">
<link href="${path}/resources/user/css/style.css" rel="stylesheet">
<link href="${path}/resources/user/css/responsive.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/resources/user/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/user/bootstrap-fileinput/css/fileinput.min.css"/>

<%-- <script type="text/javascript" src="${path}/resources/user/js/jquery-1.12.0.min.js"></script> --%>

<!--评论css-->
  <link rel="stylesheet" href="${path}/resources/user/css/comment.css">

 <link rel="stylesheet" type="text/css" href="${path}/resources/user/css/picture.css">

<link rel="shortcut icon" href="${path}/resources/user/images/favicon.png" type="image/x-icon">
<link rel="icon" href="${path}/resources/user/images/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="${path}/resources/user/otheruserpic/css/baguetteBox.min.css">
<link rel="stylesheet" href="${path}/resources/user/otheruserpic/css/fluid-gallery.css">

<!-- Responsive -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">

<!--[if lt IE 9]><script src="http://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
<!--[if lt IE 9]><script src="js/respond.js"></script><![endif]-->
<style>
	.getgold_top_head_img{
    height: 80px;
    width: 80px;
    border-radius:50%;
    -webkit-border-radius:50%;
    -moz-border-radius:50%;
    margin-top: 15px;
}

.bgc{
background-color: #f2f3f5;
}
.bgc1{
background-color: white;
}
.other4{
width: 110px;
height: 110px;
}
.user{
     		/* position:static; */
     	}

	
</style>


</head>

<body class="bgc" style="overflow: auto;">
<% 
UserVO user = (UserVO)session.getAttribute("user");
PicEX pic = (PicEX)session.getAttribute("picbyid");
List<PicEX> other4 =(List<PicEX>) request.getAttribute("other4");
String path="";
int like=0;
if(session.getAttribute("collect")!=null&&session.getAttribute("collect")=="true"){
System.out.println("收藏标记了");
path="2";
}else{
	path="1";
}
if(session.getAttribute("piclike")!=null&&session.getAttribute("piclike")=="true"){
System.out.println("点赞标记了");
like=2;
}else{
	like=1;
}
%>
<input id="picid" type="text" style="display:none;" value="<%=pic.getId()%>">
<input type="hidden" class="userid" value="<%=pic.getUser().getId()%>">
<input type="hidden" class="userimg" value="<%=pic.getUser().getImg()%>">
<input type="hidden" class="username" value="<%=pic.getUser().getAccount()%>">
<div class="page-wrapper">
 	
    <!-- Preloader -->
    <div class="preloader"></div>
 	
    <!-- Main Header / Header Style Two-->
    <header class="main-header header-style-two">
    
    	
    	<div class="header">
    <div class="main">
       <a href="${path}/user/index"><img id="img1" src="${path}/resources/user/images/Looo.png"></a>
        <ul>
         <li><a href="${path}/user/index">首页</a></li>
            <li class="zhaopian"><a href="${path}/pic/piclist">作品  </a></li>
            <li><a href="${path}/pic/gettop">排行榜</a></li>
			<li><a href="${path}/chatroom" target="view_window">聊天室</a></li>
        </ul>
        <div class="div_sou"><img id="img2" src="${path}/resources/user/images/HD/hd19.png"><input id="sou_input" type="text"></div>
         <%
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
    	

    </header>
    <!--End Main Header -->
	
	<!--Page Title-->
	<section class="page-title" style="background-image: url(${path}/resources/user/images/FG/FG1.jpg); height: 0px">
		<div class="auto-container">
			<h1><%=pic.getName() %></h1>
			<!-- <div class="text">Highlight your writing with beautiful, expressive featured images.</div> -->
		</div>
	</section>
	<!--End Page Title-->
	
	<!--Shop Single Section-->
	<section class="shop-single-section sidebar-page-container" >
		<div class="auto-container">
			<div class="row clearfix">
				
				<!--Content Column-->
				<div class="content-column col-lg-8 col-md-12 col-sm-12">
					<div class="inner-column">
						<div class="shop-single  bgc1">
							<div class="inner-box" >
								<div class="image">
									<a class="lightbox" href="<%=pic.getPicpath() %>" target="_Blank">
										<img class="bigimg" src="<%=pic.getPicpath() %>" alt="" />
									</a>
								</div>
								<div class="lower-content">
									<div class="text">
										<h3><%=pic.getName() %></h3>
										<p><%=pic.getDescription() %></p>
									</div>
									<div class="lower-box">
										<div class="clearfix">
											<div class="pull-left">
												<div class="post-meta-option">
													<div class="author">
														<div class="author-image"><img src="<%=pic.getUser().getImg() %>" alt="" /></div>
														by <%=pic.getUser().getName() %>
													</div>
													
												</div>
											</div>
											<div class="pull-right">
												<ul class="social-icon-one">
												<%if(like==1){%>
													<li><button type="button"  class="btn btn-info" id="dianzanbtn" data-num="<%=pic.getPiclike()%>" name="1" data-picid="<%=pic.getId()%>">点赞 !</button></li>
													<%-- <li ><a href="javascript:;" style="background-color: white;"><img src="${path}/resources/user/images/dianzan.png" id="dianzan" alt="18" data-num="<%=pic.getPiclike()%>" name="1" data-picid="<%=pic.getId()%>"/></a></li> --%>
													<%}else{%>
													<li ><button type="button" class="btn btn-default active"  id="dianzanbtn" data-num="<%=pic.getPiclike()%>" name="-1" data-picid="<%=pic.getId()%>">已点赞 !</button></li>
													<%-- <li ><a href="javascript:;" style="background-color: white;"><img src="${path}/resources/user/images/dianzanred.png" id="dianzan" alt="18" data-num="<%=pic.getPiclike()%>" name="-1" data-picid="<%=pic.getId()%>"/></a></li> --%>
													<%}if(path.equals("2")){%>
													<%-- <li ><a href="javascript:;" style="background-color: white;"><img src="${path}/resources/user/images/shoucang (<%=path %>).png" id="shoucang" name="<%=path %>"  data-picid="<%=pic.getId()%>"/></a></li> --%>
													<li ><button type="button" class="btn btn-default active" id="shoucang" name="-1"  data-picid="<%=pic.getId()%>">已收藏 !</button></li>
													<%}else{%>
													<li ><button type="button" class="btn btn-warning" id="shoucang" name="1"  data-picid="<%=pic.getId()%>">收藏 !</button></li>
													<%}%>
													<li ><a href="javascript:;" style="background-color: white;" onclick="picdownload()"><img src="${path}/resources/user/img/icon/downloadIcon.png" alt="下载" style="width: 26px; height: 26px;"/></a></li>
													<li ><a href="javascript:;" style="background-color: white;" data-toggle="modal" data-target="#myModal"><img src="${path}/resources/user/img/icon/reportIcon.png" alt="举报" style="width: 28px; height: 28px;"/></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							
							
							
							</div>
						</div>
						
						<!--Popular Category-->
						<div class="popular-category  bgc1">
							<h2>评论</h2>							
    
    <div class="commentAll" style="width: 700px;">
    <!--评论区域 begin-->
    <div class="reviewArea clearfix">
        <textarea class="content comment-input" placeholder="Please enter a comment&hellip;" onkeyup="keyUP(this)" style="margin-top: 0px;"></textarea>
        <a href="javascript:;" class="plBtn">评论</a>
    </div>
    <!--评论区域 end-->
    <!--回复区域 begin-->
    <div class="comment-show" id="comment-show">
        <div class="comment-show-con clearfix">
            <div class="comment-show-con-img pull-left"><img src="${path}/resources/user/images/header-img-comment_03.png" alt=""></div>
            <div class="comment-show-con-list pull-left clearfix">
                <div class="pl-text clearfix">
                    <a href="#" class="comment-size-name" data-preid="1">张三 : </a>
                    <span class="my-pl-con">&nbsp;来啊 造作啊!</span>
                </div>
                <div class="date-dz">
                    <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                    <div class="date-dz-right pull-right comment-pl-block">
                        <a href="javascript:;" class="removeBlock">删除</a>
                        <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                        <span class="pull-left date-dz-line">|</span>
                        <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>
                    </div>
                </div>
                <div class="hf-list-con"></div>
            </div>
        </div>
    </div>
    <!--回复区域 end-->
</div>
    

							<div class="row clearfix">
					
								<!-- 
								<div class="category-block">
									<div class="inner-box">
										<div class="image">
											<img src="images/resource/category-1.jpg" alt="" />
											<div class="overlay-box">
												<div class="overlay-inner">
													<div class="content">
														<h3><a href="blog-single.html">artwork</a></h3>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							
								<div class="category-block">
									<div class="inner-box">
										<div class="image">
											<img src="images/resource/category-2.jpg" alt="" />
											<div class="overlay-box">
												<div class="overlay-inner">
													<div class="content">
														<h3><a href="blog-single.html">coding</a></h3>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								
								<div class="category-block">
									<div class="inner-box">
										<div class="image">
											<img src="images/resource/category-3.jpg" alt="" />
											<div class="overlay-box">
												<div class="overlay-inner">
													<div class="content">
														<h3><a href="blog-single.html">courses</a></h3>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								
								<div class="category-block">
									<div class="inner-box">
										<div class="image">
											<img src="images/resource/category-4.jpg" alt="" />
											<div class="overlay-box">
												<div class="overlay-inner">
													<div class="content">
														<h3><a href="blog-single.html">photography</a></h3>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							
								
								<div class="category-block">
									<div class="inner-box">
										<div class="image">
											<img src="images/resource/category-6.jpg" alt="" />
											<div class="overlay-box">
												<div class="overlay-inner">
													<div class="content">
														<h3><a href="blog-single.html">backgrounds</a></h3>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								
								<div class="category-block">
									<div class="inner-box">
										<div class="image">
											<img src="images/resource/category-7.jpg" alt="" />
											<div class="overlay-box">
												<div class="overlay-inner">
													<div class="content">
														<h3><a href="blog-single.html">graphics</a></h3>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								
								<div class="category-block">
									<div class="inner-box">
										<div class="image">
											<img src="images/resource/category-8.jpg" alt="" />
											<div class="overlay-box">
												<div class="overlay-inner">
													<div class="content">
														<h3><a href="blog-single.html">crafts</a></h3>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

								
								<div class="category-block">
									<div class="inner-box">
										<div class="image">
											<img src="images/resource/category-9.jpg" alt="" />
											<div class="overlay-box">
												<div class="overlay-inner">
													<div class="content">
														<h3><a href="blog-single.html">design</a></h3>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div> -->
							
							</div>
								
						</div>
						
				
					</div>
				</div>
				
				<!--Sidebar Column-->
				<div class="sidebar-column col-lg-4 col-md-12 col-sm-12 siderbar1" >
					<div class="inner-column">
						
						<!--Purchased Widget-->
						<div class="purchased-widget" style="text-align: center;padding: 0px;width: 390px;">
							<div class="inner-box">
								<div class="author">
								<%--  <a href="${path}/user/findotherauther?oid=<%=other4.get(0).getUserid()%>"> --%>
								<a href="${path}/pic/otheruserpic?userid=<%=other4.get(0).getUserid()%>">
										<div class="author-image"><img class="getgold_top_head_img" src="<%=pic.getUser().getImg() %>" alt="" /></div>														
													</div>													
								<h3><%=pic.getUser().getName() %></h3>
								</a>
								<div class="text"><p>粉丝数:&nbsp;&nbsp;&nbsp;<span>18</span></p>
									<p>作品数:&nbsp;&nbsp;&nbsp;<span>18</span></p></div>
								<a  class="purchased-btn theme-btn" data-userid="<%=pic.getUserid()%>" id="follow_btn" data-flag="0">关注</a>
								<a  class="purchased-btn theme-btn" onclick="toUserChat()" data-userid="<%=pic.getUserid()%>" id="chat_btn" data-flag="0" style="display:none;">聊一聊</a>								
							</div>	
						</div>	
					</div>
				</div>
				
			
			
			<!--Sidebar Column-->
				<div class="sidebar-column col-lg-4 col-md-12 col-sm-12 siderbar2" style="margin-top: -60px">
					<div class="inner-column">
						
						<!--Purchased Widget-->
						<div class="purchased-widget" style="text-align: center;">
							<div class="inner-box" style="padding: 20px;">
								<div class="panel panel-default">
  <div class="panel-heading">他的画廊 
  <a href="/moment/pic/otheruserpic?userid=<%=other4.get(0).getUserid()%>">
<span class="label label-default" style="float: right;">更多</span>
</a>
  </div>
 
   <div class="tz-gallery" style="padding: 20px;">
		  <div class="row">
  <% 
  if(other4.size()!=0){
  for(int i=0;i<other4.size();i++){%>
		<div class="col-sm-12 col-md-6">
			<a class="lightbox" href="<%=other4.get(i).getPicpath() %>">
		        <img src="<%=other4.get(i).getPicpath() %>" alt="Bridge" style="width: 158px;height: 104.25px;">
			</a>
		</div>			
<%}}%>   				      
	</div>
  </div> 
</div>
										
									
											<%-- 	<ul class="social-icon-one" >
												<%if(like==1){%>
													<li style=""><a href="javascript:;" style="background-color: white;"><img src="${path}/resources/user/images/dianzan.png" id="dianzan" alt="18" data-num="<%=pic.getPiclike()%>" name="1" data-picid="<%=pic.getId()%>"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
													<%}else{%>
													<li ><a href="javascript:;" style="background-color: white;"><img src="${path}/resources/user/images/dianzanred.png" id="dianzan" alt="18" data-num="<%=pic.getPiclike()%>" name="-1" data-picid="<%=pic.getId()%>"/></a></li>
													<%}%>
													<li ><a href="javascript:;" style="background-color: white;"><img src="${path}/resources/user/images/shoucang (<%=path %>).png" id="shoucang" name="<%=path %>"  data-picid="<%=pic.getId()%>"/></a></li>
													
												</ul> --%>
												
		
																						
																																	
							</div>	
						</div>	
					</div>
				</div>
			
			
			
			</div>
		</div>
	</section>
	<!--End Shop Single Section-->
	
	
    <!-- <footer class="main-footer">
    
		<div class="auto-container">
        
        	
            <div class="widgets-section">
            	<div class="row clearfix">
                	
                  
                    <div class="big-column col-lg-5 col-md-12 col-sm-12">
                        <div class="row clearfix">
							
							
                            <div class="footer-column col-lg-7 col-md-7 col-sm-12">
								<div class="footer-widget logo-widget">
									<div class="logo">
										<a href="index.html"><img src="images/FG/FG12.jpg" alt="" /></a>
									</div>
									<div class="text">Lorem Ipsum proin gravida nibh vel velit aucsollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit.</div>
									<ul class="social-icon-one">
										<li class="facebook"><a href="#"><span class="fa fa-facebook"></span></a></li>
										<li class="pinterest"><a href="#"><span class="fa fa-pinterest-p"></span></a></li>
										<li class="twitter"><a href="#"><span class="fa fa-twitter"></span></a></li>
									</ul>
								</div>
							</div>
							
						
                            <div class="footer-column col-lg-5 col-md-5 col-sm-12">
								<div class="footer-widget links-widget">
									<h2>Company</h2>
									<ul class="list">
										<li><a href="#">About Us</a></li>
										<li><a href="#">Our Team</a></li>
										<li><a href="#">Testimonials</a></li>
										<li><a href="#">Brand</a></li>
										<li><a href="#">Ecosystem</a></li>
										<li><a href="#">Sitemap</a></li>
									</ul>
								</div>
							</div>
							
						</div>
					</div>
					
					
                    <div class="big-column col-lg-7 col-md-12 col-sm-12">
                        <div class="row clearfix">
							
							
                            <div class="footer-column col-lg-4 col-md-6 col-sm-12">
								<div class="footer-widget links-widget">
									<h2>Categories</h2>
									<ul class="list">
										<li><a href="#">Graphics (25)</a></li>
										<li><a href="#">Backgrounds (12)</a></li>
										<li><a href="#">Fonts (8)</a></li>
										<li><a href="#">Music (3)</a></li>
										<li><a href="#">Photography (3)</a></li>
										<li><a href="#">Themes (3)</a></li>
									</ul>
								</div>
							</div>
							
						
                            <div class="footer-column col-lg-4 col-md-6 col-sm-12">
								<div class="footer-widget links-widget">
									<h2>Useful Links</h2>
									<ul class="list">
										<li><a href="#">Blog</a></li>
										<li><a href="#">Terms & Conditions</a></li>
										<li><a href="#">Privacy Policy</a></li>
										<li><a href="#">Refund Policy</a></li>
										<li><a href="#">Affiliate</a></li>
										<li><a href="#">Contact</a></li>
									</ul>
								</div>
							</div>
							
						
                            <div class="footer-column col-lg-4 col-md-6 col-sm-12">
								<div class="footer-widget map-widget">
									<h2>Where we are</h2>
									<div class="image">
										<img src="images/resource/map.png" alt="" />
									</div>
								</div>
							</div>
							
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="copyright">&copy; Copyright 2018 , <a href="http://www.17sucai.com/">Dizital</a></div>
			
		</div>
	</footer> -->
	
	<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="myModalLabel">
					我要举报
				</h4>
			</div>
			
			<div class="modal-body" style="height: 120px">
				
				<div class="form-group"> 
<div class="col-md-6" > 
<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="侵犯版权"> 侵犯版权
</label>
</div> 
<div class="col-md-6">
<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="话题不相关"> 话题不相关
</label> 
</div> 
<div class="col-md-6"> 
<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="垃圾广告"> 垃圾广告
</label>
</div> 
<div class="col-md-6">
<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="色情"> 色情
</label> 
</div> 
<div class="col-md-6"> 
<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="赌博信息"> 赌博信息
</label>
</div> 
<div class="col-md-6">
<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="违法信息"> 违法信息
</label> 
</div> 
<div class="col-md-6"> 
<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="人身攻击"> 人身攻击
</label>
</div> 
<div class="col-md-6">
<label class="radio-inline">
		<input type="radio" name="optionsRadiosinline" id="optionsRadios4"  value="其他"> 其他
</label> 
</div> 
</div>
	
			
			</div>
			<div class="modal-footer">
				<button type="button"  class="btn btn-default" 
						data-dismiss="modal" id="closebtn">关闭
				</button>
				<button type="button" class="btn btn-primary" id="submitreportbtn">
					提交更改
				</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
	<div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
	
	
</div>
<!--End pagewrapper-->
 <%System.out.println("userimg:"+user.getImg());%>
<script src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
<script src="${path}/resources/user/js/bootstrap.min.js"></script>
<!--<script src="js/popper.min.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/jquery.fancybox.js"></script>
<script src="js/appear.js"></script>
<script src="js/owl.js"></script>
<script src="js/wow.js"></script>-->
<script src="${path}/resources/user/js/script.js"></script>
<script type="text/javascript" src="${path}/resources/user/bootstrap-fileinput/js/fileinput.min.js"></script>
<script type="text/javascript" src="${path}/resources/user/bootstrap-fileinput/js/fileinput_locale_zh.js"></script>
<script type="text/javascript" src="${path}/resources/user/js/upload.js"></script> 

<script type="text/javascript" src="${path}/resources/user/js/jquery.flexText.js"></script>
<script type="text/javascript" src="${path}/resources/user/js/websocket.js"></script>
<script src="${path}/resources/user/js/single.js"></script>
<script type="text/javascript" src="${path}/resources/user/otheruserpic/js/baguetteBox.min.js"></script>
	<script type="text/javascript">
		baguetteBox.run('.tz-gallery');
	</script>

<script type="text/javascript">
    $(function () {
        $('.content').flexText();       
    });
    $("#input-711").fileinput({
   	 language: 'zh',
   	 showPreview :true,
   	 showUpload:false,
   	 maxFileCount:1,
       allowedPreviewTypes : [ 'image' ],
       allowedFileExtensions : ["jpg", "png","gif"] 
   });
</script>
<!--textarea限制字数-->
<script type="text/javascript">
    function keyUP(t){
        var len = $(t).val().length;
        if(len > 139){
            $(t).val($(t).val().substring(0,140));
        }
    }
</script>
<!--点击评论创建评论条-->
<script type="text/javascript">
    $('.commentAll').on('click','.plBtn',function(){
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        //console.log(oSize+":::::::");
       
        if(oSize.length>0){   
        //评论id
        var dataid=-1;
        //将评论添加入数据库
         $.ajax({
        	url:"comment/addcomment",
        	type:"post",
        	data:{
        		context:oSize,//评论内容
        		time:now,//评论时间
        		commentid:0,
        		picid:$("#picid").val()
        	},
        	success:function(data){
        		//返回评论id
        		dataid=data.id;
        	}
        }); 
        
        
       
<%--        alert("<%=user.getImg()%>"); --%>
        
        //动态创建评论模块
      
        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="<%=user.getImg()%>" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name" data-id="-1"><%=user.getName() %> : </a> <span class="my-pl-con" data-id="'+dataid+'">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line"></span> </div> </div><div class="hf-list-con"></div></div> </div>';
        if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
        }   	
        }else{
        	//alert("请输入内容！");
        	<%-- alert("<%=user.getImg()%>"); --%>
        }
    });
</script>
<!--点击回复动态创建回复块-->
<script type="text/javascript">
    $('.comment-show').on('click','.pl-hf',function(){
    	//获取回复的父级ID
        var fid = $(this).attr("data-fid");
       
        //获取回复人的名字
        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        
        //获取回复评论的id
                var remark=$(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').attr("data-id");
                
        //回复@
        var fhN = '回复@'+fhName;
        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" data-preid="-1" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl" data-fid="'+fid+'">评论</a></div>';
        //显示回复
        if($(this).is('.hf-con-block')){
            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
            $(this).removeClass('hf-con-block');
            $('.content').flexText();
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
            //input框自动聚焦
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
        }else {
            $(this).addClass('hf-con-block');
            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
        }
    });
</script>
<!--评论回复块创建-->
<script type="text/javascript">
    $('.comment-show').on('click','.hf-pl',function(){
        var oThis = $(this);
        console.log(oThis);
       
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
        console.log(oHfVal)
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var oAllVal = '回复@'+oHfName;
        
        //将回复评论添加入数据库
        $.ajax({
        	url:"comment/addcomment",
        	type:"post",
        	data:{
        		context:oHfVal,//评论内容
        		picid:$("#picid").val(),//回复评论id
        		commentid:1,
        		fid:oThis.attr("data-fid")
        	},
        	success:function(data){
        		//dataid=data.id;
        	}
        });
        
        
        
        
        if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

        }else {
            $.getJSON("${path}/resources/user/json/pl.json",function(data){
                var oAt = '';
                var oHf = '';
                $.each(data,function(n,v){
                    delete v.hfContent;
                    delete v.atName;
                    var arr;
                    var ohfNameArr;
                    if(oHfVal.indexOf("@") == -1){
                        data['atName'] = '';
                        data['hfContent'] = oHfVal;
                    }else {
                        arr = oHfVal.split(':');
                        ohfNameArr = arr[0].split('@');
                        data['hfContent'] = arr[1];
                        data['atName'] = ohfNameArr[1];
                    }

                    if(data.atName == ''){
                        oAt = data.hfContent;
                    }else {
                        oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
                    }
                    oHf = data.hfName;
                });
                
              
               console.log($(this));
                //评论id
        var dataid=-1;
          

                var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con" data-id=""'+dataid+'"">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line"></span></div> </div></div>';
                oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
            });
        }
    });
</script>
<!--删除评论块-->
<script type="text/javascript">
    $('.commentAll').on('click','.removeBlock',function(){
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
        if(oT.siblings('.all-pl-con').length >= 1){
            oT.remove();
        }else {
            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
            oT.remove();
        }
        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

    });
</script>
<!--点赞-->
<script type="text/javascript">
    $('.comment-show').on('click','.date-dz-z',function(){
        var zNum = $(this).find('.z-num').html();
        if($(this).is('.date-dz-z-click')){
            zNum--;
            $(this).removeClass('date-dz-z-click red');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').removeClass('red');
        }else {
            zNum++;
            $(this).addClass('date-dz-z-click');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').addClass('red');
        }
    });
    
    $(window).scroll(function (){
         if ($(window).scrollTop()>300) {
         $(".siderbar1").css({position: "fixed","left":"960px","top":"112px"});
         $(".siderbar2").css({position: "fixed","left":"906px","top":"482px"});
         console.log("大于300");
        } else{
        $(".siderbar1").css({position: "static"});
        $(".siderbar2").css({position: "absolute"});
        console.log("小于300");
        }
        //console.log($(window).scrollTop());
    });
    //加载页面前判断是否已经关注过作者
    $.ajax({
		url:"/moment/user/selectfollowflag",
		type:"post",
		data:{fid:$("#follow_btn").attr("data-userid")
		},
		success:function(data){  
			if(data==1){
				$("#follow_btn").html("已关注!");
				  $("#follow_btn").css("background-color",'#9F9F9F');
				$("#follow_btn").css("border",'#9F9F9F');
				$("#follow_btn").attr("data-flag","1");
				$("#chat_btn").css("display","inline");
			}
						  
		}
	});
    
    $("#follow_btn").on('click',function(){
    	var fid = $(this).attr("data-userid");
    	var flag = $(this).attr("data-flag");
    	if(<%=user.getId()%>+""==fid){
    		alert("无法关注自己!");
    	}else{
    		$.ajax({
    			url:"/moment/user/followuser",
    			type:"post",
    			data:{fid:fid,
    				flag1:flag
    			},
    			success:function(data){  
    				//alert("已关注");
    				if(flag=="0"){
    					alert("成功关注！");    					
    					$("#follow_btn").html("已关注!");  						
      				  $("#follow_btn").css("background-color",'#9F9F9F');
      				$("#follow_btn").css("border",'#9F9F9F');
      				$("#follow_btn").attr("data-flag","1");
      				//显示聊天按钮
      				$("#chat_btn").css("visibility","visible");
      				window.location.reload();
    				}else{
    					alert("已取消关注！");
    					$("#follow_btn").html("关注!");
        				  $("#follow_btn").css("background-color",'#3f9b77');
        				$("#follow_btn").css("border",'2px solid #3f9b77');
        				$("#follow_btn").attr("data-flag","0");
        				$("#chat_btn").css("visibility","hidden");
        				window.location.reload();
    				}
    				  
    			}
    		});
    	}
    });
    
    $("#dianzanbtn").on('click',function(){
    	var picid = $(this).attr("data-picid");
		var num = $(this).attr("data-num");
		var rs = $(this).attr("name");		
		$.ajax({
			url:"/moment/pic/change",
			type:"post",
			data:{
				imgid:picid,
				liketype:"piclike",
				num:num,
				rs:rs
			},
			success:function(data){
				 if(rs=='1'){
				$("#dianzanbtn").removeClass("btn-info");
				 $("#dianzanbtn").addClass("btn-default active");
				 $("#dianzanbtn").html("以点赞 !");
				 $("#dianzanbtn").attr("name","-1");
				 alert("已点赞 !");
				 }else{
						$("#dianzanbtn").removeClass("btn-default active");
						 $("#dianzanbtn").addClass("btn-info");
						 $("#dianzanbtn").html("点赞 !");
						 $("#dianzanbtn").attr("name","1");
						 alert("已取消点赞 !");
				 }
			}
		});
    });
    
    
    $("#shoucang").on('click',function(){
    	var picid = $(this).attr("data-picid");
		var rs = $(this).attr("name");
		if(rs=="1"){
		$(this).removeClass("btn-warning");	
		$(this).addClass("btn-default active");	
		$(this).html("已收藏 !");
		$(this).attr("name","-1");
		alert("已收藏 !");
		}else{		
			$(this).removeClass("btn-default active");	
			$(this).addClass("btn-warning");
			$(this).html("收藏 !");	
			$(this).attr("name","1");
			alert("已取消收藏 !");
		}
		
		$.ajax({
			url:"/moment/pic/change",
			type:"post",
			data:{
				imgid:picid,
				liketype:"collect",
				rs:rs
			}
		});
    });
    
    //举报提交js
    $("#submitreportbtn").on('click',function(){
    	var val= $("input[type='radio']:checked").val();
    	var picid = $("#dianzanbtn").attr("data-picid");
    	if(typeof(val)=="undefined"){
    		alert("请选择举报理由 !");
    	}else{
    		alert("举报已提交 !");
    		$.ajax({
    			url:'/moment/report/addreport',
    			type:"post",
    			data:{
    				description:val,
    				picid:picid,
    				state:"已发布"
    			}
    		});
    		$("#closebtn").click();
    	}
    	
    }); 
    
    function toUserChat(){
      	 var userimg='${sessionScope.user.img}';
      	 alert(userimg);
      	 	window.open('${path}/userchat?reviewer='+ encodeURIComponent('|'+$(".userid").val()+'|'+$(".userimg").val()+'|'+$(".username").val()),'tag');	
       }
    //图片下载
    function picdownload(){
    	//alert($(".bigimg").attr("src"));
    	window.location.href="${path}/pic/picdown?filepath="+encodeURIComponent($(".bigimg").attr("src"));
    }
</script>
<!-- 背景 -->
<link rel="stylesheet" type="text/css" href="${path}/resources/user/background/demo/style/index.css">
<link rel="stylesheet" type="text/css" href="${path}/resources/user/background/demo/style/prism.css">
<script type="text/javascript" src="${path}/resources/user/background/lib/quietflow.min.js"></script>
<script type="text/javascript" src="${path}/resources/user/background/demo/js/index.js"></script>
<script type="text/javascript" src="${path}/resources/user/background/demo/js/prism.js"></script>
</body>
</html>
