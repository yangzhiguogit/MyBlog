package com.blog.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.blog.dao.UserDao;
import com.blog.entity.User;
import com.blog.entity.UserAllInfo;
import com.blog.entity.UserDetails;

@Component
public class UserDaoImpl implements UserDao {
	
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Override
	public List<User> findUser(String lg_name, String pwd) {
		String hql="from User";
		if(pwd=="" || pwd==null){
			hql+=" where lg_name='"+lg_name+"'";
		}else{
			hql+=" where lg_name='"+lg_name+"' and pwd='"+pwd+"'";
		}
		List<User> list=this.hibernateTemplate.find(hql);
		for (User user : list) {
			System.out.println(user.getUd()+","+user.getId()+","+user.getLg_name()+","+user.getPwd());
		}
		return list;
	}

	@Override
	public List<UserDetails> findUserDetails(User user,String phone) {
		String hql="from UserDetails";
		if(phone=="" || phone==null){
			hql+=" where id="+user.getUd().getId()+"";
		}else{
			hql+=" where phone='"+phone+"'";
		}
		List<UserDetails> list=this.hibernateTemplate.find(hql);
		return list;
	}

	@Override
	public boolean addUser(String name, String pwd, String phone) {
		UserDetails ud=new UserDetails();
		User user=new User();
		ud.setPhone(phone);
		ud.setStatu(1);
		user.setLg_name(name);
		user.setPwd(pwd);
		user.setUd(ud);
		ud.setUser(user);
		try {
			this.hibernateTemplate.save(ud);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public List<User> findUserById(String id) {
		String hql="from User where id="+id;
		return this.hibernateTemplate.find(hql);
	}

	@Override
	public List<UserAllInfo> findUserDetailsById(String id) {
		String sql="select u.id id,u.lg_name lg_name,u.pwd pwd,ud.name name,ud.sex sex,ud.image image,ud.phone phone," +
				"ud.email email,ud.brithday brithday,ud.address address,ud.description description,ud.statu statu from user u"+ 
				" left join user_details ud on u.user_details_id=ud.id" +
				" where u.id=" +id;
		//利用setResultTransformer(Transformers.aliasToBean())来处理多表查询的实体
		List<UserAllInfo> list=this.hibernateTemplate.getSessionFactory().getCurrentSession().createSQLQuery(sql)
			.setResultTransformer(Transformers.aliasToBean(UserAllInfo.class)).list();
		
		return list;
	}
	
}
