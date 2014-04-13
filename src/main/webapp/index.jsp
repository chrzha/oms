<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>index</title>

<script
	src="${pageContext.request.contextPath}/webresource/hotel-js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	function relocation(){
		$("#indexForm").submit();
	}
</script>
</head>
<body onload="relocation()">
<form id="indexForm" action="/hotel/login/"></form>
</body>
</html>