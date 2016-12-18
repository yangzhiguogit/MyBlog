package com.blog.service;

import java.util.List;

import com.blog.entity.User;
import com.blog.entity.UserAllInfo;
import com.blog.entity.UserDetails;

/**
 * �û�service�ӿ�
 * @author Administrator
 *
 */
public interface UserService {
	/**
	 *  ����һ��User�û�,�������Ϊ�����ֻ���û�����ѯ
	 * @param lg_name �ʺ�
	 * @param pwd ����
	 * @return ����user����
	 */
	public List<User> findUser(String lg_name,String pwd);
	/**
	 * �����ṩ���û����󣬲��ҳ���Ӧ���û���ϸ��Ϣ,����ֻ�����Ϊ�վͰ�user������ѯ����λ�վͰ��ֻ������ѯ
	 * @param user �û�������� 
	 * @param phone �ֻ�����
	 * @return �û�����ϸ��Ϣ
	 */
	public List<UserDetails> findUserDetails(User user,String phone);
	/**
	 * �����ṩ�Ĳ���������ע���û�
	 * @param name ע����û���
	 * @param pwd ����
	 * @param phone �ֻ�����
	 * @return true-ע��ɹ���false-ע��ʧ��
	 */
	public boolean addUser(String name,String pwd,String phone);
	/**
	 * ����id�������û�
	 * @param id �û�id
	 * @return �����û�����
	 */
	public List<User> findUserById(String id);
	/**
	 * ����id�������û�  ��ϸ��Ϣ
	 * @param id �û�id
	 * @return �����û���Ϣ����
	 */
	public List<UserAllInfo> findUserDetailsById(String id);
}
