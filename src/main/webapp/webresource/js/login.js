$(document).ready(function() {

	      	$(function(){         
	         	$('#kaptchaImage').click(function () {//生成验证码  
	     		$(this).hide().attr('src', '/getKaptchaImage?' + Math.floor(Math.random()*100) ).fadeIn();  
	     		event.cancelBubble=true;  
	    		});  
			});   
	  
	  
	        window.onbeforeunload = function(){  
	    		//关闭窗口时自动退出  
	   		 if(event.clientX>360&&event.clientY<0||event.altKey){     
	        	alert(parent.document.location);  
	    		}  
			};  

			function changeCode() {  
	    		$('#kaptchaImage').hide().attr('src', '/getKaptchaImage?' + Math.floor(Math.random()*100) ).fadeIn();  
	    		event.cancelBubble=true;  
			}  
		   
		$("input[type=text],input[type=password]").bind("click", function() {
			$(this).addClass("hightline");
		});

		$("input[type=text],input[type=password]").bind("blur", function() {
			$(this).removeClass("hightline");
		});

		$("input[type=submit]").bind("click", function() {
			var username=$("#userName");
			var password=$("#userPassword");
			
			if(username.val()==""){
				username.removeClass("hightline").addClass("error");
				$("#userName_error").text("输入您的用户名");
				return false;
			}
			if(password.val()==""){
				password.removeClass("hightline").addClass("error");
				$("#userPassword_error").text("输入您的密码");
				return false;
				}
		});

	});