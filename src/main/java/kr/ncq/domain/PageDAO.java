package kr.ncq.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDAO {

	private int startPage;
	private int endPage;
	private long total;
	private boolean prev,next;
	private Criteria cri;
	
	public PageDAO(Criteria cri, long total) {
		
		this.cri = cri;
		this.total = total;
	
	    this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0)) * 10;
	    this.startPage = endPage - 9 ;
		
	    int realEnd = (int)(Math.ceil((total * 1.0)/ cri.getAmount())); //전체 갯수 / 한페이지당  갯수 = 총 페이지네이션 갯수
 	    
	    if(endPage > realEnd) {
	    	this.endPage = realEnd;
	    }		
	    
	    this.prev = this.startPage > 1;
	    this.next = this.endPage < realEnd;
	}
	
}
