/**
 * @description the interface of service
 * @time 11/8
 * @author ashin
 */
package com.wlayteam.service;

import com.wlayteam.model.ArticleDataBean;

/**
 * find the latest article
 * @author ashin
 *
 */
public interface LatestArticleService {
	public ArticleDataBean findLatestArticle() throws Exception;

}
