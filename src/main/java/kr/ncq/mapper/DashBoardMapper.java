package kr.ncq.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ncq.domain.BoardDAO;
import kr.ncq.domain.Criteria;

public interface DashBoardMapper {

    public List<BoardDAO> getBoardList(@Param("cri") Criteria cri,@Param("regionId") String regionId);
	
	public BoardDAO readBoard(long bno);
	
	public void insertBoard(BoardDAO board);
	
	public boolean updateBoard(BoardDAO board);
	
	public boolean deleteBoard(long bno);
	
	public long currentBoard();
	
	public long getTotalCount(@Param("regionId") String regionId);
	
	public void updateReplyCnt(@Param("bno") long bno, @Param("amount") int amount);
	
    public int updateHit(@Param("bno") long bno);
}
