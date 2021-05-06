package kr.ncq.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ncq.domain.Criteria;
import kr.ncq.domain.NoticeDAO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	@Setter(onMethod_ = {@Autowired})
	private BoardMapper mapper;
	
	@Test
	public void test() {
		
		Criteria cri = new Criteria();
		cri.setKeyword("수정");
		cri.setType("TC");
		
		log.info("수정 테스트" );
		
		List<NoticeDAO> list = mapper.getNoticeList(cri);
		list.forEach(notice -> log.info(notice));
	}
}
