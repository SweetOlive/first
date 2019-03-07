package com.springtest.springboot.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

public class ExcelUtils {

	/**
	 * 
	 * Create the excel file
	 * 
	 * @param excelPath
	 * @param sheetName
	 * @throws IOException
	 */
	public static void createExcel(String excelPath, String sheetName) throws IOException {
		createSheet(new File(excelPath), sheetName, new String[] {});

	}

	/**
	 * 
	 * Create sheet by excel file path and sheet name
	 * 
	 * @param excelPath
	 * @param sheetName
	 * @param fieldNameList
	 * @throws IOException
	 */
	public static void createSheet(String excelPath, String sheetName, String[] fieldNameList) throws IOException {
		createSheet(new File(excelPath), sheetName, fieldNameList);
	}

	/**
	 * 
	 * Create sheet by excel file and sheet name
	 * 
	 * @param excelFile
	 * @param sheetName
	 * @param fieldNameList
	 * @throws IOException
	 */
	public static void createSheet(File excelFile, String sheetName, String[] fieldNameList) throws IOException {
		InputStream in = null;
		OutputStream out = null;
		HSSFWorkbook excel = null;
		File parentFile = excelFile.getParentFile();
		if (!parentFile.exists()) {
			parentFile.mkdirs();
		}
		if (excelFile.exists()) {
			in = new FileInputStream(excelFile);
			excel = new HSSFWorkbook(in);
		} else {
			excel = new HSSFWorkbook();
		}
		HSSFFont font = excel.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		HSSFSheet sheet = excel.createSheet(sheetName != null && !sheetName.equals("") ? sheetName : "sheet");
		sheet.setDefaultColumnWidth(30);
		HSSFRow row = sheet.createRow(0); // 第一行处理
		for (int i = 0, j = fieldNameList.length; i < j; i++) {
			HSSFCell cell = row.createCell(i);
			HSSFRichTextString text = new HSSFRichTextString(fieldNameList[i]);
			text.applyFont(font);
			cell.setCellValue(text);
		}
		out = new FileOutputStream(excelFile);
		excel.write(out);
		
		if(excel!=null){
			excel.close();
		}
		
		if (out != null) {
			out.close();
		}
		if (in != null) {
			in.close();
		}

	}

	/**
	 * 
	 * Insert data list to excel
	 * 
	 * @param excelPath
	 * @param sheetName
	 * @param dataList
	 * @throws IOException
	 */
	public static void insertList(String excelPath, String sheetName, List<Map<String, Object>> dataList) throws IOException {
		InputStream in = null;
		OutputStream out = null;
		File excelFile = null;
		excelFile = new File(excelPath);
		if (excelFile.exists()) {
			in = new FileInputStream(excelFile);
			HSSFWorkbook excel = new HSSFWorkbook(in);
			HSSFSheet sheet = excel.getSheet(sheetName);
			HSSFRow row = sheet.getRow(0); // 第一行处理
			Iterator<Cell> headIt = row.cellIterator();
			Iterator<Map<String, Object>> dataIt = dataList.iterator();
			List<String> headList = new ArrayList<String>();
			int index = sheet.getLastRowNum();
			while (headIt.hasNext()) {
				Cell cell = headIt.next();
				cell.getStringCellValue();
				headList.add(cell.getStringCellValue());
			}
			while (dataIt.hasNext()) {
				index++;
				row = sheet.createRow(index);
				Map<String, Object> data = dataIt.next();
				for (int i = 0, j = headList.size(); i < j; i++) {
					HSSFCell cell = row.createCell(i);
					String temp;
					if (data.get(headList.get(i)) == null) {
						temp = "";
					} else {
						temp = data.get(headList.get(i)).toString();
					}
					HSSFRichTextString text = new HSSFRichTextString(temp);
					cell.setCellValue(text);
				}
			}
			out = new FileOutputStream(excelFile);
			excel.write(out);
		}
	}

