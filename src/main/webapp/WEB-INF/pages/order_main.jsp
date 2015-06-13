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
<link
    rel="stylesheet"
    type="text/css"
    href="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/tree_themes/SimpleTree.css">
</link>

<script src="${pageContext.request.contextPath}/webresource/js/jquery-1.7.2.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/jquery.easyui.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/locale/easyui-lang-zh_CN.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/tabs.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/SimpleTree.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/plugins/jquery.datagrid.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/plugins/jquery.datebox.js">
</script>
<script>
function doSearch(){
		$('#dg').datagrid('load',{
			itemid: $('#itemid').val(),
			productid: $('#productid').val()
		});
}
</script>
</head>
<body>
<div region="center">
  <div id="p" class="easyui-panel" title="按条件查询"
       style="background:#fafafa;">
       <div style="height:20%;">
       <form>
            <table style="margin-top:20px;margin-bottom:20px;margin-left:100px;">
                <tr>
                    <td>订单编号:</td>
                    <td><input type="text" /></td>
                    <td>订单状态:</td>
                    <td><select><options><option>all</option></options></select></td>
                    <td>创建人:</td>
                    <td><input type="text" /></td>
                    <td>创建时间:</td>
                    <td><input type="text" class="easyui-datebox" /></td>
                    <td><input type="submit" value="查询" /></td>
                    <td><input type="reset" value="重置" /></td>
                </tr>
            </table>
       </form>
       </div>


  </div>
  <div id="order_panel" class="easyui-panel" title="订单明细"
       style="background:#fafafa;">
       <table id="dg" class="easyui-datagrid"
            url="/order/list"
            rownumbers="true" pagination="true" toolbar='#toolbar'>
       <thead>
           <tr>
               <th field="ck" checkbox="true"></th>
               <th field='orderId' width="250" align="center">订单编号</th>
               <th field='status' width="150" align="center">订单状态</th>
               <th field='createdBy' width="150" align="center">创建人</th>
               <th field='createdDate' width="150" align="center">创建时间</th>
               <th field='comment' width="150" align="center">备注</th>
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