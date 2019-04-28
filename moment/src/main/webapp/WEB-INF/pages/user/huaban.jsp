<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head><link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" type="text/css" href="${path}/resources/user/css/indexhuaban.css">
    <meta charset="UTF-8">
    <title>图享</title>
    <link rel="stylesheet" href="${path}/resources/user/css/adabase.css">
    <link rel="stylesheet" href="${path}/resources/user/less/index.css">
    <link rel="stylesheet" href="${path}/resources/user/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/resources/user/chatroom/css/Lobibox.min.css"/>        
	<link rel="stylesheet" type="text/css" href="${path}/resources/user/bootstrap-fileinput/css/fileinput.min.css"/>
<script type="text/javascript">
</script>
</head>
<body>
<!--导航栏-->
<style>
    body{
        background-color: #f0f4fb;
    }
    .lobibox-notify{
        right: -700px;
        font-size: 12px;
        color: white;
    }
</style>
 <%UserVO user= (UserVO)session.getAttribute("user");%>
<div class="header">
    <div class="main">
        <img id="img1" src="${path}/resources/user/images/Looo.png">
        <ul>
        <li><a href="${path}/user/index">首页</a></li>
            <li class="zhaopian"><a href="${path}/pic/piclist">作品
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
            <li><a href="${path}/pic/gettop">排行榜</a></li>
            <%-- <li><a href="${path}/pic/userfollow?uid=<%=user.getId() %>">画友</a></li> --%>
			<li><a href="${path}/chatroom" target="view_window">聊天室</a></li>
          <!--  <input type="button" value="open" onclick="toUserChat()"> -->
        </ul>
        <form action="${path}/pic/piclist" id="smallfind">
        <div class="div_sou"><img id="img2" src="${path}/resources/user/images/HD/hd19.png">
            <input id="sou_input" type="text" name="find">
        </div>
        </form>
             
       <%if(user==null){%>       
       <div class="div_dl"><a href="login.html">登录</a></div>
        <div class="div_zc"><a href="register.html">免费注册</a></div>
        <%} else{%>
        <div style="float: right;">       
        <ul >
            <li class="zhaopian"><%=user.getAccount() %>
                <!-- 下拉框 -->
                <div class="zhaopian_xl" style="height: 160px;">
                    <ul>
                        <li><a href="${path}/user/person">个人中心</a></li>
                        <li><a <%-- href="${path}/user/upload" --%> data-toggle="modal" data-target="#alter">上传作品</a></li>
                        <li><a href="${path}/pic/userfollow?uid=<%=user.getId()%>">我的关注</a></li>
                        <li><a href="${path}/user/logout">注销</a></li>                        
                    </ul>
                </div>
            </li>
        </ul>
        </div>
        <%} %>
        
        
    </div>
</div>
<input type="hidden" class="userid" value="<%=user.getId()%>">
<input type="hidden" class="username" value="<%=user.getAccount()%>">
<input type="hidden" class="userimg" value="<%=user.getImg()%>">
<!--最外层大盒子-->
<div id="page">
    <!--头部-->
    <div class="head-box">
        <!--背景图-->
        <div class="banner-background clearfix" id="bannerBackground"></div>
        <!--遮罩-->
        <div class="mask"></div>
        <!--内容-->
        <div class="new-banner">
            <!--上面-->
             <div class="top-banner"></div>
            <!--搜索-->
            <div class="search-box">
                <form action="${path}/pic/piclist" class="new-searching-unit" id="bigfind" method="post">
                    <input id="query" type="text" size="27" name="find" autocomplete="off" placeholder="搜索你喜欢的" value="">
                    <a  class="go"></a>
                </form>
                <!-- <div class="hot-words">
                    <span>热门搜索：</span>
                    <a href="#">花瓣认证设计师</a>
                    <span>，</span>
                    <a href="#">原创插画</a>
                    <span>，</span>
                    <a href="#">花瓣LIVE</a><span>，</span>
                    <a href="#">配色</a>
                    <span>，</span>
                    <a href="#">壁纸那些事</a>
                </div> -->
            </div>
            <!--下面小文字-->
            <div class="bottom-box">
                <div class="wrapper wrapper-996"><span>图片：</span><a href="#">Ciao大榴莲！</a></div>
            </div>
        </div>
    </div>
    <!--回到头部-->
    <div id="elevator_item" class="elevator-item" style="display:none;">
        <a id="elevator" class="" onclick="return false;" title="回到顶部"></a>
    </div>
    <!--关注-->
    <div class="yWrapp w">
        <div class="recommend-line"><a>大家正在关注</a></div>
    </div>
