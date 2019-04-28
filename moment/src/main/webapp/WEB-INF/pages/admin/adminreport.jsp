<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.admin.domain.*"%>
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
<title>图片列表</title>
</head>
<body>

<div class="page-container">
	
<!-- 	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="picture_add('添加图片','picture-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加图片</a></span> <span class="r">共有数据：<strong>54</strong> 条</span> </div> -->
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="40">ID</th>
					<th width="">名称</th>
					<th width="100">封面</th>
					<th>分类</th>
					<th width="">作者</th>
					<th width="150">发布时间</th>
					<th width="60">发布状态</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<tr class="text-c">
					<td><input name="" type="checkbox" value=""></td>
					<td>001</td>
					<td>分类名称</td>
					<td><a href="javascript:;" onClick="picture_edit('图库编辑','picture-show.html','10001')"><img width="210" class="picture-thumb" src="temp/200x150.jpg"></a></td>
					<td class="text-l"><a class="maincolor" href="javascript:;" onClick="picture_edit('图库编辑','picture-show.html','10001')">现代简约 白色 餐厅</a></td>
					<td class="text-c">标签</td>
					<td>2014-6-11 11:11:42</td>
					<td class="td-status"><span class="label label-success radius">已发布</span></td>
					<td class="td-manage"><a style="text-decoration:none" onClick="picture_stop(this,'10001')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a style="text-decoration:none" class="ml-5" onClick="picture_edit('图库编辑','picture-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,8]}// 制定列不参与排序
	],
	bLengthChange: false,
	ajax : "${path}/admin/getpiclist",
	columns: [
		{
	        "data": 'checkbox',
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
			"data": "picpath",	        	
			'sClass': "text-center"	 	         	       	
		 },		        
		{
			"orderable" : false,
			"data": "type",	        	
			'sClass': "text-center"	 	         	       	
		},		        
		{
			"orderable" : false,
			"data": "user.name",	        	
			'sClass': "text-center"	 	         	       	
		},		        
		{
			"orderable" : false,
			"data": "time",	        	
			'sClass': "text-center"	 	         	       	
		},		        
		{
			"orderable" : false,
			"data": "ispublic",	        	
			'sClass': "td-status"	 	         	       	
		},		        
		{
			"orderable" : false,
			"data": "option",	        	
			'sClass': "td-manage"	 	         	       	
		}
		
	]	
});

/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*图片-查看*/
function picture_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*图片-审核*/
function picture_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过'], 
		shade: false
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="picture_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
var upflag = null;
//更新举报处理
function upreport(id,state){
	var rs =0;
	$.ajax({
		url:'/moment/report/updaterport',
		type:"post",
		data:{
			sid:id,
			state:state
		}
	});

	
}

/*图片-下架*/
function picture_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){		
		var rs = upreport(id,"下架");
		
		
			$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
			$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
			$(obj).remove();
			layer.msg('已下架!',{icon: 5,time:1000});
		
	});
}

/*图片-发布*/
function picture_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		var rs = upreport(id,"发布");
		
			$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
			$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
			$(obj).remove();
			layer.msg('已发布!',{icon: 6,time:1000});
		
		
		
	});
}



/*图片-申请上线*/
function picture_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

/*图片-编辑*/
function picture_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*图片-删除*/
function picture_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		alert(id);
		 $.ajax({
			type: 'POST',
			url: '/moment/pic/delete',
			data:{
				id:id
			},
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	 
	});
}


/* $.ajax({
	url:'/moment/report/selectport',
	type:'post',
	success:function(data){
		upflag=data;
		console.log(upflag);
		var html = '';
		for(var i=0;i<data.length;i++){
			var time = getMyDate(data[i].time);
			html = html+'<tr class="text-c"><td><input name="" type="checkbox" value=""></td>'+
			'<td>'+data[i].report.id+'</td>'+
			'<td>'+data[i].name+'</td>'+
			'<td><a href="${path}/pic/single?sid='+data[i].id+'"><img width="210" class="picture-thumb" src="'+data[i].picpath+'"></a></td>'+
			'<td class="text-l">'+data[i].description+'</td>'+
			'<td class="text-c">'+data[i].report.description+'</td>'+
			'<td>'+time+'</td>';
			if(data[i].state==1){
				html=html+'<td class="td-status"><span class="label label-defaunt radius">已下架</span></td>'+
				'<td class="td-manage"><a style="text-decoration:none" onClick="picture_start(this,'+"'"+data[i].id+"'"+')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a><a style="text-decoration:none" class="ml-5" onClick="picture_edit('+"'图库编辑'"+','+"'picture-add.html'"+','+"'10001'"+')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'+"'"+data[i].id+"'"+')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>';
			}else{
				html=html+'<td class="td-status"><span class="label label-success radius">已发布</span></td>'+
				'<td class="td-manage"><a style="text-decoration:none" onClick="picture_stop(this,'+"'"+data[i].id+"'"+')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a> <a style="text-decoration:none" class="ml-5" onClick="picture_edit('+"'图库编辑'"+','+"'picture-add.html'"+','+"'10001'"+')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'+"'"+data[i].id+"'"+')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>';
			}
			
			html=html+'</tr>';
			
			$("#tbody").html(html);
		}
	}
}); */

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