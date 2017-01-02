/**
 * 
 */


$(document).ready(function(){
	$("#2").click(function() {
		
		$.ajax({
			type:"post",
			url:"page",
			datatype:"json",
			success:function(data){
				$("#2").css("class","active");
			},
			error:function(){
				alert("error");
			}

			});
		
		
	});
});



/**


**/