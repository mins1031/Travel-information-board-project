package kr.ncq.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ncq.domain.Criteria;
import kr.ncq.domain.PageDAO;
import kr.ncq.domain.UsersDAO;
import kr.ncq.service.UserService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
public class UserController {

	private UserService service;
	
	private BCryptPasswordEncoder passEncoder;
	
	@GetMapping("/list")
	public void list(Model model) {
		
	} 
	
	/*@PostMapping("/customLogin")
	public String login(UsersDAO loginUser,RedirectAttributes rttr) {
		
		
		log.info("Con id : "+ loginUser.getU_id());
		log.info("Con pw : "+ loginUser.getU_pw());
		boolean loginResult = service.login(loginUser.getU_id(), loginUser.getU_pw());

		return "index";

	}*/
	
	@GetMapping("/user/indexMember")
	public String indexMember(
			@CookieValue(name = "view") String cookie,
			HttpServletResponse response) {
		
		log.info("멤버용 페이지");
	   

      		//사용자가 로그인하여 인덱스 멤버 페이지로 접속시 쿠키 생성
		return "/user/indexMember";
	}
    	
	@GetMapping("/user/indexAdmin")
	public void indexAdmin() {
		
		log.info("관리자용 페이지");
	}
	
	@GetMapping("/user/customLogin")
	public void login(String returnPage,Model model) {
		
		log.info("로그인 페이지");
		
		model.addAttribute("returnPage", returnPage);
	}
	
	@GetMapping("/user/customLogout")
	public void logoutGET() {
		
		log.info("custom logout");
	}
	
	@PreAuthorize("isAnonymous()")
	@GetMapping("/customJoin")
	public void join() {
		
	}
	@PreAuthorize("isAnonymous()")
	@PostMapping("/user/customJoin")
	public String join(UsersDAO user,RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("user",user); //회원가입이 실패할시 화면이 전환되며 기존에 작성했던 내용을 가지고 있게 하기 위함
		String inputPw = user.getU_pw();
		String pw = passEncoder.encode(inputPw);
		
		user.setU_pw(pw); //암호화 하는 코드인데 일단 시큐리티로 구현 예정
		
		service.register(user);
		
		return "index";
		
	}
	
	@GetMapping("/user/userInfo")
	@PreAuthorize("isAuthenticated()")
	public void userInfo() {
		
		log.info("유저 정보 페이지");
	}
	
	@GetMapping("/user/userDetailInfo")
	@PreAuthorize("isAuthenticated()")
	public void userDetailInfo(Principal pri,Model model) {
		
		String u_id = pri.getName();

		log.info("유저 디테일 정보 페이지");
		log.info(u_id);
		model.addAttribute("user", service.get(u_id));
	}
	
	@GetMapping("/user/userBoard")
	@PreAuthorize("isAuthenticated()")
	public void userBoard(Criteria cri,Principal pri,Model model) {
		
		log.info("유저 작성 게시물 페이지");
		String u_id = pri.getName();
		
		long totalCnt = service.getBoardTotalCount(u_id);
		model.addAttribute("boardList", service.userBoard(cri,u_id));
		model.addAttribute("pageMaker", new PageDAO(cri,totalCnt));
	}
	
	@PostMapping("/user/remove")
	@PreAuthorize("isAuthenticated()")
	public String userRemove(@RequestParam("u_id") String u_id,Model model) {
		
		log.info("유저 작성 게시물 페이지");
		
		if(service.delete(u_id)) {
			model.addAttribute("result", "success");
		}
	  

	    return "/index"; 
	}
	
	@PostMapping(value="/user/idCheck")
	@ResponseBody
	public int idCheck(@RequestParam("u_id") String u_id) {
		
		log.info(u_id);
		UsersDAO user = service.idCheck(u_id);
		
		int result = 0;
		
		if(user != null) {
			log.info("not null");
			result = 1;
		}
		return result ;
	}
	
	/*=================== admin ==================================*/
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/user/adminJoin")
	public void adminGetJoin() {
		
	}
	@Secured("ROLE_ADMIN")
	@PostMapping("/user/adminJoin")
	public String adminPostJoin(UsersDAO user,RedirectAttributes rttr) {
		
		rttr.addFlashAttribute("user",user); //회원가입이 실패할시 화면이 전환되며 기존에 작성했던 내용을 가지고 있게 하기 위함
		String inputPw = user.getU_pw();
		String pw = passEncoder.encode(inputPw);
		
		user.setU_pw(pw); 
		
		service.adminRegister(user);
		
		return "/user/indexAdmin";
	}
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/user/userList")
	public void userList(Criteria cri,Model model) {
		log.info("유저 목록 조회");
		
		model.addAttribute("userList" ,service.getList(cri));
		model.addAttribute("pageMaker" , new PageDAO(cri,service.getTotalCount()));
	}
}
