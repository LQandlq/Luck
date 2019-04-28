$(function(){
	function getlist(url,type,type2,offset){
		//type2 热度，最新
	//ajax 加载图片
	if(typeof(url) == "undefined"){
		url="//localhost:8080/moment/pic/getPicList";
	}
	/*alert("leixin："+type);
	alert("fangshi："+type2);*/
	$.ajax({
	        	url:url,
	        	type:"post",
	        	data:{
	        		type:type,
	        		type2:type2,
	        		offset:offset
	        	},
	        	success:function(data){
	        		console.log(data);
	        		var unm = $("#jiazaiDu").attr("data-last");
	        		
	        		var div='<div class="pic1 tz-gallery"><ul>';
	        		var enddiv='</ul></div>';
	        		var li='';
	        		if(data.length<16){
	        			if(data.length==0){
	        				alert("没有更多了 !");
	        			}
	        			$("#jiazaiDu").hide();;
	        		}else{
	        			if(unm=="0"){
	           			 $("#jiazaiDu").attr("data-last","16");
	           					  }else{
	           						$("#jiazaiDu").attr("data-last",parseInt(unm)+16); 
	           					  }
	        		}
	        		
	        		for(var i=0;i<data.length;i++){
	        			console.log("第"+i+"条：");
	        			var ic="icon";
	        			if(data[i].ed!=0){
	        				ic="iconed"
	        			}
	        			if(i==0){
	        				li=li+div;
	        			}        		
	        		li=li+'<li class="img"><a href="//localhost:8080/moment/pic/single?sid='+data[i].id+'"><img src="'+data[i].picpath+'" alt=""></a><div class="userdetails1">'+
	            '<div><p class="title"><a href="javascript:;">'+data[i].name+'</a></p>'+               
	                '<p class="title tit_s"><a href="javascript:;"></a></p></div>'+           
	                '<label>'+data[i].piclike+'</label></div><div class="icon"><a class="lightbox" href="'+data[i].picpath+'"><i id="remark51" data-imgid="'+data[i].id+'"  data-piclike="'+data[i].piclike+'" data-nub="1">点赞</i></a>  <span class="left" id="num9">10</span></div></li>'   ;
	        		if((i+1)%4==0&&i!=0){
	    				li=li+enddiv;
	    				if((i+1)!=16){
	    					console.log("errrrrrrr");
	    					console.log((i+1)!=16);
	    					li=li+div;
	    				}
	    			}        	
	        		}
	        		
	        		$("#piclist").append(li);
	        	}
	        });
	}
	if(find.length>0&&find!="null"){
		//alert("关键字查询");
		var url = "/moment/pic/getPicListByCondition";
		$("#jiazaiDu").attr("data-find",find);
		$(".headli").removeClass("active");
		var unm = $("#jiazaiDu").attr("data-last");
		getlist(url,find,null,unm);
		$("#mintitle").text("搜索 : "+find);
	}else{
		getlist2();
		var unm = $("#jiazaiDu").attr("data-last");
		$("#jiazaiDu").attr("data-type",'all');
		var num1 = parseInt(unm)+16;
		$("#jiazaiDu").attr("data-last",num1);
		//alert("分类查询");
		//getlist();	
	}

	//加载分类
	$.ajax({
		url:"/moment/pic/getgenre",
		type:"post",
		success:function(data){
			console.log(data);
			var height= data.length*44.8+'px';
			var html ='';
			for(var i=0;i<data.length;i++){
				html+='<li><a href="javascript:;" data-id="'+data[i].id+'" class="agenre" data-class="'+data[i].name+'">'+data[i].name+'</a></li>';
			}
			$("#genre").html(html);
			$(".dropdown-menu").html(html);
			
			$("#genrediv").css("height",height);
		}
	});


	//分类检索
	$("body").on('click',"[data-id]",function(){
		/*alert("分类检索");*/
		console.log($(".active").text());
		var classtype= $(this).attr("data-class");
		//getlist("${path}/pic/getPicList",classtype);
		var type = $("#jiazaiDu").attr("data-type");
		$("#jiazaiDu").attr("data-type",classtype);
		$("#jiazaiDu").attr("data-last","16");
		$("#jiazaiDu").attr("data-sort",$(".active").text());
		$("#piclist").html("");
		if($(".active").text()=="全部"){
			getlist2(classtype,null,null,null);
		}
		if($(".active").text()=="最新"){
			getlist2(classtype,null,null,"sadf");
		}
		if($(".active").text()=="热门"){
			getlist2(classtype,10,null,null);
		}
		if($(".active").text()=="关注"){
			getlist2(classtype,null,null,$(".userid").val());
		}
		
		$("#mintitle").text(classtype);
		
	});

	//热门点击事件
	$(".type2").on('click',function(){
		//alert($(this).html()+"===="+$("#mintitle").text());
		/* if($("#mintitle").text()=="全部"){
		getlist("${path}/pic/getPicList",null,$(this).html());
		}else{
		getlist("${path}/pic/getPicList",$("#mintitle").text(),$(this).html());
		$("#mintitle").text($(this).html());
		} */
		 if($("#mintitle").text()=="全部"){
			 if($(this).html()=="热门推荐"){
				 getlist2(null,10,null,null);
			 }else{
				 getlist2(null,null,null,"sadf");
			 }		
			}else{
				if($(this).html()=="热门推荐"){
					 getlist2($("#mintitle").text(),10,null,null);
				 }else{
					 getlist2($("#mintitle").text(),null,null,"sadf");
				 }
			/* getlist("${path}/pic/getPicList",$("#mintitle").text(),$(this).html());
			$("#mintitle").text($(this).html()); */
			} 
		
	});

	$(".headli").on('click',function(){
		$(".headli").removeClass("active");
		$(this).addClass("active");	
		 if($(this).text()=="全部"){
			 $("#mintitle").text("全部");
			 window.location.href = "${path}/pic/piclist";
		 }else{
			 var type = $("#mintitle").text();
			 //alert("当前选择的筛选："+type);
			// alert("当前排序方式:"+$(this).text());
			 //在分类查询中进行排序查询
			 $("#piclist").empty();
			 if($(this).text()=="热门"){
				 getlist2(type,10,null,null);
			 }else{
				 if($(this).text()=="最新"){
					 getlist2(type,null,null,"sadf");
				 }else{
					 //展示关注用户的作品
					 getlist2(type,null,null,$(".userid").val());
				 }
				 
			 }
		 }
	});

	//点赞
	$("body").on('click',"#remark5",function(){
		alert($(this).attr("data-imgid"));
		var imgid=$(this).attr("data-imgid");
		var piclike =$(this).attr("data-piclike");
		var rs = $(this).attr("data-nub");	
		cc("//localhost:8080/moment/pic/change",imgid,"piclike",piclike,"",rs);
		if(rs=="1"){
		$(this).css("background-image","url(//localhost:8080/moment/resources/user/img/zaned.png)");
		$(this).attr("data-nub","-1");
		//console.log("+1前"+piclike+"=======后："+(parseInt(piclike)+1));
		$(this).attr("data-piclike",parseInt(piclike)+1);
		}else{
		$(this).css("background-image","url(//localhost:8080/moment/resources/user/images/remark.png)");
		$(this).attr("data-nub","1");
		$(this).attr("data-piclike",parseInt(piclike)-1);
		}
	});

	//收藏
	$("body").on('click',"#favorite5",function(){
		alert($(this).attr("data-imgid"));
		 var imgid=$(this).attr("data-imgid");
		var collect =$(this).attr("data-collect");
		cc(imgid,"collect") 
	});



	function cc(url,imgid,type,num,listtype,rs){
		//rs判断点赞是+还是-，listtype判断是查全部还是分类，num当前图片的点赞数，
		var data;
		$.ajax({
			url:url,
			type:"post",
			data:{
				imgid:imgid,
				liketype:type,
				num:num,
				type:listtype,
				rs:rs
			}
		
		});
	}

	function getlist2(type,piclike,ed,ispublic){	
		$.ajax({
			url:"/moment/pic/selecthotpic",
			type:"post",
			data:{piclike:piclike,
					ed:ed,
					type:type,
					ispublic:ispublic
			},
			success:function(data){
				console.log(data);
				if(data.length<16){
					if(data.length==0){
						//判断是一个都没有还是没有更多了
						if($("#piclist").children().length==0){
							alert("没有找到什么东西 !");
						}else{
							alert("没有更多了 !");
						}
	    				
	    			}
	    			var unm = $("#jiazaiDu").hide();;
	    		}
	    		var div='<div class="pic1 tz-gallery"><ul>';
	    		var enddiv='</ul></div>';
	    		var li='';
	    		for(var i=0;i<data.length;i++){
//	    			console.log("第"+i+"条：");
	    			var ic="icon";
	    			if(data[i].ed!=0){
	    				ic="iconed"
	    			}
	    			if(i==0){
	    				li=li+div;
	    			}        		
	    		li=li+'<li class="img"><a href="//localhost:8080/moment/pic/single?sid='+data[i].id+'"><img src="'+data[i].picpath+'" alt=""></a><div class="userdetails1">'+
	        '<div><p class="title"><a href="javascript:;">'+data[i].name+'</a></p>'+               
	            '<p class="title tit_s"><a href="javascript:;"></a></p></div>'+           
	            '<label>'+data[i].piclike+'</label></div><div class="icon"><a class="lightbox" href="'+data[i].picpath+'"><i id="remark51" data-imgid="'+data[i].id+'"  data-piclike="'+data[i].piclike+'" data-nub="1">点赞</i> </a> <span class="left" id="num9">10</span></div></li>'   ;
	    		if((i+1)%4==0&&i!=0){
					li=li+enddiv;
					if((i+1)!=16){
						/*console.log("errrrrrrr");
						console.log((i+1)!=16);*/
						li=li+div;
					}
				}        	
	    		}
	    		
	    		$("#piclist").append(li);
	    		
	    		
			}
		});
	}



	$("#jiazaiDu").on('click',function(){
		var find = $("#jiazaiDu").attr("data-find");
		var type = $("#jiazaiDu").attr("data-type");
		var unm = $("#jiazaiDu").attr("data-last");
		alert(find);
		if(find!=''&&typeof(find) != "undefined"){
			//加载查询的更多
			alert("进find");
			getlist("/moment/pic/getPicListByCondition",find,null,unm);
		}else{
			//加载所选分类的更多
			var num1 = parseInt(unm)+16;
			$("#jiazaiDu").attr("data-last",num1);										
					if(type=="all"){
						type=null;
					}		
					getlist2(type,null,unm,null);
				
		}
	});


		//滚动条到页面底部加载更多案例 
	$(window).scroll(function(){
	 var scrollTop = $(this).scrollTop();    //滚动条距离顶部的高度
	 var scrollHeight = $(document).height();   //当前页面的总高度
	 var clientHeight = $(this).height();    //当前可视的页面高度
	/*alert("滚动条距离顶部的高度:"+scrollTop);
	alert("当前页面的总高度:"+scrollHeight);
	alert("当前可视的页面高度:"+(scrollTop + clientHeight));*/
	 // console.log("top:"+scrollTop+",doc:"+scrollHeight+",client:"+clientHeight);
	 if(scrollTop + clientHeight >= (scrollHeight-20)){   //距离顶部+当前高度 >=文档总高度 即代表滑动到底部 count++;         //每次滑动count加1
	 	/*alert("啥方法？");*/
	 //filterData(serviceTypeId,industryId,cityId,count); //调用筛选方法，count为当前分页数
	 }else if(scrollTop<=0){ 
	 //滚动条距离顶部的高度小于等于0 TODO
	 //alert("下拉刷新，要在这调用啥方法？");
	 }
	
	});	
});