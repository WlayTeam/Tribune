/**
 * @description the index request with spring MVC
 * @function display the index page and display the latest article 
 * @time 11/8
 * @author ashin
 */
package com.wlayteam.controller;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	@RequestMapping(value = "/toIndex")
	public ModelAndView toIndex(@RequestParam(value="nowpage",required=false,defaultValue="1") Integer nowpage,ModelAndView modelAndView) {
		
		try {
			System.out.println(nowpage);
			arrticleList = latestArticleServiceImpl.findLatestArticle(nowpage);
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
	public String showArticle(@RequestParam(value="tid",required=false) Integer id,Map<String,Object> map ) {
		
		map.put("id", id);
		
		return "showArticle";

	}
	
	/*@RequestMapping(value="page")
	public List<ArticleDataBean> page(@RequestParam(value="nowpage",required=false,defaultValue="1") Integer nowpage) {
		
		try {
			
			arrticleList = latestArticleServiceImpl.findLatestArticle(nowpage);
			JSONArray jsonArray = JSONArray.fromObject(arrticleList);
			System.out.println(arrticleList);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return arrticleList;
	}*/
		
	
}