</div>
<!--导航栏-->
<div id="hotpic">
<div class="nav w clearfix ">
    <a href="moment/pic/single?sid=35"><img src="${path}/resources/user/images/ylimages/faggahgh.jpg" alt="" class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/w650.jpg" alt=""
                     class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/ahgagajl.jpg" alt="" class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/faagjajlg.jpg" alt="#" class="sheji"></a>    
</div>
<div class="nav w clearfix" style="margin-top: 15px;">
    <a href="#"><img src="${path}/resources/user/images/ylimages/faggahgh.jpg" alt="" class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/w650.jpg" alt=""
                     class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/ahgagajl.jpg" alt="" class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/faagjajlg.jpg" alt="#" class="sheji"></a>    
</div>
</div>

<div class="yWrapp w jiazaigengduo clearfix">
    <div class="recommend-line"><a href="${path}/pic/piclist" id="jiazaiDu">加载更多</a></div>
</div>




<%--  <div class="yWrapp w">
        <div class="recommend-line"><a>推荐</a></div>
    </div>
</div>
<!--导航栏-->
<div class="nav w clearfix ">
    <a href="shop-single.html"><img src="${path}/resources/user/images/ylimages/faggahgh.jpg" alt="" class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/w650.jpg" alt=""
                     class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/ahgagajl.jpg" alt="" class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/faagjajlg.jpg" alt="#" class="sheji"></a>    
</div>
<div class="nav w clearfix" style="margin-top: 15px;">
    <a href="#"><img src="${path}/resources/user/images/ylimages/faggahgh.jpg" alt="" class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/w650.jpg" alt=""
                     class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/ahgagajl.jpg" alt="" class="sheji"></a>
    <a href="#"><img src="${path}/resources/user/images/ylimages/faagjajlg.jpg" alt="#" class="sheji"></a>    
</div> --%>



 <!--为你推荐-->
<div class="yWrapp w">
    <div class="recommend-line"><a>为你推荐</a></div>
