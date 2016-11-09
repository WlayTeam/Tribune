/**
 * @description latest article dao 
 * @function connect the  dao to find the latest article and deliver to the service
 * @time 11/9
 * @author ashin
 */
package com.wlayteam.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import javax.annotation.Resource;
import org.springframework.stereotype.Repository;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.wlayteam.dao.LatestArticleDao;
import com.wlayteam.model.ArticleDataBean;
@Repository
public class LatestArticleDaoImpl implements LatestArticleDao {
	@Resource(name="articleDataBean")
	private ArticleDataBean articleDataBean;
	
	
	@Override
	public ArticleDataBean findLatestArticle(Connection connection) throws SQLException {
		String sql = "select * from summary";
		Statement statement = (Statement) connection.createStatement();
		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			articleDataBean.setAuthor(resultSet.getString("author"));
		}
		return articleDataBean;
	}
	


}
