package kr.ncq.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ncq.domain.Criteria;
import kr.ncq.domain.ReplyDAO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplMapperTest {

	@Autowired
	private ReplyMapper mapper;
	
	@Test
	public void replyTest() {
		log.info("reply test");
		
		Criteria cri = new Criteria(); 
		ReplyDAO re = new ReplyDAO();
		
	    //re.setRno(2);
		//re.setBno(2);
		//re.setReply("테스트 댓글3333");
		//re.setReplyer("replyer3");
		
		//mapper.insertReply(re);
		//mapper.readReply(4);
	    //mapper.deleteReply(4);
		//mapper.updateReply(re);
	    mapper.getListReply(cri, 2);
	}
}
