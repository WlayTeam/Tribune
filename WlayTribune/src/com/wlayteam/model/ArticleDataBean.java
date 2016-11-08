/**
 * @description the databean of latest article
 * @time 11/8
 * @author ashin
 */
package com.wlayteam.model;

import java.util.Date;

public class ArticleDataBean {
	/**article title*/
	private String title;
	/**article author*/
	private String author;
	/**upload time*/
	private Date uTime;
	/**Introduction of the article*/
	private String summary;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public Date getuTime() {
		return uTime;
	}

	public void setuTime(Date uTime) {
		this.uTime = uTime;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

}
