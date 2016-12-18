package com.blog.entity;

import java.util.Date;

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

/**
 * 用户详细信息实体类，与用户有一对一关联
 * @author Administrator
 *
 */
@Entity
@Table(name="user_details")
@JsonIgnoreProperties(value={"user"})
public class UserDetails {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.LAZY,mappedBy="ud")
	private User user;
	private String name;
	private String sex;
	private String image;
	private String phone;
	private String email;
	private Date brithday;
	private String address;
	private String description;
	private int statu;
	
	public UserDetails() {
	}

	public UserDetails(int id, User user, String name, String sex,
			String image, String phone, String email, Date brithday,
			String address, String description, int statu) {
		super();
		this.id = id;
		this.user = user;
		this.name = name;
		this.sex = sex;
		this.image = image;
		this.phone = phone;
		this.email = email;
		this.brithday = brithday;
		this.address = address;
		this.description = description;
		this.statu = statu;
	}

	public UserDetails(User user, String name, String sex, String image,
			String phone, String email, Date brithday, String address,
			String description, int statu) {
		super();
		this.user = user;
		this.name = name;
		this.sex = sex;
		this.image = image;
		this.phone = phone;
		this.email = email;
		this.brithday = brithday;
		this.address = address;
		this.description = description;
		this.statu = statu;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBrithday() {
		return brithday;
	}

	public void setBrithday(Date brithday) {
		this.brithday = brithday;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatu() {
		return statu;
	}

	public void setStatu(int statu) {
		this.statu = statu;
	}
	
}
