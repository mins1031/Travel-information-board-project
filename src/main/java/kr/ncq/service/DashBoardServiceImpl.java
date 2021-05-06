package kr.ncq.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ncq.domain.BoardAttachDAO;
import kr.ncq.domain.BoardDAO;
import kr.ncq.domain.Criteria;
import kr.ncq.mapper.BoardAttachMapper;
import kr.ncq.mapper.DashBoardMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class DashBoardServiceImpl implements DashBoardService{

	private DashBoardMapper mapper;

	private BoardAttachMapper attachMapper;
	
	public List<BoardDAO> getBoardList(Criteria cri, String regionId) {
        
		log.info("게시판 리스트 조회");
		
		log.info("게시판 리스트 종류" + regionId);
		
		return mapper.getBoardList(cri,regionId);
	}

	@Override
	public BoardDAO getBoard(long bno) {
		
		log.info("조회하여 조회수 증가시킴.");
		
		return mapper.readBoard(bno);
	}

	@Transactional
	@Override
	public void registerBoard(BoardDAO board) {
		
		log.info("게시글 등록 서비스층");
  
		mapper.insertBoard(board);
		//먼저 게시글 등록하구

		if(board.getAttachList() == null || board.getAttachList().size() <= 0) {
			return;
		} //첨부파일이 없으면 그냥 메서드 종료하고
		
		board.getAttachList().forEach(attach ->{
			long currentBno = (Long)mapper.currentBoard(); 
			attach.setBno(currentBno);
			attachMapper.insert(attach);
		}); //첨부파일 있으면 위의 코드가 실행되는데 전송된 객체의 각각의 첨부파일 리스트를 조사해 bno값과 첨부파일 내용을 설정해줌.
	}

	@Transactional
	@Override
	public boolean modifyBoard(BoardDAO board) {
		
		log.info("서비스층 게시글 수정 ");
		
		attachMapper.deleteAll(board.getBno());
		
		boolean modifyResult = mapper.updateBoard(board);
		
		if(modifyResult && board.getAttachList() != null && board.getAttachList().size() > 0) {
			
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			}); 
		}
		
		return modifyResult;
       //게시물을 수정시 어떤 첨부파일이 삭제되었고 추가되었는지 파악해야하는 수고로움이 있지만 간단하게 기존 db값을 모두 지우고 뷰에서 받아온 내용으로 다시 파일 데이터를 추가하는
		//방식을 사용하기 해 파일디비의 bno값에 맞는 데이터를 삭제하고, 게시글수정을 진행하고, 마지막으 board에 있는 파일들 정보를 insert해준다.
	}

	@Transactional
	@Override
	public boolean removeBoard(long bno) {
		
		log.info("서비스층 게시글 삭제 ");
		
		attachMapper.deleteAll(bno);
		
		return mapper.deleteBoard(bno);
	}

	@Override
	public long currentInsertId() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public long getTotalCount(String regionId) {
		
		log.info("전체 개시물 갯수");
		return mapper.getTotalCount(regionId);
	}

	@Override
	public void modifyHit(long bno) {
		
		log.info("조회수 기능");
		
		mapper.updateHit(bno);
		
	}

	@Override
	public List<BoardAttachDAO> getAttachList(long bno) {

		log.info(bno + "의 첨부파일 가져오기");

		return attachMapper.findByBno(bno);
	}

	

	
}
