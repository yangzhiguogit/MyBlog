package com.blog.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 * 文章回复实体
 * @author Administrator
 *
 */
@Entity
@Table(name="article_response")
@JsonIgnoreProperties(value={"fromUser","toUser","art"})
public class ArticleResponse {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String context;
	private Date time;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="from_user_id")
	private User fromUser;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="to_user_id")
	private User toUser;
	
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="article_id")
	private Article art;
	
	public ArticleResponse() {
	}

	public ArticleResponse(int id, String context, Date time, User fromUser,
			User toUser, Article art) {
		super();
		this.id = id;
		this.context = context;
		this.time = time;
		this.fromUser = fromUser;
		this.toUser = toUser;
		this.art = art;
	}

	public ArticleResponse(String context, Date time, User fromUser,
			User toUser, Article art) {
		super();
		this.context = context;
		this.time = time;
		this.fromUser = fromUser;
		this.toUser = toUser;
		this.art = art;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public User getFromUser() {
		return fromUser;
	}

	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}

	public User getToUser() {
		return toUser;
	}

	public void setToUser(User toUser) {
		this.toUser = toUser;
	}

	public Article getArt() {
		return art;
	}

	public void setArt(Article art) {
		this.art = art;
	}
	
}
