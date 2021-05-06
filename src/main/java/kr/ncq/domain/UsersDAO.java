package kr.ncq.domain;

import java.util.List;

import lombok.Data;

@Data
public class UsersDAO {

	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_mailrecevie;
	private String u_address;
	private String u_tell;
	private String u_phone;
	private String u_SMS;
	private String u_email;
	private String u_birth;
	private String u_marryani;
	private String u_matebirth;
	private String u_region;
	private List<UserHasAuthDAO> u_auth;
	private int user_level;
}
