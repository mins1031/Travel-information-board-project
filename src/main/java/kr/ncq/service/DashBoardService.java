package kr.ncq.service;

import java.util.List;

import kr.ncq.domain.BoardAttachDAO;
import kr.ncq.domain.BoardDAO;
import kr.ncq.domain.Criteria;

public interface DashBoardService {

    public List<BoardDAO> getBoardList(Criteria cri,String regionId);
	
	public BoardDAO getBoard(long bno);
	
	public void registerBoard(BoardDAO board);
	
	public boolean modifyBoard(BoardDAO board);
	
	public boolean removeBoard(long bno);
	
	public long currentInsertId();
	
	public long getTotalCount(String regionId);
	
	public void modifyHit(long bno);
	
	public List<BoardAttachDAO> getAttachList(long bno);
}
