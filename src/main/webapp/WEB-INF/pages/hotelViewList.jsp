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
      酒店景点
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
				<th data-options="field:'update',width:60,align:'center'"></th>
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
					<td><button > <a id="update_${status.count}">修改</a></button></td>
				    <td><button > <a id="delete_${status.count}">删除</a></button></td>
				</tr>
			</c:forEach> 
			<tr>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td ><button id="add_${status.count}"> <a id="addView">添加</a></button></td>
			</tr>
	
		</tbody>
	</table>
  </div>
  <div id="win_add" class="easyui-window" title="添加景点记录" closed="true" style="width:400px;height:270px;">    
       <form name="form"  id = "add_form" action="/hotel/View" ENCTYPE="multipart/form-data" modelAttribute="view" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<input type="hidden" name="id">
			
			<tr><td><span>名称*</span></td><td><input type="text" name="name"></td></tr>

			<tr><td><span>地址*</span></td><td><input type="text" name="address"></td></tr>

			<tr><td><span>距离*</span></td><td><input type="text" name="away"></td></tr>

			<tr><td><span>线路</span></td><td><input type="text" name="rout"></td></tr>
			
			<tr><td><span>门票</span></td><td><input type="text" name="price"></td></tr>

			<tr><td><span>简介</span></td><td><input type="text" name="description"></td></tr>
					
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<input type="button" id="add_view" value="添加"/>
	    		<input type="reset" name="reset" value="重填"/>
	    		<input type="button" id="cancle_add" value="取消" /></div>
	    	</form>
	    
    </div>
 <div id="win_update" class="easyui-window" title="更新景点记录" closed="true" style="width:400px;height:290px;">    
       <form name="form" id="update_form" action="/hotel/updateView" ENCTYPE="multipart/form-data" modelAttribute="view" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<input type="hidden" value="" name="id" id="hidden_id"></input>
			
			<tr><td><span>编号</span></td><td><label readonly="readonly" id="update_id"></label</td></tr>
			
			<tr><td><span>名称*</span></td><td><input type="text" name="name" id="update_name"></td></tr>

			<tr><td><span>地址*</span></td><td><input type="text" name="address" id="update_address"></td></tr>

			<tr><td><span>距离</span></td><td><input type="text" name="away" id="update_away"></td></tr>

			<tr><td><span>线路</span></td><td><input type="text" name="rout" id="update_rout"></td></tr>
			
			<tr><td><span>门票</span></td><td><input type="text" name="price" id="update_price"></td></tr>

			<tr><td><span>简介</span></td><td><input type="text" name="description" id="update_description"></td></tr>
					
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<input type="button" id="update" value="更新"/>
	    		<input type="reset" name="reset" value="重填"/>
	    		<input type="button" id="update_cancle" value="取消" /></div>
	    	</form>
	    
    </div>
 
</body>
<script type="text/javascript">
$(document).ready(function(){
  
	$("#update_cancle").click(function(){
	   $('#win_update').window('close'); 
	});
	$("#cancle_add").click(function(){
	   $('#win_add').window('close'); 
	});
	
	$("#addView").click(function(){
	   
	   $('#win_add').window('open'); 
	   
	   $("#add_view").click(function(){
	   
	   var view = $("#add_form").serialize();
	   $.post("/hotel/addView",view,function(data){
				   if(data=="success"){
						window.location.reload();
				   }else{
					  alert("error!");		   
				   } 
		 });
	   
	   
	   });
  
	});
	
	$(".easyui-datagrid tbody tr").each(function(i){
	
	    var index = $(this).index();
	    
	    
	    $("#update_"+i).click(function(){

			var viewId = $("#viewId_"+index).text();
			var viewName = $("#viewName_"+index).text();
			var viewAddress = $("#viewAddress_"+index).text();
			var viewAway = $("#viewAway_"+index).text();
			var viewRout = $("#viewRout_"+index).text();
			var viewPrice = $("#viewPrice_"+index).text();
			var viewDesc = $("#viewDesc_"+index).text();
			

			$("#update_id").text(viewId);
			$("#hidden_id").val(viewId);
			$("#update_name").val(viewName);
			$("#update_address").val(viewAddress);
			$("#update_away").val(viewAway);
			$("#update_rout").val(viewRout);
			$("#update_price").val(viewPrice);
			$("#update_description").val(viewDesc);
			
			$('#win_update').window('open'); 
			
			
			$("#update").click(function(){
			
			var view = $("#update_form").serialize();
				$.post("/hotel/updateView",view,function(data){
				   if(data=="success"){
						window.location.reload();
				   }else{
					  alert("error!");		   
				   } 
		   		});
			});
	
		});
	    		 
	   $("#delete_"+i).click(function(){

		var viewId = $("#viewId_"+index).text();
		
		 $.messager.confirm('确认', '确定要删除该条记录吗?', function(r){  
		 if(r){
		 	$.ajax({
				url : "/hotel/deleteViewById?viewId="+viewId,
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
