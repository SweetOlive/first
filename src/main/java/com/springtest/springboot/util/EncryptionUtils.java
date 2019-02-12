package com.springtest.springboot.util;

import java.security.MessageDigest;

/**
 * MD5工具类
 */
public class EncryptionUtils {

	private static String byteArrayToHexString(byte b[]) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++)
			resultSb.append(byteToHexString(b[i]));
		return resultSb.toString();
	}

	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n += 256;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}

	/**
	 * 加密
	 * 
	 * @param origin
	 *            进行加密的字符串
	 * @param charsetname
	 *            编码类型
	 * @param way
	 *            加密方式，MD5，SHA1
	 * @return
	 */
	public static String encryption(String origin, String charsetname, String way) {
		String resultString = null;
		try {
			resultString = new String(origin);
			MessageDigest md = MessageDigest.getInstance(way);
			if (charsetname == null || "".equals(charsetname))
				resultString = byteArrayToHexString(md.digest(resultString.getBytes()));
			else
				resultString = byteArrayToHexString(md.digest(resultString.getBytes(charsetname)));
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		// System.out.println(resultString);
		return resultString;
	}

	// 位运算
	private static final String hexDigits[] = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

}
