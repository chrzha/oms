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
      修改管理员
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
 
</style>
</head>
<body class="easyui-layout" >
  <div region="center" style="height:80px;">
  <table class="easyui-datagrid" title="修改" style="width:1000px;height:400px">
		<thead>
			<tr>
				<th data-options="field:'id',width:100,align:'center'">酒店编号编号</th>
				<th data-options="field:'name',width:100,align:'center'">酒店名称</th>
				<th data-options="field:'status',width:100,align:'center'">是否通过审核</th>
				<th data-options="field:'phone',width:160,align:'center'">联系电话</th>
				<th data-options="field:'address',width:160,align:'center'">地址</th>
				<th data-options="field:'save',width:60,align:'center'"></th>
			</tr>
		</thead>
		<tbody>
		 
				<tr>
					<td><a  id="id" name="id">${hotel.id}</a></td>
					<td><a  id="hotelName" name="hotelName">${hotel.name}</a></td>
					<td>
					<span id="status">
					<select>
					<option value="1" <c:if test="${hotel.status=='1'}">selected</c:if> >通过</option>
					<option value="0" <c:if test="${hotel.status=='0'}">selected</c:if> >未通过</option>
					</select>
					</span>
					</td>
					<td><a  id="phone" name="phone">${hotel.phone}</a></td>
					<td><a  id="address" name="address">${hotel.address}</a></td>
					<td><input type="submit" name="save" id="saveBtn" value="保存"/></td>
				</tr>
		 
		</tbody>
	</table>
  </div>
</body>
<script type="text/javascript">
$(document).ready(function(){
var id = $("#id").text();
var _status = $("#status").children("select");
var status = $("#status").children("select").val();

	_status.change(function(){
	
	 status = $(this).val();
	
	});
	
	$("#saveBtn").click(function(){
	alert("/hotel/doEditHotel?id="+id+"&status="+status);
	
	$.ajax({
			url : "/hotel/doEditHotel?id="+id+"&status="+status,
			type : 'POST',
			success : function(data) {
			alert("修改成功！");
				window.location.reload();
			},
			error : function() {
				alert("修改失败！");
			}
		});
	});

});
 
</script>

</html>
