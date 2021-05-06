package kr.ncq.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/sample/*")
@Log4j
public class SampleController {

	@GetMapping("/ex02")
	public void ex02(@RequestParam("name") String host, @RequestParam("id") int id ) {
		
		log.info(""+host);
		log.info(""+id);
	}
}
