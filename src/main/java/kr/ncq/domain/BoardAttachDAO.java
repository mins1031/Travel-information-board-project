package kr.ncq.domain;

import lombok.Data;

@Data
public class BoardAttachDAO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private long bno;
}
