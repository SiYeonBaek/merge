package com.korea.ttrs;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.MyCommon;

@Controller
public class MainController {

	// index 페이지!!
	@RequestMapping(value = { "/", "index.do" })
	public String index() {
		
		return MyCommon.MAIN_VIEW_PATH + "index.jsp";
	}

}
