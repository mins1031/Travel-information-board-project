package kr.ncq.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.ncq.domain.NoticeDAO;
import kr.ncq.domain.UsersDAO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
//@AllArgsConstructor
public class BoardServiceTest {

	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	@Test
	public void UserServiceTest() {
	  
		//log.info("list check"+service.getList());
		assertNotNull(service);		
		
        NoticeDAO no = new NoticeDAO();
		
		no.setN_id(10);
		no.setN_title("수정하기 테스트2");
		no.setN_content("수정하기 test2");
		
		log.info("insert check : "+ service.updateNotice(no));
	}
}
