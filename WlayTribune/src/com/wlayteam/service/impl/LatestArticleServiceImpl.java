/**
 * @description latest article service 
 * @function use the  dao to find the latest article and deliver to the controller
 * @time 11/8
 * @author ashin
 */
package com.wlayteam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import com.wlayteam.model.ArticleDataBean;
import com.wlayteam.service.LatestArticleService;

public class LatestArticleServiceImpl implements LatestArticleService {
	
	@Autowired
	@Qualifier(value = "articleDataBean")
	private ArticleDataBean articleDataBean;

	@Override
	public ArticleDataBean findLatestArticle() {

		/**
		 * not yet written
		 */

		return articleDataBean;
	}

}
