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
</script>
</head>
<body>
<div region="center">
  <div id="p" class="easyui-panel" title="基本信息"
       style="background:#fafafa;">
       <div style="width:100%;height:20%;">
            <table style="margin-top:20px;margin-bottom:20px;margin-left:100px;">
                <tr>
                    <td>订单编号:</td>
                    <td><input type="text" value="${orderId }" /></td>
                    <td>供应商:</td>
                    <td><input type="text" /><font color="red">[供应商列表]</font></td>
                    <td>付款方式:</td>
                    <td><select><option>现金</option></select> </td>
                </tr>
                <tr>
                	<td>收货部门:</td>
                	<td><select><option>采购部</option></select></td>
                	<td>收货地址:</td>
                	<td colspan="3"><input type="text" /></td>
                </tr>
                <tr>
                	<td>采购日期:</td>
                	<td><input type="text" class="easyui-datebox" /></td>
                	<td>到货日期:</td>
                	<td><input type="text" class="easyui-datebox" /></td>
                	<td>过期日期:</td>
                	<td><input type="text" class="easyui-datebox" /></td>
                </tr>
                <tr>
                	<td>采购原因:</td>
                	<td colspan="5"><input class="easyui-textbox" data-options="multiline:true" type="text" style="width:600px;height:50px"></td>
                </tr>
                <tr>
                	<td>备注:</td>
                	<td colspan="5"><input class="easyui-textbox" data-options="multiline:true" type="text"  style="width:600px;height:80px"></td>
                </tr>
            </table>
       </div>
  </div>
  <div id="order_panel" class="easyui-panel" title="商品信息列表"
       style="background:#fafafa;">
       <table id="dg" class="easyui-datagrid" url="/order/update">
       <thead>
           <tr>
               <th field="ck" checkbox="true"></th>
               <th field='goodsId' width="120"  align="center">商品编号</th>
               <th field='goodsName' width="130" align="center">商品名称</th>
               <th field='goodsType' width="120" align="center">规格型号</th>
               <th field='goodsDep' width="120" align="center">采购单位</th>
               <th field='computerDep' width="120" align="center">核算单位</th>
               <th field='number' width="110" align="center">采购数量</th>
               <th field='price' width="110" align="center">采购单价</th>
               <th field='rate' width="110" align="center">进项税率</th>
               <th field='money' width="110" align="center">采购金额</th>
           </tr>
       </thead>
       </table>
  </div>
</div>
</body>
</html>