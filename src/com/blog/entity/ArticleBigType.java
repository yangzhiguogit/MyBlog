package com.blog.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 文章大类实体
 * @author Administrator
 *
 */
@Entity
@Table(name="article_big_type")
public class ArticleBigType {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String name;
	private int statu;
	
	public ArticleBigType() {
	}

	public ArticleBigType(int id, String name, int statu) {
		super();
		this.id = id;
		this.name = name;
		this.statu = statu;
	}

	public ArticleBigType(String name, int statu) {
		super();
		this.name = name;
		this.statu = statu;
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
	
}
