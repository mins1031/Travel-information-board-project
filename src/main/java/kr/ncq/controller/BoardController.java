package kr.ncq.controller;

import java.security.Principal;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ncq.domain.Criteria;
import kr.ncq.domain.NoticeDAO;
import kr.ncq.domain.PageDAO;
import kr.ncq.service.BoardService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {

	private BoardService service;
	
	@GetMapping("/notice/list")
	public void GetNoticeList(Model model,Criteria cri) {
		
		log.info("공지사항 리스트 호출");
		model.addAttribute("noticeList", service.getNoticeList(cri));
		
		long total = service.getTotalCount(cri);
		
		log.info("총갯수"+total);
		
		model.addAttribute("pageMaker", new PageDAO(cri,total));
	}
	/**/
	
	@Secured("ROLE_ADMIN")
	@GetMapping("/notice/register")
	public void getNoticeRegister() {
		
	} //공지사항 등록페이지
	
	@Secured("ROLE_ADMIN")
	@PostMapping("/notice/register")
	public String postNoticeRegister(NoticeDAO notice,Principal principal,
			RedirectAttributes rttr) {
		
		log.info("공지사항 등록..");
		log.info("유저 이름 :" + principal.getName());
		log.info("공지사항 등록.."+ notice.getN_title());
		log.info("공지사항 등록.."+ notice.getN_content());
		
		notice.setUserid(principal.getName());
		
		service.registerNotice(notice);
		
		long insertId = service.currentInsertId();
		
		rttr.addFlashAttribute("result", insertId);
		
		return "redirect:/board/notice/list"; //PRG형식으로 등록후 새로고침의 영향없게 리다이렉트
	}
	
	@GetMapping({"/notice/get","/notice/modify"})
	public void getNoticeRead(@RequestParam("n_id") long n_id, Model model,
			@ModelAttribute("cri") Criteria cri) {
		
		log.info("공지사항 게시물 "+ n_id +"번 상세조회 or 수정");
		model.addAttribute("notice",service.readNotice(n_id));
	}
	
	@PostMapping("/notice/modify")
	public String postNoticeModify(NoticeDAO notice,RedirectAttributes rttr,Criteria cri) {
		
		log.info("공지사항 수정");		
		
		if(service.updateNotice(notice)) {
			rttr.addFlashAttribute("upresult",notice.getN_id());
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword" , cri.getKeyword());
		//게시물 수정시 get까지 가져왔던 위의 값들을 list로 넘기기 위함임. 각 위치에 해당 값이 들어가게됨.
		return "redirect:/board/notice/list";
	}
	
	@PostMapping("/notice/remove")
	public String postNoticeRemove(@RequestParam("n_id") long n_id, RedirectAttributes rttr
			,Criteria cri) {
		
		log.info("공지사항 삭제"+ n_id);
		
		if(service.deleteNotice(n_id)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword" , cri.getKeyword());
		
		return "redirect:/board/notice/list";
	}

}
