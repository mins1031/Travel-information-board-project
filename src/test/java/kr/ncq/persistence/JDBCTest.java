package kr.ncq.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTest {
    
	static {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void JDBCTest() {
		
		try(Connection con = DriverManager.getConnection(
				"jdbc:mariadb://localhost:3306/",
				"min",
				"alsdud6038")){
			log.info(con);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
