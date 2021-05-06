package kr.ncq.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.ncq.domain.BoardDAO;
import kr.ncq.domain.Criteria;
import kr.ncq.domain.NoticeDAO;
import kr.ncq.domain.UsersDAO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
//@AllArgsConstructor
public class DashBoardServiceTest {

	@Setter(onMethod_ = {@Autowired})
	private DashBoardService service;
	
	@Test
	public void UserServiceTest() {
	  
		//log.info("list check"+service.getList());
		assertNotNull(service);		
		
        BoardDAO no = new BoardDAO();
		
        Criteria cri = new Criteria();
        
        String regionId = "r001";
		
		log.info("insert check : "+ service.getBoardList(cri, regionId));
	}
}
