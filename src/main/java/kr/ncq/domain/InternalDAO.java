package kr.ncq.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InternalDAO {

	private long iboardId;
	private String ib_title;
	private String ib_content;
	private Date ib_regdate;
	private Date ib_updatedate;
	private long ib_hit;
	private UsersDAO user;
	private RegionDAO region;
}
