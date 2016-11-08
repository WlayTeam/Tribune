package com.wlayteam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexPageController {

	@RequestMapping(value = "toIndex")
	public ModelAndView toIndex(ModelAndView modelAndView) {
		modelAndView.setViewName("index");
		return modelAndView;
	}
}
