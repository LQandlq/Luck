<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*,com.moment.pic.domain.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
		<script src="${path}/resources/user/js/bootstrap.min.js"></script>
		<script src="${path}/resources/user/js/bootstrapValidator.min.js"></script>
	
		<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/bootstrap.min.css"/>	
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
.feature-image{
/* width: 294px;
height: 294px; */
}
.line-limit-length {
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap; //文本不换行，这样超出一行的部分被截取，显示...
}

.product-buyer-name {
max-width: 110px;
overflow: hidden;
text-overflow: ellipsis;
white-space: nowrap;
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

      <div class="" id="main-content"> 
      	<div class="wrapper container"> 
      		<div class="row" id="row">
      			<div class="col-md-3">
								<div class="thumbnail">
									<a href="#" id="imghref2" onclick="imgva('imghref2')"><img class="feature-image img-responsive" src="/picture/a.jpg"></a>
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
									<img class="feature-image img-responsive" src="/picture/a.jpg">
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
									<img class="feature-image img-responsive" src="/picture/a.jpg">
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
									<img class="feature-image img-responsive" src="/picture/a.jpg">
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
									<img class="feature-image img-responsive" src="/picture/a.jpg">
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
                    <form class="form-group" id="login" method="get">
                <div class="modal-body">
                  
                     <p>确定要删除这张图片吗？</p>            
                    <div class="text-right">
                                <button class="btn btn-primary" type="button" id="btn-delete">确定</button>
                                <button class="btn btn-danger" data-dismiss="modal" id="btn-close">取消</button>
                     </div>
                </div>
                </form>
                </div>
                
            </div>
        </div>
    </div>	
    
    
     <div class="modal fade" id="about-modal1" tabindex="-1" role="dialog" aria-labelledby="modal-label"
         aria-hidden="true" >
        <div class="modal-dialog"  style="width:800px;">
            <div class="modal-content" >
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span
                            aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
                    <h4 class="modal-title" id="modal-label">评论删除</h4>
                </div>
                <div class="modal-body" >
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
    
	</body>
	<script type="text/javascript">
	//加载自己上传的作品
	$.ajax({
		url:"/moment/pic/getmyPicList",
		type:"post",
		success:function(data){
			console.log(data);
			if(data==""){
				$("#row").html('<p style="text-align: center;">您还没有作品哦~</p>');
			}else{
				var html = "";
				for(var i=0;i<data.length;i++){
					var myDate = new Date(data[i].time);
					html+='<div class="col-md-3" data-fid="'+data[i].id+'">'+
					'<div class="thumbnail">'+
					'<img class="feature-image img-responsive" src="'+data[i].picpath+'" style="width: 236px;height: 206px">'+
					'<div class="caption">'+
					'<p>标题:&nbsp;&nbsp;<a>'+data[i].name+'</a></p>'+
					'<p style="width:180px;  overflow:hidden; white-space:nowrap; text-overflow:ellipsis;">简介:&nbsp;&nbsp;<a class="">'+data[i].description+'</a></p>'+
					'<p>图片分类:&nbsp;&nbsp;<a>'+data[i].type+'</a></p>'+
					'<p>时间:&nbsp;&nbsp;<a>'+transtime(myDate)+'</a></p>'+
					'<p><a href="#" class="btn btn-danger" id="imgdel" data-toggle="modal" data-target="#about-modal" data-id="'+data[i].id+'">图片删除</a></p></div></div></div>';
					//'&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="btn btn-warning" data-toggle="modal" data-target="#about-modal1" data-id="'+data[i].id+'">评论删除</a></p></div></div></div>';					
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
		//alert(id);
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
	
	</script>
</html>
