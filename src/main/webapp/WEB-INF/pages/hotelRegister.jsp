<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>酒店注册页面</title>
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

<script type="text/javascript">
 $(document).ready(function(){
	
});
 
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
	<div region="north" style="height: 70px; background-color: #99ccff;">
		<div style="width: 500px; height: 30px; margin-left: 460px;">
			<h1>基于云模式的酒店服务信息后台管理系统</h1>
		</div>
	</div>


	<div region="center">
		<div
			style="height: 300px; width: 410px; margin-left: 490px; margin-top: 10px;">
			<div class="easyui-panel" title="酒店注册"
				style="height: 300px; width: 400px;">
				<div style="padding: 10px 0 0 10px">
					<form name="form" action="/hotel/hotelRegister" modelAttribute="hotel"
						method="post">
						<table style="margin: 10px 0 0 70px;">

							<tr>
								<td><span>酒店名称*</span></td>
								<td><input type="text" name="name" maxlength="20"></td>
								<td><span class="name"></span></td>
							</tr>

							<tr>
								<td><span>地址*</span></td>
								<td><input type="text" name="address" ></td>
								<td><span class="address"></span></td>
							</tr>

							<tr>
								<td><span>联系电话*</span></td>
								<td><input type="text" name="phone"></td>
								<td><span class="phone"></span></td>
							</tr>

							<tr>
								<td><span>简介</span></td>
								<td><input type="text" name="description"></td>
								<td><span class="description"></span></td>
							</tr>

							<tr>
								<td><span>邮箱*</span></td>
								<td><input type="text" id="id1" name="email"></td>
								<td><span class="email"></span></td>
							</tr>
							<input type="hidden" id="status" name="status">

						</table>
						<div class="submit" style="margin-left: 150px;">
							<input type="submit" name="register" value="注册" /> <input
								type="reset" name="reset" value="重填" />
						</div>
					</form>

				</div>
			</div>

		</div>
	</div>

	<div region="south" style="height: 40px;">
		<jsp:include page="copyright.jsp"></jsp:include>
	</div>
	


</body>

</html>
