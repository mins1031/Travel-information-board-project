package kr.ncq.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ncq.domain.BoardDAO;
import kr.ncq.domain.Criteria;
import kr.ncq.domain.RegionDAO;
import kr.ncq.domain.UsersDAO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class DashBoardMapperTest {

	@Setter(onMethod_ = {@Autowired})
	private DashBoardMapper mapper;
	
	@Test
	public void test() {
		
		String id = "r001";
		Criteria cri = new Criteria();
		UsersDAO user = new UsersDAO();
		user.setU_id("jae");
		RegionDAO region = new RegionDAO();
		region.setRegionId(id);
		BoardDAO board = new BoardDAO(); 
		board.setB_title("test");
		board.setB_content("this is test");
		board.setUser(user);
		board.setRegion(region);
		
		//mapper.insertBoard(board);
		//log.info("수정 테스트" + mapper.getBoardList(cri,id));
		//mapper.getBoardList(cri,id);
		//mapper.readBoard(2);
		//mapper.updateHit(25);
	    log.info(mapper.currentBoard());
	}
}
