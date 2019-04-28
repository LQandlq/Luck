$(function(){
	/*$("#shoucang").on('click',function(){
		var picid = $(this).attr("data-picid");
		var rs = $(this).attr("name");
		if(rs=="1"){
		$(this).attr('src','/moment/resources/user/images/shoucang (2).png');
		$(this).removeClass("btn-warning");	
		$(this).addClass("btn-default active");	
		}else{
			$(this).attr('src','/moment/resources/user/images/shoucang (1).png');
			$(this).removeClass("btn-default active");	
			$(this).addClass("btn-warning");	
		}
		$.ajax({
			url:"/moment/pic/change",
			type:"post",
			data:{
				imgid:picid,
				liketype:"collect",
				rs:rs
			}
		});
	});*/
	
	
	
	$("#dianzan").on('click',function(){
		var picid = $(this).attr("data-picid");
		var num = $(this).attr("data-num");
		var rs = $(this).attr("name");
		
		alert("点赞成功?????");
		
		$.ajax({
			url:"/moment/pic/change",
			type:"post",
			data:{
				imgid:picid,
				liketype:"piclike",
				num:num,
				rs:rs
			},
			success:function(data){
				alert("404");
			}
		});
		if(rs=="1"){
			$(this).attr('src','/moment/resources/user/images/dianzanred.png');
			$(this).attr("name","-1");
			$("#dianzanbtn").removeClass("btn-info");
			 $("#dianzanbtn").removeClass("btn-default active");
			 $("#dianzanbtn").html("以点赞 !");
			
		}else{
			$(this).attr('src','/moment/resources/user/images/dianzan.png');
			$(this).attr("name","1");
			console.log($("#dianzanbtn"));
		}
		
		
	});
	
	
	$.ajax({
		url:"comment/selectcomment",
		type:"post",
		data:{
			id:$("#picid").val()
		},
		success:function(data){
			console.log(data);
			
			var html='';
			for(var i=0;i<data.length;i++){
				var myDate = new Date(data[i].time);
				var now = transtime(myDate);
				if(data[i].commentid!=0){
					console.log();
					html+='<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">'+data[i].username+': </a><span class="my-pl-con">'+data[i].content+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <span class="pull-left date-dz-line"></span> </div> </div></div>';
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
			'<div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a>'+
			'<a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" data-fid="'+data[i].id+'">回复</a>'+
			'<span class="pull-left date-dz-line"></span>'+
			'</div></div> <div class="hf-list-con">';
			if(i==data.length-1){
				html+='</div></div></div>';
			}
			
				}
			}
			
			$("#comment-show").html(html);
                 
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
        //console.log("时间:"+now);
        return now;
        
	}
});