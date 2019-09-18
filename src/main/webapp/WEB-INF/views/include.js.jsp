<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="icon" type="image/x-icon" href="/favicon.ico">



<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath}/static/global/plugins/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/excanvas.min.js"></script> 
<script src="${pageContext.request.contextPath}/static/global/plugins/ie8.fix.min.js"></script> 
<![endif]-->
<!-- BEGIN CORE PLUGINS -->
<script src="${pageContext.request.contextPath}/static/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/js.cookie.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/jquery-validation/js/localization/messages_zh.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/global/plugins/pagination/jquery.pagination.min.js"></script>

<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-select/js/bootstrap-select.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->


<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/global/scripts/app.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/static/global/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/static/global/plugins/jquery.input-ip-address-control-1.0.min.js" type="text/javascript"></script>
        
<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-growl/jquery.bootstrap-growl.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->

<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="${pageContext.request.contextPath}/static/layouts/layout4/scripts/layout.js" type="text/javascript"></script>
<!-- END THEME LAYOUT SCRIPTS -->

<!-- BEGIN IMAGE UPLOAD -->
<script src="${pageContext.request.contextPath}/static/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<!-- END IMAGE UPLOAD -->

<!-- BEGIN H5 CKEDITOR -->
<script type="text/javascript">
	var filebrowserUploadUrl = '/tbox/admin/uploadImage';
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/global/plugins/ckeditor4_7_0/ckeditor.js"></script>
<!-- END H5 CKEDITOR -->

<!-- NUI -->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/global/plugins/nui4m/nui.core.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/global/plugins/nui4m/nui.dialog.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/global/plugins/nui4m/nui.ajax.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/global/plugins/nui4m/nui.ui.js"></script>

<script type="text/javascript">
$('.toast-close-button').click(function () {
	$(this).parent('div').hide();
});
$('#updatePasswordToast').click(function () {
	$('#changPassword').click();
	$(this).parent('div').hide();
});
	(function($) {
		bootbox.setLocale("zh_CN");
		NUI.init("${pageContext.request.contextPath}/login");
        refreshSideBarRedPoint();
	})(jQuery);


//红点提示
function initPoints(){
    var sidebar = $(".page-sidebar");
    var redPointSums = $(".redPointSums",sidebar);
    redPointSums.each(function() {
        var $this = $(this);
        var redPoints = $(".redPoint",$this);
        var redPointSum = $(".redPointSum",$this);
        var sum=0;
        redPoints.each(function() {
            var $redPoint = $(this);
            var n = parseInt($redPoint.html());
            if (!isNaN(n))
            {
                sum =sum +n;
            }

        });
        if(sum>0){
            redPointSum.html(sum);
        }else{
            redPointSum.html("");
        }

    });
}

function refreshSideBarRedPoint(){
    var sidebar = $(".page-sidebar");
    var redPoints = $(".redPoint",sidebar);

    $.ajax({
        type : 'GET',
        url : '${pageContext.request.contextPath}/admin/refreshSideBarRedPoint',
        cache : false,
        success : function(response) {
            var json = NUI.jsonEval(response);

            if(json){

                //clear
                redPoints.each(function() {
                    var $this = $(this);
                    $this.html("");
                });

                /* for(var rp : json){
                    var redPoint = $("#"+rp.key,redPoints);
                    redPoint.html(rp.value);
                }
                 */
                for(var key in json){

                    var redPoint = $("#"+key);
                    var value = json[key];
                    if(value>0||isNaN(value)){
                        redPoint.html(json[key]);
                    }

                }
                initPoints();
            }

        },
        error : NUI.ajaxError,
        statusCode : {
            503 : function(xhr, ajaxOptions, thrownError) {
                alert(NUI.msg("statusCode_503") || thrownError);
            }
        }
    });

}

function refreshSideBarRedPointByType(type){
    $.ajax({
        type : 'GET',
        url : '${pageContext.request.contextPath}/admin/refreshSideBarRedPoint?type='+type,
        cache : false,
        success : function(response) {
            var json = NUI.jsonEval(response);

            if(json){

                for(var key in json){
                    var redPoint = $("#"+key);
                    var value = json[key];
                    if(value>0||isNaN(value)){
                        redPoint.html(json[key]);
                    }else{
                        redPoint.html("");
                    }
                }
                initPoints();
            }

        },
        error : NUI.ajaxError,
        statusCode : {
            503 : function(xhr, ajaxOptions, thrownError) {
                alert(NUI.msg("statusCode_503") || thrownError);
            }
        }
    });

}

</script>
