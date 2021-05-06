package kr.ncq.service;

import kr.ncq.domain.Criteria;
import kr.ncq.domain.ReplyDAO;
import kr.ncq.domain.ReplyPageDAO;

public interface ReplyService {
	
	public int registerReply(ReplyDAO reply);

	public ReplyDAO getReply(long rno);
	
    public int modifyReply(ReplyDAO reply);
    
    public int removeReply(long rno);
    
    public ReplyPageDAO getList(Criteria cri, long bno);
	
}
