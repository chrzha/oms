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
            order["getReason"] = $("#detail_table").find("#getReason").val(),
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
                            <option value="1">供应商1</option>
                            <option value="2">供应商2</option>
                        </select>
                    </td>
                    <td>付款方式:</td>
                    <td>
                        <select id="payTypeId" name="payTypeId">
                            <option value="1">现金</option>
                            <option value="2">信用卡</option>
                        </select>
                    </td>
                </tr>
                <tr>
                	<td>收货部门:</td>
                	<td>
                        <select id="getDeptmtId" name="getDeptmtId">
                            <option value="1">采购部01</option>
                            <option value="2">采购部02</option>
                        </select>
                    </td>
                	<td>收货地址:</td>
                	<td colspan="3"><input type="text" name="orderAddress" /></td>
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
                	<td colspan="5"><input class="easyui-textbox" data-options="multiline:true" type="text" name="getReason" value="${orderDetail.order_buyreason}" style="width:600px;height:50px"></td>
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
       <table id="dg">
       </table>
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