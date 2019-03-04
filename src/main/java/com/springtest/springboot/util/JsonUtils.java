package com.springtest.springboot.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonUtils {

	private static JsonConfig jcConfig = new JsonConfig();
	static {

		jcConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor() {
			@Override
			public Object processArrayValue(Object arg0, JsonConfig arg1) {
				return null;
			}

			@Override
			public Object processObjectValue(String arg0, Object arg1, JsonConfig arg2) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				if (arg1 == null) {
					return "";
				}
				return sdf.format((Date) arg1);
			}
		});
	}

	public static String obj2Json(Map<String, Object> map) {
		JSONObject jo = JSONObject.fromObject(map, jcConfig);
		return jo.toString();
	}

	public static Map<String, Object> Json2Map(String json) {
		JSONObject jo = JSONObject.fromObject(json);
		Map<String, Object> map = new HashMap<String, Object>();

		for (Object object : jo.keySet()) {
			map.put((String) object, jo.get(object));
		}

		return map;
	}

}
