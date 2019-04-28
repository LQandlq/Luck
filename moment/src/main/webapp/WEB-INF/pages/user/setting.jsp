<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>账号设置</title>
    <link href="${path}/resources/user/css/bootstrap.min.css"  rel="stylesheet" />
    <link href="${path}/resources/user/css/cropper.min.css" rel="stylesheet">
    <link href="${path}/resources/user/css/main.css" rel="stylesheet">
    <link rel="shortcut icon"  href="${path}/resources/user/img/icon.jpg">
    <link rel="stylesheet" href="${path}/resources/user/css/setting.css" />
    <style type="text/css">
    	.exit{
            background: url(${path}/resources/user/fonts/tuichu.svg) no-repeat 4px 5px;
            background-size: 19px 24px;
            width: 35px;
        }
        .inform{
            background: url(${path}/resources/user/fonts/inform.svg) no-repeat 4px 5px;
            background-size: 19px 24px;
            width: 35px;
        }
        .user{
            background: url(${path}/resources/user/fonts/user.svg) no-repeat 4px 5px;
            background-size: 19px 24px;
            width: 35px;
        }
        .setting1{
            background: url(${path}/resources/user/fonts/setting1.svg) no-repeat 4px 5px;
            background-size: 19px 24px;
            width: 35px;
        }
       .like{
            background: url(${path}/resources/user/fonts/xihuan.svg) no-repeat 1px 3px;
            background-size:  16px 16px;
            width: 35px;
            display: inline-block;
            border: none;
            background-color: rgba(224, 224, 224, 0.84);
            float: right;
            cursor: pointer;
        }
        .collect{
           background: url(${path}/resources/user/fonts/shoucang.svg) no-repeat 0px -1px;
            background-size: 18px 26px;
            width: 35px;
            display: inline-block;
            border: none;
            background-color: rgba(224, 224, 224, 0.84);
            float: right;
            cursor: pointer;
        }
        .comment{
            background: url(${path}/resources/user/fonts/pinglun.svg) no-repeat -1px 1px;
            background-size: 19px 24px;
            width: 35px;
            display: inline-block;
            border: none;
            background-color: rgba(224, 224, 224, 0.84);
            float: right;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%-- <div class="top_content">
    <header>
        <div>
             <ul>
            <li>
                <a href="${path}/user/index.action"><img src="${path}/resources/user/img/logo.png" class="logo"></a>
            </li>
            <li>
                <a href="${path}/user/index.action">首页</a>
            </li>
            <li>
                <a href="">外拍</a>
            </li>
            <li>
                <a href="">论坛</a>
            </li>
            <li>
                <a href="">干货</a>
            </li>
            <li class="userCenter">
                <img src="${user.img}" class="userImg userImgCenter">
                    <ul class="centerList hidden">
                        <li>
                            <a href="${path}/user/center.action" class="user">个人中心</a>
                        </li>
                        <li>
                            <a href class="inform">重要通知</a>
                        </li>
                        <li>
                            <a href="${path}/user/setting.action" class="setting1">账号设置</a>
                        </li>
                        <li>
                            <a href="${path}/user/logout.action" class="exit">退出账号</a>
                        </li>
                    </ul>
            </li>
        </ul>
        </div>
       
    </header>
</div> --%>




    <h4>账号设置</h4>
    <hr>
    <div id="crop-avatar">

    <!-- Current avatar -->
    <label>用户头像</label>
    <div class="avatar-view" title="Change the avatar">
      	<img src="${user.img }" alt="用户头像" id="userImg">
    </div>
	
    <!-- Cropping modal -->
    <div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <form class="avatar-form" action="${path}/user/doupload.action" enctype="multipart/form-data" method="post">
            <div class="modal-header">
              <button class="close" data-dismiss="modal" type="button">&times;</button>
              <h4 class="modal-title" id="avatar-modal-label">头像上传</h4>
            </div>
            <div class="modal-body">
              <div class="avatar-body">

                <!-- Upload image and data -->
                <div class="avatar-upload">
                  <input class="avatar-src" name="avatar_src" type="hidden">
                  <input class="avatar-data" name="imgdata" type="hidden">
                  <label for="avatarInput">Local upload</label>
                  <input class="avatar-input" id="avatarInput" name="file" type="file">
                </div>

                <!-- Crop and preview -->
                <div class="row">
                  <div class="col-md-9">
                    <div class="avatar-wrapper"></div>
                  </div>
                  <div class="col-md-3">
                    <div class="avatar-preview preview-lg"></div>
                    <div class="avatar-preview preview-md"></div>
                    <div class="avatar-preview preview-sm"></div>
                  </div>
                </div>

                <div class="row avatar-btns">
                  <div class="col-md-3"></div>
                  <div class="col-md-6">
                    <button class="btn btn-primary btn-block avatar-save" type="submit">Done</button>
                  </div>
                  <div class="col-md-3"></div>
                </div>
              </div>
            </div>
            <!-- <div class="modal-footer">
              <button class="btn btn-default" data-dismiss="modal" type="button">Close</button>
            </div> -->
          </form>
        </div>
      </div>
    </div><!-- /.modal -->

    <!-- Loading state -->
    <div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
  </div>
  <hr>
    <form enctype="multipart/form-data" method="post" id="userForm" class="form-horizontal">
     <div class="form_group" hidden>
            <input type="text" name="id" value="${user.id}" id="userIDHidden">
            
        </div>
   
        <div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">用户昵称</label>
		<div class="col-sm-6">
			<input class="form-control" type="text" placeholder="请输入用户昵称" name="name" value="${user.name }">
		</div>
	</div>
	<div class="form-group">
	<label for="firstname" class="col-sm-2 control-label">绑定邮箱</label>
		<div class="col-sm-6">
			<input class="form-control" id="firstname" type="text" placeholder="未绑定" readonly name="email" value="${user.email }"
				   placeholder="请输入名字">
		</div>
	</div>
	
	<%-- <div class="form-group">
	<label for="firstname" class="col-sm-2 control-label">绑定手机</label>
		<div class="col-sm-6">
			<input class="form-control" type="text" placeholder="未绑定" readonly name="phonum" value="${user.phonum }">
		</div>
	</div>
 --%>	
      <%--   <div class="form_group">
            <label>用户昵称</label>
            <input type="text" placeholder="请输入用户昵称" name="name" value="${user.name }" >
        
        </div>
        <hr>
        
        <div class="form_group">
            <label>绑定邮箱</label>
            <input type="text" placeholder="未绑定" readonly name="email" value="${user.email }">
            
        </div>
        <hr>
        <div class="form_group">
            <label>绑定手机</label>
            <input type="text" placeholder="未绑定" readonly name="phonum" value="${user.phonum }">
           
        </div> --%>
         <hr>
        <div class="form_group pwd_block">
            <label for="firstname" class="col-sm-2 control-label">登录密码</label>
            <span class="set_pwd">编辑</span>
            <div class="hidden">
                <div class="form_group" >
                    <label>旧密码</label>
                    <input type="password" placeholder="请输入旧密码" id="oldPassword">
                    <p class="red oldFlag hidden">密码错误</p>
                    
                </div>
                <div>    
                    <label>新密码</label>
                    
                    <input type="password" placeholder="请输入新密码" disabled id="newPassword">
                    <p class="red newFlag hidden">密码格式不正确</p>
                </div>
                <div class="form_group" >
                    <label>确认密码</label>
                    <input type="password" placeholder="请再次输入密码" name="password" disabled id="passwordAgain">
                    
                    <p class="red againFlag hidden">两次密码不同</p>
                </div>
            </div>
        </div>
          <hr>
        <button class="sub_btn" id="subBtn">提交修改</button>
    </form>
    
    

<fotter>
</fotter>
<script src="${path}/resources/user/js/jquery-2.2.3.min.js"></script>
<script src="${path}/resources/user/js/bootstrap.min.js"></script>
<script src="${path}/resources/user/js/jquery.form.js"></script>
<script src="${path}/resources/user/js/cropper.min.js"></script>
<script src="${path}/resources/user/js/setting.js"></script>
<script src="${path}/resources/user/js/userImg.js"></script>
<script type="text/javascript"> 

//密码验证
$("#oldPassword").blur(function(){
	id=$("#userIDHidden").val();
	password=$("#oldPassword").val();
	var options={
			target:null,
			url:'/moment/user/validate.action?id='+id+"&password="+password,
			success:function(data){
				console.log(data);
				if(data.status==1){
					$(".oldFlag").addClass("hidden");
					$("#newPassword").removeAttr("disabled");
					$("#passwordAgain").removeAttr("disabled");
				}else{
					$(".oldFlag").removeClass("hidden");
				}
			},
			error:function(){
				$(".oldFlag").removeClass("hidden");
			}
	};
	//使用表单控件，进行异步更新数据
	$("#userForm").ajaxSubmit(options);
	return false;
});


$("#subBtn").click(function(){
	var options={
			target:null,
			url:'/moment/user/update.action',
			success:function(data){
				if(data.status==1){
					alert(data.msg);
					//window.location.href=window.location;
					parent.location.reload();
				}else{
					alert(dataobj.msg);
					//window.location.href=window.location;
					parent.location.reload();
				}
			},
			error:function(){
				alert("更新失败，请稍后再试");
			}
	};
	//使用表单控件，进行异步更新数据
	$("#userForm").ajaxSubmit(options);
	window.location.reload();
	return false;
	
});
</script>

</body>
</html>