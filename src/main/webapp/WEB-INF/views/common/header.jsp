<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top">
	<!-- BEGIN HEADER INNER -->
	
	<div class="page-header-inner ">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a> <img height="50" width="150" src="${pageContext.request.contextPath}/static/images/young.jpg" alt="logo" class="logo-default" />
			</a>
			<div class="menu-toggler sidebar-toggler">
				<!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
			</div>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>

		<!-- BEGIN HORIZANTAL MENU -->
		<div class="hor-menu hidden-sm hidden-xs">
		    <ul class="nav navbar-nav">
		        <!-- DOC: Remove data-hover="dropdown" and data-close-others="true" attributes below to disable the horizontal opening on mouse hover -->
		        <li class="classic-menu-dropdown active" style="margin-top: 10px">
		            <%--<c:choose>
		            	<c:when test="${!empty userId && !empty examToken}">
		           			 <a href="${examUrl}admin/index?userId=${userId}&token=${examToken}">考试中心系统<span class="selected"></span></a>
		            	</c:when>
		            	<c:otherwise>
		            		 <a href="${examUrl}admin/index">考试中心系统<span class="selected"></span></a>
		            	</c:otherwise>
		            </c:choose>--%>
		        </li>

		    </ul>
		</div>
		<!-- END HORIZANTAL MENU -->

		<!-- BEGIN PAGE TOP -->
		<div class="page-top">

			<div class="top-menu">
				<ul class="nav navbar-nav pull-right">
					<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
					<li class="dropdown dropdown-user dropdown-dark"><a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> <span class="username username-hide-on-mobile"> <i class="fa fa-user"></i>${currentUser.username} </span> <!-- DOC: Do not remove below empty space(&nbsp;) as its purposely used -->
					</a>
						<ul class="dropdown-menu dropdown-menu-default">
							<li><a href="${pageContext.request.contextPath}/admin/user/changePassword" target="dialog"> <i class="icon-lock"></i> 修改密码
							</a></li>
							<li><a href="${pageContext.request.contextPath}/logout"> <i class="icon-key"></i> 退出登录
							</a></li>
						</ul></li>
					<!-- END USER LOGIN DROPDOWN -->

				</ul>
			</div>
			<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- END PAGE TOP -->
	</div>
	<!-- END HEADER INNER -->
</div>