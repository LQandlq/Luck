<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.moment.user.domain.*,com.moment.pic.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>         
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>${auther.name}的画廊</title>
	<link rel="stylesheet" href="${path}/resources/user/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path}/resources/user/otheruserpic/css/baguetteBox.min.css">
	<link rel="stylesheet" href="${path}/resources/user/otheruserpic/css/gallery-grid.css">	
	<style type="text/css">
		img{
			height: 187.49px;
		}
		.title{
			position: relative;			
			bottom: 15px;
			text-align:center;
		}
	</style>	
</head>

<body>
<div class="container">		
		<div class="container gallery-container">
		    <h1>${auther.name}</h1>
		    <p class="page-description text-center">欢迎来到${auther.name}的画廊！</p>		    
		    <div class="tz-gallery">
		        <div class="row">
		        <c:choose>  
			        <c:when test="${tradeList==null || fn:length(tradeList) == 0}">		     
			        	<c:forEach items="${userPicList}" var="item" varStatus="status">
			            	<div class="col-sm-6 col-md-4">
			          
			                	<a class="lightbox" href="${item.picpath}">
			                    	<img src="${item.picpath}" alt="${item.name}">			                    	
			                	</a>
			                	<div class="title">
			                	<a  href="${path}/pic/single?sid=${item.id}">${item.name}</a>
			                	</div>
			            	</div>
						</c:forEach>
					</c:when> 
					<c:otherwise>
						<h2>该用户暂无作品</h2>
					</c:otherwise>   	
				 </c:choose>     		          		          
		        </div>
		    </div>
		</div>		 
	</div>
	
	
	<script type="text/javascript" src="${path}/resources/user/otheruserpic/js/baguetteBox.min.js"></script>
	<script type="text/javascript">
		baguetteBox.run('.tz-gallery');
	</script>
</body>
</html>