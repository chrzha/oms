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
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/tabs.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/SimpleTree.js">
</script>

<script type="text/javascript">
 $(document).ready(function(){
	
});
 
</script>
<style>
.username,.password,.repassword,.email,.description,.role,.phone,.hotelId{
	display:block;
	color:red;
	font-size:13px;
}

</style>
</head>
<body class="easyui-layout" >
  <div region="north" style="height:70px;background-color:#99ccff;">
    <div style="width:500px;height:30px;margin-left:460px;"><h1>基于云模式的酒店服务信息后台管理系统</h1></div>
  </div>


<div region="center">
  <div style="height:400px;width:410px;margin-left:490px;margin-top:10px;">
     <div class="easyui-panel"  title="注册" style="height:400px;width:400px;">
  	<div style="padding:10px 0 0 10px">
	   <form name="form" action="/hotel/register" ENCTYPE="multipart/form-data" modelAttribute="user" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<tr><td><span>用户名*</span></td><td><input type="text" name="userName" maxlength="20"></td><td><span class="username"></span></td></tr>

			<tr><td><span>密码*</span></td><td><input type="password" name="userPassword" maxlength="20"></td><td><span class="password"></span></td></tr>

			<tr><td><span>确认密码*</span></td><td><input type="password" name="repassword" maxlength="20"></td><td><span class="repassword"></span></td></tr>

			<tr><td><span>电话*</span></td><td><input type="text" name="phone"></td><td><span class="telephone"></span></td></tr>

			<tr><td><span>邮箱*</span></td><td><input type="text" id="id1" name="email"></td><td><span class="email"></span></td></tr>

			<tr><td><span>所在酒店编号*</span></td><td><input type="text" id="hotelId" name="hotelId"></td><td><span class="hotelId"></span></td></tr>

			<tr><td><span>注册角色*</span></td><td><select id="roleId" name="roleId" style="width:155px;"><option>--请选择--</option><option value="0002">酒店管理员</option><option value="0003">酒店操作员</option></select></td><td><span class="role"></span></td></tr>

			<tr><td><span>备注</span></td><td><input type="text" id="id1" name="description"></td><td></td></tr>
			
			<input type="hidden" id = "hotelId" name="hotelId">
			
			<input type="hidden" id="status" name="status">
					
	    	</table>
	    	<div class="submit" style="margin-left:150px;">
	    		<input type="submit" name="register" value="注册"/>
	    		<input type="reset" name="reset" value="重填"/></div>
	    	</form>
	    
	</div>
	</div>
	
  </div>
  </div>

<div region="south" style="height:40px;">
<jsp:include page="copyright.jsp"></jsp:include>
</div>


</body>

</html>
