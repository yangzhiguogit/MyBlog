package com.blog.entity;

import java.util.Date;

public class UserAllInfo {
	private int id;
	private String lg_name;
	private String pwd;
	private String name;
	private String sex;
	private String image;
	private String phone;
	private String email;
	private Date brithday;
	private String address;
	private String description;
	private int statu;
	public UserAllInfo(int id, String lg_name, String pwd, String name,
			String sex, String image, String phone, String email,
			Date brithday, String address, String description, int statu) {
		super();
		this.id = id;
		this.lg_name = lg_name;
		this.pwd = pwd;
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
	public UserAllInfo(String lg_name, String pwd, String name, String sex,
			String image, String phone, String email, Date brithday,
			String address, String description, int statu) {
		super();
		this.lg_name = lg_name;
		this.pwd = pwd;
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
	
	public UserAllInfo() {
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
