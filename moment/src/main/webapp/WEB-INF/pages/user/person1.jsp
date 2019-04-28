<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*,com.moment.pic.domain.*"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>用户中心</title>
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/iconfont.css" tppabs="css/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/personstyle1.css" tppabs="css/personstyle1.css" />
		<link rel="stylesheet" href="${path}/resources/user/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${path}/resources/user/css/dashboard.css" />
		<script src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
		<script src="${path}/resources/user/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
		<style type="text/css">
			a:hover{
				color: #337ab7;
			}
			.product-buyer-name {
max-width: 190px;
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
}
.followed{
background: #9f9f9f;
}
		</style>
	</head>

	<body>
		<%UserVO user =(UserVO) session.getAttribute("user"); 
	UserVO otheruser =(UserVO) session.getAttribute("otheruser");
	boolean flag = false;
	if(otheruser.getSex()=="you"){
		flag=true;
	}
	 if(otheruser!=null){
		 user=otheruser;		 
	 }
	%>
	
		<div class="header">
			<div class="bar">
				<div class="w1200">
					<span class="l"><a href="${path}/user/index"><img id="img1" src="${path}/resources/user/images/Looo.png" width="100" height="52"></a><font>用户中心</font></span>
					<span class="r"><a href="${path}/user/index"><i class="icon iconfont icon-dianyuan"></i>首页</a></span>
				</div>
			</div>
			<div class="user-info">
				<div class="w1200">
					<div class="user-headface" id="userid" data-userid="<%=user.getId() %>">
						<img src="<%=user.getImg() %>"/>
					</div>
					<div class="user-account">
						<p class="tip">下午好，<%=user.getName() %></p>
						<p class="account">
							<span>帐户名：<%=user.getName() %></span>
							<span>用户：<%=user.getAccount() %></span>
						</p>
					</div>
					<%if(!flag){ %>
					<div class="user-modify" id="followdiv" style="background: #62ab00" data-follow="0" data-fid="<%=user.getId() %>">
						<a href="#" data-toggle="modal" data-target="#exampleModal" id="followtext" style="color: white;" data-userid="<%=user.getId() %>">关注</a>
					</div> 
				<%}else{%>
					<div class="user-modify" style="background: #9f9f9f" id="followdiv" data-follow="1" data-fid="<%=user.getId() %>"> 
						<a  data-toggle="modal" data-target="#exampleModal" id="followtext" style="color: white;" data-userid="<%=user.getId() %>">已关注</a>
					</div>
				<%} %>

				</div>
			</div>
		</div>
		<div class="main w1200">
			<!-- <div class="left">
				<ul>
					<li>
						<a href="#" class="active">
							<i class="icon iconfont icon-lingdang"></i>
							作品画廊
						</a>
					</li>
					
				</ul>
			</div> -->
			<!-- <div class="right">
				<div class="tap">
					<span>作品展示</span>
				</div> -->
				
				<div class="page-header">
              <h1 class="page-title">
                画廊
              </h1>
              <div class="page-subtitle">1 - 12 of 1713 photos</div>
              
            </div>
				<style>
								.imgp{
									width: 190px; height: 243px;									
								}
								.dip{
									width: 25px;
									height: 25px;
								}
								.ptitle{
									display: inline;
									height: 25px;
									line-height: 25px;
								}
							</style>
				<div class="container">
					<!-- <div class="no-doc">								
					</div> -->
					  <div class="row row-cards">                     
             
            </div>
					
				</div>
			<!-- </div> -->
		</div>
		
		
		
		
		<!--信息修改模态框-->
		<!-- <div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">用户信息修改</h4>
            </div>

            <div class="modal-body">
                <form id="updateform">
                    <div class="form-group">
                        <label for="loginname" class="control-label">用户名:</label>
                        <input type="text" class="form-control" id="loginname" name="loginname">
                    </div>
                    <div class="form-group">
                        <label for="email" class="control-label">Email:</label>
                        <input type="text" class="form-control" id="email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="phone" class="control-label">电话:</label>
                        <input type="text" class="form-control" id="phone" name="phone">
                    </div>
                    <div class="form-group">
                        <label for="address" class="control-label">收货地址:</label>
                        <textarea class="form-control" id="address" name="address"></textarea>
                    </div>
                    <div class="text-right">
                        <span id="returnMessage" class="glyphicon"> </span>
                        <button type="button" class="btn btn-default right" data-dismiss="modal">关闭</button>
                        <button id="submitBtn" type="button" class="btn btn-primary">修改</button>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div> -->

		<script>
		 $.ajax({
				url:"/moment/pic/getmyPicList",
				type:'post',
				data:{
					oid:"5"
				},
				success:function(data){
					console.log("别人作者作品测试");
					console.log(data);
					var html = "";
					for(var i=0;i<data.length;i++){
						var time = getMyDate(data[i].time);
						/* if(i==0||i%4==0){
							if(i!=0){
								html=html+'</div>';
							}
							html = html + '<div class="row">';
						}			
						  html = html+'<div class="col-sm-5 col-md-3">'+
						    '<div class="thumbnail">'+
						      '<a href="${path}/pic/single?sid='+data[i].id+'"><img src="'+data[i].picpath+'" alt="..." class="img-rounded imgp" ></a>'+
						      '<div class="caption">'+
						        '<h4 class="product-buyer-name">'+data[i].name+'</h4>'+
						       '<h5>点赞: <span class="label label-default">'+data[i].piclike+'</span></h5>'+
						      '</div></div></div>';	 */	
						      
						      html=html+'<div class="col-sm-6 col-lg-4"> <div class="card p-3"> <a href="${path}/pic/single?sid='+data[i].id+'" class="mb-3">'+
						      ' <img src="'+data[i].picpath+'" class="rounded" style="height:233px;width:350px;"> </a>'+
						      ' <div class="d-flex align-items-center px-2"> <div>'+
						      '<div>'+data[i].name+'</div>'+
						      '<small class="d-block text-muted">'+time+'</small></div>'+
						      '<div class="ml-auto text-muted">'+
						      ' <a href="javascript:void(0)" class="icon"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span> 112</a>'+
						      '<a href="javascript:void(0)" class="icon d-none d-md-inline-block ml-3"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span> '+data[i].piclike+'</a>'+
						      ' </div></div></div></div>'
						      
					}
					
					//$(".no-doc").html(html);
					$(".row-cards").html(html);
					
				}
			});
		 
		 
		 
                
             
          
         
        
		 
		 
		 
		 
		 $("#followdiv").on('click',function(){
			var fl = $(this).attr("data-follow");
			var fid = $(this).attr("data-fid");
				opfollow(fid,fl);			
		 });
		 
		 function opfollow(fid,flag){
			 $.ajax({
				 url:"/moment/user/followuser",
				 type:"post",
				 data:{
					 fid:fid,
					 flag1:flag
				 },
				 success:function(data){
					 if(flag=="1"){
					 $("#followdiv").css("backgroud","#62ab00");
					 $("#followdiv").attr("data-follow","0");
					 $("#followtext").html("关注！");
					 alert("取消关注！");
					 }else{
						$("#followdiv").css("backgroud","#9f9f9f");
						 $("#followdiv").attr("data-follow","1");
						$("#followtext").html("已关注！");
						alert("成功关注！");
					 }
				 }
			 });
		 }
		 
		 function getMyDate(str){  
	            var oDate = new Date(str),  
	            oYear = oDate.getFullYear(),  
	            oMonth = oDate.getMonth()+1,  
	            oDay = oDate.getDate(),  
	            oHour = oDate.getHours(),  
	            oMin = oDate.getMinutes(),  
	            oSen = oDate.getSeconds(),  
	            oTime = oYear +'-'+ getzf(oMonth) +'-'+ getzf(oDay) +' '+ getzf(oHour) +':'+ getzf(oMin) +':'+getzf(oSen);//最后拼接时间  
	            return oTime;  
	        };  
	        //补0操作  
	        function getzf(num){  
	            if(parseInt(num) < 10){  
	                num = '0'+num;  
	            }  
	            return num;  
	        }
		 
		</script>
		
	</body>

</html>