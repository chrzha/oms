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
      云中心管理员界面
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
  <table class="easyui-datagrid" title="管理员列表" style="width:1000px;height:400px">
		<thead>
			<tr>
				<th data-options="field:'userId',width:100,align:'center'">编号</th>
				<th data-options="field:'userName',width:100,align:'center'">用户名</th>
				<th data-options="field:'role',width:100,align:'center'">角色</th>
				<th data-options="field:'hotel',width:100,align:'center'">所在酒店</th>
				<th data-options="field:'status',width:100,align:'center'">是否通过审核</th>
				<th data-options="field:'phone',width:160,align:'center'">联系电话</th>
				<th data-options="field:'email',width:160,align:'center'">电子邮箱</th>
				<th data-options="field:'validate',width:60,align:'center'"></th>
				<th data-options="field:'delete',width:60,align:'center'"></th>
				
			</tr>
		</thead>
		<tbody>
		
		 <c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td><a  id="userId_${status.count}">${list.userId}</a></td>
					<td><a  id="userName_${status.count}">${list.userName}</a></td>
					<td>
					<a id="roleId_${status.count}">${list.roleName}</a>
					</td>
					
					<td><a  id="hotelId_${status.count}">${list.hotelId}</a></td>
					<td>
					<select id="status_${status.count}" disabled="disabled">
					<option value="1" <c:if test="${list.status=='1'}">selected="selected"</c:if> >通过</option>
					<option value="0" <c:if test="${list.status=='0'}">selected="selected"</c:if> >未通过</option>
					</select>
					</td>
					<td><a  id="phone_${status.count}">${list.phone}</a></td>
					<td><a  id="email_${status.count}">${list.email}</a></td>
					<td> <a href="/hotel/editUser?userId=${list.userId}" class="easyui-linkbutton" plain="true" iconCls="icon-edit">审核</a></td>
					<td><a id="delete_${status.count}" class="easyui-linkbutton" plain="true" iconCls="icon-remove"> 删除 </a></td>
				</tr>
			</c:forEach> 
			<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td><a id="reload" class="easyui-linkbutton" plain="true" iconCls="icon-reload">刷新</a></td></tr>
	
		</tbody>
	</table>
  

  </div>
</body>
<script type="text/javascript">
$(document).ready(function(){

    $("#reload").click(function(){

		window.location.reload();

	});
  
	$(".easyui-datagrid tbody tr").each(function(i){
	
	    var index = $(this).index();
	 
		 $("#delete_"+i).click(function(){

			var userId = $("#userId_"+index).text();
		
		 $.messager.confirm('确认', '确定要删除该条记录吗?', function(r){  
		  if(r){
		 	$.ajax({
				url : "/hotel/deleteUser?userId="+userId,
				type : 'POST',
				success : function(data) {
				
					window.location.reload();
				},
				error : function() {
					alert("修改失败！");
				}
			});
		 }
		});
	 });
   });
 
});
</script>

</html>
