package kr.ncq.controller;

import java.nio.file.AccessDeniedException;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class ExceptonController {

	//400
	@ExceptionHandler({
		RuntimeException.class
	})
	public String BadRequestException(final RuntimeException ex, Model model){
		log.info("error400" , ex);
		
		model.addAttribute("errorType", 400);
		return "/errorPage";
	}
	
	//401
	@ExceptionHandler({ AccessDeniedException.class })
    public String handleAccessDeniedException(final AccessDeniedException ex,Model model) {
	    log.warn("error401", ex);
	    
	    model.addAttribute("errorType", 401);
	    return "/errorPage";
	}


    // 500
	@ExceptionHandler({ Exception.class })
	public String handleAll(final Exception ex,Model model) {
	    log.info(ex.getClass().getName());
	    log.error("error500", ex);
	    
	    model.addAttribute("errorType", 500);
	    return "/errorPage";
	}
}
