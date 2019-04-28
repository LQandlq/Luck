<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>搜索展示</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/user/css/picture.css">
    <link rel="stylesheet" href="${path}/resources/user/css/adabase.css">
    <link rel="stylesheet" href="${path}/resources/user/less/index.css">
    <script type="text/javascript" src="${path}/resources/user/js/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="${path}/resources/user/js/r_f.js"></script>
   <style type="text/css">
   a{
   	color:white;
   };
   </style>
</head>
<body>
<div class="div_bg">



<div class="header">
    <div class="main">
        <a href="${path}/user/index"><img id="img1" src="${path}/resources/user/images/Looo.png"></a>
        <ul>
            <li class="zhaopian"><a href="${path}/pic/piclist">照片
                <!-- 下拉框 -->
                <div class="zhaopian_xl" id="genrediv">
                    <ul id="genre" >
                        <li><a href="pic_rm.html">热门</a></li>
                        <li><a href="${path}/user/piclist.jsp">流行</a></li>
                        <li><a href="pic_xx.html">新鲜</a></li>
                        <li><a href="pic_fg1.html">风光</a></li>
                        <li><a href="pic_rx.html">人像</a></li>
                        <li><a href="pic_hb.html">黑白</a></li>
                        <li><a href="pic_qt.html">其他</a></li>
                    </ul>
                </div>
            </a></li>
            <li><a href="index.html">商店</a></li>
            <li><a href="huodong.html">活动</a></li>
            <li><a href="login.html">器材</a></li>
            <li><a href="sheyou.html">摄友</a></li>


        </ul>
        <div class="div_sou"><img id="img2" src="${path}/resources/user/images/HD/hd19.png"><input id="sou_input" type="text"></div>
        <div class="div_dl"><a href="login.html">登录</a></div>
        <div class="div_zc"><a href="register.html">免费注册</a></div>
    </div>
</div>

