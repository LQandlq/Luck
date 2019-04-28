<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*,com.moment.pic.domain.*,java.util.List"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
		<script src="${path}/resources/user/js/bootstrap.min.js"></script>
		<!-- <script src="bootstrap-3.3.7-dist/js/bootstrapValidator.min.js"></script> -->
		<%-- <script src="${path}/resources/user/js/scripts.js"></script> --%>
		<!-- <script src="js/jquery.nicescroll.js"></script> -->
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/bootstrap-3.3.7-dist/css/bootstrapValidator.min.css" />
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>	
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/bootstrap-3.3.7-dist/css/bootstrap-theme.css"/>
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/main-style.css"/>
		<link href="${path}/resources/user/css/style1.css" rel="stylesheet">
		
<!-- <script type="text/javascript" src="bootstrap-fileinput/js/fileinput.min.js"></script>
<link rel="stylesheet" type="text/css" href="bootstrap-fileinput/css/fileinput.min.css"/>
<script type="text/javascript" src="bootstrap-fileinput/js/fileinput_locale_zh.js"></script> -->
		<title></title>
		<style type="text/css">
			.title{
				font-size: 20px;
				line-height: 30px;
			}
		</style>
	</head>
	<body>
		
      
      
      
      	<div class="wrapper"> 
      		<div class="input-group" style="position: relative; left: 100px;">
      				<!--<button type="button" class="btn btn-info" data-toggle="modal" data-target="#alter">添加</button>-->
      					<button type="button" class="btn btn-info" id="add">添加</button>
     <!-- <input type="text" class="form-control" placeholder="请输入用户名">
      <span class="input-group-btn">
        <button class="btn btn-default" type="button">检索</button>
      </span>-->
    </div><!-- /input-group -->
      		<table class="table table-hover">
	<caption>用户管理</caption>
	<thead>
		<tr>
			<th>ID</th>
			<th>类别</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody class="tbody">
		<tr>
			<td>Tanmay</td>
			<td>Uma</td>
			<td class="operationbtn">
				
					<!--<button type="button" class="btn btn-info" data-toggle="modal" data-target="#alter">修改</button>
					<button type="button" class="btn btn-warning">禁止登陆</button>-->
					<button type="button" class="btn btn-danger">删除</button>
			</td>
		</tr>
		
	</tbody>
</table>
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

<script>
	 $.ajax({
		url:"/moment/pic/getgenre",
		type:'post',
		success:function(data){
			var html='';
			for(var i=0;i<data.length;i++){
				html=html+'<tr id="'+data[i].id+'">'+
				'<td>'+data[i].id+'</td>'+
				'<td>'+data[i].name+'</td>'+
				'<td class="operationbtn">'+
				'<button type="button" class="btn btn-danger delete" data-id="'+data[i].id+'">删除</button>'+
				'</td></tr>';	
				$(".tbody").html(html);
			}
		}
	});
	$("#add").on('click',function(){
		var val = prompt("请输入添加的分类：");
		if(val!=""){
			$.ajax({
				url:"/moment/pic/addgenre",
				type:'post',
				data:{name:val},
				success:function(data){
					if(data!=0){
						alert("添加成功！");
						window.location.reload();
						/* var html='';
						html=html+'<tr id="'+data+'">'+
						'<td>'+data+'</td>'+
						'<td>'+val+'</td>'+
						'<td class="operationbtn">'+
						'<button type="button" class="btn btn-danger" data-id="'+data+'">删除</button>'+
						'</td></tr>';
						$(".tbody").append(html); */
					}else{
						alert("添加失败！");
					}
					
				}
			});
		}		
	}); 
	
	$("body").on('click','.delete',function(){
		var id = $(this).attr('data-id');
	
		if(confirm("是否删除此分类！")){
		 $.ajax({
			url:'/moment/pic/deletegenre',
			type:"post",
			data:{sid:id},
			success:function(data){
				if(data!=0){
					$("#"+id).remove();
				}else{
					alert("删除失败！");
				}
			}
		}); 
		}
	});
	
	
</script>
     
      
	</body>
</html>
