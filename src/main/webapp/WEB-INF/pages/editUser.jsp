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
      修改管理员
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

<style>
 
</style>
</head>
<body class="easyui-layout" >
  <div region="center" style="height:80px;">
  <table class="easyui-datagrid" title="修改" style="width:1000px;height:400px">
		<thead>
			<tr>
				<th data-options="field:'userId',width:100,align:'center'">管理员编号</th>
				<th data-options="field:'userName',width:100,align:'center'">用户名</th>
				<th data-options="field:'roleId',width:100,align:'center'">角色</th>
				<th data-options="field:'hotel',width:100,align:'center'">所在酒店</th>
				<th data-options="field:'status',width:100,align:'center'">是否通过审核</th>
				<th data-options="field:'phone',width:160,align:'center'">联系电话</th>
				<th data-options="field:'email',width:160,align:'center'">电子邮箱</th>
				<th data-options="field:'save',width:60,align:'center'"></th>
			</tr>
		</thead>
		<tbody>
		 
				<tr>
					<td><a  id="userId" name="userId">${userView.userId}</a></td>
					<td><a  id="userName" name="userName">${userView.userName}</a></td>
					<td>
					<span  id="roleId">
					<select>
					<option value="0002" <c:if test="${userView.roleId=='0002'}">selected</c:if> >酒店管理员</option>
					<option value="0003" <c:if test="${userView.roleId=='0003'}">selected</c:if> >酒店操作员</option>
					</select>
					</span>
					</td>
					
					<td><a  id="hotelId" name="hotelId">${userView.hotelId}</a></td>
					<td>
					<span id="status">
					<select>
					<option value="1" <c:if test="${userView.status=='1'}">selected</c:if> >通过</option>
					<option value="0" <c:if test="${userView.status=='0'}">selected</c:if> >未通过</option>
					</select>
					</span>
					</td>
					<td><a  id="phone" name="phone">${userView.phone}</a></td>
					<td><a  id="email" name="email">${userView.email}</a></td>
					<td><a id="saveBtn" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a></td>
				</tr>
				<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
				<td><a id="backBtn" class="easyui-linkbutton" plain="true" iconCls="icon-back">返回</a></td></tr>
		 
		</tbody>
	</table>
  </div>
</body>
<script type="text/javascript">
$(document).ready(function(){
var userId = ${userView.userId};
var _status = $("#status").children("select");
var _roleId = $("#roleId").children("select");
var status = $("#status").children("select").val();
var roleId = $("#roleId").children("select").val();

	_status.change(function(){
	
	 status = $(this).val();
	
	});
	
	_roleId.change(function(){
	
	 roleId = $(this).val();
	
	});
	
	$("#saveBtn").click(function(){
	
	
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
	
	$("#backBtn").click(function(){
	
		history.back();
	
	});

});
 
</script>

</html>
