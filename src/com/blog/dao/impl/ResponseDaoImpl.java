package com.blog.dao.impl;

import java.math.BigInteger;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.blog.dao.ArticleDao;
import com.blog.dao.ResponseDao;
import com.blog.dao.UserDao;
import com.blog.entity.Article;
import com.blog.entity.ArticleResponse;
import com.blog.entity.User;

@Component
public class ResponseDaoImpl implements ResponseDao {

	@Resource
	private HibernateTemplate hibernateTemplate;
	@Resource
	private ArticleDao ad;
	@Resource
	private UserDao ud;
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	public void setAd(ArticleDao ad) {
		this.ad = ad;
	}
	public void setUd(UserDao ud) {
		this.ud = ud;
	}


	@Override
	public boolean addResponse(String value, String articleId, String from_userId,String to_userId,String date) {
		ArticleResponse ar=new ArticleResponse();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		try {
			ar.setTime(sdf.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		ar.setContext(value);
		
		if(to_userId!=null){
			System.out.println(ud.findUserById(to_userId).size());
			ar.setToUser(ud.findUserById(to_userId).get(0));
		}
		if(from_userId!=null){
			ar.setFromUser(ud.findUserById(from_userId).get(0));
		}
		if(articleId!=null){
			ar.setArt(ad.findArticleByID(articleId).get("center"));
		}
		
		try {
			this.hibernateTemplate.save(ar);
		} catch (Exception e) {
			return false;
		}
		return true;
	}

	@Override
	public List<ArticleResponse> findResponse(String articleId, String to_userId) {
		String hql="from ArticleResponse where article_id="+articleId+"";
		if(to_userId!=null || to_userId!=""){
			hql+=" and to_user_id="+to_userId+"";
		}
		return this.hibernateTemplate.find(hql);
	}
	@Override
	public int getResponseTimes(String articleId) {
		String sql="select count(*) from article_response where article_id="+articleId;
		List<Object> list=this.hibernateTemplate.getSessionFactory().getCurrentSession().createSQLQuery(sql).list();
		Object ob=list.get(0);
		BigInteger bitInt=(BigInteger)ob;
		//BigInteger×ªintÀàÐÍ
		int num=bitInt.intValue();
		return num;
	}

}
