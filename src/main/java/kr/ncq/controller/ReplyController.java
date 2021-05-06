package kr.ncq.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ncq.domain.Criteria;
import kr.ncq.domain.ReplyDAO;
import kr.ncq.domain.ReplyPageDAO;
import kr.ncq.service.ReplyService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/replies/*")
@AllArgsConstructor
public class ReplyController {

	private ReplyService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new",
			consumes = "application/json", //해당 메서드는 json타입만 처리한다는 의미 = 데이터포맷을 json으로 명시
			produces = {MediaType.TEXT_PLAIN_VALUE}) //해당 메서드의 반환값은 문자열이라는 의미 = 서버에서 보내주는 데이터타입 명시.
	public ResponseEntity<String> create(@RequestBody ReplyDAO re){
		
		log.info("replyDAO" + re);
		
		int insertResult = service.registerReply(re);
		
		log.info("insertResult" + insertResult);
			
		return insertResult == 1 ? new ResponseEntity<>("success" ,HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		//삼항연산자 처리. rest방식은 요청자가 정상적인 데이터인지 비정상적인 데이터인지 판단하기 어렵기 때문에 정확히 명시해주기 위해 ResponseEntity타입 사용
	}
	
	@GetMapping(value="/pages/{bno}/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageDAO> getList(
			@PathVariable("page") int page,
			@PathVariable("bno") long bno){
		
		log.info("getList....");
		Criteria cri = new Criteria(page,10);
		
		log.info(cri);
		
		return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK); 
		//service.getList(cri, bno)가 객체 형태로 반환(ReplyPageDAO)되어  reply.js의 data가 됨 data = ReplyPageDAO객체
	}
	
	@GetMapping(value= "/{rno}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE}) //메서드의 반환값은 xml파일이나 json형태라고 명시해줌.
	public ResponseEntity<ReplyDAO> get(@PathVariable("rno") long rno){
		
		log.info("get" +rno);
		
		return new ResponseEntity<>(service.getReply(rno), HttpStatus.OK);  
	}
	
	@PreAuthorize("principal.username == #re.replyer")
	@DeleteMapping(value="/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE })
    public ResponseEntity<String> remove(@PathVariable("rno") long rno,@RequestBody ReplyDAO re){
		
		log.info("remove" + rno);
		
		return service.removeReply(rno) == 1 ? new ResponseEntity<>("success" ,HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("principal.username == #re.replyer")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{rno}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody ReplyDAO re,//수정하는 json데이터를 ReplyDAO 객체의 파라미터로 변환해줌
			@PathVariable("rno") long rno) { //url에 사용되는 값을 파라미터로 사용한다는 어노테이션
		re.setRno(rno);
		
		log.info("rno:" + rno);
		
		return service.modifyReply(re) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
			    : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
