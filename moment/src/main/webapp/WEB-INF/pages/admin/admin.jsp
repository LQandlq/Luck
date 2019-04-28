<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.admin.domain.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
		<script src="${path}/resources/user/js/bootstrap.min.js"></script>
		<!-- <script src="bootstrap-3.3.7-dist/js/bootstrapValidator.min.js"></script> -->
	
	<link rel="stylesheet" href="${path}/resources/user/css/comment.css">
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/bootstrap.min.css"/>	
		<!-- <link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap-theme.css"/> -->
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/main-style.css"/>
		<link href="${path}/resources/user/css/style1.css" rel="stylesheet">
		<!-- <script type="text/javascript" src="bootstrap-fileinput/js/fileinput.min.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap-fileinput/css/fileinput.min.css"/>
<script type="text/javascript" src="bootstrap-fileinput/js/fileinput_locale_zh.js"></script> -->
		<style type="text/css" rel>
/* reset */
/*** guide ***/
.guide{width:60px;margin-left:570px;position:fixed;left:60%;bottom:134px;_position:absolute;_top:expression(documentElement.scrollTop+documentElement.clientHeight - this.clientHeight - 134+'px');display:block;}
.guide a{display:block;width:60px;height:50px;background:url(images/sprite_v2.png) no-repeat;margin-top:10px;text-decoration:none;font:16px/50px "Microsoft YaHei";text-align:center;color:#fff;border-radius:2px;}
.guide a span{display:none;text-align:center;}
.guide a:hover{text-decoration:none;background-color:#39F;color:#fff;}
.guide a:hover span{display:block;width:60px;background:#39F}
.guide .edit{background-position:-83px -185px;}
.operationbtn{
	width: 80px;
}
.td2{
	width: 600px;
}
</style>

<script language = JavaScript>
function showmenu() {
 var list = document.getElementById("sonlist");
 var menu = document.getElementById("sub-menu")
 if (list.style.display=="none") {
  list.style.display="block";
   menu.style.backgroundColor="#2E3B46";
 }else {
  list.style.display="none";
  menu.style.backgroundColor="#394A59";
 }
} 
</script>
		<title></title>
         
	</head>
	<body>
	<% AdminVO admin =(AdminVO)session.getAttribute("admin"); %>
			<header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"></div>
            </div>

            <!--logo start-->
            <a href="admin.html" class="logo">后台管理</a>
            <!--logo end-->

            <div class="nav search-row" id="top_menu">
                <!--  search form start -->
                <ul class="nav top-menu">                    
                    <li>
                        <form class="navbar-form">
                            <input class="form-control" placeholder="Search" type="text">
                        </form>
                    </li>                    
                </ul>
                <!--  search form end -->                
            </div>

            <div class="top-nav notification-row">                
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">
                      
                    <!-- user login dropdown start-->
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                           
                            <span class="username">欢迎：<%=admin.getName() %>！</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <li class="eborder-top">
                                <a href="#"><i class="icon_profile"></i> 个人信息</a>
                            </li>
                            
                            <li>
                                <a href="index.html"><i class="icon_clock_alt"></i>返回首页</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_chat_alt"></i>消息</a>
                            </li>
                            <li>
                                <a href="/moment/admin/login"><i class="icon_key_alt"></i> 登出</a>
                            </li>
                           
                        </ul>
                    </li>
       
                </ul>   
            </div>
      </header> 
      
      
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <!-- <li class="active">
                      <a class="" href="#">
                          <span>后台首页</span>
                      </a>
                  </li> -->
				  <li class="sub-menu">
                      <a href="${path}/admin/adminuser" class="">
                      
                          <span>用户管理</span>
                      </a>
                      
                  </li>     
                  <li class="sub-menu">
                      <a href="#" class="">
                      
                          <span>分类管理</span>
                      </a>
                      
                  </li>       
                  <li class="sub-menu" id="sub-menu">
                      <a class="#" onclick="showmenu()">
                          <span>图片管理</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub" id="sonlist"  style="display:none">
                          <li><a class="" href="adminimg.html">1</a></li>
                          <li><a class="" href="article-list.html">2</a></li>
                          <li><a class="slid"  data-path="${path}/admin/adminreport">3</a></li>
                      </ul>
                  </li>
                  
                  <li>                     
                      <a class="" href="adminlogin.html">
                          <i class="icon_piechart"></i>
                          <span>登出</span>
                          
                      </a>
                                         
                  </li>
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
      
      <div class="" id="main-content" style="margin-left: 180px;"> 
      	<div class="wrapper container" style="margin-top: 60px;"> 
      		
      		
      	 <iframe id="iFrame1" width=1325 height=615  src="/moment/admin/admincate" scrolling= "auto " frameborder= "0 " style="margin-top: ;"> </iframe> 
      		
      	</div>
      	
      
      
      </div>
      	
      	 


      	 
    <script type="text/javascript">
    	$(".slid").on('click',function(){
    	var url=$(this).attr("data-path");
    	alert($("#iFrame1").attr("src"));   
    		 $("#iFrame1").attr("src",url); 
    	});
    
    </script>
    
     
   
    
    
	</body>
</html>
