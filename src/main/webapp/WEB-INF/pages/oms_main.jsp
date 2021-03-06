<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>
      oms
    </title>
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
<script type="text/javascript">
 $(document).ready(function(){



    $("#material").click(function(){
        //当前tab
        if($("#tabs").tabs('exists','物料信息')){
            $("#tabs").tabs('select','物料信息');
        }else{
            $('#tabs').tabs('add',{
                  title: '物料信息',
                  content : '<iframe scrolling="auto" frameborder="0"  src="/material/view/main" style="width:100%;height:100%;"></iframe>',
                  closable: true
             });
        }
 	});

    $("#supplier").click(function(){
        //当前tab
        var current_tab = $('#tabs').tabs('getSelected');
        $('#tabs').tabs('update',{
             tab:current_tab,
             options : {
                  border: false,
                  title: '供应商',
                  content : '<iframe scrolling="auto" frameborder="0"  src="/supplier/view/main" style="width:100%;height:100%;"></iframe>',
             }
        });

 	});

    $("#buyer").click(function(){
        //当前tab
        var current_tab = $('#tabs').tabs('getSelected');
        $('#tabs').tabs('update',{
             tab:current_tab,
             options : {
                  border: false,
                  title: '采购员',
                  content : '<iframe scrolling="auto" frameborder="0"  src="/buyer/view/main" style="width:100%;height:100%;"></iframe>',
             }
        });

 	});

    $("#order").click(function(){

        if($("#tabs").tabs('exists','订单信息')){
                    $("#tabs").tabs('select','订单信息');
                }else{
                    $('#tabs').tabs('add',{
                          title: '订单信息',
                          content : '<iframe scrolling="auto" frameborder="0"  src="/order/view/main" style="width:100%;height:100%;"></iframe>',
                          closable: true
                     });
        }

 	});

	$("#exit").click(function(){
	
		 $.messager.confirm('确认', '确定要退出系统吗?', function(r){  
		 	if(r){
		 	$.post("/logout",null,function(data){
			if(data=="true"){
				window.location="/login";
				}
			});
		 }
                
       });  
		
	});

	$("#changePwd").click(function(){
		if($("#tabs").tabs('exists','修改密码')){
			$("#tabs").tabs('select','修改密码');
			}else{
			$('#tabs').tabs('add',{
				title: '修改密码',
				content: '<iframe style="width:100%;height:480px;" src="/changePwd"></iframe>',
				closable: true
			});
		}
	});

	//update_userInfo
	$("#update_userInfo").click(function(){
	   $('#win_update_userInfo').window('open'); 
	   
	   $("#update_userInfo_btn").click(function(){
	   
	   	var user = $("#update_info_form").serialize();
	  	 $.post("/hotel/updateUserInfo",user,function(data){
               if(data=="success"){
                   $('#win_update_userInfo').window('close');
                    window.parent.location.reload();
               }else{
                   $.messager.alert('错误','修改成功!','error');
               }
		 });

	   });
	});
	//cancle_update_info
	$("#cancle_update_info").click(function(){
	   $('#win_update_userInfo').window('close'); 
	});	
});
 
</script>
<style>
#userInfo {
	margin:5px;padding:5px; border:solid 1px #ccc;line-height:150%;
}

.tree{
	margin:5px;padding:5px; border:solid 1px #ccc;line-height:150%;height:380px;
}
</style>
</head>
<body class="easyui-layout" >

  <div region="north" style="height:50%;background-color:#E0ECFF;">
          <div style="height:80%;width:90%;">
            <div style="font-family:华文新魏; font-size:24pt; color:#000099; font-weight:bold;
              height:70%;margin-left:40%;margin-top:10px;">
            OMS订单管理系统
            </div>
          </div>
  </div>

<div region="west" split="true" style="width:220px;" title="导航菜单">
    <div id="userInfo">
        <div style="background-color:#99ccff;padding:2px 5px;font-weight:bold;">登录信息<a id="update_userInfo" style="color:#ff0000;font-weight:bold;margin-left:70px;cursor:pointer;">修改</a></div>
        用户名：${user.userName}<br />
        姓名：${user.realName}<br />
        邮&nbsp;&nbsp;箱：<a id="user_email">${user.email}</a><br />
        电&nbsp;&nbsp;话：<a id="user_phone">${user.phone}</a><br />
    </div>
    <div id="win_update_userInfo" class="easyui-window" title="修改联系方式" closed="true" style="width:400px;height:170px;" data-options="iconCls:'icon-edit'">    
       <form name="form"  id = "update_info_form" action="/hotel/???" ENCTYPE="multipart/form-data" modelAttribute="user" method="post" >
	    	<table style="margin:10px 0 0 70px;">		
			<input type="hidden" name="userId" value="${user.userId}">
			
			<tr><td><span>联系电话</span></td><td><input type="text" name="phone" value="${user.phone}"></td></tr>

			<tr><td><span>邮箱</span></td><td><input type="text" name="email" value="${user.email}" class="easyui-validatebox" data-options="validType:'email'"></td></tr>
					
	    	</table>
	    	<div class="submit" style="margin-left:150px;">
	    		<a id="update_userInfo_btn" class="easyui-linkbutton" plain="true" iconCls="icon-save">保存</a>
	    		<a id="cancle_update_info" class="easyui-linkbutton" plain="true" iconCls="icon-cancel">取消</a></div>
	    	</form>
	    
    </div>


    <ul class="easyui-tree" data-options="animate:true,lines:true" style="height:350px;">
		<li data-options="state:'closed'">
			<span>基础数据</span>
			<ul>
				<li>
					<a id="material">物料</a>
				</li>
				<li>
					<a id="supplier">供应商</a>
				</li>
				<li>
					<a id="#">请购人</a>
				</li>
				<li>
					<a id="buyer">采购员</a>
				</li>

			</ul>
		</li>
		<li data-options="state:'closed'">
			<span>采购管理</span>
			<ul>
				<li>
					<a id="order">采购订单</a>
				</li>
			</ul>
		</li>
		<li>
			<a id="changePwd">修改密码</a>
		</li>
		<li>
			<a id="exit">注销登录</a>
		</li>
	</ul>


    </div>
</div>

<div region="center" id="center_div" title="您的位置：系统首页">
  <div id="tabs" class="easyui-tabs"  fit="true" border="false" plain="false">
        <div title="首页">
            <p style="padding-left:2em;font-weight:bold;">OMS 订单管理系统使用须知：</p>
            <p style="padding-left:2em;">
            <span style="color:#ff0000;font-weight:bold;">1. 第一次登录后务必修改自己的密码，以确保操作安全。</span><br />
        </div>
  </div>
</div>
<div region="south" style="height:40px;">
<jsp:include page="copyright.jsp"></jsp:include>
</div>


</body>

</html>
