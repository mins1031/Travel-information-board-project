package kr.ncq.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {

	@Select("select curdate()")
	public String getTime();
}
