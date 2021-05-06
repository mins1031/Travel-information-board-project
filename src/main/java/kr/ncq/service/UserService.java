package kr.ncq.service;

import java.util.List;

import kr.ncq.domain.BoardDAO;
import kr.ncq.domain.Criteria;
import kr.ncq.domain.UserHasAuthDAO;
import kr.ncq.domain.UsersDAO;

public interface UserService {

	public List<UsersDAO> getList(Criteria cri);
	
	public UsersDAO get(String u_id);
	
	public void register(UsersDAO user);
	
	public void adminRegister(UsersDAO user);
	
	public boolean modify(UsersDAO user);
	
	public boolean delete(String u_id);
	
	public boolean login(String u_id, String u_pw);
	
	public void userAuthRegist(UserHasAuthDAO userAuth);
	
	public List<BoardDAO> userBoard(Criteria cri,String u_id);
	
	public long getTotalCount();
	
	public long getBoardTotalCount(String u_id);
	
	public UsersDAO idCheck(String u_id);
}
