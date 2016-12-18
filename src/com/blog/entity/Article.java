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
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

/**
 * 文章实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="article")
//加这个注解是为了解决ajax将对象转json是无法对有管理的对象作出转化，所以要指定转换
@JsonIgnoreProperties(value={"user","ast"})
public class Article {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String name;
	private String context;
	private String description;
	private Date time;
	private int look_times;
	private int response;
	private String image;
	@ManyToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User user;
	
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="article_small_type_id")
	private ArticleSmallType ast;
	
	public Article() {
	}

	public Article(int id, String name, String context, String description,
			Date time, int look_times, int response, String image, User user) {
		super();
		this.id = id;
		this.name = name;
		this.context = context;
		this.description = description;
		this.time = time;
		this.look_times = look_times;
		this.response = response;
		this.image = image;
		this.user = user;
	}

	public Article(String name, String context, String description, Date time,
			int look_times, int response, String image, User user) {
		super();
		this.name = name;
		this.context = context;
		this.description = description;
		this.time = time;
		this.look_times = look_times;
		this.response = response;
		this.image = image;
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	
	public int getLook_times() {
		return look_times;
	}

	public void setLook_times(int look_times) {
		this.look_times = look_times;
	}

	public ArticleSmallType getAst() {
		return ast;
	}

	public void setAst(ArticleSmallType ast) {
		this.ast = ast;
	}

	public int getResponse() {
		return response;
	}

	public void setResponse(int response) {
		this.response = response;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}
