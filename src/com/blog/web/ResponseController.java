package com.blog.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.entity.Article;
import com.blog.entity.ArticleResponse;
import com.blog.entity.UserAllInfo;
import com.blog.service.ArticleService;
import com.blog.service.ResponseService;
import com.blog.service.UserService;

@Component
@RequestMapping(value="/response")
public class ResponseController {
	@Resource
	private ResponseService rs;
	@Resource
	private ArticleService as;
	@Resource
	private UserService us;
	public void setRs(ResponseService rs) {
		this.rs = rs;
	}
	public void setAs(ArticleService as) {
		this.as = as;
	}
	public void setUs(UserService us) {
		this.us = us;
	}


	//回复文章
	@RequestMapping(value="/responseToArticle",produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, Object> addResponseToArticle(String value, String articleId, String from_userId){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=sdf.format(new Date());
		boolean bl=false;
		Map<String, Object> map=new HashMap<String, Object>();
		if(!value.equals("0")){
			bl=this.rs.addResponse(value, articleId, from_userId, null, date);
		}
		
			List<ArticleResponse> response=this.rs.findResponse(articleId, null);
			Map<String,Article> article=this.as.findArticleByID(articleId);
			article.get("center").setResponse(this.rs.getResponseTimes(articleId));
		
			List<UserAllInfo> user=this.us.findUserDetailsById(from_userId);
			
			map.put("response", response);
			map.put("article", article.get("center"));
			map.put("user", user);
			return map;
	}
	
	//回复文章中的用户
	@RequestMapping(value="/responseToUser",produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public Map<String, Object> addResponseToUser(String value, String articleId, String from_userId, String to_userId){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date=sdf.format(new Date());
		boolean bl=false;
		Map<String, Object> map=new HashMap<String, Object>();
		if(!value.equals("0")){
			bl=this.rs.addResponse(value, articleId, from_userId, to_userId, date);
		}
		
			List<ArticleResponse> response=this.rs.findResponse(articleId, to_userId);
			Map<String,Article> article=this.as.findArticleByID(articleId);
			article.get("center").setResponse(this.rs.getResponseTimes(articleId));
		
			List<UserAllInfo> user=this.us.findUserDetailsById(from_userId);
			
			map.put("response", response);
			map.put("article", article.get("center"));
			map.put("user", user);
			return map;
	}
}
