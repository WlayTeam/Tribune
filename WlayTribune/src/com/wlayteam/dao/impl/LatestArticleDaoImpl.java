/**
 * @description latest article dao 
 * @function connect the  dao to find the latest article and deliver to the service
 * @time 11/9
 * @author ashin
 */
package com.wlayteam.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.wlayteam.dao.LatestArticleDao;
import com.wlayteam.model.ArticleDataBean;

@Repository
public class LatestArticleDaoImpl implements LatestArticleDao {
	// @Resource(name = "articleDataBean")
	private final static int EACHPAGE_SHOW_NUMBER = 5;


	@Override
	public ArrayList<ArticleDataBean> findLatestArticle(Connection connection,int nowpage) throws SQLException {
	    ArrayList<ArticleDataBean> arrticleList = new ArrayList<ArticleDataBean>();
		String sql = "select * from title limit "+(nowpage-1)*EACHPAGE_SHOW_NUMBER+","+((nowpage-1)*EACHPAGE_SHOW_NUMBER+5)+" ";
		System.out.println(sql);
		Statement statement = (Statement) connection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
		 ArticleDataBean articleDataBean = new ArticleDataBean();
			articleDataBean.setTitle(resultSet.getString("title"));
			articleDataBean.setTid(resultSet.getInt("tid"));
			articleDataBean.setIntroduction(resultSet.getString("introduction"));
			arrticleList.add(articleDataBean);

		}
		return arrticleList;
	}

	

}
