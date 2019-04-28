		$(function(){
		 var url = window.location.href;

				 var pattern1 = /[/S]/ig;
				 var pattern2 = /[0-9]/ig;
		   		 var present_page = pattern2.exec(url.split(pattern1)[12]);
		 
           // 按页面跳转
            $(".page a").click(function(){
                 
                currentpage = ($(this).html());
                var aHref = $(this).attr("href");
                $(this).attr("href",aHref + currentpage +".html");
                  
            })

            // 跳转到 前一页
			
            $(".pre_page a").click(function(){
            var pre_page = parseInt(present_page) - 1 ;
            if(pre_page >= 2){
                    var pre_href = $(this).attr("href");
                    $(this).attr("href",pre_href + pre_page +".html");
                     
            }else{
                $(".pre_page a").attr("href","pic_fg1.html");
                
            }
            
           })
            
            // 跳转到后一页
             $(".next_page a").click(function(){
            var next_page =  parseInt(present_page) + 1 ;
            if(next_page <= 11){
                    var next_href = $(this).attr("href");
                    $(this).attr("href",next_href + next_page +".html");
                    
            }else{
                $(".next_page a").attr("href","pic_fg5.html");
                
            }
            
           })







		// 点赞、收藏部分

		$("#remark1").click( function () {
			$(this).css("display","none");
			$("#num1").css("display","block");
			$("#num1").text(parseInt( $("#num1").text())+1);
		})
				
		$("#num1").mouseout( function(){
			$("#num1").css("display","none");
			$("#remark1").css("display","inline-block");

		})



		$("#favorite1").click( function () {
			$(this).css("display","none");
			$("#num2").css("display","inline-block");
			$("#num2").text(parseInt( $("#num2").text())+1);
		})
				
		$("#num2").mouseout( function(){
			$("#num2").css("display","none");
			$("#favorite1").css("display","inline-block");
		})


		// 

		$("#remark2").click( function () {
			$(this).css("display","none");
			$("#num3").css("display","inline-block");
			$("#num3").text(parseInt( $("#num3").text())+1);
		})
				
		$("#num3").mouseout( function(){
			$("#num3").css("display","none");
			$("#remark2").css("display","inline-block");

		})



		$("#favorite2").click( function () {
			$(this).css("display","none");
			$("#num4").css("display","inline-block");
			$("#num4").text(parseInt( $("#num4").text())+1);
		})
				
		$("#num4").mouseout( function(){
			$("#num4").css("display","none");
			$("#favorite2").css("display","inline-block");
		})




		// 

		$("#remark3").click( function () {
			$(this).css("display","none");
			$("#num5").css("display","inline-block");
			$("#num5").text(parseInt( $("#num5").text())+1);
		})
				
		$("#num5").mouseout( function(){
			$("#num5").css("display","none");
			$("#remark3").css("display","inline-block");

		})



		$("#favorite3").click( function () {
			$(this).css("display","none");
			$("#num6").css("display","inline-block");
			$("#num6").text(parseInt( $("#num6").text())+1);
		})
				
		$("#num6").mouseout( function(){
			$("#num6").css("display","none");
			$("#favorite3").css("display","inline-block");
		})



		// 

		$("#remark4").click( function () {
			$(this).css("display","none");
			$("#num7").css("display","inline-block");
			$("#num7").text(parseInt( $("#num7").text())+1);
		})
				
		$("#num7").mouseout( function(){
			$("#num7").css("display","none");
			$("#remark4").css("display","inline-block");

		})



		$("#favorite4").click( function () {
			$(this).css("display","none");
			$("#num8").css("display","inline-block");
			$("#num8").text(parseInt( $("#num8").text())+1);
		})
				
		$("#num8").mouseout( function(){
			$("#num8").css("display","none");
			$("#favorite4").css("display","inline-block");
		})




		$("#remark5").click( function () {
			$(this).css("display","none");
			$("#num9").css("display","inline-block");
			$("#num9").text(parseInt( $("#num9").text())+1);
		})
				
		$("#num9").mouseout( function(){
			$("#num9").css("display","none");
			$("#remark5").css("display","inline-block");

		})



		$("#favorite5").click( function () {
			$(this).css("display","none");
			$("#num10").css("display","inline-block");
			$("#num10").text(parseInt( $("#num10").text())+1);
		})
				
		$("#num10").mouseout( function(){
			$("#num10").css("display","none");
			$("#favorite5").css("display","inline-block");
		})


		// 

		$("#remark6").click( function () {
			$(this).css("display","none");
			$("#num11").css("display","inline-block");
			$("#num11").text(parseInt( $("#num11").text())+1);
		})
				
		$("#num11").mouseout( function(){
			$("#num11").css("display","none");
			$("#remark6").css("display","inline-block");

		})



		$("#favorite6").click( function () {
			$(this).css("display","none");
			$("#num12").css("display","inline-block");
			$("#num12").text(parseInt( $("#num12").text())+1);
		})
				
		$("#num12").mouseout( function(){
			$("#num12").css("display","none");
			$("#favorite6").css("display","inline-block");
		})




		// 

		$("#remark7").click( function () {
			$(this).css("display","none");
			$("#num13").css("display","inline-block");
			$("#num13").text(parseInt( $("#num13").text())+1);
		})
				
		$("#num13").mouseout( function(){
			$("#num13").css("display","none");
			$("#remark7").css("display","inline-block");

		})



		$("#favorite7").click( function () {
			$(this).css("display","none");
			$("#num14").css("display","inline-block");
			$("#num14").text(parseInt( $("#num14").text())+1);
		})
				
		$("#num14").mouseout( function(){
			$("#num14").css("display","none");
			$("#favorite7").css("display","inline-block");
		})



		// 

		$("#remark8").click( function () {
			$(this).css("display","none");
			$("#num15").css("display","inline-block");
			$("#num15").text(parseInt( $("#num15").text())+1);
		})
				
		$("#num15").mouseout( function(){
			$("#num15").css("display","none");
			$("#remark8").css("display","inline-block");

		})



		$("#favorite8").click( function () {
			$(this).css("display","none");
			$("#num16").css("display","inline-block");
			$("#num16").text(parseInt( $("#num16").text())+1);
		})
				
		$("#num16").mouseout( function(){
			$("#num16").css("display","none");
			$("#favorite8").css("display","inline-block");
		})

		//
		$("#remark9").click( function () {
			$(this).css("display","none");
			$("#num17").css("display","inline-block");
			$("#num17").text(parseInt( $("#num17").text())+1);
		})
				
		$("#num17").mouseout( function(){
			$("#num17").css("display","none");
			$("#remark9").css("display","inline-block");

		})



		$("#favorite9").click( function () {
			$(this).css("display","none");
			$("#num18").css("display","inline-block");
			$("#num18").text(parseInt( $("#num18").text())+1);
		})
				
		$("#num18").mouseout( function(){
			$("#num18").css("display","none");
			$("#favorite9").css("display","inline-block");
		})


		// 

		$("#remark10").click( function () {
			$(this).css("display","none");
			$("#num19").css("display","inline-block");
			$("#num19").text(parseInt( $("#num19").text())+1);
		})
				
		$("#num19").mouseout( function(){
			$("#num19").css("display","none");
			$("#remark10").css("display","inline-block");

		})



		$("#favorite10").click( function () {
			$(this).css("display","none");
			$("#num20").css("display","inline-block");
			$("#num20").text(parseInt( $("#num20").text())+1);
		})
				
		$("#num20").mouseout( function(){
			$("#num20").css("display","none");
			$("#favorite10").css("display","inline-block");
		})




		// 

		$("#remark11").click( function () {
			$(this).css("display","none");
			$("#num21").css("display","inline-block");
			$("#num21").text(parseInt( $("#num21").text())+1);
		})
				
		$("#num21").mouseout( function(){
			$("#num21").css("display","none");
			$("#remark11").css("display","inline-block");

		})



		$("#favorite11").click( function () {
			$(this).css("display","none");
			$("#num22").css("display","inline-block");
			$("#num22").text(parseInt( $("#num22").text())+1);
		})
				
		$("#num22").mouseout( function(){
			$("#num22").css("display","none");
			$("#favorite11").css("display","inline-block");
		})



		// 

		$("#remark12").click( function () {
			$(this).css("display","none");
			$("#num23").css("display","inline-block");
			$("#num23").text(parseInt( $("#num23").text())+1);
		})
				
		$("#num23").mouseout( function(){
			$("#num23").css("display","none");
			$("#remark12").css("display","inline-block");

		})



		$("#favorite12").click( function () {
			$(this).css("display","none");
			$("#num24").css("display","inline-block");
			$("#num24").text(parseInt( $("#num24").text())+1);
		})
				
		$("#num24").mouseout( function(){
			$("#num24").css("display","none");
			$("#favorite12").css("display","inline-block");
		})
		// 

		$("#remark13").click( function () {
			$(this).css("display","none");
			$("#num25").css("display","inline-block");
			$("#num25").text(parseInt( $("#num25").text())+1);
		})
				
		$("#num25").mouseout( function(){
			$("#num25").css("display","none");
			$("#remark13").css("display","inline-block");

		})



		$("#favorite13").click( function () {
			$(this).css("display","none");
			$("#num26").css("display","inline-block");
			$("#num26").text(parseInt( $("#num26").text())+1);
		})
				
		$("#num26").mouseout( function(){
			$("#num26").css("display","none");
			$("#favorite13").css("display","inline-block");
		})


// 

		$("#remark14").click( function () {
			$(this).css("display","none");
			$("#num27").css("display","inline-block");
			$("#num27").text(parseInt( $("#num27").text())+1);
		})
				
		$("#num27").mouseout( function(){
			$("#num27").css("display","none");
			$("#remark14").css("display","inline-block");

		})



		$("#favorite14").click( function () {
			$(this).css("display","none");
			$("#num28").css("display","inline-block");
			$("#num28").text(parseInt( $("#num28").text())+1);
		})
				
		$("#num28").mouseout( function(){
			$("#num28").css("display","none");
			$("#favorite14").css("display","inline-block");
		})


// 

		$("#remark15").click( function () {
			$(this).css("display","none");
			$("#num29").css("display","inline-block");
			$("#num29").text(parseInt( $("#num29").text())+1);
		})
				
		$("#num29").mouseout( function(){
			$("#num29").css("display","none");
			$("#remark15").css("display","inline-block");

		})



		$("#favorite15").click( function () {
			$(this).css("display","none");
			$("#num30").css("display","inline-block");
			$("#num30").text(parseInt( $("#num30").text())+1);
		})
				
		$("#num30").mouseout( function(){
			$("#num30").css("display","none");
			$("#favorite15").css("display","inline-block");
		})

// 

		$("#remark16").click( function () {
			$(this).css("display","none");
			$("#num31").css("display","inline-block");
			$("#num31").text(parseInt( $("#num31").text())+1);
		})
				
		$("#num31").mouseout( function(){
			$("#num31").css("display","none");
			$("#remark16").css("display","inline-block");

		})



		$("#favorite16").click( function () {
			$(this).css("display","none");
			$("#num32").css("display","inline-block");
			$("#num32").text(parseInt( $("#num32").text())+1);
		})
				
		$("#num32").mouseout( function(){
			$("#num32").css("display","none");
			$("#favorite16").css("display","inline-block");
		})

		// 

		$("#remark17").click( function () {
			$(this).css("display","none");
			$("#num33").css("display","inline-block");
			$("#num33").text(parseInt( $("#num33").text())+1);
		})
				
		$("#num33").mouseout( function(){
			$("#num33").css("display","none");
			$("#remark17").css("display","inline-block");

		})



		$("#favorite17").click( function () {
			$(this).css("display","none");
			$("#num34").css("display","inline-block");
			$("#num34").text(parseInt( $("#num34").text())+1);
		})
				
		$("#num34").mouseout( function(){
			$("#num34").css("display","none");
			$("#favorite17").css("display","inline-block");
		})
		// 

		$("#remark18").click( function () {
			$(this).css("display","none");
			$("#num35").css("display","inline-block");
			$("#num35").text(parseInt( $("#num35").text())+1);
		})
				
		$("#num35").mouseout( function(){
			$("#num35").css("display","none");
			$("#remark18").css("display","inline-block");

		})



		$("#favorite18").click( function () {
			$(this).css("display","none");
			$("#num36").css("display","inline-block");
			$("#num36").text(parseInt( $("#num36").text())+1);
		})
				
		$("#num36").mouseout( function(){
			$("#num36").css("display","none");
			$("#favorite18").css("display","inline-block");
		})

		// 

		$("#remark19").click( function () {
			$(this).css("display","none");
			$("#num37").css("display","inline-block");
			$("#num37").text(parseInt( $("#num37").text())+1);
		})
				
		$("#num37").mouseout( function(){
			$("#num37").css("display","none");
			$("#remark19").css("display","inline-block");

		})



		$("#favorite19").click( function () {
			$(this).css("display","none");
			$("#num38").css("display","inline-block");
			$("#num38").text(parseInt( $("#num38").text())+1);
		})
				
		$("#num38").mouseout( function(){
			$("#num38").css("display","none");
			$("#favorite19").css("display","inline-block");
		})
		// 

		$("#remark20").click( function () {
			$(this).css("display","none");
			$("#num39").css("display","inline-block");
			$("#num39").text(parseInt( $("#num39").text())+1);
		})
				
		$("#num39").mouseout( function(){
			$("#num39").css("display","none");
			$("#remark20").css("display","inline-block");

		})



		$("#favorite20").click( function () {
			$(this).css("display","none");
			$("#num40").css("display","inline-block");
			$("#num40").text(parseInt( $("#num40").text())+1);
		})
				
		$("#num40").mouseout( function(){
			$("#num40").css("display","none");
			$("#favorite20").css("display","inline-block");
		})
	})

	// 翻页部分
