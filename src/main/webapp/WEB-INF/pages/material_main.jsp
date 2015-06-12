<div region="center" title="您当前位置：基础数据>>物料信息" style="width:90%;height:80%;" id="test">
  <table
        id="dg"
        title="商场列表"
        class="easyui-datagrid"
        style="width:80%;height:80%;"
        data-options="singleSelect:true,collapsible:true,url:'/material/list' "
        toolbar="#toolbar"
        pagination="true"
        rownumbers="true"
        fitColumns="true"
        singleSelect="true">

		<thead>
			<tr>
				<th data-options="field:'id',width:80,align:'center'">商场编号</th>
				<th data-options="field:'name',width:150,align:'center'">商场名称</th>
				<th data-options="field:'address',width:250,align:'center'">地址</th>
				<th data-options="field:'away',width:100,align:'center'">距离</th>
				<th data-options="field:'rout',width:100,align:'center'">线路</th>
			</tr>
		</thead>

	</table>
 </div>