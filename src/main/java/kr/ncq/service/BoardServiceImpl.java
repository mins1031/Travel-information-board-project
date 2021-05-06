package kr.ncq.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ncq.domain.Criteria;
import kr.ncq.domain.NoticeDAO;
import kr.ncq.mapper.BoardMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
    
	private BoardMapper mapper;

	@Override
	public List<NoticeDAO> getNoticeList(Criteria cri) {
		
		log.info("공지사항 리스트");
		
		return mapper.getNoticeList(cri);
	}

	@Override
	public NoticeDAO readNotice(long n_id) {
		
		log.info("공지사항 " +n_id+"번 조회.");
		
		return mapper.readNotice(n_id);
	}

	@Override
	public void registerNotice(NoticeDAO notice) {
		
		log.info("공지사항 등록 service layer..");
		
		mapper.registerNotice(notice);
	}

	@Override
	public boolean updateNotice(NoticeDAO notice) {

		log.info("공지사항 수정 service layer..");
		return mapper.updateNotice(notice);
	}

	@Override
	public boolean deleteNotice(long n_id) {

		log.info("공지사항 삭제 service layer..");
		
		return mapper.deleteNotice(n_id);
	}

	@Override
	public long currentInsertId() {
	
		return mapper.currentInsertId();
	}

	@Override
	public long getTotalCount(Criteria cri) {
		
		log.info("전체 갯수 count");
		
		return mapper.getTotalCount(cri);
	}
	
	
}
