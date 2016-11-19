/**
 * @description the interface of dao
 * @time 11/9
 * @author ashin
 */
package com.wlayteam.dao;

import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.wlayteam.model.ArticleDataBean;

/**
 * @function find latest article
 * @author ashin
 *
 */
public interface LatestArticleDao {
	public ArrayList<ArticleDataBean> findLatestArticle(Connection connection) throws Exception;
}
