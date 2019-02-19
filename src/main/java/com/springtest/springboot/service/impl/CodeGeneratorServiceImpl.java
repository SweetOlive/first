package com.springtest.springboot.service.impl;

import com.springtest.springboot.service.CodeGeneratorService;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@Service("sessionCodeGeneratorService")
public class CodeGeneratorServiceImpl implements CodeGeneratorService {

    private String prefix = "00";

    private int index = 0;


    @Override
    public synchronized String gen() {

        StringBuilder sBuilder = new StringBuilder(prefix);

        SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
        sBuilder.append(sdf.format(new Date()))	;

        String randomNum = RandomStringUtils.randomAlphanumeric(4).toUpperCase();//获取随机数
        sBuilder.append(randomNum);

        DecimalFormat df = new DecimalFormat("00");//补全2位数值
        sBuilder.append(df.format(index));

        index++;

        if(index>=10000){
            index=0;
        }

        return sBuilder.toString();
    }

}