</div>
<!--图片盒子集合-->
<div class="dahezi-box" id="jecs">
    <div class="one-box clearfix w">
        <a href="#"><img src="${path}/resources/user/images/ylimages/184174a4c0c2022b3188e64dee9be2fcd310100ff274-Pg4WWw_sq320.jpg" alt=""></a>
        <a href="#" class="ajfaggaflgjala">
        <span class="box-top">
            <div class="ziti"></div>
           <h2>摄影</h2>
           <div class="info-tra-left"></div>
        </span>
            <span class="box-bottom">
            <div class="guzhuang"></div>
            <h2>人物</h2>
            <div class="info-tra-right"></div>
        </span></a>
        <a href="#"><img src="${path}/resources/user/images/ylimages/e2964923318448cfe6b2bc54fa08d8a4460e0820917f-NlQZGA_sq320.jpg" alt=""></a>
        <a href="#" class="jflajgiwiw">
            <img src="${path}/resources/user/images/ylimages/310d7dffa903a14d16816115e5b472c6a43b85165da9-IhQxuq_sq320.jpg" alt="">
            <div class="left-box">
                <div class="recommend-data"></div>
                <h2>插画</h2>
            </div>
        </a>
    </div>
    <div class="one-box clearfix w">
        <a href="#" class="jflajgiwiw">
            <img src="${path}/resources/user/images/ylimages/e5713c07c062b74ef9aee3c49fcd5c64d06cb39412d08-q91Rge_sq320.jpg" alt="">
            <div class="left-box">
                <div class="recommend-data"></div>
                <h2>风景</h2>
            </div>
        </a>
        <a href="#"><img src="${path}/resources/user/images/ylimages/cf96838ae05b70076121b96112cf5fb76a094ec415309-fEMQvg_sq320(1).jpg" alt=""></a>
        <a href="#" class="ajfaggaflgjala">
        <span class="box-top">
            <div class="ziti"></div>
           <h2>星空</h2>
           <div class="info-tra-left"></div>
        </span>
            <span class="box-bottom">
            <div class="guzhuang"></div>
            <h2>其他</h2>
            <div class="info-tra-right"></div>
        </span></a>
        <a href="#"><img src="${path}/resources/user/images/ylimages/c29ebafa5fa61e7f84f91d330ba6d61c37f9aa85ba36-keYExD_sq320.jpg" alt=""></a>

    </div>
    

    <div class="one-box clearfix w" style="display:none;">
        <a href="#" class="jflajgiwiw">
            <img src="${path}/resources/user/images/ylimages/47971e7fe45deff5ad59d095a690c704338eafc3a157-562Cv2_sq320.jpg" alt="">
            <div class="left-box">
                <div class="recommend-data"></div>
                <h2>〖文与碎语〗</h2>
            </div>
        </a>
        <a href="#"><img src="${path}/resources/user/images/ylimages/f1b2dc9a80ae6d63318324f812727897fff30794c9cd-5rnkof_sq320.jpg" alt=""></a>
        <a href="#" class="ajfaggaflgjala">
        <span class="box-top">
            <div class="ziti"></div>
           <h2>花艺</h2>
           <div class="info-tra-left"></div>
        </span>
            <span class="box-bottom">
            <div class="guzhuang"></div>
            <h2>禅绕画</h2>
            <div class="info-tra-right"></div>
        </span></a>
        <a href="#"><img src="${path}/resources/user/images/ylimages/fdee9b56ec2f79f7a98ad67e8abadd5a6805c7551be79-xvddYw_sq320.jpg" alt=""></a>

    </div>
</div>
<!--加载更多-->
<div class="yWrapp w jiazaigengduo clearfix">
    <div class="recommend-line"><a href="#" id="jiazaiDu">加载更多</a></div>
</div>

<!--页脚-->
<div class="friend">
    <div class="sponsor w">
        <div class="l-sponsor">
            <div class="caiji">
                <dl class="f-l">
                    <dt><a href="#">首页</a></dt>
                  
                </dl>
                <dl class="f-l">
                    <dt><a href="#">联系与合作</a></dt>
                   
                </dl>
                <dl class="f-l">
                    <dt><a href="#">联系客户端</a></dt>
                
                </dl>

            </div></div>
        <div class="r-sponsor f-r">
            <dl>
                <dt>关注我们</dt>
                
                 <div class="modal fade" id="alter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">作品上传</h4>
      </div>
      <div class="modal-body" >
      	
      <form class="form-group" role="form" action="${path}/pic/uploads" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="">标题</label>
                                <input class="form-control" type="text" id="firstname" placeholder="请输入标题" name="name">
                            </div>
                            <div class="form-group">
                               <label for="name">简介</label>
    <textarea class="form-control" rows="3" name="description"></textarea>
                            </div>
                            <div class="form-group">
                             <label for="name">选择列表</label>
		<select class="form-control" id="genre" name="type">

		</select>
                            </div>
                           
                             <div class="form-group">
                                <label for="">作品上传</label>
                            <input type="file" class="file"  id="input-711" name="files"/>
                            </div>							                           						                                            
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="submit" class="btn btn-primary uploadbtn">确认</button>
      </div>
      </form>
    </div>
  </div>
