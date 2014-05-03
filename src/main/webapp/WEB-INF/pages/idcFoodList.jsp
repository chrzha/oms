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
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/locale/easyui-lang-zh_CN.js">
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
<body class="easyui-layout" style="width:100%;height:600px;">
  <div region="center" style="height:80px;" id="test">
  <table class="easyui-datagrid" title="美食列表" style="width:1120px;height:450px">
		<thead>
			<tr>
				<th data-options="field:'foodId',width:80,align:'center'">美食编号</th>
				<th data-options="field:'foodPhoto',width:100,align:'center'">图片</th>
				<th data-options="field:'foodName',width:100,align:'center'">美食名称</th>
				<th data-options="field:'foodType',width:100,align:'center'">类型</th>
				<th data-options="field:'foodPrice',width:50,align:'center'">价格</th>
				<th data-options="field:'foodAddress',width:150,align:'center'">地址</th>
				<th data-options="field:'foodRout',width:100,align:'center'">线路</th>
				<th data-options="field:'foodDesc',width:180,align:'center'">简介</th>
				<th data-options="field:'delete',width:60,align:'center'"></th>
			</tr>
		</thead>
		<tbody id="myBody">
		 <c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td><a  id="foodId_${status.count}">${list.id}</a></td>
					<td><img src="${pageContext.request.contextPath}/webresource/hotel-img/${list.photo}"/></td>
					<td><a  id="foodName_${status.count}">${list.name}</a></td>
					<td><a  id="foodType_${status.count}">${list.type}</a></td>
					<td>￥<a  id="foodPrice_${status.count}">${list.price}</a></td>
					<td><a  id="foodAddress_${status.count}">${list.address}</a></td>
					<td><a  id="foodRout_${status.count}">${list.rout}</a></td>
					<td><a  id="foodDesc_${status.count}">${list.description}</a></td>
					<td><button> <a id="delete_${status.count}">删除</a></button></td>
					
				</tr>
			</c:forEach> 
		</tbody>
	</table>
	<div class="easyui-pagination" data-options="total:114" style="border:1px solid #ddd;"></div>
	
 </div>
</body>
<script type="text/javascript">
$(document).ready(function(){

	var startIndex = 0;
	var pageSize = 5;
	
	$.ajax({
				url : "/hotel/foodList?startIndex="+startIndex+"&pageSize="+pageSize,
				type : 'GET',
				success : function(data) {
				initTable(data);
				},
				error : function() {
					alert("修改失败！");
				}
	});
	
	
	function initTable(data) {
		
            var len = data.length;
          
            $("#myBody tr").remove();
            
            for (var i = 0; i < len; i++) {
            	
            	 $(".easyui-datagrid #myBody").append("<tr></tr>");
                 $(".easyui-datagrid #myBody tr:last").append("<td><a>"+data[i].id+"</a></td>");
                 $(".easyui-datagrid #myBody tr:last").append("<td><a>"+data[i].photo+"</a></td>");
                 $(".easyui-datagrid #myBody tr:last").append("<td><a>"+data[i].name+"</a></td>");
                 $(".easyui-datagrid #myBody tr:last").append("<td><a>"+data[i].type+"</a></td>");
                 $(".easyui-datagrid #myBody tr:last").append("<td><a>"+data[i].price+"</a></td>");
                 $(".easyui-datagrid #myBody tr:last").append("<td><a>"+data[i].address+"</a></td>");
                 $(".easyui-datagrid #myBody tr:last").append("<td><a>"+data[i].rout+"</a></td>");
                 $(".easyui-datagrid #myBody tr:last").append("<td><a>"+data[i].description+"</a></td>");
                 $(".easyui-datagrid #myBody tr:last").append("<td><a>delete</a></td>");
                
		}
	}

});
 
</script>

</html>
