<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/bootstrap.min.css">
<link rel="stylesheet/less" type="text/css"
	href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/acxiom.base.css">
<link rel="stylesheet/less" type="text/css"
	href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/acxiom.ui.dialogue.css">
<link rel="stylesheet/less" type="text/css"
	href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/acxiom.ui.combobox.css">
<link rel="stylesheet/less" type="text/css"
	href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/acxiom.ui.modal.css">
<link rel="stylesheet/less" type="text/css"
	href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/acxiom.ui.calendar.css">
<link rel="stylesheet/less" type="text/css"
	href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/acxiom.ui.calendar2.css">
<link rel="stylesheet/less" type="text/css"
	href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/acxiom.ui.datatables.css">
<link
	href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/acxiom.ui.data.visualization.base.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/acxiom.ui.global.navigation.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/webresource/tree/jquery.treeview.css"
	rel="stylesheet">
<!--[if IE ]>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/webresource/acxiomStyle/styles/IEstyle.css" type="text/css" />
		<![endif]-->

<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/libraries/jquery/jquery-1.7.2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/libraries/less-1.3.0.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/webresource/javascript/jquery-1.9.1.ui.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/js/acxiom.ui.base.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/js/acxiom.dialogue.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/js/acxiom.ui.combo.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/js/acxiom.modal.js"></script>

<script
	src="${pageContext.request.contextPath}/webresource/javascript/jquery.dataTables.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/js/acxiom.ui.calendar.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/libraries/kendoui/js/kendo.dataviz.min.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/js/acxiom.datavisualization.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/js/acxiom.ui.autocomplete.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/js/acxiom.ui.spinner.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/js/jquery.jeditable.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webresource/acxiomStyle/js/acxiom.ui.editable.table.js"></script>
<script
	src="${pageContext.request.contextPath}/webresource/javascript/optimization/optimization_main.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/webresource/c/js/jsl.parser.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webresource/c/js/jsl.format.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webresource/c/js/jsl.interactions.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webresource/c/js/jquery-linedtextarea/jquery-linedtextarea.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/webresource/TestingToolJS/jquery.tablednd.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/webresource/TestingToolJS/search.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/webresource/tree/jquery.treeview.js"></script>

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
			<form action="/test/doUpload" enctype="multipart/form-data" method="post">
				<input type="file" id="imgfile" name="imgfile"></input> <input
					type="submit" value="UPLOAD">

			</form>
		</div>
	</div>

</body>

</html>

<script type="text/javascript">


</script>

