<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>青年之家铁路物资管理系统</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit" />
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta name="renderer" content="webkit">

    <%@ include file="include.inc.jsp"%>
    <%@ include file="include.css.jsp"%>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "https://hm.baidu.com/hm.js?e1359e896ec5e81b1540336cdd19f894";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>

</head>

<body class="page-container-bg-solid page-header-fixed  page-sidebar-closed-hide-logo page-footer-fixed">
    <%--<div id="toast-container" class="toast-top-right" aria-live="polite" style="margin-top: 73px"
         role="alert">
        <c:if test="${currentUser.isOriginalPassword ne 'N'}">
            <a id ="changPassword" href="${pageContext.request.contextPath}/admin/user/changePassword" target="dialog"></a>
            <div class="toast toast-warning"  id="updatePasswordToast" >
                <button class="toast-close-button" role="button">×</button>
                <div class="toast-title">修改初始密码</div>
                <div class="toast-message">为了您的账号安全，请修改初始密码。</div>
            </div>
        </c:if>
    </div>--%>
<%@ include file="common/header.jsp"%>


<!-- BEGIN HEADER & CONTENT DIVIDER -->
<div class="clearfix"> </div>
<!-- END HEADER & CONTENT DIVIDER -->

<div class="page-container">
    <div id="_tboxNotice" class="custom-alerts alert alert-success fade in display-hide"><button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button>TBOX公告</div>
    <%@ include file="common/sidebar.jsp"%>
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">

        <!-- BEGIN CONTENT BODY -->
        <div id="page-content" class="page-content">
            <!-- BEGIN PAGE HEAD-->
            <div class="page-head">
                <!-- BEGIN PAGE TITLE -->
                <div class="page-title">
                    <h1>工作台
                        <small>欢迎使用青年之家铁路物资管理系统</small>
                    </h1>
                </div>
                <!-- END PAGE TITLE -->
            </div>
            <!-- END PAGE HEAD-->
            <!-- BEGIN PAGE BREADCRUMB -->
            <ul class="page-breadcrumb breadcrumb">
                <li>
                    <a href="#">首页</a>
                    <i class="fa fa-circle"></i>
                </li>
                <li>
                    <span class="active">工作台</span>
                </li>
            </ul>
            <!-- END PAGE BREADCRUMB -->
            <!-- BEGIN PAGE BASE CONTENT -->
            <div class="row">
                <div class="col-md-12">
                    <div class="m-heading-1 border-green m-bordered">
                        <p> 欢迎使用 <a href="#" target="_blank">青年之家铁路物资管理系统</a>
                            <br>如在使用过程中遇到问题，请随时与我们联系：603656949@qq.com </p>
                    </div>
                </div>

            </div>
        </div>
        <!-- END CONTENT BODY -->
    </div>
    <!-- END CONTENT -->

</div>


<%@ include file="common/footer.jsp"%>
<!-- ./wrapper -->
</body>

<div id="dialog" class="modal fade"></div>
<iframe id='callbackframe' name='callbackframe' src='about:blank' style='display:none'></iframe>
<%@ include file="include.js.jsp"%>

</html>
