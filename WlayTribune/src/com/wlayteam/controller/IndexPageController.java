/**
 * @description the index request with spring MVC
 * @function display the index page and display the latest article 
 * @time 11/8
 * @author ashin
 */
package com.wlayteam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexPageController {
	/**
	 * display index page
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "toIndex")
	public ModelAndView toIndex(ModelAndView modelAndView) {
		modelAndView.setViewName("index");
		return modelAndView;
	}
}
