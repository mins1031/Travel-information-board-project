package kr.ncq.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ncq.domain.BoardAttachDAO;
import kr.ncq.domain.BoardDAO;
import kr.ncq.domain.Criteria;
import kr.ncq.domain.PageDAO;
import kr.ncq.domain.RegionDAO;
import kr.ncq.domain.UsersDAO;
import kr.ncq.service.DashBoardService;
import kr.ncq.tool.UriSwitch;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/dash/*")
@AllArgsConstructor
public class DashBoardController {

	private DashBoardService service;
	/*계속 모호했던 부분이 여기선 service를 @Autowired했고 구현은 impl에서했음.근데 인페를 주입받고 왜 impl의 내용이 동작하는지 모호했는데...
	 우선 @Autowired는 자료형이 해당 자료형인 내용을 기본적으로 끓어옴. 다만DashBoardService자체는 인터페이스이고 @service 어노테이션도 없음
	 그러면 어노테이션이 있는 클래스들중 DashBoardService타입인 DashBoardServiceImpl이 주입되는게 당연한 이야기였음. 생각조금더 해보자. */
	
	@GetMapping("/internal/sudo")
	public void getSudo(Model model,Criteria cri,HttpServletRequest request){
		
		log.info("sudo게시판");
		
		String id = "r001";
		
		long totalCtn = service.getTotalCount(id);
		
		    model.addAttribute("boardType", "r001");
					
			model.addAttribute("boardList",service.getBoardList(cri,id));
			model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));
		
	}
	
	@GetMapping("/internal/gangwon")
	public void getGangwon(Model model,Criteria cri) {
		
       log.info("강원도 게시판");
		
		String id = "r002";
		
	    model.addAttribute("boardType", "r002");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
	}
	
	@GetMapping("/internal/chungcheong")
	public void getChungcheong(Model model,Criteria cri,String BoardType) {
		
       log.info("충청도 게시판");
		
		String id = "r003";
		
	    model.addAttribute("boardType", "r003");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
	}
	
	@GetMapping("/internal/gyeongsang")
	public void getGyeongsang(Model model,Criteria cri,String BoardType) {
		
       log.info("경상도 게시판");
		
		String id = "r004";
		
	    model.addAttribute("boardType", "r004");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
	}
	
	@GetMapping("/internal/jeonla")
	public void getJeonla(Model model,Criteria cri,String BoardType) {
		
       log.info("전라도 게시판");
		
		String id = "r005";
		
	    model.addAttribute("boardType", "r005");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
	}
	
	@GetMapping("/internal/jeju")
	public void getJeju(Model model,Criteria cri,String BoardType) {
		
       log.info("제주도 게시판");
		
		String id = "r006";
		
	    model.addAttribute("boardType", "r006");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
	}
	
	// ==========================  국내 페이지 컨트롤러  =============================================
	
	@GetMapping("/asia/china")
	public void getChina(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("중국 게시판");
		
		String id = "r007";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r007");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	 }
	
	@GetMapping("/asia/japan")
	public void getJapan(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("일본 게시판");
		
		String id = "r008";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r008");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	 }
	
	@GetMapping("/asia/oceania")
	public void getOceania(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("오세아니아 게시판");
		
		String id = "r009";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r009");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	 }
	
	@GetMapping("/asia/eastsouth")
	public void getEastSouth(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("동남아 게시판");
		
		String id = "r010";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r010");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	 }
	
	@GetMapping("/asia/asiaetc")
	public void getAsiaEtc(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("그외 아시아 국가 게시판");
		
		String id = "r011";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r011");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	 }
	// ========================== 아시아 페이지 컨트롤러  =============================================

	@GetMapping("/europe/uk")
	public void getUK(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("영국 게시판");
		
		String id = "r012";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r012");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	@GetMapping("/europe/france")
	public void getFrance(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("sudo게시판");
		
		String id = "r013";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r013");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	@GetMapping("/europe/italia")
	public void getItalia(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("이탈리아 게시판");
		
		String id = "r014";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r014");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	@GetMapping("/europe/iberia")
	public void getIberia(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("iberia 게시판");
		
		String id = "r015";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r015");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	@GetMapping("/europe/swiss")
	public void getSwiss(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("스위스 게시판");
		
		String id = "r016";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r016");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	@GetMapping("/europe/germany")
	public void getGermany(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("독일 게시판");
		
		String id = "r017";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r017");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	@GetMapping("/europe/etc")
	public void getEuropeEtc(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("북유럽과 그외 국가들 게시판");
		
		String id = "r018";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r018");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	// ==========================  유럽 페이지 컨트롤러  =============================================
	
	@GetMapping("/america/usa")
	public void getUsa(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("미국 게시판");
		
		String id = "r019";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r019");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	@GetMapping("/america/canada")
	public void getCanada(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("캐나다 게시판");
		
		String id = "r020";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r020");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	@GetMapping("/america/mexico")
	public void getMexico(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("맥시코 게시판");
		
		String id = "r021";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r021");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	@GetMapping("/america/etc")
	public void getAmericaEtc(Model model,Criteria cri,HttpServletRequest request) {
		
		log.info("남미 그외 아메리카 국가 게시판");
		
		String id = "r022";
		
		long totalCtn = service.getTotalCount(id);
		
	    model.addAttribute("boardType", "r022");
				
		model.addAttribute("boardList",service.getBoardList(cri,id));
		model.addAttribute("pageMaker", new PageDAO(cri, totalCtn));

	}
	
	// ==========================  아메리카 페이지 컨트롤러  =============================================

	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void dashRegister(Model model,
			@RequestParam("boardType") String boardType) {
		
		model.addAttribute("boardType",boardType);
	}
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String dashPostRegister(@RequestParam("boardType") String boardType,
			    BoardDAO board, Principal principal,RedirectAttributes rttr) {
		
		log.info("게시글 등록");
		
		log.info("board" + board);
		
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		UsersDAO user = new UsersDAO();
		user.setU_id(principal.getName()); //세션에서 로그인된 사용자 이름(id) 가져오기.
		
		RegionDAO region = new RegionDAO();
		region.setRegionId(boardType); //뷰에서 받은 게시판 타입 입력 받음.
		
		board.setRegion(region);
		board.setUser(user);//각각의 등록 게시글에 기재
		
		service.registerBoard(board);
		
		rttr.addAttribute("result",board.getBno());
		  
		UriSwitch uri = new UriSwitch(boardType);	  
		  
		String url = "redirect:/dash"+uri.switchResult();
		return url;
	}
	
	@GetMapping("/get")
	public String getBoardRead(Model model,
			HttpServletResponse response,
			Principal principal,
			@CookieValue(name="view") String cookie,
			@RequestParam("bno") long bno, 
			@RequestParam("boardType") String boardType,
			@RequestParam("userInfoToken") String userInfoToken,
			@ModelAttribute("cri") Criteria cri) {
			
			if(!(cookie.contains(String.valueOf(bno)))) {
				//쿠키값에 bno값을 문자열화 시킨 값이 있으면 true기에 값이 없어야 조건식이 true가 됨
				cookie += bno + "/";
				log.info(cookie.toString());
				service.modifyHit(bno);				
		    }
			
		response.addCookie(new Cookie("view",cookie));
		//새로운 view 키값의 쿠키를 만들어 위의 bno를 담아 조회수 증가를 억제해줌
		model.addAttribute("boardType",boardType);
		model.addAttribute("userInfoToken",userInfoToken);
		model.addAttribute("board",service.getBoard(bno));
		
		return "/dash/get";
	}
	
	@GetMapping("/modify")
	@PreAuthorize("isAuthenticated()")
	public void getBoardupdate(Model model,
			@RequestParam("bno") long bno, 
			@RequestParam("boardType") String boardType,
			@ModelAttribute("cri") Criteria cri) {
	
		model.addAttribute("boardType",boardType);		
		model.addAttribute("board",service.getBoard(bno));
		
	}
	
	@PreAuthorize("principal.username == #board.user.u_id")
	@PostMapping("/modify")
	public String postModify(@RequestParam("boardType") String boardType,
			@RequestParam("userInfoToken") String userInfoToken,
			BoardDAO board,Criteria cri, RedirectAttributes rttr) {
			
		log.info("게시글 수정"+boardType);
		
		if(service.modifyBoard(board)) {
			rttr.addFlashAttribute("upresult",board.getBno());
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword" , cri.getKeyword());
				
		  
	    UriSwitch uri = new UriSwitch(boardType);	  
		  
		String url = "redirect:/dash"+uri.switchResult();
		 //등록후 boardType에 맞는 게시판 페이지로 리다이랙트를 위한 클래스
		
		return url;
	}
	
	@PreAuthorize("principal.username == #writer")
	@PostMapping("remove")
	public String postRemove(@RequestParam("boardType") String boardType,
			long bno,Criteria cri, RedirectAttributes rttr, @RequestParam("user.u_id") String writer) {
		
		List<BoardAttachDAO> attachList = service.getAttachList(bno);
		
		if(service.removeBoard(bno)) {
			
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result","success");
		}		
		UriSwitch uri = new UriSwitch(boardType);	  
		  
		String url = "redirect:/dash"+uri.switchResult() + cri.getListLink();
		//삭제후 boardType에 맞는 게시판 페이지로 리다이랙트를 위한 클래스		
		
		return url;
	}
	
	@GetMapping(value = "/getAttachList",
			produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	  @ResponseBody
    public ResponseEntity<List<BoardAttachDAO>> getAttachList(long bno) {
		
		log.info(bno + "의 첨부파일 조회");
		
		return new ResponseEntity<>(service.getAttachList(bno),HttpStatus.OK);
	}
	
	private void deleteFiles(List<BoardAttachDAO> attachList) {
		
		if(attachList == null || attachList.size()==0) {
			return;
		}
		
		log.info("첨부파일들 삭제");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\spring_file_upload\\" + attach.getUploadPath() + "\\" + attach
						.getUuid()+"_"+ attach.getFileName());//파일의 절대경로 정의
			   Files.deleteIfExists(file);
			   //헤당 파일이 있으면 삭제후 true를 없으면 false를 리턴
			   if(Files.probeContentType(file).startsWith("image")) {
				   Path thumbNail = Paths.get("C:\\spring_file_upload\\" + attach.getUploadPath() + "\\s_" + attach
							.getUuid()+"_"+ attach.getFileName());
			       Files.delete(thumbNail);
			   }//만약 이미지 파일 일시 if문내용으로 삭제
			   
			} catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});
	}
}
