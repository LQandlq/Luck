$(function(){
$.ajax({
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
			html+=' <a href="//localhost:8080/moment/pic/single?sid='+data[i].id+'"><img src="'+data[i].picpath+'" alt="" class="sheji"></a>';
			  
		if(i==data.length-1){
			html+="</div>";
		}		
		}
		$("#hotpic").html(html);
		
	}
});



});