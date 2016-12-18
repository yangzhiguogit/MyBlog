package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.blog.dao.UserDao;
import com.blog.entity.User;
import com.blog.entity.UserAllInfo;
import com.blog.entity.UserDetails;
import com.blog.service.UserService;

@Component
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public List<User> findUser(String lg_name, String pwd) {
		return userDao.findUser(lg_name, pwd);
	}

	@Override
	public List<UserDetails> findUserDetails(User user,String phone) {
		return this.userDao.findUserDetails(user,phone);
	}

	@Override
	public boolean addUser(String name, String pwd, String phone) {
		return this.userDao.addUser(name, pwd, phone);
	}

	@Override
	public List<User> findUserById(String id) {
		return this.userDao.findUserById(id);
	}

	@Override
	public List<UserAllInfo> findUserDetailsById(String id) {
		return this.userDao.findUserDetailsById(id);
	}

}
