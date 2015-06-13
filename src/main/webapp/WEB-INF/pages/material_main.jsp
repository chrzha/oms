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
            url="/material/list"
            rownumbers="true" pagination="true" toolbar='#toolbar'>
       <thead>
           <tr>
               <th field="ck" checkbox="true"></th>
               <th field="materialId" align="center">ID</th>
               <th field="materialCode" align="center">物料编号</th>
               <th field="materialName" align="center">物料名称</th>
               <th field="uomName" align="center">计价单位</th>
               <th field="refPrice" align="center">参考价格</th>
               <th field="matTypeName" align="center">类型</th>
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