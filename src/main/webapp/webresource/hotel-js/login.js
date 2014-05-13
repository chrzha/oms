$(document).ready(function() {
 
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
		$("#loginBtn").click(function(){
			var userName = $("#userName").val();
			var userPassword = $("#userPassword").val();
			var roleId = $("#roleId").val();
			var clientCode = $("#clientCode").val();
			
			$.ajax({
				url : "/hotel/validate?userName="+userName+"&userPassword="+userPassword+"&roleId="+roleId+"&clientCode="+clientCode,
				
				type : 'GET',
				success : function(data) {
					if(data[0]=="error_code"){
						$("#code_error").text("验证码错误！");
					}else if(data[0]=="error_0"){
						$("#userName_error").text("该用户不存在");
					}else if(data[0]=="error_1"){
						$("#userName_error").text("");
						$("#userPassword_error").text("密码错误");
					}else if(data[0]=="error_2"){
						$("#userName_error").text("");
						$("#userPassword_error").text("");
						$("#roleId_error").text("角色错误或未通过审核！");
					}else if(data[0]=="idcHome"){
						window.location.href = '/hotel/idcHome';
					}else if(data[0]=="adminHome"){
						window.location.href = '/hotel/adminHome?hotelId='+data[1].hotelId;
					}else if(data[0]=="operatorHome"){

						window.location.href = '/hotel/operatorHome?hotelId='+data[1].hotelId;
					}
				}
			});
		});
	});