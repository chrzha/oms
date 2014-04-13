$(document).ready(function(){

	$(".content2,.content3,.content4,.content5,.content6").hide();
		    $(".mune1").click(function(){
		    	$(".content1").slideDown(500);
		    	$(".content2,.content3,.content4,.content5,.content6").hide();
				
			});

			$(".mune2").click(function(){
				$(".content2").slideDown(500);
				$(".content1,.content3,.content4,.content5,.content6").hide();
				
			});
			 $(".mune3").click(function(){
				$(".content3").slideDown(500);
				$(".content2,.content1,.content4,.content5,.content6").hide();
					
			});

			$(".mune4").click(function(){
				$(".content4").slideDown(500);
				$(".content1,.content3,.content2,.content5,.content6").hide();
						
			});
			 $(".mune5").click(function(){
				$(".content5").slideDown(500);
				$(".content2,.content1,.content4,.content3,.content6").hide();
						
			});

			$(".mune6").click(function(){
				$(".content6").slideDown(500);
				$(".content1,.content3,.content2,.content5,.content4").hide();
							
			});
				
			
			
		
		
	/*$(".mune1").click(function(){
		
		$(".content1").show();
		
	});*/
	
	
});