package kr.ncq.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ncq.domain.UsersDAO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {

	@Setter(onMethod_ = {@Autowired})
	private UserMapper usermap;
	
	/*@Autowired
	public UserMapperTest(UserMapper user) {
		this.usermap = user;
	}*/
	
	
	
	public void mapperTest() {
		
		UsersDAO user = new UsersDAO();
		/*
		user.setU_id("urisegea@naver.com");
		user.setU_pw("wodud1638");
		user.setU_name("정재영");
		user.setU_address("경기도 광주시 초월읍 ");
		user.setU_tell("031-399-1004");
		user.setU_phone("010-2401-6038");
		user.setU_email("jyo8019@naver.com ");
		user.setU_birth("2000-08-19 ");
        user.setU_region("경기도 광주시");*/
		
		user.setU_id("test");
		user.setU_pw("test");
		user.setU_name("test");
		user.setU_address("test");
		user.setU_tell("test");
		user.setU_phone("test");
		user.setU_email("test@naver.com ");
		user.setU_birth("test");
        user.setU_region("test11");
		
		//usermap.userInsert(user);
		//log.info(usermap.userUpdate(user));
        log.info(usermap.userDelete("test"));
        
		//log.info(usermap.userList());		//log.info(usermap.userRead("urisegea"));
		
	}
	

	public void mapperTest2() {
		
    	//long result = usermap.getTotalCount();
		//log.info(result);
		
		/*UserHasAuthDAO userAuth = new UserHasAuthDAO();
		userAuth.setU_id("u");
		userAuth.setAuth("ROLE_MEMBER");
		usermap.userAuthInsert(userAuth);*/
		
		log.info(usermap.authRead("urisegea"));
	}
	
	@Test
    public void loginTest() {
    	
//		UsersDAO user = usermap.authRead("min");
//
//		log.info(user);
//
//		user.getU_auth().forEach(authDAO -> log.info(authDAO));
    }
}
