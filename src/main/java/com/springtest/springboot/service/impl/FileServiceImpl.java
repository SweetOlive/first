package com.springtest.springboot.service.impl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.Map.Entry;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.springtest.springboot.Constants;
import com.springtest.springboot.service.FileService;
import com.springtest.springboot.util.ContentTypeTool;
import com.springtest.springboot.util.RefNumGenerator;


import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service(value = "fileService")
public class FileServiceImpl implements FileService {

	private Logger log = LoggerFactory.getLogger(getClass());


	private String fileRoot = "F:/mnt/files/sea/";

	@Override
	public String autoRenameUploadFile(MultipartFile file, String uploadFolder) throws Exception {

		if (file == null || file.isEmpty()) {
			return null;
		}
		// System.out.println("file is " + (file==null));

		Calendar calendar = Calendar.getInstance();
		StringBuilder sb = new StringBuilder();
		sb.append("/").append(calendar.get(Calendar.YEAR)).append("/").append(calendar.get(Calendar.MONTH) + 1).append("/").append(calendar.get(Calendar.DATE));
		String uploadFolderPath = uploadFolder + sb.toString();

		String originalName = file.getOriginalFilename();
		String ext = FilenameUtils.getExtension(originalName);
		if (StringUtils.isNotEmpty(ext)) {
			ext = "." + ext;
		}
		String renameFileName = RefNumGenerator.getInstance().gen() + ext;

		return uploadFile(file, uploadFolderPath, renameFileName);
	}

	public String uploadFile(MultipartFile file, String uploadFolderPath, String renameFileName) throws Exception {

		// uploadFolderPath = uploadFolderPath + FileUtil.getUploadPathByDate();
		// String fileName = FileUtil.generateNewFileName(file);
		// String type = fileName.substring(fileName.lastIndexOf("."));
		// renameFileName = renameFileName + "_" +
		// IdGenerator.getInstance().gen() + type;
		log.debug(" uploadFile ..upload to the file:" + uploadFolderPath);
		log.debug(" uploadFile ..upload to the file renameFileName:" + renameFileName);

		if (file.isEmpty()) {
			return null;
		}

		String relativePath = "";

		String fileName = renameFileName == null ? file.getOriginalFilename() : renameFileName;

		if (!StringUtils.isBlank(uploadFolderPath)) {
			relativePath += uploadFolderPath;
		}

		File fileFolder = new File(fileRoot + relativePath);

		if (!fileFolder.exists()) {
			fileFolder.mkdirs();
		}

		File upfile = new File(fileRoot + relativePath, fileName);
		log.info("upload file to:[" + upfile.getPath() + "]");
		file.transferTo(upfile);

		return relativePath + "/" + fileName;
	}

	public void deleteFile(String path) {
		String fullPath = fileRoot + path;
		File file = new File(fullPath);

		if (file.exists()) {
			if (file.isDirectory()) {
				deleteDirectory(file);
			} else {
				file.delete();
			}
		}
	}

	public void deleteFile(File file) {
		if (file.exists()) {
			if (file.isDirectory()) {
				deleteDirectory(file);
			} else {
				file.delete();
			}
		}
	}

	public File getFile(String path) throws FileNotFoundException {
		File file = new File(fileRoot + path);
		if (file.exists()) {
			return file;
		} else {
			throw new FileNotFoundException(path);
		}
	}

	@Override
	public String getFileRealPath(String path) {
		return fileRoot + path;

	}

	public void deleteDirectory(File directory) {
		File[] files = directory.listFiles();
		for (int i = 0; i < files.length; i++) {
			if (files[i].isDirectory()) {
				deleteDirectory(files[i]);
			} else {
				files[i].delete();
			}
		}
		directory.delete();
	}

	public void deleteDirectory(String path) {
		File directory = new File(fileRoot + path);
		File[] files = directory.listFiles();

		for (int i = 0; i < files.length; i++) {
			if (files[i].isDirectory()) {
				deleteDirectory(files[i]);
			} else {
				files[i].delete();
			}
		}
		directory.delete();
	}

