<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改酒店信息</title>
<%
    String path = request.getContextPath();
%>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/default/easyui.css">

</link>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/icon.css">

</link>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/tree_themes/SimpleTree.css">

</link>


<script
	src="${pageContext.request.contextPath}/webresource/hotel-js/jquery-1.7.2.min.js">
</script>
<script
	src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/jquery.easyui.min.js">
</script>
<script
	src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/tabs.js">
</script>
<script
	src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/SimpleTree.js">
</script>


<style>
.name,.address,.phone,.email,.description {
	display: block;
	color: red;
	font-size: 13px;
}
</style>
</head>
<body class="easyui-layout">
	<div region="center">
		<div
			style="height: 300px; width: 410px; margin-left: 300px; margin-top: 10px;">
			<div class="easyui-panel" title="更改酒店信息"
				style="height: 400px; width: 500px;">
				<div style="padding: 10px 0 0 10px">
					<form name="form" id="hotel_form"action="/hotel/doUpdateHotelInfo" modelAttribute="hotel"
						method="post">
						<table style="margin: 10px 0 0 70px;">
						<input type="hidden" name="id"  value="${hotel.id}">
							<tr>
								<td><span>酒店编号</span></td>
								<td><input type="text"   disabled="disabled" value="${hotel.id}"></td>
							</tr>
							<tr>
								<td><span>酒店名称*</span></td>
								<td><input type="text" name="name" value="${hotel.name}"></td>
								
							</tr>

							<tr>
								<td><span>地址*</span></td>
								<td><input type="text" name="address" value="${hotel.address}"></td>
								
							</tr>

							<tr>
								<td><span>联系电话*</span></td>
								<td><input type="text" name="phone" value="${hotel.phone}"></td>
								
							</tr>
							<tr>
								<td><span>酒店Logo</span></td>
								<td><input type="file" name="logo" ></td>
								
							</tr>
							<tr>
								<td><span>简介</span></td>
								<td><input type="text" name="description" value="${hotel.description}"></td>
								
							</tr>
							

							<input type="hidden" id="status" name="status" value="${hotel.status}">
						</table>
						
						<div class="submit" style="margin-left: 150px;">
							<input type="button" id="update" value="提交修改" />
								<input type="button" id="back" value="返回"/>
						  
						</div>
						<div id="loading" style="width: 200px; margin-left: 40%; margin-top: 10px;z-index: 999; display: none">
        						<div class="UpdateProgress">
        						 <img src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/default/images/loading.gif" />
            
            						<span id="loadMess">数据加载中，请稍候...</span>
        						</div>
    					</div>
					</form>

				</div>
			</div>

		</div>
	</div>

</body>
<script type="text/javascript">
 $(document).ready(function(){
 
 $("#back").click(function(){
 
 	window.close();
 
 });
	
	$("#update").click(function(){
	
	$("#loading").css("display", "block");
	
	var hotel = $("#hotel_form").serialize();
	   $.post("/hotel/doUpdateHotelInfo",hotel,function(data){
	   
				   if(data=="success"){
                        $("#loading").css("display", "none");
						$.messager.alert('消息','修改成功!.','info');  

				   }else{
					  alert("error!");		   
				   } 
     });	
   });
   
});
 
</script>
</html>
