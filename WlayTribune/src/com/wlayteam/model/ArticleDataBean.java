/**
 * @description the databean of latest article
 * @time 11/8
 * @author ashin
 */
package com.wlayteam.model;

import java.util.Date;

public class ArticleDataBean {
	/*title id*/
	private int tid;
	/**article title*/
	private String title;
	/**article author*/
	private String author;
	/**upload time*/
	private Date uTime;
	/**Introduction of the article*/
	private String summary;
	
	private String introduction;

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

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Override
	public String toString() {
		return "ArticleDataBean [tid=" + tid + ", title=" + title + ", author=" + author + ", uTime=" + uTime
				+ ", summary=" + summary + ", introduction=" + introduction + "]";
	}

	
	

}
