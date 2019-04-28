<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>删除的用户</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 删除的用户<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入会员名称、电话、邮箱" id="" name="">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> <span class="r">共有数据：<strong>88</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="80">ID</th>
				<th width="100">用户名</th>
				<th width="40">性别</th>
				<th width="90">手机</th>
				<th width="150">邮箱</th>
				<th width="">地址</th>
				<th width="130">加入时间</th>
				<th width="70">状态</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
			<tr class="text-c">
				<td><input type="checkbox" value="1" name=""></td>
				<td>1</td>
				<td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','360','400')">张三</u></td>
				<td>男</td>
				<td>13000000000</td>
				<td>admin@mail.com</td>
				<td class="text-l">北京市 海淀区</td>
				<td>2014-6-11 11:11:42</td>
				<td class="td-status"><span class="label label-danger radius">已删除</span></td>
				<td class="td-manage"><a style="text-decoration:none" href="javascript:;" onClick="member_huanyuan(this,'1')" title="还原"><i class="Hui-iconfont">&#xe66b;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
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
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		],
		ajax : "${path}/admin/getfakedeleteuserlist",
		columns: [
			{
		        "data": "password",
		        "sDefaultContent":"",  //默认空字符串
		        "sClass": "text-center"
		    },
    	    {
		        "data": "id",
		        "name" : "id",
		        "sDefaultContent":"",  //默认空字符串
		        "sClass": "text-center"
		    },
		    {
			    "orderable" : false,
				"data": "name",		        	
				'sClass': "text-center"		         		        	
			},		        
			{
				"orderable" : false,
				"data": "sex",	        	
				'sClass': "text-center"	 	         	       	
			 },		        
			{
				"orderable" : false,
				"data": "phonum",	        	
				'sClass': "text-center"	 	         	       	
			},		        
			{
				"orderable" : false,
				"data": "email",	        	
				'sClass': "text-center"	 	         	       	
			},		        
			{
				"orderable" : false,
				"data": "account",	        	
				'sClass': "text-center"	 	         	       	
			},		        
			{
				"orderable" : false,
				"data": "time",	        	
				'sClass': "text-center"	 	         	       	
			},		        
			{
				"orderable" : false,
				"data": "salt",	        	
				'sClass': "td-status"	 	         	       	
			},		        
			{
				"orderable" : false,
				"data": "img",	        	
				'sClass': "td-manage"	 	         	       	
			}
			
    	]
	});
});

/*用户-还原*/
function member_huanyuan(obj,id){
	layer.confirm('确认要还原吗？',function(index){	
		 $(obj).parents("tr").remove();
		var userid = $(obj).attr('data-userid');
		var flag =1;
		 $.ajax({
				type: 'POST',
				url: '/moment/admin/allowuser',
				data:{id:userid},
				success: function(data){
					if(data==0){
						flag=0;
						layer.msg('还原成功!',{icon:1,time:1000});					
					}					
					else
						console.log("还原失败！");
					
				},
				error:function() {
					console.log("还原失败！");
				},
			});				
	});
}

/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		var userid = $(obj).attr('data-userid');
		 $.ajax({
				type: 'POST',
				url:'/moment/admin/deleteuserbyID',
				data:{id:userid},
				success: function(data){
					if(data==0){
						$(obj).parents("tr").remove();
						layer.msg('删除成功!',{icon:1,time:1000});					
					}					
					else
						console.log("删除失败！");
					
				},
				error:function() {
					console.log("删除失败！");
				}
			});	
	});
}

//批量删除用户
function datadel(){
	 var spCodesTemp = "";
	var $ele =  $('input:checkbox[name=user]:checked').parent().parent();
	       $('input:checkbox[name=user]:checked').each(function(i){
	        if(0==i){
	         spCodesTemp = $(this).val();
	        }else{
	         spCodesTemp += (","+$(this).val());
	        }
	       });	 
	 var idlist = spCodesTemp.split(",");
	 $.ajax({
			type: 'POST',
			url: '/moment/admin/deleteuserlist',
			data:{idlist:idlist},
			success: function(data){
				if(data==0){
					$ele.each(function(){
						 $(this).remove();
						});
					layer.msg('批量删除成功!',{icon:1,time:1000});					
				}					
				else
					console.log("批量删除失败！");
				
			},
			error:function() {
				console.log("批量删除失败！");
			},
		});		   	
}
</script> 
</body>
</html>