<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.admin.domain.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
		<script src="${path}/resources/user/js/bootstrap.min.js"></script>
		<script src="bootstrap-3.3.7-dist/js/bootstrapValidator.min.js"></script>
	
	<link rel="stylesheet" href="${path}/resources/user/css/comment.css">
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/bootstrap.min.css"/>	
		<link rel="stylesheet" type="text/css" href="bootstrap-3.3.7-dist/css/bootstrap-theme.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/main-style.css"/>
		<link href="${path}/resources/user/css/style1.css" rel="stylesheet">
		<script type="text/javascript" src="bootstrap-fileinput/js/fileinput.min.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap-fileinput/css/fileinput.min.css"/>
<script type="text/javascript" src="bootstrap-fileinput/js/fileinput_locale_zh.js"></script>
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
                  <li class="sub-menu" id="sub-menu">
                      <a class="#" onclick="showmenu()">
                          <span>图片管理</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub" id="sonlist"  style="display:none">
                          <li><a class="" href="adminimg.html">1</a></li>
                          <li><a class="" href="article-list.html">2</a></li>
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
      
      
      <div class="" id="main-content" style="margin-left: 180px;"> 
      	<div class="wrapper container" style="margin-top: 60px;"> 
      		<div class="row" id="row">
      			<div class="col-md-3">
								<div class="thumbnail">
									<a href="#" id="imghref2" onclick="imgva('imghref2')"><img class="feature-image img-responsive" src="/picture/a.jpg" style="height: 292px;width: 100%"></a>
									<div class="caption">
										<p>上传者:&nbsp;&nbsp;<a>LQ</a></p>
										<p>图片类型:&nbsp;&nbsp;<a>JPG</a></p>
										<p>图片大小:&nbsp;&nbsp;<a>1.3M</a></p>
										<p>像素:&nbsp;&nbsp;<a>1080*720</a></p>
										<p>
											<a href="#" class="btn btn-danger" data-toggle="modal" data-target="#about-modal">图片删除</a>
											<a href="#" class="btn btn-warning" data-toggle="modal" data-target="#about-modal1">评论删除</a>
											
										</p>
									</div>
								</div>
							</div>

							<div class="col-md-3">
								<div class="thumbnail">
									<img class="feature-image img-responsive" src="images/4.png">
									<div class="caption">
										<p>上传者:&nbsp;&nbsp;<a>LQ</a></p>
										<p>图片类型:&nbsp;&nbsp;<a>JPG</a></p>
										<p>图片大小:&nbsp;&nbsp;<a>1.3M</a></p>
										<p>像素:&nbsp;&nbsp;<a>1080*720</a></p>
										<p>
											<button type="button" class="btn btn-danger">图片删除</button>
											<button type="button" class="btn btn-warning">评论删除</button>
										</p>
									</div>
								</div>
							</div>

							<div class="col-md-3">
								<div class="thumbnail">
									<img class="feature-image img-responsive" src="images/4.png">
									<div class="caption">
										<p>上传者:&nbsp;&nbsp;<a>LQ</a></p>
										<p>图片类型:&nbsp;&nbsp;<a>JPG</a></p>
										<p>图片大小:&nbsp;&nbsp;<a>1.3M</a></p>
										<p>像素:&nbsp;&nbsp;<a>1080*720</a></p>
										<p>
											<button type="button" class="btn btn-danger">图片删除</button>
											<button type="button" class="btn btn-warning">评论删除</button>
										</p>
									</div>
								</div>
							</div>

							<div class="col-md-3">
								<div class="thumbnail">
									<img class="feature-image img-responsive" src="images/4.png" style="height: 292px">
									<div class="caption">
										<p>上传者:&nbsp;&nbsp;<a>LQ</a></p>
										<p>图片类型:&nbsp;&nbsp;<a>JPG</a></p>
										<p>图片大小:&nbsp;&nbsp;<a>1.3M</a></p>
										<p>像素:&nbsp;&nbsp;<a>1080*720</a></p>
										<p>
											<button type="button" class="btn btn-danger">图片删除</button>
											<button type="button" class="btn btn-warning">评论删除</button>
										</p>
									</div>
								</div>
							</div>
      			
      		</div>
      		
      	<div class="guide">
	<div class="guide-wrap">
		<a href="#" class="edit" title="发新帖" data-toggle="modal" data-target="#addimg"><span>添加</span></a>
	</div>
</div>
      		
      	</div>
      	
      
      
      </div>
      	
      	 <div class="modal fade" id="addimg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document" >
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">图片上传</h4>
      </div>
      <div class="modal-body" >
      	
      <form class="form-group" action=""  method="get">
                            
                           
                             <div class="form-group">
                                <label for="">图片上传</label>
                            <input type="file" name="image" class="file" />
                            </div>
                            
                            <div class="form-group">
                                <label for="">图片描述</label>
                                <textarea class="form-control" rows="3"></textarea>
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


      	 <div class="modal fade" id="about-modal" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">关于</h4>
                </div>
                <div class="modal-body">
                    <form class="form-group" action="adminimg.html" id="login" method="get">
                <div class="modal-body">
                  
                     <p>确定要删除这张图片吗？</p>            
                    <div class="text-right">
                                <button class="btn btn-primary" type="submit" id="btn-delete">确定</button>
                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
                     </div>
                </div>
                </form>
                </div>
                
            </div>
        </div>
    </div>	
    
    
     <div class="modal fade" id="about-modal1" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true" >
        <div class="modal-dialog"  style="width:1200px;">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">评论删除</h4>
                </div>
                <div class="modal-body" id="comment-show" style="height:600px;overflow-y:auto">
                   <table class="table table-hover">
	<caption>评论管理</caption>
	<thead>
		<tr>
			<th class="td2">评论</th>
			<th>用户</th>
			<th>时间</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="td1">阿斯顿发生发生大法师打发</td>
			<td class="td">Bangalore</td>
			<td class="td">2017.1.2</td>
			
			<td class="operationbtn">
				
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
		<tr>
			<td class="td1">Sachin</td>
			<td class="td">Mumbai</td>
			<td class="td">2017.8.3</td>
			
			<td class="operationbtn">
				
				
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
		<tr>
			<td>Uma</td>
			<td>Pune</td>
			<td>2017.10.1</td>
			
			<td class="operationbtn">
				
				
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
		<tr>
			<td>Uma</td>
			<td>Pune</td>
			<td>2017.11.3</td>
			
			<td class="operationbtn">
				
					
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
		<tr>
			<td>Uma</td>
			<td>Pune</td>
			<td>2017.12.25</td>
			
			<td class="operationbtn">
				
				
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
	</tbody>
