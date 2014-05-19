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
      酒店设施信息
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
<script type="text/javascript">
$(document).ready(function(){

	$("#addFacilities").click(function(){
	   $('#win_add').window('open'); 
	   
	   $("#add_facilities").click(function(){
	   
	   var facilities = $("#add_form").serialize();
	   $.post("/hotel/addFacilities",facilities,function(data){
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

			var facilitiesId = $("#facilitiesId_"+index).text();
			var facilitiesName = $("#facilitiesName_"+index).text();
			var facilitiesType = $("#facilitiesType_"+index).text();
			var facilitiesAddress = $("#facilitiesAddress_"+index).text();
			var facilitiesPhoto = $("#facilitiesPhoto_"+index).text();
			var facilitiesRout = $("#facilitiesRout_"+index).text();
			var facilitiesPrice = $("#facilitiesPrice_"+index).text();
			var facilitiesDesc = $("#facilitiesDesc_"+index).text();
			

			$("#update_id").text(facilitiesId);
			$("#hidden_id").val(facilitiesId);
			$("#update_name").val(facilitiesName);
			$("#update_type").val(facilitiesType);
			$("#update_address").val(facilitiesAddress);
			$("#update_photo").val(facilitiesPhoto);
			$("#update_rout").val(facilitiesRout);
			$("#update_price").val(facilitiesPrice);
			$("#update_description").val(facilitiesDesc);
			
			$('#win_update').window('open'); 
			
			
			$("#update").click(function(){
			
			var facilities = $("#update_form").serialize();
				$.post("/hotel/updateFacilities",facilities,function(data){
				   if(data=="success"){
						window.location.reload();
				   }else{
					  alert("error!");		   
				   } 
		   		});
			});
	
		});
		 
		 
		 $("#delete_"+i).click(function(){

			var facilitiesId = $("#facilitiesId_"+index).text();
		
		 $.messager.confirm('确认', '确定要删除该条记录吗?', function(r){  
		 if(r){
		 	$.ajax({
				url : "/hotel/deleteFacilitiesById?facilitiesId="+facilitiesId,
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
<body class="easyui-layout" style="width:100%;height:600px;">
  <div region="center" style="height:80px;" id="test">
  <table class="easyui-datagrid" title="设施列表" style="width:1120px;height:478px">
		<thead>
			<tr>
				<th data-options="field:' Id',width:80,align:'center'">编号</th>
				<th data-options="field:' Name',width:140,align:'center'">名称</th>
				<th data-options="field:' Type',width:100,align:'center'">类型</th>
				<th data-options="field:' Price',width:70,align:'center'">价格</th>
				<th data-options="field:'Away',width:120,align:'center'">距离</th>
				<th data-options="field:' Desc',width:280,align:'center'">备注</th>
				 <th data-options="field:'status',width:80,align:'center'">状态</th>
				<th data-options="field:'update',width:70,align:'center'"></th>
				<th data-options="field:'delete',width:70,align:'center'"></th>
			</tr>
		</thead>
		<tbody>
		
		 <c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td><a  id="facilitiesId_${status.count}">${list.id}</a></td>
					<td><a  id="facilitiesName_${status.count}">${list.name}</a></td>
					<td><a  id="facilitiesType_${status.count}">${list.type}</a></td>
					<td>￥<a  id="facilitiesPrice_${status.count}">${list.price}</a></td>
					<td><a  id="facilitiesAway_${status.count}">${list.away}</a></td>
					<td><a  id="facilitiesDesc_${status.count}">${list.description}</a></td>
					<td><a  id="facilitiesStatus_${status.count}">${list.status}</a></td>
					<td><a id="update_${status.count}" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a></td>
					<td><a id="delete_${status.count}" class="easyui-linkbutton" plain="true" iconCls="icon-remove">删除</a></td>
					
				</tr>
			</c:forEach> 
			<tr>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td ><a id="addFacilities" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a></td>
			</tr>
		</tbody>
	</table>
	
	
 </div>
	<div id="win_add" class="easyui-window" title="添加设施信息" closed="true" style="width:400px;height:280px;" data-options="iconCls:'icon-add'">    
       <form name="form"  id = "add_form" action="/hotel/addFacilities" ENCTYPE="multipart/form-data" modelAttribute="facilities" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			<input type="hidden" name="id">
			<tr><td><span>名称*</span></td><td><input type="text" name="name" maxlength="20"></td></tr>

			<tr><td><span>类型*</span></td><td><select id="type" name="type" style="width:155px;">
			
			<option>--请选择--</option><option value="本店设施">本店设施</option><option value="娱乐设施">娱乐设施</option><option value="基础设施">基础设施</option></select></td></tr>

			<tr><td><span>价格</span></td><td><input type="text" name="price"  ></td></tr>
			
			<tr><td><span>距离</span></td><td><input type="text" name="away"></td></tr>

			<tr><td><span>简介</span></td><td><input type="text" name="description"></td></tr>
					
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<a id="add_facilities" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
	    		<a id="cancle_add" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></div>
	    	</form>
	    
    </div>
    <div id="win_update" class="easyui-window" title="修改设施记录" closed="true" style="width:400px;height:300px;" data-options="iconCls:'icon-edit'">    
       <form name="form" id="update_form" action="#" ENCTYPE="multipart/form-data" modelAttribute="facilities" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<input type="hidden" value="" name="id" id="hidden_id"></input>
			
			<tr><td><span>编号</span></td><td><label readonly="readonly" id="update_id"></label</td></tr>
			
			<tr><td><span>名称*</span></td><td><input type="text" id="update_name" name="name"></td></tr>

			<tr><td><span>类型*</span></td><td><select id="update_type" name="type" style="width:155px;">
			
			<option value="本店设施">本店设施</option><option value="娱乐设施">娱乐设施</option><option value="基础设施">基础设施</option></select></td></tr>

			<tr><td><span>价格</span></td><td><input type="text" id="update_price" name="price"></td></tr>

			 
			<tr><td><span>线路</span></td><td><input type="text" id="update_rout" name="away"></td></tr>

			<tr><td><span>简介</span></td><td><input type="text" id="update_description" name="description"></td></tr>
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<a id="update" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
	    		<a id="cancle_update" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></div>
	    	</form>
	    
    </div>
</body>

</html>
