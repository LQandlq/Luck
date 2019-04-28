<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*,com.moment.pic.domain.*"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>用户中心</title>
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/iconfont.css" tppabs="css/iconfont.css" />
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/personstyle.css" tppabs="css/personstyle.css" />
		<link rel="stylesheet" href="${path}/resources/user/bootstrap-3.3.7-dist/css/bootstrap.min.css" />
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
	</head>

	<body>
	<%UserVO user =(UserVO) session.getAttribute("user"); 
	UserVO otheruser =(UserVO) session.getAttribute("otheruser");
	boolean flag = false;
	 if(otheruser!=null){
		 user=otheruser;
		 flag=true;
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
					<%if(flag){ %>
					<div class="user-modify">
						<a href="#" data-toggle="modal" data-target="#exampleModal" style="color: white;">关注</a>
					</div> 
				<%}%>

				</div>
			</div>
		</div>
		<div class="main w1200">
			<div class="left">
				<ul>
				<%if(flag){ %>
				<li>
						<a href="#" class="active">
							<i class="icon iconfont icon-lingdang"></i>
							作品展示
						</a>
					</li>				
				<%}else{ %>
				<li>
						<a href="javascript:;" class="page" data-val="个人资料">
							<i class="icon iconfont icon-geren"></i>
							个人资料
						</a>
					</li>
					<li>
						<a href="javascript:;" class="page" data-val="作品">
							<i class="icon iconfont icon-lingdang"></i>
							作品
						</a>
					</li>
					<li>
						<a href="javascript:;" class="page" data-val="收藏">
							<i class="icon iconfont icon-fangzidichan"></i>
							收藏
						</a>
					</li>
					<%} %>
					<%-- <li>
						<a href="javascript:;" class="page" data-val="关注" name="<%=user.getId()%>">
							<i class="icon iconfont icon-wenda"></i>
							关注
						</a>
					</li> --%>
					
				</ul>
				
				 <!-- <div class="row">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="..." alt="...">
      <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
      </div>
    </div>
  </div>
</div> -->
				
				
			</div>
			<div class="right" style="height: 800px">
				<div class="tap">
					<span>系统消息</span>
				</div>
				<div class="container"  >
					<div class="no-doc" id="containdiv"  style="height: 700px;">
					<iframe src="${path}/user/setting.action" marginwidth="0" marginheight="0" width="105%" name="i" id="urlIframe" frameborder="0" height="100%"></iframe> 
						
						
						
						
						
						
						
						
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		<!--信息修改模态框-->
		<div class="modal fade " id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
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
</div>
<script type="text/javascript">
$(".page").on("click",function(){
	var type = $(this).attr("data-val");
	var url ="";
	switch (type) {
	case "作品":
		url="${path}/user/mypic";		
		break;
	case "收藏":
		url="${path}/user/collect";		
		break;
	case "个人资料":
		url="${path}/user/setting.action";	
		break;
	case "关注":
		//url="${path}//pic/userfollow?uid="+$(this).attr("name");
		//alert($(this).attr("name"));
		break;

	default:
		break;
	}
	$("#urlIframe").attr("src",url);
});

/* $.ajax({
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
			if(i==0||i%4==0){
				if(i!=0){
					html=html+'</div>';
				}
				html = html + '<div class="row">';
			}			
			  html = html+'<div class="col-sm-5 col-md-3">'+
			    '<div class="thumbnail">'+
			      '<img src="'+data[i].picpath+'" alt="..." class="img-rounded imgp" >'+
			      '<div class="caption">'+
			        '<h4 class="product-buyer-name">'+data[i].name+'</h4>'+
			       '<img src="${path}/resources/user/images/dianzaned.png" class="dip"/> <p class="ptitle" >&nbsp;'+data[i].piclike+'</p>'+
			      '</div></div></div>';			    			 
		}
		
		$(".no-doc").html(html);
	}
}); */


	
</script>
		
		
	</body>

</html>