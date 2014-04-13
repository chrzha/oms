$(document).ready(function(){
	var username=$("[name='userName']");
	var password=$("[name='userPassword']");
	var repassword=$("[name='repassword']");
	var telephone=$("[name='phone']");
	var email=$("[name='email']");
	username.bind("blur",function(){
		if(username.val()!=""){
			$(".username").text("");
			//return false;
		}
		if(username.val()==""){
			$(".username").text("用户名不能为空！");
			return false;
		}
		//用户名是否被注册
		$.post("IsExsit.do",{username:username.val()},function(data){
				   if(data=="false"){
						$(".username").text("该用户名已被注册！");
						return false;
				   }else{
					   $(".username").text("");
				   }
		});
	});
		
	
	password.bind("blur",function(){
		if(password.val()!=""){
			$(".password").text("");
			return false;
		}
		if(password.val()==""){
			$(".password").text("密码不能为空！");
			return false;
		}
	});

	repassword.bind("blur",function(){
		
		if(password.val()==""){
			$(".repassword").text("确认密码不能为空！");
			return false;
		}
	});
	
	repassword.bind("blur",function(){
		
		if(password.val()!=repassword.val()){
			$(".repassword").text("两次输入的密码不一致！");
			return false;
		}
		if(password.val()==repassword.val()){
			$(".repassword").text("");
			return false;
		}
	});
	
	name.bind("blur",function(){
		if(name.val()!=""){
			$(".name").text("");
			return false;
		}
		if(name.val()==""){
			$(".name").text("姓名不能为空！");
			return false;
		}
	});
	age.bind("blur",function(){
		//年龄验证1-150整数
		if(!(isNaN(age.val())||age.val()>150||age.val()<1)){
			$(".age").text("");
			return false;
		}
		//年龄验证1-150整数
		if(isNaN(age.val())||age.val()>150||age.val()<1){
			$(".age").text("年龄必须为1-150的整数！");
			return false;
		}
		
	});
	telephone.bind("blur",function(){
		/*电话号码验证*/
		if(telephone.val().length==11){
			$(".telephone").text("");
			return false;
		}
		if(telephone.val().length!=11){
			$(".telephone").text("号码必须为11位数字！");
			return false;
		}
/*		var regu =/(^[1][3][0-9]{9}$)|(^0[1][3][0-9]{9}$)/;
	     var re = new regexp(regu);
	     if (re.test( telephone.value)) {
	    		
		     $(".telephone").text("");
		     return false;    
		    } 
	     if (!re.test( telephone.value)) {
	
	     $(".telephone").text("请输入正确的手机号码");
	     return false;    
	     }*/
		
	});
	email.bind("blur",function(){
		//email验证
		apos=email.val().indexOf("@");
		dotpos=email.val().lastIndexOf(".");
		if (!(apos<1||dotpos-apos<2)) 
		  {
			$(".email").text("");;
			return false;
		}
		if (apos<1||dotpos-apos<2) 
		  {
			$(".email").text("email格式不正确！");;
			return false;
		}
		
		
	});
	$("input[type=submit]").bind("click", function() {
		if(username.val()==""){
			$(".username").text("用户名不能为空！");
			return false;
		}
		if(password.val()==""){
			$(".password").text("密码不能为空！");
			return false;
		}
		if(password.val()==""){
			$(".repassword").text("确认密码不能为空！");
			return false;
		}
		if(password.val()!=repassword.val()){
			$(".repassword").text("两次输入的密码不一致！");
			return false;
		}
		if(name.val()==""){
			$(".name").text("姓名不能为空！");
			return false;
		}
		//年龄验证1-150整数
		if(isNaN(age.val())||age.val()>150||age.val()<1){
			$(".age").text("年龄必须为1-150的整数！");
			return false;
		}
		
		//电话号码验证，必须是11位数字
		if(telephone.val().length!=11){
			$(".telephone").text("号码必须为11位数字！");
			return false;
		}
		//email验证
		apos=email.val().indexOf("@");
		dotpos=email.val().lastIndexOf(".");
		
		if (apos<1||dotpos-apos<2) 
		  {
			$(".email").text("email格式不正确！");;
			return false;
		}
		
	});
	


	
});
