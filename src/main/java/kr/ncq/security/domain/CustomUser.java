package kr.ncq.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.ncq.domain.UsersDAO;
import lombok.Getter;

@Getter
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;
	
	private UsersDAO user;
	
	public CustomUser(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		// TODO Auto-generated constructor stub
	}

	public CustomUser(UsersDAO user) {
		
		super(user.getU_id(), user.getU_pw(), user.getU_auth().stream()
				.map(userhasauth -> new SimpleGrantedAuthority(userhasauth.getAuth()))
				.collect(Collectors.toList()));
		this.user = user;		
	}
	
}
