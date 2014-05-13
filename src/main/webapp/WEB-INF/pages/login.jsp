<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>
      系统登录
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


<script src="${pageContext.request.contextPath}/webresource/hotel-js/jquery-1.7.2.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/jquery.easyui.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/tabs.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/SimpleTree.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/hotel-js/login.js">
</script>
<script type="text/javascript">
  $(document).ready(function(){

    $("#register").click(function(){
      window.location.href="/hotel/regRedirect";

    });

      $("#hotelRegister").click(function(){
        window.location.href="/hotel/hotelRegRedirect";
      });
      
      	$(function(){         
         	$('#kaptchaImage').click(function () {//生成验证码  
     		$(this).hide().attr('src', '/hotel/getKaptchaImage?' + Math.floor(Math.random()*100) ).fadeIn();  
     		event.cancelBubble=true;  
    		});  
		});   
  
  
        window.onbeforeunload = function(){  
    		//关闭窗口时自动退出  
   		 if(event.clientX>360&&event.clientY<0||event.altKey){     
        	alert(parent.document.location);  
    		}  
		};  
  
  
		function changeCode() {  
    		$('#kaptchaImage').hide().attr('src', '/hotel/getKaptchaImage?' + Math.floor(Math.random()*100) ).fadeIn();  
    		event.cancelBubble=true;  
		}  
	   
  });
</script>
  <style>
   #userName_error,#userPassword_error,#roleId_error,#code_error{ 
    display:block;
	color:red;
	font-size:10px;
	font-weight:bold;
	width:100px;
   }
</style>
 </head>
    <body class="easyui-layout" >

      <div region="north" style="height:70px;background-color:#E0ECFF;">
        <div style="width:700px;height:30px;margin-left:360px;">
          <div style="font-family:华文新魏; font-size:28pt; color:#000099; margin: 18px 0px 2px 0px; font-weight:bold;">基于云模式的酒店服务信息后台管理系统 </div>
          
        </div>
      </div>


      <div region="center">
        <div style="height:210px;width:410px;margin-left:490px;margin-top:10px;">
          <div class="easyui-panel"  title="登录" style="height:220px;width:450px;">
            <div style="padding:10px 0 0 10px">

              <table style="margin:10px 0 0 70px;">

                <tr>
                  <td>
                    用&nbsp;户&nbsp;名:
                  </td>
                  <td>
                    <input  type="text" name="userName" id="userName">
                  </input>
                </td>
                <td>
                  <span id='userName_error'>
                  </span>
                </td>
              </tr>
              <tr>
                <td>
                  密&nbsp;&nbsp;&nbsp;&nbsp;码:
                </td>
                <td>
                  <input type="password" name="userPassword" id="userPassword">
                </input>
              </td>
              <td>
                <span id='userPassword_error'>
                </span>
              </td>
            </tr>
            <tr>
              <td>
                登录角色:
              </td>
              <td>
                <select name="roleId" id="roleId" style="width:155px;">
                  <option value="0001" >
                    云中心管理员
                  </option>
                  <option value="0002">
                    酒店管理员管理员
                  </option>
                  <option value="0003">
                    酒店操作员
                  </option>
                </select>
              </td>
              <td>
                <span id='roleId_error'>
                </span>
              </td>
            </tr>
             <tr>
                <td>
                  验证码:
                </td>
                <td>
                  <input name="clientCode" id="clientCode" type="text"  maxlength="4" class="chknumber_input">
                </input>
              </td>
              <td>
                <img src="/hotel/getKaptchaImage" id="kaptchaImage"  style="margin-bottom: -3px;cursor:pointer;" 
                onclick="changeCode()" class="easyui-tooltip" title="点击更换验证码"/>  <span id='code_error'>
                </span> </td>
      
            </tr>
          </table>

        </div>
        <div style="margin:10px 0 0 160px">
          <input type="submit" id="loginBtn" value="登录" />
          <button id="register">
            注册
          </button>
          <button id="hotelRegister">
            酒店注册
          </button>
        </div>
      </div>
    </div>

  </div>
  <div region="south" style="height:40px;">
   <jsp:include page="copyright.jsp"></jsp:include>
  </div>


</body>

</html>
