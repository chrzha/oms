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
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/plugins/jquery.edatagrid.js">
</script>
<script>
var rowIndexArray = [];
var rootUrl = "${pageContext.request.contextPath}";
$(function(){
    $('#dg').datagrid({
        striped: true,
        fitColumns: true,
        singleSelect: false,
        rownumbers: true,
        pagination: true,
        nowrap: false,
        idField:'goodsId',
        remoteSort: false,
        pageSize: 10,
        pageList: [10, 20, 50, 100, 150, 200],
        showFooter: true,
        toolbar: "#toolbar",
        columns: [[
            { field: 'ck', checkbox: true },
            { field: 'goodsId', title: '商品编号', width: 250, align: 'center' },
            { field: 'goodsName', title: '商品名称', width: 150, align: 'center' },
            { field: 'goodsType', title: '规格型号', width: 150, align: 'center' },
            { field: 'goodsDep', title: '采购单位', width: 150, align: 'center' },
            { field: 'computerDep', title: '核算单位', width: 150, align: 'center' },
            { field: 'number', title: '采购数量', width: 150, align: 'center',editor: { type: 'numberbox', required:true, options: { precision: 0}} },
            { field: 'price', title: '采购单价', width: 150, align: 'center' },
            { field: 'rate', title: '进项税率', width: 150, align: 'center' },
            { field: 'money', title: '采购金额', width: 150, align: 'center',
                formatter:function(value,rowData,rowIndex){
                    var money = rowData.number*rowData.price;
                    return money;
                } }
        ]],
        onSelect: function(rowIndex, rowData) {
            rowIndexArray.push(rowIndex);
        },
        onClickCell: function (rowIndex, field, value) {
            $('#dg').datagrid('beginEdit',rowIndex);
        },
        onAfterEdit: function (rowIndex, rowData, changes){
               alert(changes);
        },
        onCancelEdit: function (rowIndex, rowData){
            alert(rowData);
        }
    });
});

function closeTab(){
    parent.$("#tabs").tabs('close','新增订单');
}
$(document).ready(function(){

    function parseDate(dateStr){
        var strArray = dateStr.split("/");
        if(strArray.length == 3){
            return new Date(strArray[2], strArray[0]-1, strArray[1]);
        }else{
            return new Date();
        }
    }

    //save order
    $("#save").click(function(){

        var order = {};
            order["orderId"] = $("#detail_table").find("input[name='orderId']").val(),
            order["orderStatus"] = 0,
            order["supplierId"] = $("#detail_table").find("#supplierId").val(),
            order["payTypeId"] = $("#detail_table").find("#payTypeId").val(),
            order["getDeptmtId"] = $("#detail_table").find("#getDeptmtId").val(),
            order["orderAddress"] = $("#detail_table").find("input[name='orderAddress']").val(),
            order["buyTime"] = parseDate($("#detail_table").find("input[name='buyTime']").val()),
            order["getTime"] = parseDate($("#detail_table").find("input[name='getTime']").val()),
            order["outTime"] = parseDate($("#detail_table").find("input[name='outTime']").val()),
            order["getReason"] = $("#detail_table").find("input[name='getReason']").val(),
            order["getDeptmtId"] = $("#detail_table").find("#getDeptmtId").val(),
            order["orderComment"] = $("#detail_table").find("input[name='orderComment']").val(),

          $.ajax({
            url: rootUrl+"/orders",
            type: "post",
            data: JSON.stringify(order),
            datatype: "json",
            contentType : "application/json; charset=utf-8",
            success: function(data){
                 $.messager.alert("成功","添加订单成功！");
            },
            error: function(){
                $.messager.alert("失败","添加订单失败！","error");
            }
          });
    });
	
});
function destroy() {
            var rows = $('#dg').datagrid('getSelections');

            if(rows.length==0){
                $.messager.alert("信息","请选择至少一行数据！","warning");
            }else {
                $.messager.confirm('确认', '确定要删除该条记录吗?', function (r) {
                    if (r) {
                        for(var i=0;i<rows.length;i++){
                            var index = $('#dg').datagrid('getRowIndex', rows[i]);
                            $('#dg').datagrid('deleteRow', index);
                        }
                    }
                });
            }
}
</script>
<script type="text/javascript">
  function chooseGoods(){
     $("#choose_goods").window("open");
  }
  function closeWindow(){
     $("#choose_goods").window("close");
  }
