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
      酒店美食信息
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
	$("#cancle_upload").click(function(){
	   $('#win_upload').window('close'); 
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
			var foodPrice = $("#foodPrice_"+index).text();
			var foodDesc = $("#foodDesc_"+index).text();
			

			$("#update_id").text(foodId);
			$("#hidden_id").val(foodId);
			$("#update_name").val(foodName);
			$("#update_type").val(foodType);
			$("#update_address").val(foodAddress);
			$("#update_photo").val(foodPhoto);
			$("#update_rout").val(foodRout);
			$("#update_price").val(foodPrice);
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
		//上传图片
		 $("#upload_"+i).click(function(){
		 
		 		var foodId = $("#foodId_"+index).text();
				//window.location="/hotel/upload?foodId="+foodId;
				$('#win_upload').window('open'); 
				$("#foodId").val(foodId);
		
		 });
		
		 $("#upload_submit").click(function(){
		 
           
		 var imgfile = $("#imgfile").val();
		 if(imgfile==null||imgfile==""){
		 	$.messager.alert('错误','文件不能为空!','error');
		 }else{
		 
           var value = $('#p').progressbar('getValue');  
           if (value < 100){  
               value += Math.floor(Math.random() * 30);  
              $('#p').progressbar('setValue', value);  
               setTimeout(arguments.callee, 200);  
           }else{
           		$("#upload_form").submit();
           }
		 }
		 
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
<body class="easyui-layout" style="width:100%;height:600px;">
  <div region="center" style="height:80px;" id="test">
  <table class="easyui-datagrid" title="美食列表" style="width:1120px;height:478px">
		<thead>
			<tr>
				<th data-options="field:'foodId',width:80,align:'center'">美食编号</th>
				<th data-options="field:'foodPhoto',width:80,align:'center'">图片</th>
				<th data-options="field:'foodName',width:100,align:'center'">美食名称</th>
				<th data-options="field:'foodType',width:80,align:'center'">类型</th>
				<th data-options="field:'foodPrice',width:50,align:'center'">价格</th>
				<th data-options="field:'foodAddress',width:100,align:'center'">所在酒店</th>
				<th data-options="field:'foodRout',width:200,align:'center'">线路</th>
				<th data-options="field:'foodDesc',width:120,align:'center'">备注</th>
				<th data-options="field:'foodStatus',width:80,align:'center'">状态</th>
				<th data-options="field:'upload',width:60,align:'center'"></th>
				<th data-options="field:'update',width:60,align:'center'"></th>
				<th data-options="field:'delete',width:60,align:'center'"></th>
			</tr>
		</thead>
		<tbody>
		
		 <c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td><a  id="foodId_${status.count}">${list.id}</a></td>
					<td><img src="${pageContext.request.contextPath}/webresource/hotel-img/${list.photo}"/></td>
					<td><a  id="foodName_${status.count}">${list.name}</a></td>
					<td><a  id="foodType_${status.count}">${list.type}</a></td>
					<td>￥<a  id="foodPrice_${status.count}">${list.price}</a></td>
					<td><a  id="foodAddress_${status.count}" title="${list.address}">${list.address}</a></td>
					<td><a  id="foodRout_${status.count}" title="${list.rout}">${list.rout}</a></td>
					<td><a  id="foodDesc_${status.count}">${list.description}</a></td>
					<td><c:if test="${list.status=='1'}"> <a  id="foodStatus_${status.count}">通过</a></c:if><c:if test="${list.status=='0'}">
					 <a  id="foodStatus_${status.count}">未通过</a></c:if></td>
					<td><a id="upload_${status.count}" class="easyui-linkbutton" plain="true" iconCls="icon-search">换图</a></td>
					<td><a id="update_${status.count}" class="easyui-linkbutton" plain="true" iconCls="icon-edit">修改</a></td>
					<td><a id="delete_${status.count}" class="easyui-linkbutton" plain="true" iconCls="icon-remove">删除</a></td>
					
				</tr>
			</c:forEach> 
			<tr>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td ><a id="addFood" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a></td>
			</tr>
		</tbody>
	</table>
	
	
 </div>
	<div id="win_add" class="easyui-window" title="添加美食记录" closed="true" style="width:400px;height:280px;" data-options="iconCls:'icon-add'">    
       <form name="form"  id = "add_form" action="/hotel/addFood" ENCTYPE="multipart/form-data" modelAttribute="food" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			<input type="hidden" name="id">
			<tr><td><span>名称*</span></td><td><input type="text" name="name" maxlength="20"></td></tr>

			<tr><td><span>类型*</span></td><td><select id="type" name="type" style="width:155px;">
			
			<option>--请选择--</option><option value="本店特色">本店特色</option><option value="周边美食">周边美食</option><option value="商务宴请">商务宴请</option></select></td></tr>

			<tr><td><span>价格</span></td><td><input type="text" name="price"  ></td></tr>
			
			<tr><td><span>所在酒店</span></td><td><input type="text" name="address" ></td></tr>

			<tr><td><span>线路</span></td><td><input type="text" name="rout"></td></tr>

			<tr><td><span>备注</span></td><td><input type="text" name="description"></td></tr>
					
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<a id="add_food" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
	    		<a id="cancle_add" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></div>
	    	</form>
	    
    </div>
    <div id="win_update" class="easyui-window" title="修改美食记录" closed="true" style="width:400px;height:300px;" data-options="iconCls:'icon-edit'">    
       <form name="form" id="update_form" action="#" ENCTYPE="multipart/form-data" modelAttribute="food" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<input type="hidden" value="" name="id" id="hidden_id"></input>
			
			<tr><td><span>编号</span></td><td><label readonly="readonly" id="update_id"></label</td></tr>
			
			<tr><td><span>名称*</span></td><td><input type="text" id="update_name" name="name"></td></tr>

			<tr><td><span>类型*</span></td><td><select id="update_type" name="type" style="width:155px;">
			
			<option value="本店特色">本店特色</option><option value="周边美食">周边美食</option><option value="商务宴请">商务宴请</option></select></td></tr>

			<tr><td><span>价格</span></td><td><input type="text" id="update_price" name="price"></td></tr>

			<tr><td><span>所在酒店</span></td><td><input type="text" id="update_address" name="address"></td></tr>

			<tr><td><span>线路</span></td><td><input type="text" id="update_rout" name="rout"></td></tr>

			<tr><td><span>备注</span></td><td><input type="text" id="update_description" name="description"></td></tr>
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<a id="update" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
	    		<a id="cancle_update" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></div>
	    	</form>
	    
    </div>
   <div id="win_upload" class="easyui-window" title="上传图片" closed="true" style="width:480px;height:140px;" data-options="iconCls:'icon-edit'"> 
   	  <div style="margin:20px 0 0 20px;float:left;">   
            <form id="upload_form" action="/hotel/doUpload" enctype="multipart/form-data" method="post">
			    <input type="hidden" name="foodId" id="foodId"/>
				<input type="file" id="imgfile" name="imgfile"></input> 
			</form>
	  </div>
	  <div id="p" class="easyui-progressbar" style="width:160px;margin:20px 0 20px 20px;float:left;"></div>  	
	  <div style="margin-left:140px;"><a id="upload_submit" class="easyui-linkbutton"  iconCls="icon-ok">上传</a>
				<a id="cancle_upload" class="easyui-linkbutton" iconCls="icon-cancel">取消</a></div>	
    </div>
</body>

</html>
