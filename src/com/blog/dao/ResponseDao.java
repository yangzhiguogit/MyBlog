package com.blog.dao;

import java.math.BigInteger;
import java.util.List;

import com.blog.entity.ArticleResponse;

/**
 * 留言dao
 * @author Administrator
 *
 */
public interface ResponseDao {
	/**
	 * 添加留言信息
	 * @param value 留言内容
	 * @param articleId 文章id
	 * @param from_userId 回复用户id
	 * @param date 添加时间
	 * @param to_userId 被@的用户id
	 * @return true-添加成功,false-添加失败
	 */
	public boolean addResponse(String value,String articleId,String from_userId,String date,String to_userId);
	/**
	 * 根据给定的参数来查询回复内容
	 * @param articleId 文章id
	 * @param to_userId 用户id
	 * @return 返回回复集合
	 */
	public List<ArticleResponse> findResponse(String articleId,String to_userId);
	
	/**
	 *  根据文章编号获取文章的留言条数
	 * @param articleId
	 * @return
	 */
	public int getResponseTimes(String articleId);
}
