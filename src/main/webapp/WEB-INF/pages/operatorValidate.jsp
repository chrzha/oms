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
     管理员界面
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
 
</style>
</head>
<body class="easyui-layout" >
  <div region="center" style="height:80px;">
  <table class="easyui-datagrid" title="操作员列表" style="width:1000px;height:400px">
		<thead>
			<tr>
				<th data-options="field:'userId',width:100,align:'center'">编号</th>
				<th data-options="field:'userName',width:100,align:'center'">用户名</th>
				<th data-options="field:'role',width:100,align:'center'">角色</th>
				<th data-options="field:'hotel',width:100,align:'center'">所在酒店</th>
				<th data-options="field:'status',width:100,align:'center'">是否通过审核</th>
				<th data-options="field:'phone',width:160,align:'center'">联系电话</th>
				<th data-options="field:'email',width:160,align:'center'">电子邮箱</th>
				<th data-options="field:'save',width:60,align:'center'"></th>
				<th data-options="field:'delete',width:60,align:'center'"></th>
			</tr>
		</thead>
		<tbody>
		
		 <c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td><a  id="userId_${status.count}">${list.userId}</a></td>
					<td><a  id="userName_${status.count}">${list.userName}</a></td>
					<td>
					<a id="roleName_${status.count}">${list.roleName}</a>
					</td>
					<input type="hidden" id="roleId_${status.count}" value="${list.roleId}" />
					
					<td><a  id="hotelId_${status.count}">${list.hotelId}</a></td>
					<td>
					<select id="status_${status.count}">
					<option value="1" <c:if test="${list.status=='1'}">selected="selected"</c:if> >通过</option>
					<option value="0" <c:if test="${list.status=='0'}">selected="selected"</c:if> >未通过</option>
					</select>
					</td>
					<td><a  id="phone_${status.count}">${list.phone}</a></td>
					<td><a  id="email_${status.count}">${list.email}</a></td>
					<td><a id="save_${status.count}" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a></td>
					<td> <a id="delete_${status.count}" class="easyui-linkbutton" plain="true" iconCls="icon-remove">删除</a> </td>
				</tr>
			</c:forEach> 
			<tr>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td> <a id="add" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a> </td>
			</tr>
	
		</tbody>
	</table>
 
  </div>
  <div id="win_add" class="easyui-window" title="添加操作员" closed="true" style="width:400px;height:220px;">    
       <form name="form"  id = "add_form" action="/hotel/adduUser" ENCTYPE="multipart/form-data" modelAttribute="user" method="user" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<input type="hidden" name="id" />
			
			<input type="hidden" name="hotelId" value="${user.hotelId}"/>
			
			<input type="hidden" name="roleId" value="0003"/>
			
			<tr><td><span>用户名*</span></td><td><input type="text" name="userName" /></td></tr>

			<tr><td><span>密码*</span></td><td><input type="password" name="userPassword" /></td></tr>

			<tr><td><span>确认密码*</span></td><td><input type="password" name="confirm"></td></tr>
			
			<tr><td><span>邮箱*</span></td><td><input type="text" name="email" class="easyui-validatebox" data-options="validType:'email'"></td></tr>
					
	    	</table>
	    	<div class="submit" style="margin-left:140px;">
	    		<a id="add_user" class="easyui-linkbutton" plain="true" iconCls="icon-add">添加</a>
	    		<a id="cancle_add" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></div>
	    	</form>
	    
    </div>
</body>
<script type="text/javascript">
$(document).ready(function(){


$(".easyui-datagrid tbody tr").each(function(i){

		var index = $(this).index()+1;
		
	    var userId = $("#userId_"+index).text();
	    
	    var roleId = $("#roleId_"+index).val();
	    
		var status = $("#status_"+index).val();
		
		$("#status_"+index).change(function(){
		
		status = $(this).val();
		
		});


	    $("#save_"+index).click(function(){

	     $.ajax({
			url : "/hotel/doEditUser?userId="+userId+"&status="+status+"&roleId="+roleId,
			type : 'POST',
			success : function(data) {
			    alert("修改成功！");
				window.location.reload();
			},
			error : function() {
				alert("修改失败！");
			}
		  });
	    });
	    
	    $("#delete_"+index).click(function(){
	    
	    $.messager.confirm('确认', '确定要删除吗?', function(r){  
		 	if(r){
		 	 $.ajax({
					url : "/hotel/deleteUser?userId="+userId,
					type : 'POST',
					success : function(data) {
			   	 	alert("删除成功！");
					window.location.reload();
					},
					error : function() {
					alert("删除失败失败！");
					}
		  		});
		      }        
          });  

	    }); 
	   $("#add").click(function(){
	   
	   		$('#win_add').window('open'); 
	   
	   		$("#add_user").click(function(){
	   
	   			var user = $("#add_form").serialize();
	   			$.post("/hotel/register",user,function(data){
				   	if(data=="success"){
							window.location.reload();
				   		}else{
					  	alert("error!");		   
				   	} 
		 		});
	   		});
		});
		$("#cancle_add").click(function(){

            $('#win_add').window('close'); 
		});
    
  });
});
 
</script>

</html>
