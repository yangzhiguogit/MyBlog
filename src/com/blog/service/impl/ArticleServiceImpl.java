package com.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.blog.dao.ArticleDao;
import com.blog.entity.Article;
import com.blog.entity.ArticleBigType;
import com.blog.entity.ArticleSmallType;
import com.blog.service.ArticleService;

@Component
public class ArticleServiceImpl implements ArticleService {

	@Resource
	private ArticleDao ad;
	
	public void setAd(ArticleDao ad) {
		this.ad = ad;
	}

	@Override
	public List<Article> findArticle(String articleBigType,
			String articleSmallType) {
		return ad.findArticle(articleBigType, articleSmallType);
	}

	@Override
	public List<ArticleBigType> findBigTyep() {
		return ad.findBigTyep();
	}

	@Override
	public List<ArticleSmallType> findSmallTyep(String bigType) {
		return ad.findSmallTyep(bigType);
	}

	@Override
	public Map<String,Article> findArticleByID(String id) {
		return ad.findArticleByID(id);
	}

	@Override
	public void updateArticleLookTimes(String look_times, String articleId) {
		ad.updateArticleLookTimes(look_times, articleId);
	}

}
