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
</head>
<body class="easyui-layout" >
  <div region="center" style="height:80px;" id="test">
  <table 
        id="dg"
        title="交通信息列表"
        class="easyui-datagrid"
        style="width:1100px;height:480px"
        data-options="singleSelect:true,collapsible:true,url:'/hotel/trafficList' "
        toolbar="#toolbar"
        pagination="true"
        rownumbers="true"
        fitColumns="true"
        singleSelect="true">

		<thead>
			<tr>
				<th data-options="field:'id',width:50,align:'center'">编号</th>
				<th data-options="field:'name',width:100,align:'center'">名称</th>
				<th data-options="field:'type',width:100,align:'center'">类型</th>
				<th data-options="field:'price',width:50,align:'center'">票价</th>
				<th data-options="field:'startTime',width:60,align:'center'">始发时间</th>
				<th data-options="field:'startStation',width:80,align:'center'">始发站</th>
				<th data-options="field:'pass',width:350,align:'center'" class="easyui-tooltip">沿途经过</th>
				<th data-options="field:'endStation',width:80,align:'center'">终点站</th>
				<th data-options="field:'endTime',width:60,align:'center'">末班时间</th>
				<th data-options="field:'status',width:80,align:'center',
				formatter:function(value){if(value==0)return '未通过';else return '通过';}"> 状态 </th>
				
				<th data-options="field:'flag',width:80,align:'center',
				formatter:function(value){if(value==0)return '未审核';else return '已审核';}"> 审核状态 </th>
			 <th data-options="field:'hotelName',width:80,align:'center'">
           发布酒店
          </th>
			</tr>
		</thead>
		
	</table>
 </div>
  <div id="toolbar"><a href="javascript:void(0)" class="easyui-linkbutton" iconcls="icon-remove" plain="true" onclick="destroyUser();" >通过/不通过</a>
    </div>
</body>
<script type="text/javascript">
 function destroyUser() {
            var row = $('#dg').datagrid('getSelected');
            if (row) {
                $.messager.confirm('确认', '确定要更改审核状态吗?', function (r) {
                    if (r) {
                        $.post('/hotel/changeTrafficStatus', { trafficId: row.id,status:row.status }, function (result) {
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
