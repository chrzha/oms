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


<script src="${pageContext.request.contextPath}/webresource/js/jquery-1.7.2.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/jquery.easyui.min.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/tabs.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/jquery-easy-ui/themes/SimpleTree.js">
</script>
<script src="${pageContext.request.contextPath}/webresource/js/login.js">
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
      <div region="north" style="height:50%;background-color:#E0ECFF;">
        <div style="height:80%;width:90%;">
          <div style="font-family:华文新魏; font-size:24pt; color:#000099; font-weight:bold;
            height:70%;margin-left:40%;margin-top:10px;">
          OMS订单管理系统
          </div>
          
        </div>
      </div>

      <div region="center" style="background-color:#E0ECFF;">
        <div style="height:70%;width:60%;margin-left:20%;margin-top:10px;">
          <div class="easyui-panel"  title="登录" style="height:220px;">
          <form action="/validate" method="post">
            <div style="margin-left:30%;">

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
                  验证码:
                </td>
                <td>
                  <input name="clientCode" id="clientCode" type="text"  maxlength="4" class="chknumber_input">
                </input>
              </td>
              <td>
                <img src="/getKaptchaImage" id="kaptchaImage"  style="margin-bottom: -3px;cursor:pointer;"
                onclick="changeCode()" class="easyui-tooltip" title="点击更换验证码"/>  <span id='code_error'>
                </span> </td>
            </tr>
            <tr>
            <td></td>
            <td>
                <input type="submit" id="loginBtn" value="登录" />
            </td>
            </tr>
          </table>
        </form>
      </div>
    </div>

  </div>
  <div region="south" style="height:40%; background-color:#E0ECFF;">
   <jsp:include page="copyright.jsp"></jsp:include>
  </div>


</body>

</html>
