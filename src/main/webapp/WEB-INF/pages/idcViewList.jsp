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
      酒店周围景点
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
 <table 
        id="dg"
        title="景点列表"
        class="easyui-datagrid"
        style="width:1100px;height:480px"
        data-options="singleSelect:true,collapsible:true,url:'/hotel/viewList' "
        toolbar="#toolbar"
        pagination="true"
        rownumbers="true"
        fitColumns="true"
        singleSelect="true">

		<thead>
			<tr>
				<th data-options="field:'id',width:100,align:'center'">景点编号</th>
				<th data-options="field:'name',width:100,align:'center'">景点名称</th>
				<th data-options="field:'address',width:100,align:'center'">地址</th>
				<th data-options="field:'away',width:100,align:'center'">距离</th>
				<th data-options="field:'rout',width:100,align:'center'">线路</th>
				<th data-options="field:'price',width:100,align:'center'">门票</th>
				<th data-options="field:'description',width:160,align:'center'">简介</th>
				 <th data-options="field:'hotelName',width:80,align:'center'">
           发布酒店
          </th>
			</tr>
		</thead>
	</table>
  </div>
 <div id="toolbar"><a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-remove" plain="true" onclick="destroyUser();" >删除</a>
    </div>
 
</body>
<script type="text/javascript">
 function destroyUser() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $.messager.confirm('确认', '确定要删除吗?', function (r) {
                    if (r) {
                        $.post('/hotel/deleteViewByIDC', { viewId: row.id }, function (result) {
                            if (result=="success") {
                                $('#dg').datagrid('reload');    // reload the user data  
                            } else {
                                $.messager.show({   // show error message  
                                    title: 'Error',
                                    msg:  "ERROR"
                                });
                            }
                        }, 'json');
                    }
                });
            }
        }  
</script>

</html>
