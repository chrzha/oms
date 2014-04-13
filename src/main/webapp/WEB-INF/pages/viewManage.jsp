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
   			 附近景点管理页面
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
  <table class="easyui-datagrid" title="管理员列表" style="width:1000px;height:400px">
		<thead>
			<tr>
				<th data-options="field:'userId',width:100,align:'center'">管理员编号</th>
				<th data-options="field:'userName',width:100,align:'center'">用户名</th>
				<th data-options="field:'role',width:100,align:'center'">角色</th>
				<th data-options="field:'hotel',width:100,align:'center'">所在酒店</th>
				<th data-options="field:'status',width:100,align:'center'">是否通过审核</th>
				<th data-options="field:'phone',width:160,align:'center'">联系电话</th>
				<th data-options="field:'email',width:160,align:'center'">电子邮箱</th>
				<th data-options="field:'save',width:60,align:'center'"></th>
			</tr>
		</thead>
		<tbody>
		
		 <c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td><a  id="userId_${status.count}">${list.userId}</a></td>
					<td><a  id="userName_${status.count}">${list.userName}</a></td>
					<td>
					<select id="roleId_${status.count}">
					<option value="0002" <c:if test="${list.roleId=='0002'}">selected="selected"</c:if> >酒店管理员</option>
					<option value="0003" <c:if test="${list.roleId=='0003'}">selected="selected"</c:if> >酒店操作员</option>
					</select>
					</td>
					
					<td><a  id="hotelId_${status.count}">${list.hotelId}</a></td>
					<td>
					<select id="status_${status.count}">
					<option value="1" <c:if test="${list.status=='1'}">selected="selected"</c:if> >通过</option>
					<option value="0" <c:if test="${list.status=='0'}">selected="selected"</c:if> >未通过</option>
					</select>
					</td>
					<td><a  id="phone_${status.count}">${list.phone}</a></td>
					<td><a  id="email_${status.count}">${list.email}</a></td>
					<td><button id="save_${status.count}">保存</button></td>
				</tr>
			</c:forEach> 
	
		</tbody>
	</table>
  

  </div>
</body>
<script type="text/javascript">
$(document).ready(function(){
 
</script>

</html>
