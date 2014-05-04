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
					<td><button > <a id="update_${status.count}">修改</a></button></td>
					<td><button > <a id="delete_${status.count}">删除</a></button></td>
					
				</tr>
			</c:forEach> 
			<tr>
			<td></td><td></td><td></td><td></td><td></td><td></td><td></td>
			<td ><button id="add_${status.count}"> <a id="addMkt">添加</a></button></td>
			</tr>
		</tbody>
	</table>
 </div>
 
 	<div id="win_add" class="easyui-window" title="添加商场记录" closed="true" style="width:400px;height:270px;">    
       <form name="form"  id = "add_form" action="/hotel/addMkt" ENCTYPE="multipart/form-data" modelAttribute="market" method="market" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<input type="hidden" name="id">
			
			<tr><td><span>名称*</span></td><td><input type="text" name="name"></td></tr>

			<tr><td><span>地址*</span></td><td><input type="text" name="address"></td></tr>

			<tr><td><span>距离*</span></td><td><input type="text" name="away"></td></tr>

			<tr><td><span>线路</span></td><td><input type="text" name="rout"></td></tr>

			<tr><td><span>简介</span></td><td><input type="text" name="description"></td></tr>
					
	    	</table>
	    	<div class="submit" style="margin-left:120px;">
	    		<input type="button" id="add_mkt" value="添加"/>
	    		<input type="reset" name="reset" value="重填"/>
	    		<input type="button" id="cancle_add" value="取消" /></div>
	    	</form>
	    
    </div>
 <div id="win_update" class="easyui-window" title="更新商场记录" closed="true" style="width:400px;height:270px;">    
       <form name="form" id="update_form" action="/hotel/updateMarket" ENCTYPE="multipart/form-data" modelAttribute="market" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			
			<input type="hidden" value="" name="id" id="hidden_id"></input>
			
			<tr><td><span>编号</span></td><td><label readonly="readonly" id="update_id"></label</td></tr>
			
			<tr><td><span>名称*</span></td><td><input type="text" name="name" id="update_name"></td></tr>

			<tr><td><span>地址*</span></td><td><input type="text" name="address" id="update_address"></td></tr>

			<tr><td><span>距离</span></td><td><input type="text" name="away" id="update_away"></td></tr>

			<tr><td><span>线路</span></td><td><input type="text" name="rout" id="update_rout"></td></tr>

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
	
	$("#addMkt").click(function(){
	   
	   $('#win_add').window('open'); 
	   
	   $("#add_mkt").click(function(){
	   
	   var market = $("#add_form").serialize();
	   $.post("/hotel/addMkt",market,function(data){
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

			var mktId = $("#mktId_"+index).text();
			var mktName = $("#mktName_"+index).text();
			var mktAddress = $("#mktAddress_"+index).text();
			var mktAway = $("#mktAway_"+index).text();
			var mktRout = $("#mktRout_"+index).text();
			var mktDesc = $("#mktDesc_"+index).text();
			

			$("#update_id").text(mktId);
			$("#hidden_id").val(mktId);
			$("#update_name").val(mktName);
			$("#update_address").val(mktAddress);
			$("#update_away").val(mktAway);
			$("#update_rout").val(mktDesc);
			$("#update_description").val(mktDesc);
			
			$('#win_update').window('open'); 
			
			
			$("#update").click(function(){
			
			var market = $("#update_form").serialize();
				$.post("/hotel/updateMarket",market,function(data){
				   if(data=="success"){
						window.location.reload();
				   }else{
					  alert("error!");		   
				   } 
		   		});
			});
	
		});
	    		 
	   $("#delete_"+i).click(function(){

		var mktId = $("#mktId_"+index).text();
		
		 $.messager.confirm('确认', '确定要删除该条记录吗?', function(r){  
		 if(r){
		 	$.ajax({
				url : "/hotel/deleteMktById?mktId="+mktId,
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
