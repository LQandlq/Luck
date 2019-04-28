<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.admin.domain.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
		<script src="${path}/resources/user/js/bootstrap.min.js"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrapValidator.min.js"></script>
		<script src="${path}/resources/user/js/scripts.js"></script>
		<script src="js/jquery.nicescroll.js"></script>
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrapValidator.min.css" />
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/bootstrap.min.css"/>	
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap-theme.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/main-style.css"/>
		<link href="${path}/resources/user/css/style1.css" rel="stylesheet">
		
<script type="text/javascript" src="bootstrap-fileinput/js/fileinput.min.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap-fileinput/css/fileinput.min.css"/>
<script type="text/javascript" src="bootstrap-fileinput/js/fileinput_locale_zh.js"></script>
		<title></title>
		<style type="text/css">
			.title{
				font-size: 20px;
				line-height: 30px;
			}
		</style>
	</head>
	<body>
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
<% AdminVO admin =(AdminVO)session.getAttribute("admin"); %>
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
                                <a href="login.html"><i class="icon_key_alt"></i> 登出</a>
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
                      <a class="" href="admin.html">
                          <i class="icon_house_alt"></i>
                          <span>后台首页</span>
                      </a>
                  </li> -->
				  <li class="sub-menu">
                      <a href="#" class="">
                          <i class="icon_document_alt"></i>
                          <span>用户管理</span>
                      </a>
                      
                  </li>       
                  <li class="sub-menu">
                      <a href="/moment/admin/adminimg" class="">
                          <i class="icon_desktop"></i>
                          <span>图片管理</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="adminimg.html">1</a></li>
                          <li><a class="" href="#">2</a></li>
                          <li><a class="" href="#">3</a></li>
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
      
      <div class="" id="main-content"> 
      	<div class="wrapper" style="margin-top: 60px;margin-left: 200px;padding-right: 0px"> 
      		<div class="input-group" style="position: relative; left: 500px;">
      <input type="text" class="form-control" placeholder="请输入账号" id="searchinput">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button" id="searchbtn">检索</button>
      </span>
    </div><!-- /input-group -->
      		<table class="table table-hover">
	<caption>用户管理</caption>
	<thead>
		<tr>
			<th>ID</th>
			<th>用户名</th>
			<th>账号</th>
			<th>邮箱</th>
			<th>手机</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody id="tbody">
		<tr>
			<td>Tanmay</td>
			<td>Bangalore</td>
			<td>560001</td>
			<td>Tanmay</td>
			<td>Bangalore</td>
			<td>560001</td>
			<td class="operationbtn">
				
					<button type="button" class="btn btn-info" data-toggle="modal" data-target="#alter">修改</button>
					<button type="button" class="btn btn-warning">禁止登陆</button>
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
		<tr>
			<td>Sachin</td>
			<td>Mumbai</td>
			<td>400003</td>
			<td>Tanmay</td>
			<td>Bangalore</td>
			<td>560001</td>
			<td class="operationbtn">
				
					<button type="button" class="btn btn-info" >修改</button>
					<button type="button" class="btn btn-warning">禁止登陆</button>
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
		<tr>
			<td>Uma</td>
			<td>Pune</td>
			<td>411027</td>
			<td>Tanmay</td>
			<td>Bangalore</td>
			<td>560001</td>
			<td class="operationbtn">
				
					<button type="button" class="btn btn-info" >修改</button>
					<button type="button" class="btn btn-warning">禁止登陆</button>
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
		<tr>
			<td>Uma</td>
			<td>Pune</td>
			<td>411027</td>
			<td>Tanmay</td>
			<td>Bangalore</td>
			<td>560001</td>
			<td class="operationbtn">
				
					<button type="button" class="btn btn-info" >修改</button>
					<button type="button" class="btn btn-warning">禁止登陆</button>
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
		<tr>
			<td>Uma</td>
			<td>Pune</td>
			<td>411027</td>
			<td>Tanmay</td>
			<td>Bangalore</td>
			<td>560001</td>
			<td class="operationbtn">
				
					<button type="button" class="btn btn-info" >修改</button>
					<button type="button" class="btn btn-warning">禁止登陆</button>
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
	</tbody>
</table>
      </div>
       </div>
       
       <div class="modal fade" id="alter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">用户信息修改</h4>
      </div>
      <div class="modal-body" >
      	
      <form class="form-group" action="index.html" id="login" method="get">
                            <div class="form-group">
                                <label for="">用户名</label>
                                <input class="form-control" type="text" placeholder=""  name="username">
                            </div>
                            <div class="form-group">
                                <label for="">密码</label>
                                <input class="form-control" type="password" placeholder="" name="password">
                            </div>
                            <div class="form-group">
                                <label for="">邮箱</label>
                                <input class="form-control" type="text" placeholder="" name="password">
                            </div>
                            <div class="form-group">
                                <label for="">手机号</label>
                                <input class="form-control" type="text" placeholder="" name="password">
                            </div>
                            <div class="form-group">
                                <label for="">性别</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            
  <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
  男&nbsp;&nbsp;&nbsp;&nbsp;


  <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
  女

                            </div>
                             <div class="form-group">
                                <label for="">头像上传</label>
                            <input type="file" name="image" class="file" />
                            </div>
                           
                           
                    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" class="btn btn-primary">确认</button>
      </div>
      </form>
    </div>
  </div>
</div>
     <script type="text/javascript">
     function userlist(acount){
     $.ajax({
    	 url:"/moment/admin/getuserlist",
    	 type:"post",
    	 data:{account:acount},
    	 success:function(data){
    		 console.log(data);
    		 var html="";
    		 for(var i=0;i<data.length;i++){
    			  html+='<tr><td>'+data[i].id+"</td>"+
    				'<td>'+data[i].name+'</td>'+
    				'<td>'+data[i].account+'</td>'+
    				'<td>'+data[i].email+'</td>'+
    				'<td>'+data[i].phonum+'</td>'+
    				'<td class="operationbtn">'+
    				''+
    				'<button type="button" class="btn btn-warning" data-userid="'+data[i].id+'" data-fa="1">禁止登陆</button>'+
    				'</td></tr>';
    		
    		 }
    		 
    		 if(data.length==0){
    			 html="<strong><h3>没有找到此用户！</h3></strong>"
    		 }
    		 $("#tbody").html(html);
    	 }
     });
     }
     userlist();
     
     $("#searchbtn").on('click',function(){
    	var account = $("#searchinput").val();
    	alert(account);
    	userlist(account);
     });
     
     $("body").on('click','.btn-warning',function(){
    	 var userid = $(this).attr("data-userid");
    	 var text= $(this).attr("data-fa");
    	 var score=0;
    	 if(text=="1"){
    		 score=1;
    	 }else{
    		 score=0;
    	 }
    	 $.ajax({
        	 url:"/moment/user/update",
        	 type:"post",
        	 data:{id:userid,
        		 score:score}
    	 });
    	 $(this).attr("data-fa","0");
    	 $(this).text("允许登录");
      });
     
     
     </script>
      
	</body>
</html>
