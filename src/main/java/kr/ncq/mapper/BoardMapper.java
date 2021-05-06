package kr.ncq.mapper;

import java.util.List;

import kr.ncq.domain.Criteria;
import kr.ncq.domain.NoticeDAO;

public interface BoardMapper {

	public List<NoticeDAO> getNoticeList(Criteria cri);
	
	public NoticeDAO readNotice(long n_id);
	
	public void registerNotice(NoticeDAO notice);
	
	public boolean updateNotice(NoticeDAO notice);
	
	public boolean deleteNotice(long n_id);
	
	public long currentInsertId();
	
	public long getTotalCount(Criteria cri);
	/* 공지사항 매퍼 끝*/
	
	

}
