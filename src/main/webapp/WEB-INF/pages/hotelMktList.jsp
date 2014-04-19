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
				<th data-options="field:'update',width:60,align:'center'"></th>
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
					<td><button id="update_${status.count}"> <a href="#">修改</a></button></td>
					<td><button id="delete_${status.count}"> <a href="/hotel/deleteMktById?mktId=${list.id}">删除</a></button></td>
					
				</tr>
			</c:forEach> 
			<tr>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td ><button id="add_${status.count}"> <a id="addMkt">添加</a></button></td>
			</tr>
		</tbody>
	</table>
 </div>
 <div id="win" class="easyui-window" title="添加美食记录" closed="true" style="width:400px;height:270px;">    
       <form name="form" action="#" ENCTYPE="multipart/form-data" modelAttribute="#" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<tr><td><span>名称*</span></td><td><input type="text" name="userName" maxlength="20"></td><td><span class="username"></span></td></tr>

			<tr><td><span>类型*</span></td><td><input type="password" name="userPassword" maxlength="20"></td><td><span class="password"></span></td></tr>

			<tr><td><span>地址*</span></td><td><input type="password" name="repassword" maxlength="20"></td><td><span class="repassword"></span></td></tr>

			<tr><td><span>图片</span></td><td><input type="text" name="phone"></td><td><span class="telephone"></span></td></tr>

			<tr><td><span>线路</span></td><td><input type="text" id="id1" name="email"></td><td><span class="email"></span></td></tr>

			<tr><td><span>简介</span></td><td><input type="text" id="hotelId" name="hotelId"></td><td><span class="hotelId"></span></td></tr>

			<input type="hidden" id = "hotelId" name="hotelId">
			
			<input type="hidden" id="status" name="status">
					
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<input type="submit" name="register" value="添加"/>
	    		<input type="reset" name="reset" value="重填"/>
	    		<input type="button" id="cancle" value="取消" /></div>
	    	</form>
	    
    </div>
 
</body>
<script type="text/javascript">
$(document).ready(function(){

	$("#addMkt").click(function(){
	   $('#win').window('open'); 
	});
	$("#cancle").click(function(){
	   $('#win').window('close'); 
	});

});
 
</script>

</html>
