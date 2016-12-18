package com.blog.service;

import java.util.List;
import java.util.Map;

import com.blog.entity.Article;
import com.blog.entity.ArticleBigType;
import com.blog.entity.ArticleSmallType;

/**
 * ���½ӿ�
 * @author Administrator
 *
 */
public interface ArticleService {
	
	/**
	 * ����������������������
	 * @param articleBigType ���´���
 	 * @param articleSmallType ����С��
	 * @return ����һ������ʵ�弯��
	 */
	public List<Article> findArticle(String articleBigType,String articleSmallType);
	/**
	 * ����id����ѯ����
	 * @param id ����id
	 * @return ����һ�����¼���
	 */
	public Map<String,Article> findArticleByID(String id);
	/**
	 * ������е����´���
	 * @return ���ش��༯��
	 */
	public List<ArticleBigType> findBigTyep();
	/**
	 * ���ݴ�������ѯС��
	 * @param bigType ��������
	 * @return ����С�༯��
	 */
	public List<ArticleSmallType> findSmallTyep(String bigType);
	/**
	 * ʵʱ�������µ��������
	 * @param look_times ��Ҫ�޸ĵĴ���
	 * @param articleId ����id
	 */
	public void  updateArticleLookTimes(String look_times,String articleId);
}

