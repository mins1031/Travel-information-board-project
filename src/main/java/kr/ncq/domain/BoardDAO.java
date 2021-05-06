package kr.ncq.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class BoardDAO {

	private long bno;
	private String b_title;
	private String b_content;
	private Date b_regdate;
	private Date b_updatedate;
	private long b_hit;
	private UsersDAO user;
	private RegionDAO region;
	
	private int replyCnt;
	
	private List<BoardAttachDAO> attachList;
}