$(document).ready(function(){
  $("#addGoods").click(function(){
    var rows = $("#dg_all").datagrid('getSelections');
    for(var i=0;i<rows.length;i++){
               $('#dg').datagrid('appendRow',{
                   goodsId: rows[i].goodsId,
                   goodsName: rows[i].goodsName,
                   goodsType: rows[i].goodsType,
                   goodsDep: rows[i].goodsDep,
                   computerDep: rows[i].computerDep,
                   number: 1,
                   price: rows[i].price,
                   rate: rows[i].rate
               });
    }
    $("#choose_goods").window("close");
  });
});

</script>
</head>
<body>
<div region="center">
  <div id="p" class="easyui-panel" title="基本信息"
       style="background:#fafafa;">
       <div style="width:100%;height:20%;">
         <form id="detailform" action="#" enctype='application/json'>
            <table id="detail_table" style="margin-top:20px;margin-bottom:20px;margin-left:100px;">
                <tr>
                    <td>订单编号:</td>
                    <td><input type="text" name="orderId" /></td>
                    <td>供应商:</td>
                    <td>
                        <select id="supplierId" name="supplierId">
                            <option select="true" value="1">供应商1</option>
                            <option value="2">供应商2</option>
                        </select>
                    </td>
                    <td>付款方式:</td>
                    <td>
                        <select id="payTypeId" name="payTypeId">
                            <option select="true" value="1">现金</option>
                            <option value="2">信用卡</option>
                        </select>
                    </td>
                </tr>
                <tr>
                	<td>收货部门:</td>
                	<td>
                	    <select id="getDeptmtId" name="getDeptmtId">
                	        <option select="ture" value="1">采购部01</option>
                	        <option value="2">采购部02</option>
                	    </select>
                	</td>
                	<td>收货地址:</td>
                	<td colspan="3"><input type="text" name="orderAddress" /></td>
                </tr>
                <tr>
                	<td>采购日期:</td>
                	<td><input type="text" class="easyui-datebox" name="buyTime"/></td>
                	<td>到货日期:</td>
                	<td><input type="text" class="easyui-datebox" name="getTime"/></td>
                	<td>过期日期:</td>
                	<td><input type="text" class="easyui-datebox" name="outTime"/></td>
                </tr>
                <tr>
                	<td>采购原因:</td>
                	<td colspan="5"><input class="easyui-textbox" data-options="multiline:true" name="getReason" type="text" style="width:600px;height:50px"></td>
                </tr>
                <tr>
                	<td>备注:</td>
                	<td colspan="5"><input class="easyui-textbox" data-options="multiline:true" type="text" name="orderComment"  style="width:600px;height:80px"></td>
                </tr>
            </table>
         </form>
       </div>
  </div>
  <div id="order_panel" class="easyui-panel" title="商品信息列表"
       style="background:#fafafa;">
       <div align="right">
       		<input type="button" style="width:80px;" onclick="chooseGoods()" value="选择商品" />&nbsp;&nbsp;<input type="button" style="width:80px;" onclick="destroy()" value="删除商品" />
       </div>
       <table id="dg">
       </table>
  </div>
  <div id="choose_goods" class="easyui-window" title="商品选择" closed="true" style="width:1000px;height:300px;" data-options="iconCls:'icon-add'">
          <div id="order_panel" class="easyui-panel" title="商品信息列表"
                 style="background:#fafafa;">
                 <table id="dg_all" class="easyui-datagrid" data-options="url:''+rootUrl+'/orders/goods',method:'get'">
                 <thead>
                     <tr>
                         <th field="ck" checkbox="true"></th>
                         <th field='goodsId' width="120"  align="center">商品编号</th>
                         <th field='goodsName' width="120" align="center">商品名称</th>
                         <th field='goodsType' width="120" align="center">规格型号</th>
                         <th field='goodsDep' width="120" align="center">采购单位</th>
                         <th field='computerDep' width="100" align="center">核算单位</th>
                         <th field='price' width="100" align="center">采购单价</th>
                         <th field='rate' width="100" align="center">进项税率</th>
                     </tr>
                 </thead>
                 </table>
            </div>
            <div id="button_panel" class="easyui-panel""
                     style="background:#fafafa;">
                    <div  style="width:80%;height:40%;margin-left:10px;margin-top:10px;">
                        <input type="button" style="width:80px;" id="addGoods" value="添加" />
                        <input type="button" style="width:80px;" value="取消" onclick="closeWindow();"/>
                    </div>
            </div>

  </div>

  <div id="button_panel" class="easyui-panel""
           style="background:#fafafa;">
          <div  style="width:80%;height:40%;margin-left:10px;margin-top:10px;">
              <input type="button" style="width:80px;" id="save" value="保存" />
              <input type="button" style="width:80px;" value="取消" onclick="closeTab();"/>
          </div>
  </div>
</div>
</body>
</html>