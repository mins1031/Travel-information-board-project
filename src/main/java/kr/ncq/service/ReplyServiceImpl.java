package kr.ncq.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ncq.domain.Criteria;
import kr.ncq.domain.ReplyDAO;
import kr.ncq.domain.ReplyPageDAO;
import kr.ncq.mapper.DashBoardMapper;
import kr.ncq.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ReplyServiceImpl implements ReplyService{

	private ReplyMapper mapper;
	
	private DashBoardMapper boardMapper;
 
	@Transactional
	@Override
	public int registerReply(ReplyDAO reply) {

		log.info("서비스층 댓글 등록 ");
		
		boardMapper.updateReplyCnt(reply.getBno(), 1);
		
		return mapper.insertReply(reply);
	}

	@Override
	public ReplyDAO getReply(long rno) {

		log.info("서비스층 댓글 조회");
		
		return mapper.readReply(rno);
	}

	@Override
	public int modifyReply(ReplyDAO reply) {

		log.info("서비스층 댓글 수정");
		
		return mapper.updateReply(reply);
	}

	@Transactional
	@Override
	public int removeReply(long rno) {
		
		log.info("서비스층 댓글 삭제");
		
		ReplyDAO re = mapper.readReply(rno);
		
		boardMapper.updateReplyCnt(re.getBno(), -1);
		
		return mapper.deleteReply(rno);
	}

	@Override
	public ReplyPageDAO getList(Criteria cri, long bno) {
		
		log.info("서비스층 댓글 list 조회");

		return new ReplyPageDAO(mapper.getTotalCount(bno),mapper.getListReply(cri, bno));
	}

	
}
