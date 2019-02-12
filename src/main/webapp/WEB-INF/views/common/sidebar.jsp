<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include.inc.jsp"%>

<!-- BEGIN SIDEBAR -->
<div class="page-sidebar-wrapper">
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar navbar-collapse collapse">
		<!-- BEGIN SIDEBAR MENU -->
		<ul class="page-sidebar-menu   " data-keep-expanded="false"
			data-auto-scroll="true" data-slide-speed="200">
			<!-- <li class="heading">
	                            <h3 class="uppercase">Features</h3>
	                        </li> -->

			<li class="nav-item">
				<a href="#" class="nav-link nav-toggle"> <i class="icon-layers"></i>
					<span class="title">首页</span> 
				</a>
			</li>
			<li class="nav-item"><a href="" class="nav-link nav-toggle">
					<i class="icon-settings"></i> <span class="title">基础管理</span> <span
					class="arrow"></span>
			</a>
				<ul class="sub-menu">
					<li><a
							href="#${pageContext.request.contextPath}/sysUser/list"> <i
							class="fa fa-users"></i> <span class="title">用户管理</span> <span
							class="badge badge-danger" id="_menu_badge_user"></span>
					</a></li>
					<li>
						<a href="#${pageContext.request.contextPath}/hello/test">
						<i class="fa fa-gear"></i><span class="title"> 系统设置</span>
						<span class="badge badge-danger" id="_menu_badge_sysinfo"></span>
					</a></li>
					<li><a
						href="#${pageContext.request.contextPath}/hello/test">
							<i class="fa fa-sitemap"></i> <span class="title">部门管理</span>
							<span class="badge badge-danger" id="_menu_badge_resource"></span>
					</a></li>

					<li><a
						href="#${pageContext.request.contextPath}/hello/test"> <i
							class="fa fa-user"></i> <span class="title">角色管理</span> <span
							class="badge badge-danger" id="_menu_badge_role"></span>
					</a></li>
				</ul></li>
		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
	<!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->

