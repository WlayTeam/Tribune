/**
 * @description the index request with spring MVC
 * @function display the index page and display the latest article 
 * @time 11/8
 * @author ashin
 */
package com.wlayteam.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wlayteam.model.ArticleDataBean;
import com.wlayteam.service.impl.LatestArticleServiceImpl;

@Controller
public class IndexPageController {
	/** instantiate article databean object */
	@Resource(name = "articleDataBean")
	private ArticleDataBean articleDataBean;
	/** instantiate service object */
	@Resource(name = "latestArticleServiceImpl")
	private LatestArticleServiceImpl latestArticleServiceImpl;

	/**
	 * display index page and diaplay the latest article
	 * 
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "toIndex")
	public ModelAndView toIndex(ModelAndView modelAndView) {
		try {
			modelAndView.setViewName("index");
			articleDataBean = latestArticleServiceImpl.findLatestArticle();
			System.out.println("articleDataBean:"+articleDataBean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
}
