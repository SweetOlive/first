package com.springtest.springboot;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

//错误提示抛出类
//2019.03.03 00:57
@ControllerAdvice
@ResponseBody
public class BaseException extends RuntimeException {
    protected String code;

    protected String arguments;

    public BaseException() {
        super();
        this.code = ErrorConstants.BASE_ERROR;
    }

    public BaseException(String code) {
        this.code = code;
    }

    public BaseException(String code, String... argumentArray) {
        this.code = code;
        if (argumentArray != null && argumentArray.length > 0) {
            this.arguments = StringUtils.join(argumentArray, ",");
        }
    }

    @ExceptionHandler(value = Exception.class)
    public ModelAndView allExceptionHandler(HttpServletRequest request, Exception exception) throws Exception {
        ModelAndView mav = new ModelAndView();
        if (exception instanceof BaseException) {
            mav.setViewName("/common/Exception");
            mav.addObject("exception", exception);
        } else {
            exception.printStackTrace();
        }
        return mav;
    }

    public String getCode() {
        return code;
    }

    public String getArguments() {
        return arguments;
    }
}