<div class="content">
    <div class="c_head">
        <h2>正在流行-全部</h2>
        <ul>
            <a href=""><li>热门推荐</li></a>
            <a href=""><li>正在流行</li></a>
            <a href=""><li>新鲜出炉</li></a>
            <a href=""><li class="all">全部分类
                <!-- 下拉框 -->
                <div class="all_xl">
                    <ul>
                        <a href=""><li>全部</li></a>
                        <a href=""><li>人像</li></a>
                        <a href=""><li>黑白</li></a>
                        <a href=""><li>风光</li></a>
                        <a href=""><li>纪实</li></a>
                        <a href=""><li>街头</li></a>
                        <a href=""><li>建筑</li></a>
                        <a href=""><li>观念</li></a>
                        <a href=""><li>静物</li></a>
                        <a href=""><li>lomo</li></a>
                        <a href=""><li>体育</li></a>
                        <a href=""><li>动物</li></a>
                        <a href=""><li>微观</li></a>
                        <a href=""><li>植物</li></a>
                        <a href=""><li>食品</li></a>
                        <a href=""><li>时尚</li></a>
                        <a href=""><li>婚礼</li></a>
                        <a href=""><li>海外</li></a>
                        <a href=""><li>其他</li></a>
                    </ul>
                </div>
            </li></a>
        </ul>
    </div>
    <div class="hr_black main"></div>
    <div id="piclist">
    
    <div class="pic1">
        <ul>
            <li class="img">
                <img src="${path}/resources/user/images/LX/LX1.jpg" alt="">
                <div class="userdetails1">
                <div>
                    <p class="title"><a href="http://eput.com/photo/79335">天路</a></p>
                    <p class="title tit_s"><a href="http://eput.com/user/122959">sramX9</a></p>
                </div>
                 <label>45.1</label>
                </div>
                <div class="icon">
                    <i id="remark1">点赞</i>
                    <span class="left" id="num1">10</span>
                    
                    <em id="favorite1">收藏</em>
                    <span class="right" id="num2">10</span>
                    
                </div>
            </li>


            <li class="img">
                <img src="${path}/resources/user/images/LX/LX2.jpg" alt="">
                <div class="userdetails1">
                <div>
                    <p class="title"><a href="http://eput.com/photo/79335">2014.04.13，ren...</a></p>
                    <p class="title tit_s"><a href="http://eput.com/user/122959">鱼子</a></p>
                </div>
                 <label>45.3</label>
                </div>
                <div class="icon">
                    <i id="remark2">点赞</i>
                    <span class="left" id="num3">10</span>
                    
                    <em id="favorite2">收藏</em>
                    <span class="right" id="num4">10</span>
                    
                </div>
            </li>

            <li class="img">
                <img src="${path}/resources/user/images/LX/LX3.jpg" alt="">
                <div class="userdetails1">
                <div>
                    <p class="title"><a href="http://eput.com/photo/79335">swirl</a></p>
                    <p class="title tit_s"><a href="http://eput.com/user/122959">Mendowong</a></p>
                </div>
                 <label>49.1</label>
                </div>
                <div class="icon">
                    <i id="remark3">点赞</i>
                    <span class="left" id="num5">10</span>
                    
                    <em id="favorite3">收藏</em>
                    <span class="right" id="num6">10</span>
                    
                </div>
            </li>

            <li class="img4">
                <img src="${path}/resources/user/images/LX/LX4.jpg" alt="">
                <div class="userdetails1">
                <div>
                    <p class="title"><a href="http://eput.com/photo/79335">01</a></p>
                    <p class="title tit_s"><a href="http://eput.com/user/122959">黑音</a></p>
                </div>
                 <label>54.2</label>
                </div>
                <div class="icon">
                    <i id="remark4">点赞</i>
                    <span class="left" id="num7">10</span>
                    
                    <em id="favorite4">收藏</em>
                    <span class="right" id="num8">10</span>
                    
                </div>
            </li>

        </ul>
    </div>

    <div class="pic1">
        <ul>
            <li class="img"><img src="${path}/resources/user/images/LX/LX5.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">猫，杯子，影子</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">RunYu</a></p>
            </div>
                <label>46.1</label>
                </div>
                <div class="icon">
                    <i id="remark5" data-nub="1">点赞</i>
                    <span class="left" id="num9">10</span>
                    
                    <em id="favorite5">收藏</em>
                    <span class="right" id="num10">10</span>
                    
                </div>
            </li>
            <li class="img"><img src="${path}/resources/user/images/LX/LX6.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">Lupu bridge</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">Akrios余沈立</a></p>
            </div>
                <label>46.4</label>
                </div>
                <div class="icon">
                    <i id="remark6">点赞</i>
                    <span class="left" id="num11">10</span>
                    
                    <em id="favorite6">收藏</em>
                    <span class="right" id="num12">10</span>
                    
                </div>
            </li>
            <li class="img"><img src="${path}/resources/user/images/LX/LX7.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">行走的力量</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">旅人何生</a></p>
            </div>
                <label>53.1</label>
                </div>
                <div class="icon">
                    <i id="remark7">点赞</i>
                    <span class="left" id="num13">10</span>
                    
                    <em id="favorite7">收藏</em>
                    <span class="right" id="num14">10</span>
                    
                </div>
            </li>
            <li class="img4"><img src="${path}/resources/user/images/LX/LX8.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">a girl picki...</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">壹周摄影精选</a></p>
            </div>
                <label>51.3</label>
                </div>
                <div class="icon">
                    <i id="remark8">点赞</i>
                    <span class="left" id="num15">10</span>
                    
                    <em id="favorite8">收藏</em>
                    <span class="right" id="num16">10</span>
                    
                </div>
            </li>
        </ul>
    </div>
    <div class="pic1">
        <ul>
            <li class="img"><img src="${path}/resources/user/images/LX/LX9.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">上海之光</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">高亦克</a></p>
            </div>
                <label>52.4</label>
                </div>
                <div class="icon">
                    <i id="remark9">点赞</i>
                    <span class="left" id="num17">10</span>
                    
                    <em id="favorite9">收藏</em>
                    <span class="right" id="num18">10</span>
                    
                </div>
            </li>
            <li class="img"><img src="${path}/resources/user/images/LX/LX10.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">女神的镜子</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">陆伟同学</a></p>
            </div>
                <label>48.5</label>
                </div>
                <div class="icon">
                    <i id="remark10">点赞</i>
                    <span class="left" id="num19">10</span>
                    
                    <em id="favorite10">收藏</em>
                    <span class="right" id="num20">10</span>
                    
                </div>
            </li>
            <li class="img"><img src="${path}/resources/user/images/LX/LX11.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">水</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">旁观者</a></p>
            </div>
                <label>52.3</label>
                </div>
                <div class="icon">
                    <i id="remark11">点赞</i>
                    <span class="left" id="num21">10</span>
                    
                    <em id="favorite11">收藏</em>
                    <span class="right" id="num22">10</span>
                    
                </div>
            </li>
            <li class="img4"><img src="${path}/resources/user/images/LX/LX12.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">上海之心</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">甲壳虫</a></p>
            </div>
                <label>43.1</label>
                </div>
                <div class="icon">
                    <i id="remark12">点赞</i>
                    <span class="left" id="num23">10</span>
                    
                    <em id="favorite12">收藏</em>
                    <span class="right" id="num24">10</span>
                    
                </div>
            </li>
        </ul>
    </div>
    <div class="pic1">
        <ul>
            <li class="img"><img src="${path}/resources/user/images/LX/LX13.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">花花世界</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">周禹炀</a></p>
            </div>
                <label>42.3</label>
                </div>
                <div class="icon">
                    <i id="remark13">点赞</i>
                    <span class="left" id="num25">10</span>
                    
                    <em id="favorite13">收藏</em>
                    <span class="right" id="num26">10</span>
                    
                </div>
            </li>
            <li class="img"><img src="${path}/resources/user/images/LX/LX14.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">anantara</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">余沈立</a></p>
            </div>
                <label>52.3</label>
                </div>
                <div class="icon">
                    <i id="remark14">点赞</i>
                    <span class="left" id="num27">10</span>
                    
                    <em id="favorite14">收藏</em>
                    <span class="right" id="num28">10</span>
                    
                </div>
            </li>
            <li class="img"><img src="${path}/resources/user/images/LX/LX15.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">火树银花</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">蝎子大哥</a></p>
            </div>
                <label>45.3</label>
                </div>
                <div class="icon">
                    <i id="remark15">点赞</i>
                    <span class="left" id="num29">10</span>
                    
                    <em id="favorite15">收藏</em>
                    <span class="right" id="num30">10</span>
                    
                </div>
            </li>
            <li class="img4"><img src="images/LX/LX16.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">和光同尘</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">微良</a></p>
            </div>
                <label>48.1</label>
                </div>
                <div class="icon">
                    <i id="remark16">点赞</i>
                    <span class="left" id="num31">10</span>
                    
                    <em id="favorite16">收藏</em>
                    <span class="right" id="num32">10</span>
                    
                </div>
            </li>
        </ul>
    </div>
    <div class="pic1">
        <ul>
            <li class="img"><img src="${path}/resources/user/images/LX/LX17.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">海边的马蹄莲</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">circleyq</a></p>
            </div>
                <label>52.3</label>
                </div>
                <div class="icon">
                    <i id="remark17">点赞</i>
                    <span class="left" id="num33">10</span>
                    
                    <em id="favorite17">收藏</em>
                    <span class="right" id="num34">10</span>
                    
                </div>
            </li>
            <li class="img"><img src="${path}/resources/user/images/LX/LX18.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">山行</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">昊2的夏天</a></p>
            </div>

                            <label>47.1</label>
                </div>
                <div class="icon">
                    <i id="remark18">点赞</i>
                    <span class="left" id="num35">10</span>
                    
                    <em id="favorite18">收藏</em>
                    <span class="right" id="num36">10</span>
                    
                </div></li>
            <li class="img"><img src="${path}/resources/user/images/LX/LX19.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">深渊入口</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">木西AlexanDENG</a></p>
            </div>
                <label>56.3</label>
                </div>
                <div class="icon">
                    <i id="remark19">点赞</i>
                    <span class="left" id="num37">10</span>
                    
                    <em id="favorite19">收藏</em>
                    <span class="right" id="num38">10</span>
                    
                </div>
            </li>
            <li class="img4"><img src="${path}/resources/user/images/LX/LX20.jpg" alt=""><div class="userdetails1">
            <div>
                <p class="title"><a href="http://eput.com/photo/79335">日落</a></p>
                <p class="title tit_s"><a href="http://eput.com/user/122959">Sky Duanmu</a></p>
            </div>
                <label>46.3</label>
                </div>
                <div class="icon">
                    <i id="remark20">点赞</i>
                    <span class="left" id="num39">10</span>
                    
                    <em id="favorite20">收藏</em>
                    <span class="right" id="num40">10</span>
                    
                </div>
            </li>
        </ul>
    </div>
    </div>
    <!--页码-->
   <div class="column">
        <!-- <div class="pager">
            <ul>
                <li>
                    <em class="current"><b>1</b></em>

                    <span><a href="">2</a></span>
                    <span><a href="">3</a></span>
                    <span><a href="">4</a></span>
                    <span><a href="">5</a></span>
                    <span><a href="">6</a></span>
                    <span><a href="">7</a></span>
                    <span><a href="">8</a></span>
                    <span><a href="">9</a></span>
                    <span><a href="">10</a></span>
                    <span><a href="">11</a></span>
                    <span class="next_page"><a href="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></span>
                    <span style="display:none"><a href="">末页</a></span>
                </li>
            </ul>
        </div>-->
        <!--加载更多-->