</div>
          <input type="hidden"   id="userimg" value="<%=user.getImg()%>"/>   
            
<script src="${path}/resources/user/js/jquery-1.12.0.min.js"></script>
<script src="${path}/resources/user/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/resources/user/bootstrap-fileinput/js/fileinput.min.js"></script>
<script type="text/javascript" src="${path}/resources/user/bootstrap-fileinput/js/fileinput_locale_zh.js"></script>
<script type="text/javascript" src="${path}/resources/user/js/websocket.js"></script>
<script src="${path}/resources/user/js/lobibox.js"></script>
<script src="${path}/resources/user/js/lobiboxDemo.js"></script>
<script type="text/javascript" src="${path}/resources/user/js/upload.js"></script>	
<script src="${path}/resources/user/js/huaban.js"></script>	
			 <script>
$("#input-711").fileinput({
	 language: 'zh',
	 showPreview :true,
	 showUpload:false,
	 maxFileCount:1,
    allowedPreviewTypes : [ 'image' ],
    allowedFileExtensions : ["jpg", "png","gif"] 
});
</script> 
		
                <script>
              
                
                    var minType=document.getElementsByClassName("minitype-min")[0];
                    var maxType=document.getElementsByClassName("minitype-max")[0];
                    
                    $(".minitype-min").first().onmouseover=function () {
                        maxType.style.cssText="display:block;";
                    }
                    $(".minitype-min").first().onmouseout=function () {
                        maxType.style.cssText="display:none;";
                    }
                    //大搜索框点击事件
                     $(".go").click(function(){
                    	//alert("go");
                    	$('#bigfind').submit();
                    	
                    }); 
                    /*  $("#img2").on('click',function(){
                     	alert("go");
                     	if($("#sou_input").val()!=""){
                     		$('#smallfind').submit();
                     	}else{
                     		alert("请输入搜索内容！");
                     	}                    	
                     });  */
                    
                     function toUserChat(){
                    	 var userimg='${sessionScope.user.img}';
                    	 alert(userimg);
                    	 window.open('${path}/userchat?reviewer='+ encodeURIComponent('|13|/picture/963@qq.com/icon/a.jpg|963@qq.com'),'tag');	
                     }
                    
                </script>
            </dl>
        </div>
    </div>
</div>
<script type="text/javascript">
/* //作品上传加载分类
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
}); */


/* $.ajax({
	url:"/moment/pic/selecthotpic",
	type:"post",
	data:{piclike:10,
		ed:0
	},
	success:function(data){
		console.log(data);
		var html="";
		for(var i=0;i<8;i++){
			if(i==0){
				html+='<div class="nav w clearfix ">';
			}
			if(i==4){
				html+='</div><div class="nav w clearfix" style="margin-top: 15px;">'
			}
			html+=' <a href="${path}/pic/single?sid='+data[i].id+'"><img src="'+data[i].picpath+'" alt="" class="sheji"></a>';
			  
		if(i==data.length-1){
			html+="</div>";
		}		
		}
		$("#hotpic").html(html);
		
	}
}); */


