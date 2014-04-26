<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="shortcut icon"
	href="http://acxiom.wpengine.com/wp-content/uploads/2013/08/favicon.png" />

<title>upload files</title>
<style type="text/css">
textarea {
	width: 260;
	overflow-x: visible;
	overflow-y: visible;
}

#results_header,#results_header2,#results_header3 {
	float: left;
	align: center;
}
</style>

</head>
<body>
	<div
		style="width: 100%; text-align: center; margin-right: auto; margin-left: auto;">


		<div style="margin-top: 0px;" class="acxiom-table">
			<form action="/hotel/doUpload" enctype="multipart/form-data" method="post">
				<input type="file" id="imgfile" name="imgfile"></input>${foodId} <input
					type="submit" value="UPLOAD">

			</form>
		</div>
	</div>

</body>

</html>

<script type="text/javascript">


</script>

