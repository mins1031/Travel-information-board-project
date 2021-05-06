package kr.ncq.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.ncq.domain.UsersDAO;
import kr.ncq.mapper.UserMapper;
import kr.ncq.security.domain.CustomUser;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{

	@Setter(onMethod_ = {@Autowired})
	private UserMapper mapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		log.info("Load User By UserName: "+ username);
		
		UsersDAO user = mapper.authRead(username);
		
		return user == null ? null : new CustomUser(user);
	}//UserMapper를 이용하여 user의 내용을 조회하고 user에 맞는 내용을 얻을 수 있다면 CustomUser타입의 객체로 변환하여 반환
	//솔직히 시큐리티 어려움.. 갈피 못잡겠음
	
	
}
