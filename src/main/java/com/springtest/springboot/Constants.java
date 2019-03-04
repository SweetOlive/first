package com.springtest.springboot;

import java.util.HashMap;
import java.util.Map;

public class Constants {

	/*
	 * Attribute Name
	 */
	public static final String GLOBAL_EDITING = "E";
	public static final String GLOBAL_VALID = "V";
	public static final String GLOBAL_INVALID = "I";
	public static final String GLOBAL_DELETE = "D";
	public static final String GLOBAL_UPDATE = "U";
	public static final String GLOBAL_YES = "Y";
	public static final String GLOBAL_NO = "N";
	
	public static final String IS_DELETE_YES = "Y";
	public static final String IS_DELETE_NO = "N";

	public static final String ABT_CURRENT_USER_PERMISSION = "abtUserPermission";
	public static final String ABT_CURRENT_USER = "nowUser";
	public static final String ABT_APPLICATION_NAME_SETTINGS = "abtSettings";

	public static int DEFAULT_PAGE_SIZE = 10;

	public static final String SAVE_FORM = "save";
	public static final int SAVE_CHECK = 0;
	public static final int UPDATE_CHECK = 1;

	public static final String PASSWORD_SALT = "abt";

	public static final String DEFAULT_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

	public static final String DEFAULT_DATE_MINUTE_FORMAT = "yyyy-MM-dd HH:mm";

	public static final String DEFAULT_DATE_TIME_MINUTE_FORMAT = "HH:mm";

	public static final String DEFAULT_DATE_DATE_FORMAT = "yyyy-MM-dd";

	public static final String SHARE_QR_CODE_KEY = "SHARE_QR_CODE";

	/*
	 * Api
	 */
	public static String API_STATUS_SUCCESS = "0";
	public static String API_STATUS_SUCCESS_MSG = "成功";
	public static String API_STATUS_FAIL = "1";
	public static String API_STATUS_FAIL_MSG = "失败";

	/*
	 * File folder
	 */
	public static final String PRIVATE_FOLDER = "/private";
	public static final String PUBLIC_FOLDER = "/public";
	public static final String TEMP_FOLDER = "/temp";
	public static final String COMWEBBANNER = "/comwebbanner";

	public static final String IMG_FOLDER = "/images";
	public static final int HEAD_IMG_WIDTH = 300;
	public static final int HEAD_IMG_HEIGHT = 300;

	public static final String RESOURCE_FILE_PATH_RESOURCE = "resource";
	public static final String RESOURCE_FILE_PATH_LITIMG = "litimg";

	/**
	 * login imgcode
	 */
	public static final String IMG_CODE = "IMG_CODE";// 登陆 校验码
	public static final String PASSWORD_ERROR_NUM = "PASSWORD_ERROR_NUM";// 登陆密码错误次数
	public static final String ADMIN_IMG_CODE = "ADMIN_IMG_CODE";// 登陆 校验码
	public static final String ADMIN_PASSWORD_ERROR_NUM = "ADMIN_PASSWORD_ERROR_NUM";// 登陆 ADMIN
	// 密码错误次数



	// 来源
	public static final String RESOURCE_SOURCE_US = "U";// 本校自己
	public static final String RESOURCE_SOURCE_THIRD_PARTY = "T";// 第三方

	// 权限级别
	public static final String RESOURCE_PERMISSION_PRIVATE = "PR";// 私有
	public static final String RESOURCE_PERMISSION_SCHOOL = "S";// 本校
	public static final String RESOURCE_PERMISSION_PUBLIC = "PU";// 公开

	
	// 文件上传状态
	public static final String RESOURCE_FILE_UPLOAD_UNDERWAY = "U";// 进行中
	public static final String RESOURCE_FILE_UPLOAD_SUCCESS = "S";// 成功
	public static final String RESOURCE_FILE_UPLOAD_FAIL = "F";// 失败
	
	// 文件后缀
	public static final String WORD = ".doc.docx.rtf";
	public static final String EXCEL = ".xls.xlsx";
	public static final String PPT = ".ppt.pptx";
	public static final String PDF = ".pdf";
	public static final String WPS = ".wps";
	public static final String TEXT = ".txt";
	public static final String VIDEO = ".mp4.MP4.mkv";
	public static final String ZIP = ".zip.ZIP.rar";
	public static final String IMG = ".jpg.png.gif.bmp.JPG.PNG.GIF.BMP.jpeg";
	public static final String XML = ".xml.XML";

	// 文件类型
	public static final String RESOURCE_FILE_TYPE_WORD = "WORD";
	public static final String RESOURCE_FILE_TYPE_EXCEL = "EXCEL";
	public static final String RESOURCE_FILE_TYPE_PPT = "PPT";
	public static final String RESOURCE_FILE_TYPE_PDF = "PDF";
	public static final String RESOURCE_FILE_TYPE_WPS = "WPS";
	public static final String RESOURCE_FILE_TYPE_TEXT = "TEXT";
	public static final String RESOURCE_FILE_TYPE_VIDEO = "VIDEO";
	public static final String RESOURCE_FILE_TYPE_ZIP = "ZIP";
	public static final String RESOURCE_FILE_TYPE_IMG = "IMG";
	public static final String RESOURCE_FILE_TYPE_OTHER = "OTHER";// 其他类型
	public static final Map<String, String> resourceFileMap = new HashMap<String, String>();
	static {
		resourceFileMap.put(RESOURCE_FILE_TYPE_WORD, WORD);
		resourceFileMap.put(RESOURCE_FILE_TYPE_EXCEL, EXCEL);
		resourceFileMap.put(RESOURCE_FILE_TYPE_PPT, PPT);
		resourceFileMap.put(RESOURCE_FILE_TYPE_PDF, PDF);
		resourceFileMap.put(RESOURCE_FILE_TYPE_WPS, WPS);
		resourceFileMap.put(RESOURCE_FILE_TYPE_TEXT, TEXT);
		resourceFileMap.put(RESOURCE_FILE_TYPE_VIDEO, VIDEO);
		resourceFileMap.put(RESOURCE_FILE_TYPE_ZIP, ZIP);
		resourceFileMap.put(RESOURCE_FILE_TYPE_IMG, IMG);
	}

	public static final String FORM_PAGE_SCUSER_CONTENT = "page-scuser-content";// 刷新

	public static final String GOODS_IMG_FOLDER = "/goods/img";

	public static final String COMPANY_IMG_FOLDER = "/company/img";
}
