<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="p" uri="/WEB-INF/PageElPermission.tld" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${path}/resources/admin/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/admin/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/admin/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${path}/resources/admin/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${path}/resources/admin/static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
		<form class="cateaddform" method="post" action="" target="_self">
			<input type="text" placeholder="分类名称" value="" class="input-text cateinput" style="width:120px">
			<button type="button" class="btn btn-success" id="" name="" onClick="cate_add(this);"><i class="Hui-iconfont">&#xe600;</i> 添加</button>
		</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="80">ID</th>
				<th>分类</th>
				<th width="80">状态</th>				
				<th width="180">操作</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${path}/resources/admin/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${path}/resources/admin/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${path}/resources/admin/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${path}/resources/admin/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${path}/resources/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${path}/resources/admin/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${path}/resources/admin/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存		
		ajax : "//localhost:8080/moment/admin/getcategory",
		columns: [
			{
		        "data": "checkbox",
		        "sDefaultContent":"",  //默认空字符串
		        "sClass": "text-center"
		    },
		    {
		    	"orderable" : true,
		        "data": "id",
		        "sDefaultContent":"",  //默认空字符串
		        "sClass": "text-center"
		    },
		    {
		    	"orderable" : true,
		        "data": "name",
		        "sDefaultContent":"",  //默认空字符串
		        "sClass": "text-center"
		    }, 
		    {
		        "data": "tablestate",
		        "sDefaultContent":"",  //默认空字符串
		        "sClass": "td-status"
		    },
		    {
		        "data": "option",
		        "sDefaultContent":"",  //默认空字符串
		        "sClass": "td-manage"
		    }]
		    
				
	});
	
});

function active_del(obj,index){
	layer.confirm('确认要删除吗？',function(index){
		var cateid=$(obj).attr('data-cateid');
		$.ajax({
			type: 'POST',
			url: '/moment/admin/delcategory',
			 data:{idlist:cateid},
			success: function(data){		
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon: 5,time:1000});
			},
			error:function(data) {
				console.log("删除失败！");
			}
		});	
	});
}

//批量删除
function datadel(){
	 var spCodesTemp = "";
	var $ele =  $('input:checkbox[name=catecheckbox]:checked').parent().parent();
	       $('input:checkbox[name=catecheckbox]:checked').each(function(i){
	        if(0==i){
	         spCodesTemp = $(this).val();
	        }else{
	         spCodesTemp += (","+$(this).val());
	        }
	       });	
	 alert(spCodesTemp);
	 $.ajax({
			type: 'POST',
			url: '//localhost:8080/moment/admin/delcategory',
			data:{idlist:spCodesTemp},
			success: function(data){
					$ele.each(function(){
						 $(this).remove();
						});
					layer.msg('批量删除成功!',{icon:1,time:1000});									
			},
			error:function() {
				console.log("批量删除失败！");
			}
		});		   	
}

function cate_start(obj,index){
	layer.confirm('确认要启用吗？',function(index){
		var cateid=$(obj).attr('data-cateid');
		$.ajax({
			type: 'POST',
			url: '//localhost:8080/moment/admin/upcategory',
			data:{idlist:cateid,
				state:0},
			success: function(data){		
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="cate_start(this,id)" data-cateid="'+cateid+'" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();									
				layer.msg('停用成功!',{icon:1,time:1000});									
			}
		});
	});	
}

function cate_stop(obj,index){
	layer.confirm('确认要停用吗？',function(index){
		var cateid=$(obj).attr('data-cateid');
		$.ajax({
			type: 'POST',
			url: '//localhost:8080/moment/admin/upcategory',
			data:{idlist:cateid,
				state:1},
			success: function(data){		
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="cate_start(this,id)" data-cateid="'+cateid+'" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();									
				layer.msg('停用成功!',{icon:1,time:1000});									
			}
		});
	});	
}

//添加分类
function cate_add(obj){
	if($(".cateinput").val()==""){
		alert("请输入分类名");
	}else{		
		$.ajax({
			type: 'POST',
			url: '//localhost:8080/moment/admin/findcateByName',
			data:{catename:$(".cateinput").val(),
				state:1},
			success: function(data){		
				if(data==0){
					window.location.reload();
				}else{
					layer.msg('分类已存在!',{icon:1,time:1000});
				}
				
			}
		});
	}
}

</script> 
</body>
</html>