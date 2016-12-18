package com.blog.service;

import java.util.List;

import com.blog.entity.User;
import com.blog.entity.UserAllInfo;
import com.blog.entity.UserDetails;

/**
 * 用户service接口
 * @author Administrator
 *
 */
public interface UserService {
	/**
	 *  查找一个User用户,如果密码为空则就只按用户名查询
	 * @param lg_name 帐号
	 * @param pwd 密码
	 * @return 返回user对象
	 */
	public List<User> findUser(String lg_name,String pwd);
	/**
	 * 根据提供的用户对象，查找出相应的用户详细信息,如果手机号码为空就按user参数查询，补位空就按手机号码查询
	 * @param user 用户对象参数 
	 * @param phone 手机号码
	 * @return 用户的详细信息
	 */
	public List<UserDetails> findUserDetails(User user,String phone);
	/**
	 * 根据提供的参数对象，来注册用户
	 * @param name 注册的用户名
	 * @param pwd 密码
	 * @param phone 手机号码
	 * @return true-注册成功，false-注册失败
	 */
	public boolean addUser(String name,String pwd,String phone);
	/**
	 * 根据id来查找用户
	 * @param id 用户id
	 * @return 返回用户集合
	 */
	public List<User> findUserById(String id);
	/**
	 * 根据id来查找用户  详细信息
	 * @param id 用户id
	 * @return 返回用户信息集合
	 */
	public List<UserAllInfo> findUserDetailsById(String id);
}
