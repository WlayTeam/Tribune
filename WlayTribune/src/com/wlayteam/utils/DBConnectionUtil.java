/**
 * @description dbconnection util
 * @function get the connection
 * @time 11/9
 * @author ashin
 */
package com.wlayteam.utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import com.mysql.jdbc.Connection;

public class DBConnectionUtil {
	private Properties properties = new Properties();
	private String driverClass;
	private String url;
	private String username;
	private String password;
	private Connection connection;
	private InputStream inputStream;

	/**
	 * @function get the db connection
	 * @return connection
	 */
	public Connection getConnection() {

		try {
			inputStream = this.getClass().getResourceAsStream("/dbconnect.properties");
			properties.load(inputStream);
			driverClass = properties.getProperty("driverClassName");
			url = properties.getProperty("url");
			username = properties.getProperty("username");
			password = properties.getProperty("password");
			Class.forName(driverClass);
			connection = (Connection) DriverManager.getConnection(url, username, password);

		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				properties.clone();
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return connection;
	}

	/**
	 * @function close the db connection when it's not null
	 * @param connection
	 */
	public void closeConnection(Connection connection) {
		if (connection != null) {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
