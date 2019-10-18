<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include.inc.jsp"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->

<head>
<meta charset="utf-8" />
<title>青年之家铁路物资管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link
	href="${pageContext.request.contextPath}/static/global/plugins/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/static/global/plugins/simple-line-icons/simple-line-icons.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/static/global/plugins/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/static/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css"
	rel="stylesheet" type="text/css" />
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN THEME GLOBAL STYLES -->
<link
	href="${pageContext.request.contextPath}/static/global/css/components.min.css"
	rel="stylesheet" id="style_components" type="text/css" />
<link
	href="${pageContext.request.contextPath}/static/global/css/plugins.min.css"
	rel="stylesheet" type="text/css" />
<!-- END THEME GLOBAL STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link
	href="${pageContext.request.contextPath}/static/pages/css/login-4.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME LAYOUT STYLES -->
<!-- END THEME LAYOUT STYLES -->
<style>
.middle-layout {
	position: absolute;
	top: 40%;
	left: 50%;
	-ms-transform: translate(-50%, -50%); /* IE 9 */
	-webkit-transform: translate(-50%, -50%); /* Safari and Chrome */
	-o-transform: translate(-50%, -50%); /* Opera */
	-moz-transform: translate(-50%, -50%); /* Firefox */
	transform: translate(-50%, -50%);
}

</style>

</head>
<!-- END HEAD -->

<body class=" login">
	<!-- BEGIN LOGO -->
	<div class="middle-layout">
		<div class="logo">
			<a href="#">
				<%--<img src="${pageContext.request.contextPath}/static/images/young.jpg" alt="" height="120" width="290"/>--%>
				<h3 style="color:#aeb2c4;">青年之家铁路物资管理系统</h3>
			</a>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN LOGIN -->
		<div class="content">
			<!-- BEGIN LOGIN FORM -->
			<form id="loginId" class="login-form form-horizontal"
				action="${pageContext.request.contextPath}/login/check"
				method="post">
				<h3 class="form-title" >请输入您的登录账号</h3>
				<h4 class="form-title" style="color: red">${message}</h4>
				<%--<c:if test="${not empty errorObj }">--%>
					<%--<div class="alert alert-danger"><!--  display-hide -->--%>
						<%--<button class="close" data-close="alert"> ${errorObj.code}</button>--%>
						<%--<spring:message code="ERROR.CODE.${errorObj.code}"--%>
							<%--arguments="${errorObj.arguments}"></spring:message>--%>
						<%--<c:if test="${errorObj.code eq '2103'}">${settingMap['SCODE_COMPANY_TEL'] }</c:if>--%>
					<%--</div>--%>
				<%--</c:if>--%>
				<div class="form-body">
					<div class="form-group">
						<label class="col-md-3 control-label">用户账号</label>
						<div class="col-md-9">
							<input type="text" id="username"
									class="form-control" autocomplete="off" placeholder=""
									name="username" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">密&nbsp;&nbsp;码</label>
						<div class="col-md-9">
							<input type="password"  id="password"
									class="form-control" autocomplete="off" placeholder=""
									name="password" />
						</div>
					</div>
				</div>

              <%--<c:if test="${PASSWORD_ERROR_NUM > 3}">--%>
					 <%--<div class="form-group">--%>

						<%--<label class="col-md-3 control-label">验证码</label>--%>
						<%--<div class="col-md-9">--%>

							<%--<div class="input-group">--%>
								<%--<div class="input-group-control">--%>
								<%--<input type="text" id="code"--%>
										<%--class="form-control" autocomplete="off" placeholder=""--%>
										<%--name="code" />--%>
								<%--</div>--%>
								<%--<span class="input-group-btn"> <image--%>
										<%--src="${pageContext.request.contextPath}/imgCode"--%>
										<%--height="34px;" />--%>
								<%--</span>--%>
							<%--</div>--%>
						<%--</div>--%>
					<%--</div>--%>
					<%--</c:if>--%>

				<div class="form-actions">
					<div class="row">
						<div class="col-md-offset-3 col-md-6">
							<button type="submit" class="btn green btn-block">登录</button>
						</div>
					</div>
				</div>
			</form>
			<!-- END LOGIN FORM -->
		</div>
		<!-- END LOGIN -->
		<!-- BEGIN COPYRIGHT -->
		<div class="copyright">
			<div>备案信息：粤ICP备19117182号</div>
			&copy; 2019 <a href="#">青年之家铁路物资管理系统</a>版权所有.
		</div>
	</div>
	<!-- END COPYRIGHT -->
	<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/static/global/plugins/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/excanvas.min.js"></script> 
<![endif]-->
	<!-- BEGIN CORE PLUGINS -->
	<script
		src="${pageContext.request.contextPath}/static/global/plugins/jquery.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/global/plugins/bootstrap/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/global/plugins/js.cookie.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/global/plugins/jquery.blockui.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
		type="text/javascript"></script>
	<!-- END CORE PLUGINS -->
	<!-- BEGIN PAGE LEVEL PLUGINS -->
	<script
		src="${pageContext.request.contextPath}/static/global/plugins/jquery-validation/js/jquery.validate.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/global/plugins/jquery-validation/js/additional-methods.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/static/global/plugins/backstretch/jquery.backstretch.min.js"
		type="text/javascript"></script>
	<!-- END PAGE LEVEL PLUGINS -->
	<!-- BEGIN THEME GLOBAL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/static/global/scripts/app.min.js" type="text/javascript"></script>
	<!-- END THEME GLOBAL SCRIPTS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->
	<script src="${pageContext.request.contextPath}/static/pages/scripts/login.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->

	<!-- BEGIN THEME LAYOUT SCRIPTS -->
	<!-- END THEME LAYOUT SCRIPTS -->

</body>

</html>