<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
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

<script src="${pageContext.request.contextPath}/webresource/js/jquery-1.7.2.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/jquery.easyui.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/locale/easyui-lang-zh_CN.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/tabs.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/plugins/jquery.datagrid.js">
</script>
</head>
<body>
<div region="center">
  <div id="order_panel" class="easyui-panel"
       style="background:#fafafa;">
       <table id="dg" class="easyui-datagrid"
            url="/suplier/list"
            rownumbers="true" pagination="true" toolbar='#toolbar'>
       <thead>
           <tr>
               <th field="supplierCode" align="center">代码</th>
               <th field="supplierName" align="center">名称</th>
               <th field="address" align="center">地址</th>
               <th field="supTypeName" align="center">类别</th>
               <th field="supRankName" align="center">等级</th>
           </tr>
       </thead>

       </table>
  </div>
       <div id="toolbar">
           <div>
           			<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true">查看</a>
           			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">新建</a>
           			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
           			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">删除</a>
           			<a href="#" class="easyui-linkbutton" iconCls="icon-reload"  plain="true">刷新</a>
           </div>
       </div>
</div>

</body>
</html>