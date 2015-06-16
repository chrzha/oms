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
    function closeTab(){
        parent.$("#tabs").tabs('close','修改订单');
    }
$(function(){
    $('#dg').datagrid({
        url: '/order/update',
        method: 'POST',
        striped: true,
        fitColumns: true,
        singleSelect: false,
        rownumbers: true,
        pagination: false,
        nowrap: false,
        pageSize: 10,
        pageList: [10, 20, 50, 100, 150, 200],
        showFooter: true,
        columns: [[
            { field: 'ck', checkbox: true },
            { field: 'goodsId', title: '商品编号', width: 180, align: 'left' },
            { field: 'goodsName', title: '商品名称', width: 150, align: 'left' },
            { field: 'goodsType', title: '规格型号', width: 100, align: 'left' },
            { field: 'goodsDep', title: '采购单位', width: 100, align: 'left' },
            { field: 'computerDep', title: '核算单位', width: 100, align: 'right' },
            { field: 'number', title: '采购数量', width: 100, align: 'right',editor:'numberbox'},
            { field: 'price', title: '采购单价', width: 100, align: 'right' },
            { field: 'rate', title: '进项税率', width: 80, align: 'left' },
            { field: 'money', title: '采购金额', width: 80, align: 'left',
                formatter:function(value,rowData,rowIndex){
                    var money = rowData.number*rowData.price;
                    return money;
                }
            }
        ]]
    });
});

function updateActions(index){
    $('#dg').datagrid('updateRow',{
        index: index,
        row:{}
    });
}
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
                    <td><input type="text" value="${orderDetail.order_id}" /></td>
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
                	<td><input type="text" class="easyui-datebox" value="${orderDetail.order_buytime}"/></td>
                	<td>到货日期:</td>
                	<td><input type="text" class="easyui-datebox" value="${orderDetail.order_gettime}"/></td>
                	<td>过期日期:</td>
                	<td><input type="text" class="easyui-datebox" value="${orderDetail.order_outtime}"/></td>
                </tr>
                <tr>
                	<td>采购原因:</td>
                	<td colspan="5"><input class="easyui-textbox" data-options="multiline:true" type="text" value="${orderDetail.order_buyreason}" style="width:600px;height:50px"></td>
                </tr>
                <tr>
                	<td>备注:</td>
                	<td colspan="5"><input class="easyui-textbox" data-options="multiline:true" type="text" value="${orderDetail.order_comment}" style="width:600px;height:80px"></td>
                </tr>
            </table>
       </div>
  </div>
  <div id="order_panel" class="easyui-panel" title="商品信息列表"
       style="background:#fafafa;">
       <table id="dg">
       </table>
  </div>
    <div id="button_panel" class="easyui-panel""
         style="background:#fafafa;">
        <div  style="width:80%;height:40%;margin-left:10px;margin-top:10px;">
            <input type="button" style="width:80px;" value="保存" />
            <input type="button" style="width:80px;" value="取消" onclick="closeTab();" />
        </div>
    </div>
</div>
</body>
</html>