	/**
	 * 
	 * Insert data to excel
	 * 
	 * @param excelPath
	 * @param sheetName
	 * @param data
	 * @throws IOException
	 */
	public static void insert(String excelPath, String sheetName, Map<String, Object> data) throws IOException {
		InputStream in = null;
		OutputStream out = null;
		File excelFile = new File(excelPath);
		if (excelFile.exists()) {
			in = new FileInputStream(excelFile);
			HSSFWorkbook excel = new HSSFWorkbook(in);
			HSSFSheet sheet = excel.getSheet(sheetName);
			HSSFRow row = sheet.getRow(0); // 第一行处理
			Iterator<Cell> headIt = row.cellIterator();
			List<String> headList = new ArrayList<String>();
			int index = sheet.getLastRowNum();
			while (headIt.hasNext()) {
				Cell cell = headIt.next();
				cell.getStringCellValue();
				headList.add(cell.getStringCellValue());
			}
			index++;
			row = sheet.createRow(index);
			for (int i = 0, j = headList.size(); i < j; i++) {
				HSSFCell cell = row.createCell(i);
				String temp = data.get(headList.get(i)).toString();
				HSSFRichTextString text = new HSSFRichTextString(temp != null ? temp : "");
				cell.setCellValue(text);
			}
			out = new FileOutputStream(excelFile);
			excel.write(out);
		}

	}

	public static List<Map<String, Object>> selectAll(String excelPath, String sheetName) throws IOException {
		return selectAll(new File(excelPath), sheetName);
	}

