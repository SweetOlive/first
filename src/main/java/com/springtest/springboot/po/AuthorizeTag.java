package com.springtest.springboot.po;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang.BooleanUtils;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

//import net.shadowedu.hfls.core.abt.dto.AbtUserDTO;
//import net.shadowedu.hfls.core.abt.service.AbtPermissionService;
//import net.shadowedu.hfls.core.abt.service.AbtUserService;

@Configuration
public class AuthorizeTag extends TagSupport {
	// ~ Instance fields
	// ================================================================================================

	private static final long serialVersionUID = 6026277724744626133L;
	private String ifAllGranted = "";
	private String ifAnyGranted = "";
	private String ifNotGranted = "";

	// ~ Methods
	// ========================================================================================================

	public int doStartTag() throws JspException {

		HttpSession session = pageContext.getSession();

		WebApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(pageContext.getServletContext());
//		AbtUserService abtUserService = applicationContext.getBean("userService", AbtUserService.class);
//		AbtPermissionService abtPermissionService = applicationContext.getBean("permissionService", AbtPermissionService.class);

//		AbtUserDTO currentUser = null;
//		try {
//			Object object = abtUserService.getCurrentUser(session);
//			if (object instanceof AbtUserDTO) {
//				currentUser = (AbtUserDTO) object;
//			}
//		} catch (Exception e) {
//			return Tag.SKIP_BODY;
//		}

//		// is current user is super admin
//		if (currentUser != null) {
//			Boolean isSuperAdmin = currentUser.getIsSuperAdmin();
//			if (BooleanUtils.isTrue(isSuperAdmin)) {
//				return EVAL_BODY_INCLUDE;
//			}
//		}

		if (((null == ifAllGranted) || "".equals(ifAllGranted)) && ((null == ifAnyGranted) || "".equals(ifAnyGranted)) && ((null == ifNotGranted) || "".equals(ifNotGranted))) {
			return Tag.SKIP_BODY;
		}

//		Set<String> userPermissions = null;
//		try {
//			userPermissions = abtPermissionService.getCurrentUserPermissions(session);
//		} catch (Exception e) {
//			userPermissions = new HashSet<String>();
//		}
//
//		if ((null != ifNotGranted) && !"".equals(ifNotGranted)) {
//			boolean flag = false;
//			String[] granteds = ifNotGranted.split(",");
//			for (String granted : granteds) {
//				if (userPermissions.contains(granted.trim())) {
//					flag = true;
//					break;
//				}
//			}
//
//			if (flag) {
//				return Tag.SKIP_BODY;
//			}
//		}
//
//		if ((null != ifAllGranted) && !"".equals(ifAllGranted)) {
//			boolean flag = false;
//
//			String[] granteds = ifAllGranted.split(",");
//
//			for (String granted : granteds) {
//				if (!userPermissions.contains(granted.trim())) {
//					flag = true;
//					break;
//				}
//			}
//
//			if (flag) {
//				return Tag.SKIP_BODY;
//			}
//		}

//		if ((null != ifAnyGranted) && !"".equals(ifAnyGranted)) {
//
//			boolean flag = true;
//
//			String[] granteds = ifAnyGranted.split(",");
//
//			for (String granted : granteds) {
//				if (userPermissions.contains(granted.trim())) {
//					flag = false;
//					break;
//				}
//			}
//
//			if (flag) {
//				return Tag.SKIP_BODY;
//			}
//		}

		return Tag.EVAL_BODY_INCLUDE;
	}

	public String getIfAllGranted() {
		return ifAllGranted;
	}

	public String getIfAnyGranted() {
		return ifAnyGranted;
	}

	public String getIfNotGranted() {
		return ifNotGranted;
	}

	public void setIfAllGranted(String ifAllGranted) {
		this.ifAllGranted = ifAllGranted;
	}

	public void setIfAnyGranted(String ifAnyGranted) {
		this.ifAnyGranted = ifAnyGranted;
	}

	public void setIfNotGranted(String ifNotGranted) {
		this.ifNotGranted = ifNotGranted;
	}

}
