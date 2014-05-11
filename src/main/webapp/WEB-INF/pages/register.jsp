<%@ page language="java" contentType="text/html; charset=utf-8" 
pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>
     管理员注册页面
    </title>
    <%
    String path = request.getContextPath();
    %>
    <meta http-equiv="pragma" content="no-cache" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">


    <link 
        rel="stylesheet"
        type="text/css"
        href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/default/easyui.css">

  </link>
  <link 
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/icon.css">

</link>
<link 
    rel="stylesheet"
    type="text/css"
    href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/tree_themes/SimpleTree.css">

</link>


<script src="${pageContext.request.contextPath}/webresource/hotel-js/jquery-1.7.2.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/jquery.easyui.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/locale/easyui-lang-zh_CN.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/tabs.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/SimpleTree.js">
</script>


<style>
.username,.password,.repassword,.email,.description,.roleId,.phone,.hotelId{
	display:block;
	color:red;
	font-size:10px;
	font-weight:bold;
	width:120px;
}

</style>
</head>
<body class="easyui-layout" >
  <div region="north" style="height:70px;background-color:#99ccff;">
    <div style="width:500px;height:30px;margin-left:460px;"><h1>基于云模式的酒店服务信息后台管理系统</h1></div>
  </div>


<div region="center">
  <div style="height:400px;width:410px;margin-left:490px;margin-top:10px;">
     <div class="easyui-panel"  title="注册" style="height:400px;width:450px;">
  	<div style="padding:10px 0 0 10px">
	   <form name="form" id="user_form"action="/hotel/register" ENCTYPE="multipart/form-data" modelAttribute="user" method="post" >
	    	<table style="margin:10px 0 0 60px;">		
			
			<tr><td><span>用户名*</span></td><td><input type="text" name="userName" maxlength="20"  ></td><td><span class="username"></span></td></tr>

			<tr><td><span>密码*</span></td><td><input type="password" name="userPassword" maxlength="20"  ></td><td><span class="password"></span></td></tr>

			<tr><td><span>确认密码*</span></td><td><input type="password" name="repassword" maxlength="20"  ></td><td><span class="repassword"></span></td></tr>

			<tr><td><span>电话*</span></td><td><input type="text" name="phone"  ></td><td><span class="phone"></span></td></tr>

			<tr><td><span>邮箱*</span></td><td><input type="text" id="id1" name="email" class="easyui-validatebox" data-options="validType:'email'"></td><td><span class="email"></span></td></tr>

			<tr><td><span>所在酒店编号*</span></td><td><input type="text" id="hotelId" name="hotelId" ><br></td>
			
			<td><img style="cursor:pointer;" title="该编号为酒店注册时系统产生的编号，如不知道，请查看邮件或联系管理员！" src="${pageContext.request.contextPath}/webresource/hotel-img/help.png"/><span class="hotelId"></span></td></tr>

			<tr><td><span>注册角色*</span></td><td><select id="roleId" name="roleId" style="width:155px;"  >
			
			<option>--请选择--</option><option value="0002">酒店管理员</option><option value="0003">酒店操作员</option></select></td><td><span class="roleId"></span></td></tr>

			<tr><td><span>备注</span></td><td><input type="text" id="id1" name="description"></td><td></td></tr>
			
			<input type="hidden" id = "hotelId" name="hotelId">
			
			<input type="hidden" id="status" name="status">
					
	    	</table>
	    	<div class="submit" style="margin-left:150px;">
	    		<a id="register" class="easyui-linkbutton" plain="true" iconCls="icon-ok">注册</a>
	    		
	    		<a  id="back" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">返回</a></div>
	    	<div id="loading" style="width: 200px; margin-left: 40%; margin-top: 10px;z-index: 999; display: none">
        						<div class="UpdateProgress">
        						 <img src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/default/images/loading.gif" />
            
            						<span id="loadMess">数据加载中，请稍候...</span>
        						</div>
    		</div>
	    	</form>
	    
	</div>
	</div>
	
  </div>
  </div>

<div region="south" style="height:40px;">
<jsp:include page="copyright.jsp"></jsp:include>
</div>


</body>
<script type="text/javascript">
 $(document).ready(function(){
 
 $("#back").click(function(){
 
 	window.location = "/hotel";
 
 });
 
 $("#register").click(function(){
	
	
	//validation
	//用户名是否被注册
	
	var userName = $("[name='userName']").val();
	if(userName==null||userName==""){
		$(".username").text("请输入用户名！");
		return false;
	}
		$.post("isExsit",{username:userName},function(data){
				   if(data==false){
						$(".username").text("该用户名已被注册！");
						return false;
				   }else{
					   $(".username").text("");
				   }
		});
	
	
	var userPassword = $("[name='userPassword']").val();
	var repassword = $("[name='repassword']").val();
	var phone = $("[name='phone']").val();
	var email = $("[name='email']").val();
	var hotelId = $("[name='hotelId']").val();
	var roleId = $("[name='roleId']").val();
	
	if(userPassword==null||userPassword==""){
		$(".password").text("请输入密码！");
		return false;
	}else{
		$(".password").text(" ");
	}
	if(repassword==repassword==""){
		$(".repassword").text("请再次输入密码！");
		return false;
	}else{
		$(".repassword").text(" ");
	}
	if(userPassword!=repassword){
		$(".repassword").text("密码不一致！");
		return false;
	}else{
		$(".repassword").text(" ");
	}
	if(phone==null||phone==""){
		$(".phone").text("请输入联系电话！");
		return false;
	}else{
		$(".phone").text(" ");
	}
	if(email==null||email==""){
		$(".email").text("请输入电子邮箱！");
		return false;
	}else{
		$(".email").text(" ");
	}
	if(hotelId==null||hotelId==""){
		$(".hotelId").text("所在酒店编号不能为空！");
		return false;
	}else{
		$(".hotelId").text(" ");
	}
	if(roleId!="0002"&&roleId!="0003"){
		$(".roleId").text("角色不能为空！");
		return false;
	}else{
		$(".roleId").text(" ");
	
	}
	
	$("#loading").css("display", "block");
	var user = $("#user_form").serialize();
	   $.post("/hotel/register",user,function(data){
	   
				   if(data=="success"){
                        $("#loading").css("display", "none");
						$.messager.alert('消息','注册成功!管理员审核后方可登陆.','info');  

				   }else{
					  alert("error!");		   
				   } 
     });	
	
	 
	
   });
 
	
});
 
</script>

</html>
