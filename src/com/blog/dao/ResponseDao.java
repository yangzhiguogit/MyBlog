package com.blog.dao;

import java.math.BigInteger;
import java.util.List;

import com.blog.entity.ArticleResponse;

/**
 * ����dao
 * @author Administrator
 *
 */
public interface ResponseDao {
	/**
	 * ���������Ϣ
	 * @param value ��������
	 * @param articleId ����id
	 * @param from_userId �ظ��û�id
	 * @param date ���ʱ��
	 * @param to_userId ��@���û�id
	 * @return true-��ӳɹ�,false-���ʧ��
	 */
	public boolean addResponse(String value,String articleId,String from_userId,String date,String to_userId);
	/**
	 * ���ݸ����Ĳ�������ѯ�ظ�����
	 * @param articleId ����id
	 * @param to_userId �û�id
	 * @return ���ػظ�����
	 */
	public List<ArticleResponse> findResponse(String articleId,String to_userId);
	
	/**
	 *  �������±�Ż�ȡ���µ���������
	 * @param articleId
	 * @return
	 */
	public int getResponseTimes(String articleId);
}
