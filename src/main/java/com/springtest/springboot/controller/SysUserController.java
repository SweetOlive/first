package com.springtest.springboot.controller;

import com.springtest.springboot.BaseException;
import com.springtest.springboot.Constants;
import com.springtest.springboot.ErrorConstants;
import com.springtest.springboot.po.SysUser;
import com.springtest.springboot.service.FileService;
import com.springtest.springboot.service.SysUserService;
import com.springtest.springboot.util.EncryptionUtils;
import com.springtest.springboot.util.NUIResponseUtils;
import com.springtest.springboot.util.page.PageList;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户管理 2019.02.11
 */

@Controller
@RequestMapping(value = "/sysUser")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private FileService fileService;

    //用户列表
    @RequestMapping(value = "list")
    public String list(@ModelAttribute(value = "sysUser") SysUser sysUser,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       HttpServletRequest request){
        PageList<SysUser> pageList = sysUserService.findAll(sysUser,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        return "/sysUser/sysUserList";
    }
    //新增入口
    @RequestMapping(value = "load")
    public String load(Integer id,HttpServletRequest request){
        if (id != null){
            SysUser sysUser = sysUserService.findById(id);
            request.setAttribute("sysUser",sysUser);
        }
        return "/sysUser/sysUserLoad";
    }

    //保存/修改 用户
    @RequestMapping(value = "save")
    public String save(Integer nowId,Integer id,String accountNumber,String name,
                       String password,String repassword,
                       HttpServletRequest request){
        if (id==null){
            if (sysUserService.findByAccountNumber(accountNumber)!=null){
                throw new BaseException(ErrorConstants.ACCOUNT_ALREADY_EXISTS);
            }
            SysUser sysUser = new SysUser();
            sysUser.setName(name);
            sysUser.setAccountNumber(accountNumber);
            //新建用户默认密码都为123456
            sysUser.setPassword(EncryptionUtils.encryption("123456","Utf-8","MD5"));
            sysUser.setCount(0);
            sysUser.setCreateTime(new Date());
            sysUser.setUpdateTime(new Date());
            sysUser.setCreateUserId(nowId);
            sysUser.setUpdateUserId(nowId);
            int a = sysUserService.add(sysUser);
            if (a == 1){ System.out.println("新增成功！ "+sysUser.getName()); }
            else{ System.out.println("新增失败！ "+sysUser.getName()); }
        }else{
            SysUser sysUser = sysUserService.findById(id);
            if (sysUser.getAccountNumber().equals(accountNumber)){
                sysUser.setAccountNumber(accountNumber);
            }else{
                if (sysUserService.findByAccountNumber(accountNumber)!=null){
                    throw new BaseException(ErrorConstants.ACCOUNT_ALREADY_EXISTS);
                }else{
                    sysUser.setAccountNumber(accountNumber);
                }
            }
            sysUser.setName(name);
            sysUser.setUpdateUserId(nowId);
            sysUser.setUpdateTime(new Date());
            sysUserService.update(sysUser);
        }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //删除用户
    @RequestMapping(value = "/delete")
    public String delete(Integer id,HttpServletRequest request){
        if (id != null){
            int i = sysUserService.delete(id);
            if (i == 1){
                System.out.println("删除成功！"+id);
            }else{
                System.out.println("删除失败！"+id);
            }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //用户查看详情入口
    @RequestMapping(value = "/loadDetail")
    public String loadDetail(Integer id,HttpServletRequest request){
        if (id != null){
            SysUser sysUser = sysUserService.findById(id);
            request.setAttribute("sysUser",sysUser);
        }
        return "/sysUser/sysUserDetail";
    }

    //详情基础信息页
    @RequestMapping(value = "/detailBase")
    public String detailBase(Integer id,HttpServletRequest request){
        if (id != null){
            SysUser sysUser = sysUserService.findById(id);
            request.setAttribute("sysUser",sysUser);
            if (sysUser.getBirthday()!=null){
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String birthdayString = sdf.format(sysUser.getBirthday());
                request.setAttribute("birthdayString",birthdayString);
            }
        }
        return "/sysUser/sysUserDetailBase";
    }

    //保存详情基础信息
    @RequestMapping(value = "/saveDetail")
    public String saveDetail(SysUser sysUser,Integer id,Integer nowId,String birthdayString,HttpServletRequest request)throws Exception{
        if (id!=null){
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            SysUser user = sysUser;
            user.setUpdateUserId(nowId);
            user.setBirthday(sdf.parse(birthdayString));
            user.setUpdateTime(new Date());
            sysUserService.update(user);
        }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/saveImg")
    public String saveImg(Integer id, MultipartFile file, HttpServletRequest request) throws  Exception{
        SysUser sysUser = new SysUser();
        if (id!=null){
            sysUser = sysUserService.findById(id);
            if(file != null) {
                String orginalFilename = file.getOriginalFilename();
                if(StringUtils.isNotBlank(orginalFilename)) {
                    boolean isImage = fileService.checkFileType(file, Constants.IMG);
                    if(isImage) {
                        String path = fileService.autoRenameUploadFile(file, Constants.USER_IMG_FOLDER);
                        sysUser.setImgPath(path);
                        sysUserService.update(sysUser);
                    }else {
                        throw new BaseException("0012");
                    }
                }
            }
        }
        Map<String, String> map = new HashMap<>();
        String url = request.getContextPath() +"/sysUser/loadDetail?id=" + sysUser.getId();
        //map.put(Constants.DEFAULT_DATAS, Constants.localhostImg+sysUser.getImgPath());
        map.put(Constants.DEFAULT_DATAS, Constants.serverImg+sysUser.getImgPath());
        map.put(NUIResponseUtils.REL,  Constants.FORM_PAGE_SCUSER_CONTENT);
        map.put(NUIResponseUtils.DEFAULT_STATUS_CODE, url);
        NUIResponseUtils.setNUIResponse(request, map);
        return "/common/nui.responseImg";
    }


}
