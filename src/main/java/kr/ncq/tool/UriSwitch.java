package kr.ncq.tool;

public class UriSwitch {

    private String boardType;
	
	public UriSwitch(String boardType){
	    this.boardType= boardType;	
	}
	
	public String switchResult() {
		
		  if(boardType.equals("r001")) {
			  boardType = "/internal/sudo";
		  } else if(boardType.equals("r002")) {
			  boardType = "/internal/gangwon";
		  } else if(boardType.equals("r003")) {
			  boardType = "/internal/chungcheong";
		  } else if(boardType.equals("r004")) {
			  boardType = "/internal/gyeongsang";
		  } else if(boardType.equals("r005")) {
			  boardType = "/internal/jeonla";
		  } else if(boardType.equals("r006")) {
			  boardType = "/internal/jeju";
		  } else if(boardType.equals("r007")) {
			  boardType = "/asia/china";
		  } else if(boardType.equals("r008")) {
			  boardType = "/asia/japan";
		  } else if(boardType.equals("r009")) {
			  boardType = "/asia/oceania";
		  } else if(boardType.equals("r010")) {
			  boardType = "/asia/eastsouth";
		  } else if(boardType.equals("r011")) {
			  boardType = "/asia/etc";
		  } else if(boardType.equals("r012")) {
			  boardType = "/europe/uk";
		  } else if(boardType.equals("r013")) {
			  boardType = "/europe/france";
		  } else if(boardType.equals("r014")) {
			  boardType = "/europe/italia";
		  } else if(boardType.equals("r015")) {
			  boardType = "/europe/iberia";
		  } else if(boardType.equals("r016")) {
			  boardType = "/europe/swiss";
		  } else if(boardType.equals("r017")) {
			  boardType = "/europe/germany";
		  } else if(boardType.equals("r018")) {
			  boardType = "/europe/etc";
		  } else if(boardType.equals("r019")) {
			  boardType = "/america/usa";
		  } else if(boardType.equals("r020")) {
			  boardType = "/america/canada";
		  } else if(boardType.equals("r021")) {
			  boardType = "/america/mexico";
		  } else {
			  boardType = "/america/etc";
		  } 
		  
		//등록후 boardType에 맞는 게시판 페이지로 리다이랙트를 위한 분기문
		
		return boardType;
	}
}
