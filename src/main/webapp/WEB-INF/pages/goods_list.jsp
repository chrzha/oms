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
function closePage(){
   top.$('#Product').dialog('close');
}
$(document).ready(function(){
	$("#add").click(function(){
	});
});
</script>
</head>
<body>
<div region="center">
  <div id="order_panel" class="easyui-panel" title="商品信息列表"
       style="background:#fafafa;">
       <table id="dg" class="easyui-datagrid" url="/order/choosegoods">
       <thead>
           <tr>
               <th field="ck" checkbox="true"></th>
               <th field='goodsId' width="120"  align="center">商品编号</th>
               <th field='goodsName' width="120" align="center">商品名称</th>
               <th field='goodsType' width="120" align="center">规格型号</th>
               <th field='goodsDep' width="120" align="center">采购单位</th>
               <th field='computerDep' width="100" align="center">核算单位</th>
               <th field='number' width="100" align="center">采购数量</th>
               <th field='price' width="100" align="center">采购单价</th>
               <th field='rate' width="100" align="center">进项税率</th>
               <th field='money' width="100" align="center">采购金额</th>
           </tr>
       </thead>
       </table>
  </div>
  <div id="button_panel" class="easyui-panel""
           style="background:#fafafa;">
          <div  style="width:80%;height:40%;margin-left:10px;margin-top:10px;">
              <input type="button" style="width:80px;" id="add" value="添加" />
              <input type="button" style="width:80px;" value="取消" onclick="closePage();"/>
          </div>
  </div>
</div>
</body>
</html>