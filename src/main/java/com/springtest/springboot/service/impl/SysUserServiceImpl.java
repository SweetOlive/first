package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.BaseException;
import com.springtest.springboot.Constants;
import com.springtest.springboot.dao.SysUserMapper;
import com.springtest.springboot.po.SysUser;
import com.springtest.springboot.service.FileService;
import com.springtest.springboot.service.SysUserService;
import com.springtest.springboot.util.EncryptionUtils;
import com.springtest.springboot.util.ExcelUtils;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service(value = "sysUserService")
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private FileService fileService;

    //Excel版本后缀
    private static final String EXCEL_2007_FILE_SUFFIX = ".xlsx";
    private static final String EXCEL_2003_FILE_SUFFIX = ".xls";

    @Override
    public SysUser findByAccountNumber(String number){
        return sysUserMapper.findByAccountNumber(number);
    }

    @Override
    public PageList<SysUser> findAll(SysUser sysUser,Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<SysUser> list = sysUserMapper.findAll(sysUser);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<SysUser> pageList = new PageList<SysUser>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public  int add(SysUser sysUser){
        return  sysUserMapper.insert(sysUser);
    }

    @Override
    public SysUser findById(Integer id){
        return sysUserMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(SysUser sysUser){
        return sysUserMapper.updateByPrimaryKeySelective(sysUser);
    }

    @Override
    public int delete(Integer id){
        return  sysUserMapper.deleteByPrimaryKey(id);
    }

    @Override
    public SysUser getCurrentUser(HttpSession session) throws Exception{
        Object object = session.getAttribute(Constants.ABT_CURRENT_USER);
        if (object == null && !(object instanceof SysUser)) {
            throw new BaseException("0022");
        }
        return (SysUser) object;
    }

    @Override
    public void saveImportUser(Integer nowId,String filePath) throws IOException  {
        InputStream is = null;
        File file = fileService.getFile(filePath);
        is = new FileInputStream(file);
        String fileName = file.getName();
        String suffix = fileName.substring(fileName.indexOf("."), fileName.length());
        List<Map<String, Object>> resultList = null;
        if (StringUtils.isNotBlank(suffix) && suffix.equals(EXCEL_2003_FILE_SUFFIX)) {
            resultList = ExcelUtils.findAll(new HSSFWorkbook(is));
        }else if (StringUtils.isNotBlank(suffix) && suffix.equals(EXCEL_2007_FILE_SUFFIX)) {
            // 2007以后版本
            resultList = ExcelUtils.findAll(new XSSFWorkbook(is));
        }
        String[] titileList = {"序号","*用户名","*用户账号"};
        if (resultList != null && !resultList.isEmpty()) {
            for (Map<String, Object> item : resultList) {
                String name = String.valueOf(item.get(titileList[1]));
                String accountNumber = String.valueOf(item.get(titileList[2]));
                System.out.println("name1: "+name+"  accountNumber1 :" + accountNumber);
                try {
                    if(StringUtils.isNotBlank(name)&&StringUtils.isNotBlank(accountNumber)){
                        System.out.println("name2: "+name+"  accountNumber2:" + accountNumber);
                        SysUser sysUser = sysUserMapper.findByAccountNumber(accountNumber);
                        if (sysUser==null){
                            sysUser = new SysUser();
                            sysUser.setAccountNumber(accountNumber);
                            sysUser.setName(name);
                            //新建用户默认密码都为123456
                            sysUser.setPassword(EncryptionUtils.encryption("123456","Utf-8","MD5"));
                            sysUser.setCount(0);
                            sysUser.setCreateTime(new Date());
                            sysUser.setUpdateTime(new Date());
                            sysUser.setCreateUserId(nowId);
                            sysUser.setUpdateUserId(nowId);
                            int a = sysUserMapper.insert(sysUser);
                            if (a==1) System.out.println("导入新增成功："+name+"   "+accountNumber);
                        }else{
                            sysUser.setName(name);
                            sysUser.setUpdateTime(new Date());
                            sysUser.setUpdateUserId(nowId);
                            int a= sysUserMapper.updateByPrimaryKeySelective(sysUser);
                            if (a==1) System.out.println("导入更新成功："+name+"   "+accountNumber);
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    System.err.println("失败用户:"+name+":"+accountNumber);
                }
            }
        }
    }

    @Override
    public XSSFWorkbook exportUserExcel(SysUser sysUser) throws Exception {
        // 创建XSSFWorkbook
        XSSFWorkbook workbook = new XSSFWorkbook();
        // 设置excel创建sheet表和表名
        XSSFSheet sheet = workbook.createSheet("用户信息表");
        // 创建第一行
        XSSFRow row = sheet.createRow(0);
        // 第一行设置标题
        String[] titileList = {"序号","*用户名","*用户账号","手机号码","性别","出生日期","证件类型","证件号码", "民族","政治面貌","家庭地址"};
        for (int i = 0; i < titileList.length; i++) {
            row.createCell(i).setCellValue(titileList[i]);
        }
        List<SysUser> sysUserList = sysUserMapper.findAll(sysUser);
        Map<String, String> identityCardMap = Constants.identityCardMap;
        if (sysUserList != null && sysUserList.size() > 0) {
            int cnt = 1;
            for(int i=1;i<=sysUserList.size();i++) {
                XSSFRow rowContent = sheet.createRow(i);
                SysUser user = sysUserList.get(i-1);
                //设置列表信息
                //"序号"0
                rowContent.createCell(0).setCellValue(cnt++);
                //"*用户名"1
                rowContent.createCell(1).setCellValue(user.getName());
                // "*用户账号"2
                rowContent.createCell(2).setCellValue(user.getAccountNumber());
                // "手机号码"3
                rowContent.createCell(3).setCellValue(user.getTel());
                // "性别"4
                if (user.getSex()==null)rowContent.createCell(4).setCellValue("");
                else if (user.getSex().equals("M"))rowContent.createCell(4).setCellValue("男");
                else if (user.getSex().equals("N"))rowContent.createCell(4).setCellValue("女");
                // "出生日期"5
                if (user.getBirthday()!=null){
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    String birthdayString = sdf.format(user.getBirthday());
                    rowContent.createCell(5).setCellValue(birthdayString);
                }else rowContent.createCell(5).setCellValue("");
                // "证件类型"6
                rowContent.createCell(6).setCellValue(identityCardMap.get(user.getIdCardType()));
                // "证件号码"7
                rowContent.createCell(7).setCellValue(user.getIdCardNumber());
                // "民族"8
                rowContent.createCell(8).setCellValue(user.getNation());
                // "政治面貌"9
                rowContent.createCell(9).setCellValue(user.getPoliticalStatus());
                // "家庭地址"10
                rowContent.createCell(10).setCellValue(user.getAddress());
            }
        }
        //自动调整列宽，默认第一列
        for (int i = 0; i < 1; i++) {
            sheet.autoSizeColumn((short) i);
        }
        return workbook;
    }
}
