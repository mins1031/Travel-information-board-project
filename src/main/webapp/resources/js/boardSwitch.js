
console.log("switch!");

function typeSwitch(type){
	
	    var returnType = null ;
		
		if(type === "r001"){
    		returnType = "/internal/sudo";
    	} else if(type === "r002") {
    		returnType = "/internal/gangwon";
    	} else if(type === "r003") {
    		returnType = "/internal/chungcheong";
    	} else if(type === "r004") {
    		returnType = "/internal/gyeongsang";
    	} else if(type === "r005") {
    		returnType = "/internal/jeonla";
    	} else if(type === "r006") {
    		returnType = "/internal/jeju";
    	} else if(type === "r007") {
    		returnType = "/asia/china";
    	} else if(type === "r008") {
    		returnType = "/asia/japan";
    	} else if(type === "r009") {
    		returnType = "/asia/oceania";
    	} else if(type === "r010") {
    		returnType = "/asia/eastsouth";
    	} else if(type === "r011") {
    		returnType = "/asia/etc";
    	} else if(type === "r012") {
    		returnType = "/europe/uk";
    	} else if(type === "r013") {
    		returnType = "/europe/france";
    	} else if(type === "r014") {
    		returnType = "/europe/italia";
    	} else if(type === "r015") {
    		returnType = "/europe/iberia";
    	} else if(type === "r016") {
    		returnType = "/europe/swiss";
    	} else if(type === "r017") {
    		returnType = "/europe/germany";
    	} else if(type === "r018") {
    		returnType = "/europe/etc";
    	} else if(type === "r019") {
    		returnType = "/america/usa";
    	} else if(type === "r020") {
    		returnType = "/america/canada";
    	} else if(type === "r021") {
    		returnType = "/america/mexico";
    	} else if(type === "r022") {
    		returnType = "/america/etc";
    	}

        console.log(returnType);

        return returnType;
}
