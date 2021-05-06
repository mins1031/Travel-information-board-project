package kr.ncq.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.ncq.domain.UsersDAO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
//@AllArgsConstructor
public class UserServiceTest {

	@Setter(onMethod_ = {@Autowired})
	private UserService service;
	
	@Test
	@Transactional
	public void UserServiceTest() {
	  
		//log.info("list check"+service.getList());
		assertNotNull(service);
		//log.info("1num check"+service.get(1));
		UsersDAO user = new UsersDAO();
		user.setU_id("Test120");
		user.setU_pw("test1");
		user.setU_name("Test1");
		user.setU_address("Test1");
		user.setU_phone("010-1122-3333");
		user.setU_email("Test1");
		
		service.register(user);
		
		log.info("insert check : ");
	}
}
