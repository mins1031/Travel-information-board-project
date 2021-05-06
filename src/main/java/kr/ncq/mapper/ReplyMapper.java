package kr.ncq.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ncq.domain.Criteria;
import kr.ncq.domain.ReplyDAO;

public interface ReplyMapper {

	public int insertReply(ReplyDAO reply);
	
	public ReplyDAO readReply(long rno);
	
	public int deleteReply(long rno);
	
	public int updateReply(ReplyDAO rely);
	
	public List<ReplyDAO> getListReply(
			@Param("cri") Criteria cri,
			@Param("bno") long bno);
	
	public long getTotalCount(long bno);
}