</table>
                </div>
                
            </div>
        </div>
    </div>	
    <script type="text/javascript">
    $.ajax({
		url:"/moment/pic/getPicList",
		type:"post",
		success:function(data){
			console.log(data);
			if(data==""){
				$("#row").html('<p style="text-align: center;">您还没有收藏哦~</p>');
			}else{
				var html = "";
				for(var i=0;i<data.length;i++){
					var myDate = new Date(data[i].time);
					html+='<div class="col-md-3" data-fid="'+data[i].id+'">'+
					'<div class="thumbnail">'+
					'<a href="/moment/pic/single?sid='+data[i].id+'" target="_parent"><img class="feature-image img-responsive" src="'+data[i].picpath+'" style="width: 236px;height: 206px"></a>'+
					'<div class="caption">'+
					'<p>标题:&nbsp;&nbsp;<a>'+data[i].name+'</a></p>'+
					'<p style="width:180px;  overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">简介:&nbsp;&nbsp;<a class="">'+data[i].description+'</a></p>'+
					'<p>图片分类:&nbsp;&nbsp;<a>'+data[i].type+'</a></p>'+
					'<p>时间:&nbsp;&nbsp;<a>'+transtime(myDate)+'</a></p>'+
					'<p><a href="#" class="btn btn-danger" id="imgdel" data-toggle="modal" data-target="#about-modal" data-id="'+data[i].id+'">图片删除</a>'+
					'&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" id="remarklist" class="btn btn-warning" data-toggle="modal" data-target="#about-modal1" data-id="'+data[i].id+'">评论删除</a></p></div></div></div>';					
				}
				$("#row").html(html);				
			}
		}
		
	});
    
    function transtime(myDate){
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
      console.log("时间:"+now);
      return now;
      
	}
    
    $("body").on('click',"#imgdel",function(){		
		var id = $(this).attr("data-id");
		alert(id);
		$("#btn-delete").attr("data-id",id);
	});
	
	$("#btn-delete").on('click',function(){
		var id = $(this).attr("data-id");
		alert(id);
		 $.ajax({
			url:"/moment/pic/delete",
			type:"post",
			data:{id:id}
		}); 
		
		$("[data-fid='"+id+"']").remove();
		//$("#about-modal").css("display","none");
		$("#btn-close").click();
		if(!$("[data-fid]").length>0){
		$("#row").html('<p style="text-align: center;">您还没有作品哦~</p>');
		}
	});
	 $("body").on("click","#remarklist",function(){
		//alert("1111");
		var picid = $(this).attr("data-id")
		 $.ajax({
			url:"/moment/pic/comment/selectcomment",
			type:"post",
			data:{
				id:$(this).attr("data-id")
			},
			success:function(data){
				console.log(data);
				var html='';
				for(var i=0;i<data.length;i++){
					var myDate = new Date(data[i].time);
					var now = transtime(myDate);
					if(data[i].commentid!=0){
						console.log();
						html+='<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">'+data[i].username+': </a><span class="my-pl-con">'+data[i].content+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left removethis" data-fid="'+data[i].id+'">删除</a> <span class="pull-left date-dz-line"></span> </div> </div></div>';
					}else{
						if(i!=0){
							html+='</div></div></div>';
						}
				 html+='<div class="comment-show-con clearfix">'+
				'<div class="comment-show-con-img pull-left"><img src="'+data[i].userimg+'" alt=""></div>'+
				'<div class="comment-show-con-list pull-left clearfix">'+
				'<div class="pl-text clearfix"> <a href="#" class="comment-size-name" data-preid="1">'+data[i].username+' : </a>'+
				'<span class="my-pl-con">&nbsp;'+data[i].content+'</span></div><div class="date-dz">'+
				'<span class="date-dz-left pull-left comment-time">'+now+'</span>'+
				'<div class="date-dz-right pull-right comment-pl-block">'+
				'<a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left removethis" data-fid="'+data[i].id+'">删除</a>'+
				'<span class="pull-left date-dz-line"></span>'+
				'</div></div> <div class="hf-list-con">';
				if(i==data.length-1){
					html+='</div></div></div>';
				}
				
					}
				}
				
				$("#comment-show").html(html);
				
				$("#comment-show").attr("data-picid",picid);
			}
		}); 
	});
	 
	 $('body').on('click','.removethis',function(){
		 alert($(this).attr("data-fid"));
		 
	        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
	        if(oT.siblings('.all-pl-con').length >= 1){
	            oT.remove();
	        }else {
	            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
	            oT.remove();
	        }
	        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

	        $.ajax({
	        	url:"/moment/pic/comment/doDelete",
	        	type:"post",
	        	data:{id:$(this).attr("data-fid"),
	        		picid:$("#comment-show").attr("data-picid")
	        		}
	        });
	    });
    
    </script>
    
	</body>
</html>
