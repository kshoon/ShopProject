package yjc.wdb.shop;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionAdvice {
	@ExceptionHandler(Exception.class)
	public String common(Exception e, Model model) {
		model.addAttribute("exception",e);
		return "error/error";
	}	
}
