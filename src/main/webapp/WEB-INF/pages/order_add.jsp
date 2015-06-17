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

function closeTab(){
    parent.$("#tabs").tabs('close','新增订单');
}
$(document).ready(function(){


$('#dg').datagrid('beginEdit', rowIndex);
var ed = $('#dg').datagrid('getEditors', rowIndex);
for (var i = 0; i < ed.length; i++)
{
    var e = ed[i];
    $(e.target).bind('keyup', function()
    {
        if (window.event.keyCode == 13)
        {
            alert("you check enter key");
        }
    });
}


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
            order["getReason"] = $("#detail_table").find("#getReason").val(),
            order["getDeptmtId"] = $("#detail_table").find("#getDeptmtId").val(),
            order["orderComment"] = $("#detail_table").find("input[name='orderComment']").val(),

          $.ajax({
            url: "/order",
            type: "post",
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
                $.messager.alert("信息","请选择至少一行数据！");
            }else if(rows.length>1){
                $.messager.alert("信息","暂不支持批量删除！");
            }else {
                var row = $('#dg').datagrid('getSelected');
                if (row) {
                    $.messager.confirm('确认', '确定要删除该条记录吗?', function (r) {
                        if (r) {
                        }
                    });
                }
            }
}
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
       		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="chooseGoods()">选择商品</a>&nbsp;&nbsp;<a href="javascript:void(0)" class="easyui-linkbutton" onclick="destroy()">删除商品</a>
       		<div id="dd" title="My Dialog"  class="easyui-window" closed="true" style="width:600px;height:480px;"></div> 
       </div>
       <table id="dg" class="easyui-datagrid" url="/order/update" idField="goodsId">
       <thead>
           <tr>
               <th field="ck" checkbox="true"></th>
               <th field='goodsId' width="120"  align="center">商品编号</th>
               <th field='goodsName' width="130" align="center">商品名称</th>
               <th field='goodsType' width="120" align="center">规格型号</th>
               <th field='goodsDep' width="120" align="center">采购单位</th>
               <th field='computerDep' width="120" align="center">核算单位</th>
               <th field='number' width="110" align="center" editor="{type:'numberbox'}">采购数量</th>
               <th field='price' width="110" align="center">采购单价</th>
               <th field='rate' width="110" align="center">进项税率</th>
               <th field='money' width="110" align="center">采购金额</th>
           </tr>
       </thead>
       </table>
  </div>
  <div id="Product" class="easyui-window"  style="width:1000px;height:300px;" >  
  </div>
  <script type="text/javascript">
   $("#Product").dialog({
            title: '发货操作',
            href: '/order/goodslist',
            iconCls: 'icon-edit',
            modal: true,
            closed: true
       });
    function chooseGoods(){
     $("#Product").dialog("open");
    }
  </script>
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