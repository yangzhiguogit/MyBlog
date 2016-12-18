package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.entity.Article;
import com.blog.entity.ArticleBigType;
import com.blog.entity.ArticleSmallType;

/**
 * 文章接口
 * @author Administrator
 *
 */
public interface ArticleService {
	
	/**
	 * 根据文章类型来查找文章
	 * @param articleBigType 文章大类
 	 * @param articleSmallType 文章小类
	 * @return 返回一个文章实体集合
	 */
	public List<Article> findArticle(String articleBigType,String articleSmallType);
	/**
	 * 根据id来查询文章
	 * @param id 文章id
	 * @return 返回一个文章集合
	 */
	public Map<String,Article> findArticleByID(String id);
	/**
	 * 获得所有的文章大类
	 * @return 返回大类集合
	 */
	public List<ArticleBigType> findBigTyep();
	/**
	 * 根据大类来查询小类
	 * @param bigType 大类名称
	 * @return 返回小类集合
	 */
	public List<ArticleSmallType> findSmallTyep(String bigType);
	/**
	 * 实时跟新文章的浏览次数
	 * @param look_times 需要修改的次数
	 * @param articleId 文章id
	 */
	public void  updateArticleLookTimes(String look_times,String articleId);
}

