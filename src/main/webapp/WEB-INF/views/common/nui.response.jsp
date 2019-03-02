<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../include.inc.jsp"%>
{
	"statusCode":"${_statusCode}",
	"message": "<spring:message code="NUI.RESP.MSG.${_message}"/>",
	"closeDialog":"${_closeDialog}",
	"formSubmit":"${_formSubmit}",
	"rel":"${_rel}",
	"forwardUrl":"${_forwardUrl}"
}