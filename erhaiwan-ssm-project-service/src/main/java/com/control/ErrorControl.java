package com.control;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
public class ErrorControl {
    @ExceptionHandler(NoHandlerFoundException.class)
    public ModelAndView noHandlerFoundHandler(
            HttpServletRequest req, Exception ex) {
        return new ModelAndView("err404");
    }
}
