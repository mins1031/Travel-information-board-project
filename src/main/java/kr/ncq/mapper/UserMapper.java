package kr.ncq.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.ncq.domain.BoardDAO;
import kr.ncq.domain.Criteria;
import kr.ncq.domain.UserHasAuthDAO;
import kr.ncq.domain.UsersDAO;

public interface UserMapper {
	
	public List<UsersDAO> userList(Criteria cri); 
	
	public UsersDAO userRead(String u_id); //-> String u_id
	
	//public UsersDAO userIdRead(long u_num);
	
	public UsersDAO authRead(String u_id); 
	
	public void userInsert(UsersDAO user);
	
	public boolean userUpdate(UsersDAO user);
	
	public boolean userLogin(@Param("u_id") String u_id,@Param("u_pw")String u_pw); 
	
	public boolean userDelete(String u_id); 
	
	public void userAuthDelete(String u_id);
	
	public long getTotalCount();
	
	public long getBoardTotalCount(String u_id);
	
    public void userAuthInsert(UserHasAuthDAO userAuth);
    
    public List<BoardDAO> userBoard(@Param("cri") Criteria cri,@Param("u_id") String u_id);
    
    public UsersDAO idCheck(String u_id);
}