	@Override
	public File[] listFile(String path) {
		String fileRealPath = getFileRealPath(path);
		File file = new File(fileRealPath);

		if (file.isDirectory()) {
			return file.listFiles();
		}

		return null;
	}

	@Override
	public File getFileByRealPath(String realPath) throws FileNotFoundException {
		File file = new File(realPath);
		if (file.exists()) {
			return file;
		} else {
			throw new FileNotFoundException(realPath);
		}
	}

	@Override
	public String getFileRelativePath(String realPath) {
		if (realPath != null) {
			return realPath.substring(fileRoot.length());
		}
		return null;
	}

	@Override
	public String createFolder(String path, String folderName) {
		File folder = new File(fileRoot + path, folderName);
		if (!folder.exists()) {
			folder.mkdirs();
		}
		return folder.getPath();
	}

	@Override
	public void rename(String path, String newName) {
		File file = new File(fileRoot + path);
		if (file.exists()) {
			if (!file.getName().equals(newName)) {
				String parentPath = file.getParent();
				File target = new File(parentPath, newName);

				if (!target.exists()) {
					file.renameTo(target);
				}
			}
		}
	}

	@Override
	public void download(HttpServletResponse response, String path) {
		try {
			File file = getFile(path);

			ServletOutputStream outputStream = null;
			FileInputStream inputStream = null;
			try {
				if (file != null && file.exists()) {
					String ext = FilenameUtils.getExtension(file.getPath());
					String contentType = ContentTypeTool.getContentType(ext);
					response.setContentType(contentType);
					response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
					response.setHeader("filesize", file.length() + "");

					inputStream = new FileInputStream(file);
					outputStream = response.getOutputStream();

					int b = 0;
					byte[] buffer = new byte[512];
					while (-1 != (b = inputStream.read(buffer))) {
						outputStream.write(buffer, 0, b);
					}
					outputStream.flush();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (outputStream != null) {
						outputStream.close();
					}
					if (inputStream != null) {
						inputStream.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkFileType(MultipartFile multipartFile, String type) {
		boolean result = false;
		String logoName = multipartFile == null || multipartFile.isEmpty() ? null : multipartFile.getOriginalFilename();
		if (StringUtils.isNotEmpty(logoName) && type.indexOf(FilenameUtils.getExtension(logoName)) != -1) {
			result = true;
		}
		return result;
	}

	@Override
	public void image(String path, HttpServletRequest request, HttpServletResponse response) {
		if (path != null) {
			try {
				File file = null;
				if (exists(path)) {
					file = getFile(path);
				} else {
					String basePath = request.getSession().getServletContext().getRealPath("/static/images/default.jpg");
					file = new File(basePath);
				}
				if (file != null && file.exists()) {
					response.setContentType("image");
					ServletOutputStream out;
					FileInputStream inputStream = new FileInputStream(file);
					out = response.getOutputStream();

					int b = 0;
					byte[] buffer = new byte[512];
					while (-1 != (b = inputStream.read(buffer))) {
						out.write(buffer, 0, b);
					}
					inputStream.close();
					out.close();
					out.flush();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public boolean exists(String path) {

		File file = new File(fileRoot + path);
		if (file.exists()) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void downloadFile(String userDemoUrl, HttpServletResponse response) {
		try {
			File file = new File(userDemoUrl);
			ServletOutputStream outputStream = null;
			FileInputStream inputStream = null;
			try {
				if (file != null && file.exists()) {
					String ext = FilenameUtils.getExtension(file.getPath());
					String contentType = ContentTypeTool.getContentType(ext);
					response.setContentType(contentType);
					response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
					response.setHeader("filesize", file.length() + "");

					inputStream = new FileInputStream(file);
					outputStream = response.getOutputStream();

					int b = 0;
					byte[] buffer = new byte[512];
					while (-1 != (b = inputStream.read(buffer))) {
						outputStream.write(buffer, 0, b);
					}
					outputStream.flush();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (outputStream != null) {
						outputStream.close();
					}
					if (inputStream != null) {
						inputStream.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@Override
	public void download(String downloadFileName, String uploadPath, HttpServletResponse response) {
		FileInputStream in = null;
		OutputStream out = null;
		try {
			// 得到要下载的文件
			File file = new File(uploadPath);
			// 如果文件不存在，则下载失败
			if (!file.exists()) {
				
			} else {
				// 设置响应头，控制浏览器下载该文件
				response.setHeader("content-disposition","attachment;filename=" + URLEncoder.encode(downloadFileName, "utf-8"));
				// 读取要下载的文件，保存到文件输入流
				in = new FileInputStream(uploadPath);
				// 创建输出流
				out = response.getOutputStream();
				// 创建缓冲区
				byte buffer[] = new byte[1024];
				int len = 0;
				// 循环将输入流中的内容读取到缓冲区中
				while ((len = in.read(buffer)) > 0) {
					// 输出缓冲区内容到浏览器，实现文件下载
					out.write(buffer, 0, len);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (in != null) {
					// 关闭输入流
					in.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				if (out != null) {
					// 关闭输出流
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public String autoRenameFileName(MultipartFile file, String uploadFolder) {
		if (file == null || file.isEmpty()) {
			return null;
		}
		String originalName = file.getOriginalFilename();
		String ext = FilenameUtils.getExtension(originalName);
		if (StringUtils.isNotEmpty(ext)) {
			ext = "." + ext;
		}
		String renameFileName = RefNumGenerator.getInstance().gen() + ext;// 文件名称（加后缀）

		Calendar calendar = Calendar.getInstance();
		StringBuilder sb = new StringBuilder();
		sb.append("/").append(calendar.get(Calendar.YEAR)).append("/").append(calendar.get(Calendar.MONTH) + 1).append("/").append(calendar.get(Calendar.DATE)).append("/");
		String uploadFolderPath = uploadFolder + sb.toString() + renameFileName;

		return uploadFolderPath;
	}

	@Override
	public String getFileExt(String fileName) {
		String ext = FilenameUtils.getExtension(fileName);
		if (StringUtils.isNotBlank(ext)) {
			for (Entry<String, String> entry : Constants.resourceFileMap.entrySet()) {
				if (entry.getValue().contains(ext)) {
					return entry.getKey();
				}
			}
		}
		// 未知类型
		return Constants.RESOURCE_FILE_TYPE_OTHER;
	}

	@Override
	public void zip(String[] files, String zipFile) throws Exception {
		BufferedInputStream origin = null;
		ZipOutputStream out = new ZipOutputStream(new BufferedOutputStream(new FileOutputStream(fileRoot + zipFile)));
		try {
			byte data[] = new byte[1024];
			for (int i = 0; i < files.length; i++) {
				FileInputStream fi = new FileInputStream(files[i]);
				origin = new BufferedInputStream(fi, 1024);
				try {
					ZipEntry entry = new ZipEntry(files[i].substring(files[i].lastIndexOf("/") + 1));
					out.putNextEntry(entry);
					int count;
					while ((count = origin.read(data, 0, 1024)) != -1) {
						out.write(data, 0, count);
					}
				} finally {
					origin.close();
				}
			}
		} finally {
			out.close();
		}
	}

	@Override
	public void unzip(String zipFile, String location) throws Exception {
		try {
			File f = new File(fileRoot + location);
			if (!f.isDirectory()) {
				f.mkdirs();
			}
			ZipInputStream zin = new ZipInputStream(new FileInputStream(fileRoot + zipFile));
			try {
				ZipEntry ze = null;
				while ((ze = zin.getNextEntry()) != null) {
					String path = fileRoot + location + ze.getName();

					if (ze.isDirectory()) {
						File unzipFile = new File(path);
						if (!unzipFile.isDirectory()) {
							unzipFile.mkdirs();
						}
					} else {
						FileOutputStream fout = new FileOutputStream(path, false);
						try {
							for (int c = zin.read(); c != -1; c = zin.read()) {
								fout.write(c);
							}
							zin.closeEntry();
						} finally {
							fout.close();
						}
					}
				}
			} finally {
				zin.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
