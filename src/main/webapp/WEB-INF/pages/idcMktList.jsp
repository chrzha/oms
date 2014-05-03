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
      酒店周围购物信息
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
				<th data-options="field:'mktId',width:100,align:'center'">商场编号</th>
				<th data-options="field:'mktName',width:100,align:'center'">商场名称</th>
				<th data-options="field:'mktAddress',width:100,align:'center'">地址</th>
				<th data-options="field:'mktAway',width:100,align:'center'">距离</th>
				<th data-options="field:'mktRout',width:100,align:'center'">线路</th>
				<th data-options="field:'mktDesc',width:160,align:'center'">简介</th>
			
				<th data-options="field:'delete',width:60,align:'center'"></th>
			</tr>
		</thead>
		<tbody>
		
		 <c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td><a  id="mktId_${status.count}">${list.id}</a></td>
					<td><a  id="mktName_${status.count}">${list.name}</a></td>
					<td><a  id="mktAddress_${status.count}">${list.address}</a></td>
					 
					<td><a  id="mktAway_${status.count}">${list.away}</a></td>
					<td><a  id="mktRout_${status.count}">${list.rout}</a><tetd>
					<td><a  id="mktDesc_${status.count}">${list.description}</a></td>
					
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
