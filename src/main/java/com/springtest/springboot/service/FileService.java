package com.springtest.springboot.service;

import java.io.File;
import java.io.FileNotFoundException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

public interface FileService {

	public String uploadFile(MultipartFile file, String uploadFolderPath, String renameFileName) throws Exception;

	public String autoRenameUploadFile(MultipartFile file, String uploadFolder) throws Exception;

	public String createFolder(String path, String folderName);

	public File getFile(String path) throws FileNotFoundException;

	public File getFileByRealPath(String realPath) throws FileNotFoundException;

	public void deleteFile(String path);

	public void deleteFile(File file);

	public void deleteDirectory(String path);

	public void deleteDirectory(File file);

	public String getFileRealPath(String path);

	public String getFileRelativePath(String realPath);

	public File[] listFile(String path);
	
	public boolean exists(String path);

	public void rename(String path, String newName);

	public void download(HttpServletResponse response, String path);

	public boolean checkFileType(MultipartFile multipartFile, String type);

	void image(String path, HttpServletRequest request, HttpServletResponse response);

	/**
	 * 下载 文件 (例如下载 模板Excel)
	 * 
	 * @param userDemoUrl
	 *            文件路径
	 * @param response
	 */
	public void downloadFile(String userDemoUrl, HttpServletResponse response);
	
	/**
	 * 下载文件
	 * @param downloadFileName
	 * @param uploadPath
	 * @param request
	 * @param response
	 * @author CaiRonggui 2018.08.14
	 */
	public void download(String downloadFileName, String uploadPath, HttpServletResponse response);


	/**
	 * 重命名文件名称
	 * 
	 * @param file
	 *            文件
	 * @param uploadFolder
	 *            文件夹 eg :/headimg/2017/8/29 "headimg"为文件夹
	 * @return
	 */
	public String autoRenameFileName(MultipartFile file, String uploadFolder);

	/**
	 * 分辨文件类型
	 * 
	 * @param fileName
	 *            文件名称
	 * @return
	 */
	public String getFileExt(String fileName);

	/**
	 * 
	 * 压缩zip文件
	 * 
	 * @param files
	 * @param zipFile
	 * @throws Exception
	 * @return void(返回值说明)
	 * @author Guoyaochun 2018年8月9日
	 */
	public void zip(String[] files, String zipFile) throws Exception;

	/**
	 * 
	 * 解压zip文件
	 * 
	 * @param zipFile
	 * @param location
	 * @throws Exception
	 * @return void(返回值说明)
	 * @author Guoyaochun 2018年8月9日
	 */
	public void unzip(String zipFile, String location) throws Exception;
}