	public static List<Map<String, Object>> selectAll(File file, String sheetName) throws IOException {
		InputStream in = null;
		List<Map<String, Object>> resultList = null;
		if (file.exists()) {
			resultList = new ArrayList<Map<String, Object>>();
			in = new FileInputStream(file);
			HSSFWorkbook excel = new HSSFWorkbook(in);
			HSSFSheet sheet = excel.getSheet(sheetName); // find sheet by name
			HSSFRow hearRow = sheet.getRow(0); // 第一行处理
			Iterator<Cell> headIt = hearRow.cellIterator();
			List<String> headList = new ArrayList<String>();
			while (headIt.hasNext()) {
				Cell cell = headIt.next();
				cell.getStringCellValue();
				headList.add(cell.getStringCellValue());
			}
			int maxRows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < maxRows; i++) {
				HSSFRow dataRow = sheet.getRow(i);
				Map<String, Object> dataMap = new HashMap<String, Object>();
				for (int j = 0, k = headList.size(); j < k; j++) {
					HSSFCell dataCell = dataRow.getCell(j);
					if (dataCell != null) {
						if (dataCell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
							dataMap.put(headList.get(j), dataCell.getNumericCellValue());
						} else if (dataCell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
							dataMap.put(headList.get(j), dataCell.getStringCellValue());
						} else if (dataCell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
							dataMap.put(headList.get(j), dataCell.getBooleanCellValue());
						} else {
							dataMap.put(headList.get(j), dataCell.getStringCellValue());
						}
					}
				}
				resultList.add(dataMap);
			}
		}
		return resultList;
	}

	public static List<Map<String, Object>> selectAll(InputStream inputStream, String sheetName) throws IOException {
		List<Map<String, Object>> resultList = null;
		if (inputStream != null) {
			resultList = new ArrayList<Map<String, Object>>();
			HSSFWorkbook excel = new HSSFWorkbook(inputStream);
			HSSFSheet sheet = excel.getSheet(sheetName); // find sheet by name
			HSSFRow hearRow = sheet.getRow(0); // 第一行处理
			Iterator<Cell> headIt = hearRow.cellIterator();
			List<String> headList = new ArrayList<String>();
			while (headIt.hasNext()) {
				Cell cell = headIt.next();
				cell.getStringCellValue();
				headList.add(cell.getStringCellValue());
			}
			int maxRows = sheet.getPhysicalNumberOfRows();
			for (int i = 1; i < maxRows; i++) {
				HSSFRow dataRow = sheet.getRow(i);
				Map<String, Object> dataMap = new HashMap<String, Object>();
				for (int j = 0, k = headList.size(); j < k; j++) {
					HSSFCell dataCell = dataRow.getCell(j);
					if (dataCell != null) {
						if (dataCell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
							dataMap.put(headList.get(j), dataCell.getNumericCellValue());
						} else if (dataCell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
							dataMap.put(headList.get(j), dataCell.getStringCellValue());
						} else if (dataCell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
							dataMap.put(headList.get(j), dataCell.getBooleanCellValue());
						} else {
							dataMap.put(headList.get(j), dataCell.getStringCellValue());
						}
					}
				}
				resultList.add(dataMap);
			}
		}
		return resultList;
	}
	

	public static List<Map<String, Object>> selectAll(Workbook excel) throws IOException {
		List<Map<String, Object>> resultList = null;
		resultList = new ArrayList<Map<String, Object>>();
		for (int at = 0; at < excel.getNumberOfSheets(); at++) {
			Row hearRow = null;
			int titleNum = 0;
			Sheet sheet = excel.getSheetAt(at); // find sheet by name
			do {
				hearRow = sheet.getRow(titleNum); // 标题处理
				titleNum++;
			} while (titleNum < sheet.getPhysicalNumberOfRows() && !checkRow(hearRow));
			if (hearRow != null) {
				Iterator<Cell> headIt = hearRow.cellIterator();
				List<String> headList = new ArrayList<String>();
				while (headIt.hasNext()) {
					Cell cell = headIt.next();
					headList.add(cell.getStringCellValue().trim());
				}
				int maxRows = sheet.getPhysicalNumberOfRows();
				for (int i = 1; i < maxRows; i++) {
					Row dataRow = sheet.getRow(i);
					if (dataRow != null) {
						Boolean key= false;//去除空行
						Map<String, Object> dataMap = new HashMap<String, Object>();
						for (int j = 0, k = headList.size(); j < k; j++) {
							Cell dataCell = dataRow.getCell(j);
							if (dataCell != null) {
								if (dataCell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC || dataCell.getCellType() == HSSFCell.CELL_TYPE_FORMULA) {
									dataMap.put(headList.get(j), dataCell.getNumericCellValue());
								} else if (dataCell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
									dataMap.put(headList.get(j), dataCell.getStringCellValue().trim());
								} else if (dataCell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
									dataMap.put(headList.get(j), dataCell.getBooleanCellValue());
								} else {
									dataMap.put(headList.get(j), dataCell.getStringCellValue().trim());
								}
								key = true;
							}
						}
						if(key){
							dataMap.put("行数", i+1);//第二行开始计算
							resultList.add(dataMap);
						}
					}
				}
			}
		}
		return resultList;
	}
	
	public static List<Map<String, Object>> findAll(Workbook excel) throws IOException {
		List<Map<String, Object>> resultList = null;
		resultList = new ArrayList<Map<String, Object>>();
		for (int at = 0; at < excel.getNumberOfSheets(); at++) {
			Row hearRow = null;
			int titleNum = 0;
			Sheet sheet = excel.getSheetAt(at); // find sheet by name
			do {
				hearRow = sheet.getRow(titleNum); // 标题处理
				titleNum++;
			} while (titleNum < sheet.getPhysicalNumberOfRows() && !checkRow(hearRow));
			if (hearRow != null) {
				Iterator<Cell> headIt = hearRow.cellIterator();
				List<String> headList = new ArrayList<String>();
				while (headIt.hasNext()) {
					Cell cell = headIt.next();
					headList.add(cell.getStringCellValue().trim());
				}
				int maxRows = sheet.getPhysicalNumberOfRows();
				for (int i = 1; i < maxRows; i++) {
					Row dataRow = sheet.getRow(i);
					if (dataRow != null) {
						Boolean key= false;//去除空行
						Map<String, Object> dataMap = new HashMap<String, Object>();
						for (int j = 0, k = headList.size(); j < k; j++) {
							Cell dataCell = dataRow.getCell(j);
							if (dataCell != null) {
								if (dataCell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC || dataCell.getCellType() == HSSFCell.CELL_TYPE_FORMULA) {
									NumberFormat nf = NumberFormat.getInstance();
									String s = nf.format(dataCell.getNumericCellValue());
									if (s.indexOf(",") >= 0) {
									    s = s.replace(",", "");
									}
									dataMap.put(headList.get(j), s);
								} else if (dataCell.getCellType() == HSSFCell.CELL_TYPE_STRING) {
									dataMap.put(headList.get(j), dataCell.getStringCellValue().trim());
								} else if (dataCell.getCellType() == HSSFCell.CELL_TYPE_BOOLEAN) {
									dataMap.put(headList.get(j), dataCell.getBooleanCellValue());
								} else {
									dataMap.put(headList.get(j), dataCell.getStringCellValue().trim());
								}
								key = true;
							}
						}
						if(key){
							dataMap.put("行数", i+1);//第二行开始计算
							resultList.add(dataMap);
						}
					}
				}
			}
		}
		return resultList;
	}
	
	/**
	 * 标题栏应最少大于三个，否则不视为标题栏。
	 * 
	 * @param hearRow
	 * @return
	 */
	private static boolean checkRow(Row hearRow) {
		if (hearRow == null) {
			return false;
		}
		Iterator<Cell> headIt = hearRow.cellIterator();
		int i = 0;
		while (headIt.hasNext()) {
			Cell cell = headIt.next();
			String value = cell.getStringCellValue();
			if (StringUtils.isNotEmpty(value))
				i++;
		}
		return i > 3;
	}
}
