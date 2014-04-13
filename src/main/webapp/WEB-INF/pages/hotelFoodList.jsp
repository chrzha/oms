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
      酒店周围美食信息
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
a:link {
 text-decoration: none;
 color: #F60;
 }
 a:visited {
 text-decoration: none;
 }
 a:hover {
 text-decoration: none;
 }
 a:active {
 text-decoration: none;
 font-size: 14px;
 font-weight: bold;
 }
</style>
</head>
<body class="easyui-layout" >
  <div region="center" style="height:80px;" id="test">
  <table class="easyui-datagrid" title="管理员列表" style="width:1000px;height:400px">
		<thead>
			<tr>
				<th data-options="field:'foodId',width:100,align:'center'">美食编号</th>
				<th data-options="field:'foodName',width:100,align:'center'">美食名称</th>
				<th data-options="field:'foodType',width:100,align:'center'">类型</th>
				<th data-options="field:'foodAddress',width:100,align:'center'">地址</th>
				<th data-options="field:'foodPhoto',width:100,align:'center'">图片</th>
				<th data-options="field:'foodRout',width:100,align:'center'">线路</th>
				<th data-options="field:'foodDesc',width:160,align:'center'">简介</th>
				<th data-options="field:'update',width:60,align:'center'"></th>
				<th data-options="field:'delete',width:60,align:'center'"></th>
			</tr>
		</thead>
		<tbody>
		
		 <c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td><a  id="foodId_${status.count}">${list.id}</a></td>
					<td><a  id="foodName_${status.count}">${list.name}</a></td>
					<td><a  id="foodType_${status.count}">${list.type}</a></td>
					<td><a  id="foodAddress_${status.count}">${list.address}</a></td>
					<td><a  id="foodPhoto_${status.count}">${list.photo}</a><tetd>
					<td><a  id="foodRout_${status.count}">${list.rout}</a></td>
					<td><a  id="foodDesc_${status.count}">${list.description}</a></td>
					<td><button id="update_${status.count}"> <a href="#">修改</a></button></td>
					<td><button id="delete_${status.count}"> <a href="/hotel/deleteFoodById?foodId=${list.id}">删除</a></button></td>
					
				</tr>
			</c:forEach> 
			<tr>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td ><button id="add_${status.count}"> <a id="addMkt">添加</a></button></td>
			</tr>
		</tbody>
	</table>
 </div>
 
</body>
<script type="text/javascript">
$(document).ready(function(){

	$("#addMkt").click(function(){
	
	});

});
 
</script>

</html>
