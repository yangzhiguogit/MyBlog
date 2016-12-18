package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.blog.dao.ResponseDao;
import com.blog.entity.ArticleResponse;
import com.blog.service.ResponseService;

@Component
public class ResponseServiceImpl implements ResponseService{

	@Resource
	private ResponseDao rd;
	
	
	public void setRd(ResponseDao rd) {
		this.rd = rd;
	}


	@Override
	public boolean addResponse(String value, String articleId,
			String from_userId, String to_userId, String date) {
		return rd.addResponse(value, articleId, from_userId, to_userId, date);
	}


	@Override
	public List<ArticleResponse> findResponse(String articleId, String to_userId) {
		return rd.findResponse(articleId, to_userId);
	}


	@Override
	public int getResponseTimes(String articleId) {
		return rd.getResponseTimes(articleId);
	}
	

	

}