<div class="yWrapp w jiazaigengduo clearfix">
    <div class="recommend-line"><a href="#" id="jiazaiDu">加载更多</a></div>
</div>
    </div>
 <!--页码end-->
</div>
<div class="ho_black "></div>
<div class="footer">
    <div class="main">
        <ul>
            <li><a href="">关于Mortal</a></li>
            <li><a href="">社区指南</a></li>
            <li><a href="">加入我们</a></li>
            <li><a href="">问题反馈</a></li>
            <li><a href="">Mortal blog</a></li>
            <li><a href="">官方微博</a></li>

        </ul>

        <span>Copyright &copy; Mortal.com LLC</span>
    </div>
</div>
</div>
<script>

function getlist(url,type){
//ajax 加载图片
if(typeof(url) == "undefined"){
	url="${path}/pic/getPicList";
}
$.ajax({
        	url:url,
        	type:"post",
        	data:{
        		type:type
        	},
        	success:function(data){
        		console.log(data);
        		var div='<div class="pic1"><ul>';
        		var enddiv='</ul></div>';
        		var li='';
        		for(var i=0;i<data.length;i++){
        			var ic="icon";
        			if(data[i].ed!=0){
        				ic="iconed"
        			}
        			if(i==0){
        				li=li+div;
        			}        		
        		li=li+'<li class="img"><a href="${path}/pic/single?sid='+data[i].id+'"><img src="'+data[i].picpath+'" alt=""></a><div class="userdetails1">'+
            '<div><p class="title"><a href="javascript:;">'+data[i].name+'</a></p>'+               
                '<p class="title tit_s"><a href="javascript:;">'+data[i].user.account+'</a></p></div>'+           
                '<label>46.1</label></div><div class="icon"><i id="remark5" data-imgid="'+data[i].id+'"  data-piclike="'+data[i].piclike+'" data-nub="1">点赞</i>  <span class="left" id="num9">10</span><em id="favorite5"  data-imgid="'+data[i].id+'" data-collect="'+data[i].collect+'">收藏</em><span class="right" id="num10">10</span></div></li>'   ;
        		if((i+1)%4==0&&i!=0||i==data[i].length){
    				li=li+enddiv;
    				if(i!=data[i].length){
    					li=li+div;
    				}
    			}        	
        		}
        		$("#piclist").html(li);
        	}
        });
}

