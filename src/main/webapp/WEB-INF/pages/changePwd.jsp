<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>
    密码修改
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
 
</head>
<body class="easyui-layout" >
<div style="height:210px;width:410px;margin:100px 0 0 300px;">
  <div class="easyui-panel"  title="修改密码" style="height:200px;width:400px;">
  	<div style="padding:10px 0 0 10px">
	    <form id="ff" method="post">
	    	<table style="margin:10px 0 0 70px;">
	    	<input type="hidden" value="${user.userPassword}" id="sessionPwd"/>
	    	<input type="hidden" value="${user.userId}" id="userId"/>
				<tr><td>原密码:</td><td><input type="password" id="inputPwd"></input></td></tr>
				<tr><td>新密码:</td><td><input type="password" id="userPassword" name="userPassword"></input></td></tr>
				<tr><td>确认密码:</td><td><input type="password" id="confirmPwd"></input></td></tr>   		
	    	</table>
	    </form>
	</div>
	<div style="margin:0 0 0 140px">
	<button id="confirmBtn">确认修改</button>
	<button id="cancleBtn">放弃修改</button>
	
	</div>
	
  </div>

</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	
	var userId = $("#userId") ;
	var oldPwd = $("#sessionPwd") ;
	var inputPwd = $("#inputPwd") ;
	var newPwd = $("#userPassword") ;
	var newPwd2 = $("#confirmPwd") ;
	
	$("#confirmBtn").click(function(){
	
		if(inputPwd.val()!=oldPwd.val()){
		$.messager.alert('错误','原密码错误!','error');  
		}else if(newPwd.val()!==newPwd2.val()){
		$.messager.alert('错误','两次输入的密码不一致!','error');
		}else{
				$.ajax({
				url : "/hotel/doChangePwd?userId="+userId.val()+"&userPassword="+newPwd.val(),
				type : 'GET',
				success : function(data) {
					if(data=="success"){
					   $.messager.alert('消息','修改成功!','info');
            			window.parent.location.href = '/hotel/login';
					}else if(data=="error"){
					$.messager.alert('错误','修改失败，请重试!','error');
					}
				}
			});

		}
	});
	
	$("#cancleBtn").click(function(){
	window.opener=null;
		window.parent.close();
	});
	
	
});
 
</script>

</html>
