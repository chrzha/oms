<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
$(document).ready(function(){


    function parseDate(dateStr){
        var strArray = dateStr.split("/");
        if(strArray.length == 3){
            return new Date(strArray[2], strArray[0]-1, strArray[1]);
        }else{
            return new Date();
        }
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
            url: "/order/"+order["orderId"],
            type: "put",
            data: JSON.stringify(order),
            datatype: "json",
            contentType : "application/json; charset=utf-8",
            success: function(data){
                 $.messager.alert("成功","添加订单成功！");
            },
            error: function(){
                alert("error");
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
    alert("TO DO");
  });
});

</script>
</head>
<body>
<div region="center">
  <div id="p" class="easyui-panel" title="基本信息"
       style="background:#fafafa;">
       <div style="width:100%;height:20%;">
            <table id="detail_table" style="margin-top:20px;margin-bottom:20px;margin-left:100px;">
                <tr>
                    <td>订单编号:</td>
                    <td><input type="text" name="orderId" value="${orderDetail.order_id}" /></td>
                    <td>供应商:</td>
                    <td>
                        <select id="supplierId" name="supplierId">
                            <option <c:if test="${orderDetail.order_supplier_id == 1}"> selected="selected" </c:if> value="1">供应商1</option>
                            <option <c:if test="${orderDetail.order_supplier_id == 2}"> selected="selected" </c:if> value="2">供应商2</option>
                        </select>
                    </td>
                    <td>付款方式:</td>
                    <td>
                        <select id="payTypeId" name="payTypeId">
                            <option <c:if test="${orderDetail.order_paytype_id == 1}"> selected="selected" </c:if> value="1">现金</option>
                            <option <c:if test="${orderDetail.order_paytype_id == 2}"> selected="selected" </c:if> value="2">信用卡</option>
                        </select>
                    </td>
                </tr>
                <tr>
                	<td>收货部门:</td>
                	<td>
                        <select id="getDeptmtId" name="getDeptmtId">
                            <option <c:if test="${orderDetail.order_getdeptmt_id == 1}"> selected="selected" </c:if> value="1">采购部01</option>
                            <option <c:if test="${orderDetail.order_getdeptmt_id == 2}"> selected="selected" </c:if> value="2">采购部02</option>
                        </select>
                    </td>
                	<td>收货地址:</td>
                	<td colspan="3"><input type="text" name="orderAddress" value="${orderDetail.order_address}"/></td>
                </tr>
                <tr>
                	<td>采购日期:</td>
                	<td><input type="text" class="easyui-datebox" name="buyTime" value="${orderDetail.order_buytime}"/></td>
                	<td>到货日期:</td>
                	<td><input type="text" class="easyui-datebox" name="getTime" value="${orderDetail.order_gettime}"/></td>
                	<td>过期日期:</td>
                	<td><input type="text" class="easyui-datebox" name="outTime" value="${orderDetail.order_outtime}"/></td>
                </tr>
                <tr>
                	<td>采购原因:</td>
                	<td colspan="5"><input class="easyui-textbox" data-options="multiline:true" type="text" name="getReason" value="${orderDetail.order_getreason}" style="width:600px;height:50px"></td>
                </tr>
                <tr>
                	<td>备注:</td>
                	<td colspan="5"><input class="easyui-textbox" data-options="multiline:true" type="text" name="orderComment" value="${orderDetail.order_comment}" style="width:600px;height:80px"></td>
                </tr>
            </table>
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
                   <table id="dg" class="easyui-datagrid" url="/order/choosegoods">
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
            <input type="button" style="width:80px;" value="取消" onclick="closeTab();" />
        </div>
    </div>
</div>
</body>
</html>