</script>
<!-- <script type="text/javascript" color="0,104,183" opacity="1" zindex="-1" count="100" >!function(){function o(w,v,i){return w.getAttribute(v)||i}function j(i){return document.getElementsByTagName(i)}function l(){var i=j("script"),w=i.length,v=i[w-1];return{l:w,z:o(v,"zIndex",-1),o:o(v,"opacity",0.5),c:o(v,"color","0,0,0"),n:o(v,"count",99)}}function k(){r=u.width=window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth,n=u.height=window.innerHeight||document.documentElement.clientHeight||document.body.clientHeight}function b(){e.clearRect(0,0,r,n);var w=[f].concat(t);var x,v,A,B,z,y;t.forEach(function(i){i.x+=i.xa,i.y+=i.ya,i.xa*=i.x>r||i.x<0?-1:1,i.ya*=i.y>n||i.y<0?-1:1,e.fillRect(i.x-0.5,i.y-0.5,1,1);for(v=0;v<w.length;v++){x=w[v];if(i!==x&&null!==x.x&&null!==x.y){B=i.x-x.x,z=i.y-x.y,y=B*B+z*z;y<x.max&&(x===f&&y>=x.max/2&&(i.x-=0.03*B,i.y-=0.03*z),A=(x.max-y)/x.max,e.beginPath(),e.lineWidth=A/2,e.strokeStyle="rgba("+s.c+","+(A+0.2)+")",e.moveTo(i.x,i.y),e.lineTo(x.x,x.y),e.stroke())}}w.splice(w.indexOf(i),1)}),m(b)}var u=document.createElement("canvas"),s=l(),c="c_n"+s.l,e=u.getContext("2d"),r,n,m=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||function(i){window.setTimeout(i,1000/45)},a=Math.random,f={x:null,y:null,max:20000};u.id=c;u.style.cssText="position:fixed;top:0;left:0;z-index:"+s.z+";opacity:"+s.o;j("body")[0].appendChild(u);k(),window.onresize=k;window.onmousemove=function(i){i=i||window.event,f.x=i.clientX,f.y=i.clientY},window.onmouseout=function(){f.x=null,f.y=null};for(var t=[],p=0;s.n>p;p++){var h=a()*r,g=a()*n,q=2*a()-1,d=2*a()-1;t.push({x:h,y:g,xa:q,ya:d,max:6000})}setTimeout(function(){b()},100)}();</script><canvas id="c_n23" width="1495" height="294" style="position: fixed; top: 0px; left: 0px; z-index: -1; opacity: 1;"></canvas>
<script>
    (function(){setTimeout(function () {function e(e){for(var r=e+"=",t=document.cookie.split(";"),n=0;n<t.length;n++){for(var o=t[n];" "==o.charAt(0);)o=o.substring(1,o.length);if(0==o.indexOf(r))return o.substring(r.length,o.length)}return!1}var r="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",t=function(e){e=e.replace(new RegExp("\r\n","g"),"\n");for(var r="",t=0;t<e.length;t++){var n=e.charCodeAt(t);n<128?r+=String.fromCharCode(n):n>127&&n<2048?(r+=String.fromCharCode(n>>6|192),r+=String.fromCharCode(63&n|128)):(r+=String.fromCharCode(n>>12|224),r+=String.fromCharCode(n>>6&63|128),r+=String.fromCharCode(63&n|128))}return r},n=e("yjs_id");if(!n){var o=window.navigator.userAgent,i=window.location.host,a=(new Date).getTime(),d="yjs_id="+(n=(n=function(e){var n,o,i,a,d,c,g,h="",m=0;for(e=t(e);m<e.length;)a=(n=e.charCodeAt(m++))>>2,d=(3&n)<<4|(o=e.charCodeAt(m++))>>4,c=(15&o)<<2|(i=e.charCodeAt(m++))>>6,g=63&i,isNaN(o)?c=g=64:isNaN(i)&&(g=64),h=h+r.charAt(a)+r.charAt(d)+r.charAt(c)+r.charAt(g);return h}(o+"|"+i+"|"+a+"|"+document.referrer)).replace(new RegExp("=","g"),""))+";path=/;expires="+new Date(10*a).toUTCString();document.cookie=d}if(!e("ctrl_time")){var c=document.createElement("img");c.src="//idm-su.baidu.com/su.png?yjs_id="+n,document.body.appendChild(c),c.onload=function(){document.body.removeChild(c,!0)};var g=(new Date).getTime(),h=new Date(g+864e5).toUTCString();document.cookie="ctrl_time=1;path=/;expires="+h}}, 0)})()
</script> -->

</body>

<%-- <script src="${path}/resources/user/js/index.js"></script> --%>
</html>