getlist();

//加载分类
$.ajax({
	url:"${path}/pic/getgenre",
	type:"post",
	success:function(data){
		console.log(data);
		var height= data.length*44.8+'px';
		var html ='';
		for(var i=0;i<data.length;i++){
			html+='<li><a href="javascript:;" data-id="'+data[i].id+'">'+data[i].name+'</a></li>';
		}
		$("#genre").html(html);
		$("#genrediv").css("height",height);
	}
});


//分类检索
$("body").on('click',"[data-id]",function(){
	//cc("${path}/pic/getPicList",0,0,0,$(this).html());
	
	getlist("${path}/pic/getPicList",$(this).html());
	//console.log(rs);	
});

//点赞
$("body").on('click',"#remark5",function(){
	alert($(this).attr("data-imgid"));
	var imgid=$(this).attr("data-imgid");
	var piclike =$(this).attr("data-piclike");
	var rs = $(this).attr("data-nub");	
	cc("${path}/pic/change",imgid,"piclike",piclike,"",rs);
	if(rs=="1"){
	$(this).css("background-image","url(${path}/resources/user/img/zaned.png)");
	$(this).attr("data-nub","-1");
	//console.log("+1前"+piclike+"=======后："+(parseInt(piclike)+1));
	$(this).attr("data-piclike",parseInt(piclike)+1);
	}else{
	$(this).css("background-image","url(${path}/resources/user/images/remark.png)");
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
</script>
</body>
</html>