package com.blog.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;
import org.hibernate.annotations.Cascade;
import org.springframework.stereotype.Component;

/**
 * 用户实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="user")
@JsonIgnoreProperties(value={"ud"})
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	private String lg_name;
	private String pwd;
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER)
	@JoinColumn(name="user_details_id")
	private UserDetails ud;
	
	public User() {
	}

	public User(int id, String lg_name, String pwd, UserDetails ud) {
		super();
		this.id = id;
		this.lg_name = lg_name;
		this.pwd = pwd;
		this.ud = ud;
	}

	public User(String lg_name, String pwd, UserDetails ud) {
		super();
		this.lg_name = lg_name;
		this.pwd = pwd;
		this.ud = ud;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLg_name() {
		return lg_name;
	}

	public void setLg_name(String lg_name) {
		this.lg_name = lg_name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public UserDetails getUd() {
		return ud;
	}

	public void setUd(UserDetails ud) {
		this.ud = ud;
	}
	
}
