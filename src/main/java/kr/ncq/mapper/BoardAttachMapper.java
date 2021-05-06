package kr.ncq.mapper;

import java.util.List;

import kr.ncq.domain.BoardAttachDAO;

public interface BoardAttachMapper {

	public void insert(BoardAttachDAO dao);
	
	public void delete(String uuid);
	
	public List<BoardAttachDAO> findByBno(Long bno);
	
	public void deleteAll(long bno);
	
	public List<BoardAttachDAO> getOldFiles();
}
