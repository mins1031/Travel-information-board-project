package kr.ncq.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDAO {

	private long replyCnt;
	private List<ReplyDAO> list;
}
