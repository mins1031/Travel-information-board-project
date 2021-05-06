package kr.ncq.domain;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeDAO {

	private long n_id;
	private String n_title;
	private UsersDAO user;
	private String userid;
	private String n_content;
	private Date n_regdate;
	private Date n_updatedate;
	private int n_hit;
}
