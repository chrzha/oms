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
      酒店交通信息
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
  <div region="center" style="height:80px;" id="test">
  <table class="easyui-datagrid" title="交通信息列表" style="width:1100px;height:400px">
		<thead>
			<tr>
				<th data-options="field:'trafficId',width:50,align:'center'">编号</th>
				<th data-options="field:'trafficName',width:100,align:'center'">名称</th>
				<th data-options="field:'trafficType',width:100,align:'center'">类型</th>
				<th data-options="field:'trafficPrice',width:50,align:'center'">票价</th>
				<th data-options="field:'trafficStartTime',width:60,align:'center'">始发时间</th>
				<th data-options="field:'trafficStartStation',width:80,align:'center'">始发站</th>
				<th data-options="field:'trafficPass',width:350,align:'center'">沿途经过</th>
				<th data-options="field:'trafficEndStation',width:80,align:'center'">终点站</th>
				<th data-options="field:'trafficEndTime',width:60,align:'center'">末班时间</th>
				<th data-options="field:'update',width:60,align:'center'"></th>
				<th data-options="field:'delete',width:60,align:'center'"></th>
			</tr>
		</thead>
		<tbody>
		
		 <c:forEach var="list" items="${list}" varStatus="status">
				<tr>
					<td><a  id="trafficId_${status.count}">${list.id}</a></td>
					<td><a  id="trafficName_${status.count}">${list.name}</a></td>
					<td><a  id="trafficType_${status.count}">${list.type}</a></td>					 
					<td><a  id="trafficPrice_${status.count}">${list.price}</a></td>
					<td><a  id="trafficStartTime_${status.count}">${list.startTime}</a><tetd>
					<td><a  id="trafficStartStation_${status.count}">${list.startStation}</a></td>
					<td><a  id="trafficPass_${status.count}">${list.pass}</a></td>
					<td><a  id="trafficEndStation_${status.count}">${list.endStation}</a></td>				 
					<td><a  id="trafficEndTime_${status.count}">${list.endTime}</a></td>
					<td><button > <a id="update_${status.count}">修改</a></button></td>
					<td><button > <a id="delete_${status.count}">删除</a></button></td>
					
				</tr>
			</c:forEach> 
			<tr>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td ><button id="add_${status.count}"> <a id="addTraffic">添加</a></button></td>
			</tr>
		</tbody>
	</table>
 </div>
 
 	<div id="win_add" class="easyui-window" title="添加交通记录" closed="true" style="width:400px;height:370px;">    
       <form name="form"  id = "add_form" action="/hotel/addTraffic" ENCTYPE="multipart/form-data" modelAttribute="traffic" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<input type="hidden" name="id">
			
			<tr><td><span>名称*</span></td><td><input type="text" name="name"></td></tr>

			<tr><td><span>类型*</span></td><td><input type="text" name="type"></td></tr>

			<tr><td><span>票价*</span></td><td><input type="text" name="price"></td></tr>

			<tr><td><span>始发时间</span></td><td><input type="text" name="startTime"></td></tr>

			<tr><td><span>始发站</span></td><td><input type="text" name="startStation"></td></tr>
			
			<tr><td><span>沿途经过*</span></td><td><input type="text" name="pass"></td></tr>

			<tr><td><span>终点站*</span></td><td><input type="text" name="endStation"></td></tr>

			<tr><td><span>末班时间*</span></td><td><input type="text" name="endTime"></td></tr>

			<tr><td><span>备注</span></td><td><input type="text" name="description"></td></tr>
					
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<input type="button" id="add_traffic" value="添加"/>
	    		<input type="reset" name="reset" value="重填"/>
	    		<input type="button" id="cancle_add" value="取消" /></div>
	    	</form>
	    
    </div>
 <div id="win_update" class="easyui-window" title="更新交通信息记录" closed="true" style="width:400px;height:370px;">    
       <form name="form" id="update_form" action="/hotel/updateTraffic" ENCTYPE="multipart/form-data" modelAttribute="traffic" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<input type="hidden" value="" name="id" id="hidden_id"></input>
			
			<tr><td><span>编号</span></td><td><label readonly="readonly" id="update_id"></label</td></tr>
			
			<tr><td><span>名称*</span></td><td><input type="text" name="name" id="update_name"></td></tr>

			<tr><td><span>类型*</span></td><td><input type="text" name="type" id="update_type"></td></tr>

			<tr><td><span>票价</span></td><td><input type="text" name="price" id="update_price"></td></tr>

			<tr><td><span>始发时间</span></td><td><input type="text" name="startTime" id="update_startTime"></td></tr>
			
			<tr><td><span>起始站</span></td><td><input name="startStation" id="update_startStation" ></td></tr>
			
			<tr><td><span>沿途经过*</span></td><td><input type="text" name="pass" id="update_pass"></td></tr>

			<tr><td><span>终点站*</span></td><td><input type="text" name="endStation" id="update_endStation"></td></tr>

			<tr><td><span>末班时间</span></td><td><input type="text" name="endTime" id="update_endTime"></td></tr>

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
	
	$("#addTraffic").click(function(){
	   
	   $('#win_add').window('open'); 
	   
	   $("#add_traffic").click(function(){
	   
	   var market = $("#add_form").serialize();
	   $.post("/hotel/addTraffic",market,function(data){
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

			var trafficId = $("#trafficId_"+index).text();
			var trafficName = $("#trafficName_"+index).text();
			var trafficType = $("#trafficType_"+index).text();
			var trafficPrice = $("#trafficPrice_"+index).text();
			var trafficStartTime = $("#trafficStartTime_"+index).text();
			var trafficStartStation = $("#trafficStartStation_"+index).text();
			var trafficPass = $("#trafficPass_"+index).text();
			var trafficEndStation = $("#trafficEndStation_"+index).text();
			var trafficEndTime = $("#trafficEndTime_"+index).text();
			var trafficDesc = $("#trafficDesc_"+index).text();
			
			$("#update_id").text(trafficId);
			$("#hidden_id").val(trafficId);
			$("#update_name").val(trafficName);
			$("#update_type").val(trafficType);
			$("#update_price").val(trafficPrice);
			$("#update_startTime").val(trafficStartTime);
			$("#update_startStation").val(trafficStartStation);
			$("#update_pass").text(trafficPass);
			$("#hidden_endStation").val(trafficEndStation);
			$("#update_endTime").val(trafficEndTime);
			$("#update_description").val(trafficDesc);
			
			$('#win_update').window('open'); 
			
			
			$("#update").click(function(){
			
			var traffic = $("#update_form").serialize();
				$.post("/hotel/updateTraffic",traffic,function(data){
				   if(data=="success"){
						window.location.reload();
				   }else{
					  alert("error!");		   
				   } 
		   		});
			});
	
		});
	    		 
	   $("#delete_"+i).click(function(){

		var trafficId = $("#trafficId_"+index).text();
		
		 $.messager.confirm('确认', '确定要删除该条记录吗?', function(r){  
		 if(r){
		 	$.ajax({
				url : "/hotel/deleteTrafficById?trafficId="+trafficId,
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
