$(function(){
//作品上传加载分类
$.ajax({
	url:"http://localhost:8080/moment/pic/getgenre",
	type:"post",
	success:function(data){
		console.log(data);
		var html ='';
		for(var i=0;i<data.length;i++){
			html+='<option>'+data[i].name+'</option>';
		}
		$("#genre").html(html);
	}
});

$("#input-711").fileinput({
	 language: 'zh',
	 showPreview :true,
	 showUpload:false,
	 maxFileCount:1,
    allowedPreviewTypes : [ 'image' ],
    allowedFileExtensions : ["jpg", "png","gif"] 
});

});