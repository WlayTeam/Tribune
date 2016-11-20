/**
 * @description the index request with spring MVC
 * @function display the index page and display the latest article 
 * @time 11/8
 * @author ashin
 */
package com.wlayteam.controller;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.wlayteam.model.ArticleDataBean;
import com.wlayteam.service.impl.LatestArticleServiceImpl;

@Controller
public class IndexPageController {
	/** instantiate service object */
	@Resource(name = "latestArticleServiceImpl")
	private LatestArticleServiceImpl latestArticleServiceImpl;
	private ArrayList<ArticleDataBean> arrticleList = new ArrayList<ArticleDataBean>();

	/**
	 * display index page and diaplay the latest article
	 * 
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping(value = "toIndex")
	public ModelAndView toIndex(ModelAndView modelAndView) {
		
		try {
			arrticleList = latestArticleServiceImpl.findLatestArticle();
			modelAndView.addObject("arrticleList",arrticleList);
			modelAndView.setViewName("index");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	/**
	 * click read the full text and display the article
	 * @param modelAndView
	 * @return modelAndView
	 */
	@RequestMapping(value = "showArticle")
	public ModelAndView showArticle(ModelAndView modelAndView) {
		modelAndView.setViewName("showArticle");
		return modelAndView;

	}
}
