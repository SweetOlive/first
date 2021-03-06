﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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
				<a href="${pageContext.request.contextPath}/login/index" class="nav-link nav-toggle"> <i class="icon-layers"></i>
					<span class="title">首页</span> 
				</a>
			</li>

			<li class="nav-item"><a href="" class="nav-link nav-toggle">
				<i class="fa fa-user"></i> <span class="title">个人中心</span>
				<span class="arrow"></span>
			</a>
				<ul class="sub-menu">
					<li><a
							href="#${pageContext.request.contextPath}/sysUser/loadDetail?id=${nowUser.id}"> <i
							class="fa fa-user"></i> <span class="title">个人信息</span> <span
							class="badge badge-danger" id="_menu_badge_use"></span>
					</a></li>
				</ul>
			</li>
        <security:authorize ifAnyGranted="P_SYS">
			<li class="nav-item"><a href="" class="nav-link nav-toggle">
				<i class="icon-settings"></i> <span class="title">基础管理</span>
				<span class="arrow"></span>
			</a>
				<ul class="sub-menu">
	                <security:authorize ifAnyGranted="P_SYS_USER">
					    <li><a href="#${pageContext.request.contextPath}/sysUser/list"> <i class="fa fa-users"></i>
							<span class="title">用户管理</span> <span class="badge badge-danger" id="_menu_badge_user"></span></a></li>
	                </security:authorize>
	                <security:authorize ifAnyGranted="P_SYS_ROLE">
		                <li><a href="#${pageContext.request.contextPath}/sysRole/list"> <i class="fa fa-user-plus"></i>
							<span class="title">角色管理</span> <span class="badge badge-danger" id="_menu_badge_role"></span></a></li>
					</security:authorize>
	                <security:authorize ifAnyGranted="P_SYS_DEPARTMENT">
						<li><a href="#${pageContext.request.contextPath}/sysDepartment/list"><i class="fa fa-sitemap"></i>
							<span class="title">部门管理</span><span class="badge badge-danger" id="_menu_badge_resource"></span></a></li>
					</security:authorize>
	                <security:authorize ifAnyGranted="P_SYS_PERMISSION">
					    <li><a href="#${pageContext.request.contextPath}/sysPermission/list"><i class="fa fa-gear"></i>
							<span class="title"> 权限管理</span><span class="badge badge-danger" id="_menu_badge_sysinfo"></span></a></li>
					</security:authorize>
				</ul></li>
        </security:authorize>
		<security:authorize ifAnyGranted="P_COMPANY">
			<li class="nav-item  redPointSums">
				<a href="" class="nav-link nav-toggle"><i class="fa fa-shopping-cart"></i>
					<span class="title">供应商管理</span><span class="arrow"></span>
					<span class="badge badge-warning redPointSum"></span>
				</a>
				<ul class="sub-menu">
					<security:authorize ifAnyGranted="P_COMPANY_IN">
						<li><a href="#${pageContext.request.contextPath}/supplierCompany/list"><i class="fa fa-sign-in"></i>
							<span class="title">供应商准入管理</span>
							<span class="badge badge-danger redPoint" id="COMPANY_APPROVER_NUM"></span></a>
						</li>
					</security:authorize>
					<security:authorize ifAnyGranted="P_COMPANY_ADMIN">
						<li><a href="#${pageContext.request.contextPath}/supplierCompany/passAndFailList"><i class="fa fa-shopping-cart"></i>
							<span class="title">供应商管理</span></a></li>
					</security:authorize>
				</ul>
			</li>
		</security:authorize>
		<security:authorize ifAnyGranted="P_PRICE">
			<li class="nav-item">
			<a href="" class="nav-link nav-toggle"><i class="fa fa-bookmark-o"></i>
				<span class="title">物资目录管理</span><span class="arrow"></span>
			</a>
			<ul class="sub-menu">
			<security:authorize ifAnyGranted="P_PRICE_ADMIN">
				<li><a href="#${pageContext.request.contextPath}/priceGoodsCatalog/list"><i class="fa fa-book"></i>
					<span class="title">物资目录管理</span></a></li>
			</security:authorize>
			<security:authorize ifAnyGranted="P_PRICE_LIMIT">
				<li><a href="#${pageContext.request.contextPath}/priceGoodsLimit/list"><i class="fa fa-balance-scale"></i>
					<span class="title">限价管理</span></a></li>
			</security:authorize>
			</ul>
		    </li>
	   </security:authorize>
       <security:authorize ifAnyGranted="P_BUY">
			<li class="nav-item  redPointSums">
				<a href="" class="nav-link nav-toggle"><i class="fa fa-dollar"></i>
					<span class="title">采购管理</span><span class="arrow"></span>
					<span class="badge badge-warning redPointSum"></span>
				</a>
				<ul class="sub-menu">
		    <security:authorize ifAnyGranted="P_BUY_XUN">
					<li><a href="#${pageContext.request.contextPath}/purchaseInquiry/list"><i class="fa fa-strikethrough"></i>
							<span class="title">询价单管理</span></a></li>
			</security:authorize>
			<security:authorize ifAnyGranted="P_BUY_ORDER">
					<li><a href="#${pageContext.request.contextPath}/purchaseOrder/list"><i class="fa fa-list-alt"></i>
							<span class="title">订单管理</span>
						    <span class="badge badge-danger redPoint" id="ORDER_APPROVER_NUM"></span>
					</a></li>
			</security:authorize>
			<security:authorize ifAnyGranted="P_BUY_INCOME">
					<li><a href="#${pageContext.request.contextPath}/purchaseReceiving/list"><i class="fa fa-table"></i>
							<span class="title">收料管理</span>
						    <span class="badge badge-danger redPoint" id="RECEIVING_APPROVER_NUM"></span>
					</a></li>
			</security:authorize>
				</ul>
			</li>
	   </security:authorize>
       <security:authorize ifAnyGranted="P_SAVE">
			<li class="nav-item  redPointSums">
				<a href="" class="nav-link nav-toggle"><i class="fa fa-rocket"></i>
					<span class="title">仓储管理</span><span class="arrow"></span>
					<span class="badge badge-warning redPointSum"></span>
				</a>
				<ul class="sub-menu">
		    <security:authorize ifAnyGranted="P_SAVE_INSERT">
					<li><a href="#${pageContext.request.contextPath}/storageIncoming/list"><i class="fa fa-print"></i>
							<span class="title">进库料管理</span>
						    <span class="badge badge-danger redPoint" id="INCOMING_APPROVER_NUM"></span>
					</a></li>
			</security:authorize>
			<security:authorize ifAnyGranted="P_SAVE_SEND">
					<li><a href="#${pageContext.request.contextPath}/storageSending/list"><i class="fa fa-random"></i>
							<span class="title">发料管理</span>
						    <span class="badge badge-danger redPoint" id="SEND_APPROVER_NUM"></span>
					</a></li>
			</security:authorize>
				</ul>
			</li>
	   </security:authorize>
		<security:authorize ifAnyGranted="P_BUDGET">
			<li class="nav-item">
				<a href="" class="nav-link nav-toggle"><i class="fa fa-hourglass"></i>
					<span class="title">预算管理</span><span class="arrow"></span>
				</a>
				<ul class="sub-menu">
					<security:authorize ifAnyGranted="P_BUDGET_ADMIN">
						<li><a href="#${pageContext.request.contextPath}/budgetManagement/list"><i class="fa fa-hourglass"></i>
							<span class="title">预算管理</span></a></li>
					</security:authorize>
					<security:authorize ifAnyGranted="P_BUDGET_NESS">
						<li><a href="#${pageContext.request.contextPath}/demandManagement/list"><i class="fa fa-hourglass-o"></i>
							<span class="title">需求管理</span></a></li>
					</security:authorize>
				</ul>
			</li>
		</security:authorize>
			<%--<li class="nav-item">--%>
				<%--<a href="" class="nav-link nav-toggle"><i class="fa fa-paste"></i>--%>
					<%--<span class="title">合同管理</span><span class="arrow"></span>--%>
				<%--</a>--%>
				<%--<ul class="sub-menu">--%>
					<%--<li>--%>
						<%--<a href="#${pageContext.request.contextPath}/hello/test">--%>
							<%--<i class="fa fa-file"></i>--%>
							<%--<span class="title">招标合同</span>--%>
						<%--</a>--%>
					<%--</li>--%>
					<%--<li>--%>
						<%--<a href="#${pageContext.request.contextPath}/hello/test">--%>
							<%--<i class="fa fa-file-o"></i>--%>
							<%--<span class="title">询价合同</span>--%>
						<%--</a>--%>
					<%--</li>--%>
					<%--<li>--%>
						<%--<a href="#${pageContext.request.contextPath}/hello/test">--%>
							<%--<i class="fa fa-file-text-o"></i>--%>
							<%--<span class="title">报价管理</span>--%>
						<%--</a>--%>
					<%--</li>--%>
				<%--</ul>--%>
			<%--</li>--%>
		</ul>
		<!-- END SIDEBAR MENU -->
	</div>
	<!-- END SIDEBAR -->
</div>
<!-- END SIDEBAR -->

