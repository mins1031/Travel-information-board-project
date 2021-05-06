package kr.ncq.persistence;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTest {
  
	@Setter(onMethod_= {@Autowired})
	private DataSource data;
	
	@Test
	public void dataSourceTest() {
		
		try(Connection con = data.getConnection()){
			log.info(con);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
