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
      酒店周围景点
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
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/locale/easyui-lang-zh_CN.js">
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
  <div region="center" style="height:80px;">
  <table class="easyui-datagrid" title="管理员列表" style="width:1000px;height:400px">
		<thead>
			<tr>
				<th data-options="field:'viewId',width:100,align:'center'">景点编号</th>
				<th data-options="field:'viewName',width:100,align:'center'">景点名称</th>
				<th data-options="field:'viewAddress',width:100,align:'center'">地址</th>
				<th data-options="field:'viewAway',width:100,align:'center'">距离</th>
				<th data-options="field:'viewRout',width:100,align:'center'">线路</th>
				<th data-options="field:'price',width:100,align:'center'">门票</th>
				<th data-options="field:'viewDesc',width:160,align:'center'">简介</th>
				
				<th data-options="field:'delete',width:60,align:'center'"></th>
				
			</tr>
		</thead>
		<tbody>
		
		 <c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td><a  id="viewId_${status.count}">${list.id}</a></td>
					<td><a  id="viewName_${status.count}">${list.name}</a></td>
					<td><a  id="viewAddress_${status.count}">${list.address}</a></td>
					 
					<td><a  id="viewAway_${status.count}">${list.away}</a></td>
					<td><a  id="viewRout_${status.count}">${list.rout}</a></td>
					<td>￥<a  id="viewPrice_${status.count}">${list.price}</a></td>
					<td><a  id="viewDesc_${status.count}">${list.description}</a></td>
					
				    <td><button > <a id="delete_${status.count}">删除</a></button></td>
				</tr>
			</c:forEach> 
			
		</tbody>
	</table>
  </div>

 
</body>
<script type="text/javascript">

</script>

</html>
