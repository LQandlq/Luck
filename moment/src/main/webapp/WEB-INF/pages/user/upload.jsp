<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/picture.css">
		<link rel="stylesheet" href="${path}/resources/user/css/bootstrap.min.css" />
    	<script type="text/javascript" src="${path}/resources/user/js/jquery-1.7.2.js"></script>
    	
    	<link rel="stylesheet" href="${path}/resources/user/control/css/zyUpload.css" type="text/css">
    	<link rel="stylesheet" href="${path}/resources/user/css/fileinput.min.css" type="text/css">
    	
    	<!-- 引用核心层插件 -->
		<script type="text/javascript" src="${path}/resources/user/js/zyFile.js"></script>
		<!-- 引用控制层插件 -->
		<script type="text/javascript" src="${path}/resources/user/control/js/zyUpload.js"></script>
		<!-- 引用初始化JS -->
		<script type="text/javascript" src="${path}/resources/user/js/demo.js"></script>
		<style type="text/css">
		.file {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
		</style>
		<script type="text/javascript">
        var objWin;
        function openPage() {
            var target = "http://www.baidu.com";
              //判断是否打开
            if (objWin == null || objWin.closed) {
                objWin = window.open(target);
            } else {
                objWin.location.replace(target);
            }
            //objWin.focus();
        }     
</script>
	</head>
	<body>
		<div class="header">
    <div class="main">
        <a href="${path}/user/index"><img id="img1" src="${path}/resources/user/images/Looo.png"></a>
        <ul>
            <li class="zhaopian"><a href="${path}/pic/piclist">照片
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
            <li><a href="huodong.html">活动</a></li>
            <li><a href="sheyou.html">摄友</a></li>

           
        </ul>
       <div class="div_sou"><img id="img2" src="${path}/resources/user/images/HD/hd19.png"><input id="sou_input" type="text"></div>
        <%
       UserVO user= (UserVO)session.getAttribute("user");
       if(user==null){%>       
       <div class="div_dl"><a href="login.html">登录</a></div>
        <div class="div_zc"><a href="register.html">免费注册</a></div>
        <%} else{%>
        <div style="float: right;">       
        <ul >
            <li class="zhaopian"><a href="person.htm"><%=user.getAccount() %>
                <!-- 下拉框 -->
                <div class="zhaopian_xl" style="height: 120px;">
                    <ul>
                        <li><a href="${path}/user/person">个人中心</a></li>
                        <li><a href="${path}/user/upload">上传作品</a></li>
                        <li><a href="pic_xx.html">注销</a></li>                        
                    </ul>
                </div>
            </a></li>
        </ul>
        </div>
        <%} %>
    </div>
</div>


<div class="content">
    <div class="c_head">
        <h2>作品上传</h2>
        <ul>
            <a href=""><li>热门推荐</li></a>
            <a href=""><li>正在流行</li></a>
            <a href=""><li>新鲜出炉</li></a>            
        </ul>
    </div>
    <div class="hr_black main"></div>
    <div style="width: 1200px; background: white; margin-left: 200px; margin-top: 80px; padding: 50px;">
    	<form class="form-horizontal" role="form" action="${path}/pic/uploads" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">标题</label>
    <div class="col-sm-8">
      <input type="text" class="form-control" id="firstname" placeholder="请输入名字" name="name">
    </div>
  </div>
  
  <div class="form-group">
      <label for="firstname" class="col-sm-2 control-label">分类</label>
    <div class="col-sm-8">
    <select class="form-control" id="genre" name="type">
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
      <option>5</option>
    </select>
   </div>
  </div>
  
  <div class="form-group">
      <label for="firstname" class="col-sm-2 control-label">简介</label>
    <div class="col-sm-8">
    <textarea class="form-control" rows="3" name="description"></textarea>
   </div>
  </div>
  
  <div class="form-group">
      <label for="firstname" class="col-sm-2 control-label">上传图片</label>
    <div class="col-sm-8">
		<input id="input-1a" type="file" class="file" data-show-preview="false" name="files"> 
   </div>
  </div>
 <!--  <input type="file" name="files"> -->
   
       <div class="form-group" style="text-align: center;">
    <button type="submit" id="bbt" class="btn btn-primary btn-lg">提交发布</button>
    
  </div>

 
</form>

 

    </div>
  
    
    
    
  
    
    
   
  
</div>
<div class="ho_black "></div>
<script type="text/javascript">
$.ajax({
	url:"${path}/pic/getgenre",
	type:"post",
	success:function(data){
		console.log(data);
		var html ='';
		for(var i=0;i<data.length;i++){
			html+='<option>'+data[i].name+'</option>';
		}
		$("#genre").html(html);
	}
});

</script>


	</body>
</html>
