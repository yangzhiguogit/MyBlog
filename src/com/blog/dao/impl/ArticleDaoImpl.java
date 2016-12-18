package com.blog.dao.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.blog.dao.ArticleDao;
import com.blog.entity.Article;
import com.blog.entity.ArticleBigType;
import com.blog.entity.ArticleSmallType;

@Component
public class ArticleDaoImpl implements ArticleDao {
	
	@Resource
	private HibernateTemplate hibernateTemplate;
	
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	@Override
	public List<Article> findArticle(String articleBigType,
			String articleSmallType) {
		
		
		String sql="select A.id,A.name,A.context,A.description,A.time,A.user_id," +
				"A.look_times,A.response,A.image,A.article_small_type_id" +
				" from article A" +
				" left join article_small_type AST on AST.id=A.article_small_type_id " +
				" left join article_big_type ABT on ABT.id=AST.article_big_type_id " ;	
		
		if(articleBigType!=null && articleSmallType==null){
			sql+=" where ABT.name='"+articleBigType+"'";
		}
		if(articleSmallType!=null && articleBigType==null){
			sql+=" where AST.name='"+articleSmallType+"'";
		}
		if(articleSmallType!=null && articleBigType!=null){
			sql+=" where ABT.name='ÏîÄ¿¼ÇÂ¼' and AST.name='"+articleSmallType+"'";
		}
		Session session=this.hibernateTemplate.getSessionFactory().getCurrentSession();
		List<Article> list=session.createSQLQuery(sql).addEntity("article", Article.class).list();
		return list;
	}

	@Override
	public List<ArticleBigType> findBigTyep() {
		String hql="from ArticleBigType";
		List<ArticleBigType> list=this.hibernateTemplate.find(hql);
		return list;
	}

	@Override
	public List<ArticleSmallType> findSmallTyep(String bigType) {
		String sql="select AST.id,AST.name,AST.statu,AST.article_big_type_id from article_small_type AST" +
				" left join article_big_type ABT on ABT.id=AST.article_big_type_id" +
				" where ABT.name='"+bigType+"'";
		List<ArticleSmallType> list=this.hibernateTemplate.getSessionFactory().getCurrentSession().createSQLQuery(sql).addEntity("article_small_type",ArticleSmallType.class).list();
		return list;
	}

	@Override
	public Map<String,Article> findArticleByID(String id) {

		String sql="select A.id,A.name,A.context,A.description,A.time,A.user_id," +
				"A.look_times,A.response,A.image,A.article_small_type_id" +
				" from article A" +
				" left join article_small_type AST on AST.id=A.article_small_type_id " +
				" left join article_big_type ABT on ABT.id=AST.article_big_type_id " ;	
		
		Session session=this.hibernateTemplate.getSessionFactory().getCurrentSession();
		List<Article> list=session.createSQLQuery(sql).addEntity("article", Article.class).list();
		
		Map<String,Article> articleMap=new HashMap<String, Article>();
		
		for(int i=0;i<list.size();i++){
			if(Integer.parseInt(id)==list.get(i).getId()){
				if(i==0){
					articleMap.put("prev", null);
					articleMap.put("center", list.get(i));
					articleMap.put("next", list.get(i+1));
				}else if(i==(list.size()-1)){
					articleMap.put("prev", list.get(i-1));
					articleMap.put("center", list.get(i));
					articleMap.put("next", null);
				}else{
					articleMap.put("prev", list.get(i-1));
					articleMap.put("center", list.get(i));
					articleMap.put("next", list.get(i+1));
				}
				
			}
		}
		
		return articleMap;
	}
	@Override
	public void updateArticleLookTimes(String look_times,String articleId) {
		Article article=this.findArticleByID(articleId).get("center");
		article.setLook_times(Integer.parseInt(look_times));
		this.hibernateTemplate.update(article);
	}
}
