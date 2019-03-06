<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!-- BEGIN PAGE LEVEL STYLES -->
<link href="${pageContext.request.contextPath}/static/pages/css/profile.min.css" rel="stylesheet">
<!-- END PAGE LEVEL STYLES -->
<!-- Content Header (Page header) -->
<!-- BEGIN PAGE HEAD-->
<style>
.profile-sidebar {
	float: left;
	width: 300px;
	padding-left: 15px;
	padding-right: 15px;
}

@media ( max-width : 992px) {
	.profile-sidebar {
		float: none;
		width: 100% !important;
		margin: 0;
	}
}
</style>
<div class="page-head">
	<!-- BEGIN PAGE TITLE -->
	<div class="page-title">
		<h1>
			用户管理 <small>管理用户个人信息</small>
		</h1>
	</div>
	<!-- END PAGE TITLE -->
</div>

<form class="form-horizontal" id="pagerForm" method="post" action="${pageContext.request.contextPath}/sysUser/loadDetail?id=${sysUser.id}" onsubmit="return divSearch(this,'page-content')">
	<input type="hidden" id="sysUserId" name="sysUserId" value="${sysUser.id}" />
</form>

<!-- END PAGE HEAD-->
<!-- BEGIN PAGE BREADCRUMB -->
<ul class="page-breadcrumb breadcrumb">
	<li><a href="#">首页</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="#">用户管理</a> <i class="fa fa-angle-right"></i></li>
	<li><a href="${pageContext.request.contextPath}/sysUser/list" target="ajax" rel="page-content">用户信息管理</a> <i class="fa fa-angle-right"></i></li>
	<li><span class="active">用户详情</span></li>
</ul>
<!-- END PAGE BREADCRUMB -->
<!-- BEGIN PAGE BASE CONTENT -->
<div class="row">
	<div class="profile-sidebar">
		<!-- PORTLET MAIN -->
		<div class="portlet light profile-sidebar-portlet bordered">
			<!-- SIDEBAR USERPIC -->
			<div class="profile-userpic">
				<c:choose>
					<c:when test="${not empty sysUser.imgPath}">
						<img id="img" src="${pageContext.request.contextPath}/admin/imgView?path=${sysUser.imgPath}" class="img-responsive" alt="">
					</c:when>
					<c:otherwise>
						<img id="img" src="http://www.placehold.it/150x150/EFEFEF/AAAAAA&text=no+image" class="img-responsive">
					</c:otherwise>
				</c:choose>
			</div>
			<!-- END SIDEBAR USERPIC -->
			<!-- SIDEBAR USER TITLE -->
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">${sysUser.name}</div>
			</div>
			<div class="profile-usermenu">
				<ul class="nav" id="user_profile_menu">
					<li class="active">
					   <a href="${pageContext.request.contextPath}/sysUser/detailBase?id=${sysUser.id}" target="ajax" rel="page-scuser-content">
					      <i class="icon-settings"></i> 基础信息
					   </a>
					</li>
					<%--<li>--%>
					   <%--<a href="${pageContext.request.contextPath}/admin/seaStudent/studyRecordList?id=${seaStudentDTO.id}" target="ajax" rel="page-scuser-content"> --%>
					      <%--<i class="icon-pencil"></i> 学籍信息--%>
					   <%--</a>--%>
					<%--</li>--%>
				 	<%--<li>--%>
					   <%--<a href="${pageContext.request.contextPath}/admin/seaStudent/seaStudentLog?id=${seaStudentDTO.id}" target="ajax" rel="page-scuser-content"> --%>
					      <%--<i class="icon-badge"></i> 奖惩记录--%>
					   <%--</a>--%>
					<%--</li> --%>
					<%----%>
					<%--<li>--%>
					   <%--<a href="${pageContext.request.contextPath}/admin/seaStudent/parentList?id=${seaStudentDTO.id}" target="ajax" rel="page-scuser-content"> --%>
					      <%--<i class="icon-users"></i> 家长信息--%>
					   <%--</a>--%>
					<%--</li>--%>
					
				</ul>
			</div>
			<!-- END MENU -->
		</div>
		<!-- END PORTLET MAIN -->
	</div>
	<div id="page-scuser-content" class="profile-content"></div>
</div>
<script type="text/javascript">
	$(function() {
		$("#page-scuser-content")
				.loadUrl(
						"${pageContext.request.contextPath}/sysUser/detailBase?id=${sysUser.id}");
		//$("#subBtn").trigger("click");

		var profileMenu = $('#user_profile_menu');
		profileMenu.find('li').click(function() {
			profileMenu.find('li.active').removeClass('active');
			$(this).toggleClass("active");
		});

	});
</script>
<!-- END PAGE BASE CONTENT -->

