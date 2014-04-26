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
<script type="text/javascript">
$(document).ready(function(){

	$("#addFood").click(function(){
	   $('#win_add').window('open'); 
	   
	   $("#add_food").click(function(){
	   
	   var food = $("#add_form").serialize();
	   $.post("/hotel/addFood",food,function(data){
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
	   $('#win_update').window('close'); 
	});	
	$("#cancle_update").click(function(){
	   $('#win_update').window('close'); 
	});	
	
	$(".easyui-datagrid tbody tr").each(function(i){
	
	    var index = $(this).index();
	
	    $("#update_"+i).click(function(){

			var foodId = $("#foodId_"+index).text();
			var foodName = $("#foodName_"+index).text();
			var foodType = $("#foodType_"+index).text();
			var foodAddress = $("#foodAddress_"+index).text();
			var foodPhoto = $("#foodPhoto_"+index).text();
			var foodRout = $("#foodRout_"+index).text();
			var foodDesc = $("#foodDesc_"+index).text();
			

			$("#update_id").text(foodId);
			$("#hidden_id").val(foodId);
			$("#update_name").val(foodName);
			$("#update_type").val(foodType);
			$("#update_address").val(foodAddress);
			$("#update_photo").val(foodPhoto);
			$("#update_rout").val(foodRout);
			$("#update_description").val(foodDesc);
			
			$('#win_update').window('open'); 
			
			
			$("#update").click(function(){
			
			var food = $("#update_form").serialize();
				$.post("/hotel/updateFood",food,function(data){
				   if(data=="success"){
						window.location.reload();
				   }else{
					  alert("error!");		   
				   } 
		   		});
			});
	
		});
		 $("#delete_"+i).click(function(){

			var foodId = $("#foodId_"+index).text();
		
		 $.messager.confirm('确认', '确定要删除该条记录吗?', function(r){  
		 if(r){
		 	$.ajax({
				url : "/hotel/deleteFoodById?foodId="+foodId,
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
					<td><button id="update_${status.count}"> 修改 </button></td>
					<td><button> <a id="delete_${status.count}">删除</a></button></td>
					
				</tr>
			</c:forEach> 
			<tr>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td ><button id="add_${status.count}"> <a id="addFood">添加</a></button></td>
			</tr>
		</tbody>
	</table>
	
 </div>
	<div id="win_add" class="easyui-window" title="添加美食记录" closed="true" style="width:400px;height:270px;">    
       <form name="form"  id = "add_form" action="/hotel/addFood" ENCTYPE="multipart/form-data" modelAttribute="food" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			<input type="hidden" name="id">
			<tr><td><span>名称*</span></td><td><input type="text" name="name" maxlength="20"></td></tr>

			<tr><td><span>类型*</span></td><td><input type="text" name="type" maxlength="20"></td></tr>

			<tr><td><span>地址*</span></td><td><input type="text" name="address" maxlength="20"></td></tr>

			<tr><td><span>图片</span></td><td><input type="text" name="photo"></td></tr>

			<tr><td><span>线路</span></td><td><input type="text" name="rout"></td></tr>

			<tr><td><span>简介</span></td><td><input type="text" name="description"></td></tr>
					
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<input type="button" name="add_food" id="add_food" value="添加"/>
	    		<input type="reset" name="reset" value="重填"/>
	    		<input type="button" id="cancle_add" value="取消" /></div>
	    	</form>
	    
    </div>
    <div id="win_update" class="easyui-window" title="修改美食记录" closed="true" style="width:400px;height:290px;">    
       <form name="form" id="update_form" action="#" ENCTYPE="multipart/form-data" modelAttribute="food" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<input type="hidden" value="" name="id" id="hidden_id"></input>
			
			<tr><td><span>编号</span></td><td><label readonly="readonly" id="update_id"></label</td></tr>
			
			<tr><td><span>名称*</span></td><td><input type="text" id="update_name" name="name"></td></tr>

			<tr><td><span>类型*</span></td><td><input type="text" id="update_type" name="type"></td></tr>

			<tr><td><span>地址*</span></td><td><input type="text" id="update_address" name="address"></td></tr>

			<tr><td><span>图片</span></td><td><input type="text" id="update_photo" name="photo"></td></tr>

			<tr><td><span>线路</span></td><td><input type="text" id="update_rout" name="rout"></td></tr>

			<tr><td><span>简介</span></td><td><input type="text" id="update_description" name="description"></td></tr>
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<input type="button" id="update" value="更新"/>
	    		<input type="reset" name="reset" value="重填"/>
	    		<input type="button" id="cancle_update" value="取消" /></div>
	    	</form>
	    
    </div>
 
</body>

</html>
