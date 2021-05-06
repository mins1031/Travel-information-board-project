package kr.ncq.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ncq.domain.BoardDAO;
import kr.ncq.domain.Criteria;
import kr.ncq.domain.UserHasAuthDAO;
import kr.ncq.domain.UsersDAO;
import kr.ncq.mapper.UserMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class UserServiceImpl implements UserService{

	private UserMapper mapper;

	@Override
	public List<UsersDAO> getList(Criteria cri) {
		
		log.info("유저 리스트");
		
		return mapper.userList(cri);
	}

	@Override
	public UsersDAO get(String u_id) {
		
		log.info(u_id+"유저 information");
		
		return mapper.userRead(u_id);
	}

	@Transactional
	@Override
	public void register(UsersDAO user) {
		
		log.info(user.getU_name()+"유저 등록");
		
		mapper.userInsert(user);
		UserHasAuthDAO userAuth = new UserHasAuthDAO();
		//long insertId = mapper.userInsert(user);
		String realId= user.getU_id();
		userAuth.setU_id(realId);
		userAuth.setAuth("ROLE_MEMBER");
		
		mapper.userAuthInsert(userAuth);
	}

	@Transactional
	@Override
	public void adminRegister(UsersDAO user) {
		
		log.info(user.getU_name()+"admin 등록");
		
		mapper.userInsert(user);
		UserHasAuthDAO userAuth = new UserHasAuthDAO();
		//long insertId = mapper.userInsert(user);
		String realId= user.getU_id();
		userAuth.setU_id(realId);
		userAuth.setAuth("ROLE_ADMIN");
		
		mapper.userAuthInsert(userAuth);
	}
	
	@Override
	public boolean modify(UsersDAO user) {

		log.info(user.getU_name()+"유저 수정");
		
		return mapper.userUpdate(user);
	}

	@Transactional
	@Override
	public boolean delete(String u_id) {
		
        log.info(u_id+"유저 삭제");
		
        mapper.userAuthDelete(u_id);
        
        return mapper.userDelete(u_id);
	}

	@Override
	public boolean login(String u_id, String u_pw) {
	
		log.info("Service id : "+ u_id);
		log.info("Service pw : "+ u_pw);
		boolean collect = mapper.userLogin(u_id, u_pw);
		
		return collect;
	}

	@Override
	public void userAuthRegist(UserHasAuthDAO userAuth) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardDAO> userBoard(Criteria cri,String u_id) {
		
		log.info("유저 작성 게시물 조회");
		return mapper.userBoard(cri,u_id);
	}

	@Override
	public long getBoardTotalCount(String u_id) {
		
		log.info("게시글 총 갯수(get페이지 호출시 PageDAO 인스턴스에 인자로 필요)");
		
		return mapper.getBoardTotalCount(u_id);
	}

	@Override
	public UsersDAO idCheck(String u_id) {
	
		log.info("id 중복체크 서비스"+u_id);
		
		return mapper.idCheck(u_id);
	}

	@Override
	public long getTotalCount() {
		
		log.info("총 유저 수");
		
		return mapper.getTotalCount();
	}
	
	
}
