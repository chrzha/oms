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

$(function(){
    $('#dg').datagrid({
        url: '/order/list',
        queryParams: form2Json("searchform"),
        method: 'POST',
        striped: true,
        fitColumns: true,
        singleSelect: true,
        rownumbers: true,
        pagination: true,
        nowrap: false,
        pageSize: 10,
        pageList: [10, 20, 50, 100, 150, 200],
        showFooter: true,
        toolbar: "#toolbar",
        columns: [[
            { field: 'ck', checkbox: true },
            { field: 'orderId', title: '订单编号', width: 250, align: 'center' },
            { field: 'orderStatus', title: '订单状态', width: 150, align: 'center',formatter:formatterStatus},
            { field: 'createdBy', title: '创建人', width: 150, align: 'center' },
            { field: 'createdTime', title: '创建时间', width: 150, align: 'center',formatter:formatterDate},
            { field: 'orderComment', title: '备注', width: 150, align: 'center' }
        ]]
    });
});

$("#submit_search").click(function () {
    $('#dg').datagrid({ queryParams: form2Json("searchform") });   //点击搜索
});
//将表单数据转为json
function form2Json(id) {
    var arr = {};
        arr.orderId = $("#search_table").find("input[name='orderId']").val();
        arr.orderStatus = $("#search_table").find("input[name='orderStatus']").val();
        arr.createdBy = $("#search_table").find("input[name='createdBy']").val();
        arr.createdTime = $("#search_table").find("input[name='createdTime']").val();
        console.log(arr);
    return arr;
}
function formatterStatus(value,row){
		if(value==0)
		   return '未审批';
		else
		   return '已审批';
}

function formatterDate(value, row) {
      var date = new Date(value);
      var monthZero = "";
      var dayZero = "";
      if(date.getMonth() + 1<10){
          monthZero = "0"
      }
      if(date.getDate()<10){
          dayZero = "0"
      }
      return date.getFullYear() + '-' + monthZero + (date.getMonth() + 1) + '-' + dayZero + date.getDate();
}

function QueryData() {
    $("#dg").datagrid("load", {
        "orderId":$("#search_table").find("input[name='orderId']").val()
    });
}

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
                            $.ajax({
                                url : "/order/delete/"+ row.orderId,
                                type : 'POST',
                                success : function(data) {
                                    $('#dg').datagrid('reload');
                                },
                                error : function() {
                                    alert("删除失败！");
                                }
                            });
                        }
                    });
                }
            }
}

function editOrder(){
	var rows = $("#dg").datagrid("getSelections");
	var row=$("#dg").datagrid("getSelected");
	if(rows.length>1){
		$.messager.alert("信息","修改时只可选择一条数据！");
	}else if(rows.length==0){
		$.messager.alert("信息","请选择至少一行数据！");
	}else{
		 //当前tab
        var current_tab = parent.$('#tabs').tabs('getSelected');
         parent.$('#tabs').tabs('add',{
                  border: false,
                  title: '修改订单',
                  content : "<iframe scrolling='auto' frameborder='0'  src='/order/view/modify/"+row.orderId+"' style='width:100%;height:100%;'></iframe>",
       			 closable: true
       			
        });
	}
}
function addOrder(){
	 //当前tab
        var current_tab = parent.$('#tabs').tabs('getSelected');
        if(parent.$("#tabs").tabs('exists','新增订单')){
				parent.$("#tabs").tabs('select','新增订单');
			}else{
	         parent.$('#tabs').tabs('add',{
	                  border: false,
	                  title: '新增订单',
	                  content : "<iframe scrolling='auto' frameborder='0'  src='/order/view/add' style='width:100%;height:100%;'></iframe>",
					closable: true
						                 
	        });
        }
}
</script>
</head>
<body>
<div region="center">
  <div id="p" class="easyui-panel" title="按条件查询"
       style="background:#fafafa;">
       <div style="width:100%;height:20%;">
       <form id="searchform">
            <table id="search_table" style="margin-top:20px;margin-bottom:20px;margin-left:100px;">
                <tr>
                    <td>订单编号:</td>
                    <td><input type="text" name="orderId" /></td>
                    <td>订单状态:</td>
                    <td><select name="orderStatus"><options><option value="1">all</option></options></select></td>
                    <td>创建人:</td>
                    <td><input type="text" name="createdBy"/></td>
                    <td>创建时间:</td>
                    <td><input type="text" class="easyui-datebox" name="createdTime"/></td>
                    <td><input type="submit" id="submit_search" value="查询"  src="javascript:void(0)" /></td>
                    <td><input type="reset" value="重置" /></td>
                </tr>
            </table>
       </form>
       </div>


  </div>
  <div id="order_panel" class="easyui-panel" title="订单明细"
       style="background:#fafafa;">
       <table id="dg">
       </table>
  </div>
       <div id="toolbar">
           <div>
           			<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true">查看</a>
           			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addOrder()">新建</a>
           			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editOrder()">修改</a>
           			<a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onclick="destroy()">删除</a>
           			<a href="#" class="easyui-linkbutton" iconCls="icon-reload"  plain="true">刷新</a>
           </div>
       </div>
</div>

</body>
</html>