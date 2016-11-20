/**
 * @description latest article service 
 * @function use the  dao to find the latest article and deliver to the controller
 * @time 11/8
 * @author ashin
 */
package com.wlayteam.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.mysql.jdbc.Connection;
import com.wlayteam.dao.impl.LatestArticleDaoImpl;
import com.wlayteam.model.ArticleDataBean;
import com.wlayteam.service.LatestArticleService;
import com.wlayteam.utils.DBConnectionUtil;

/**
 * @function search the latest article
 * @author ashin
 *
 */
@Service
public class LatestArticleServiceImpl implements LatestArticleService {


	@Resource(name = "dbConnectionUtil")
	private DBConnectionUtil dbConnectionUtil;

	@Resource(name = "latestArticleDaoImpl")
	private LatestArticleDaoImpl latestArticleDaoImpl;

	private ArrayList<ArticleDataBean> arrticleList = new ArrayList<ArticleDataBean>();

	@Override
	public ArrayList<ArticleDataBean> findLatestArticle() throws SQLException {
		Connection connection = dbConnectionUtil.getConnection();
		arrticleList = latestArticleDaoImpl.findLatestArticle(connection);
		return arrticleList;
	}

}
