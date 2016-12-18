package com.blog.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 文章小类实体
 * @author Administrator
 *
 */
@Entity
@Table(name="article_small_type")
public class ArticleSmallType {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String name;
	private int statu;
	
	@ManyToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="article_big_type_id")
	private ArticleBigType abt;
	
	
	public ArticleSmallType() {
	}


	public ArticleSmallType(int id, String name, int statu, ArticleBigType abt) {
		super();
		this.id = id;
		this.name = name;
		this.statu = statu;
		this.abt = abt;
	}


	public ArticleSmallType(String name, int statu, ArticleBigType abt) {
		super();
		this.name = name;
		this.statu = statu;
		this.abt = abt;
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


	public int getStatu() {
		return statu;
	}


	public void setStatu(int statu) {
		this.statu = statu;
	}


	public ArticleBigType getAbt() {
		return abt;
	}


	public void setAbt(ArticleBigType abt) {
		this.abt = abt;
	}
	
}
