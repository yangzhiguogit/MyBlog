package com.blog.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.blog.entity.Article;
import com.blog.entity.ArticleBigType;
import com.blog.entity.ArticleResponse;
import com.blog.entity.ArticleSmallType;
import com.blog.entity.UserAllInfo;
import com.blog.entity.UserDetails;
import com.blog.service.ArticleService;
import com.blog.service.ResponseService;
import com.blog.service.UserService;

/**
 * 文章控制类
 * @author Administrator
 *
 */
@Component
@RequestMapping(value="/article")
public class ArticleController {
	@Resource
	private ArticleService as;
	@Resource
	private UserService us;
	@Resource
	private ResponseService rs;
	
	public void setAs(ArticleService as) {
		this.as = as;
	}

	public void setUs(UserService us) {
		this.us = us;
	}
	public void setRs(ResponseService rs) {
		this.rs = rs;
	}

	@RequestMapping(value="/mainArticle")
	public String findArticleToMain(String articleBigType,
			String articleSmallType,ModelMap map,HttpServletRequest req){
		String bigType="";
		try {
			//解码3中方法，1
			bigType=new String(articleBigType.getBytes("ISO-8859-1"), "UTF-8");
			//2.req.setCharsetEncoding("utf-8")
			//3.通过URLDecoder.decode对字符串进行解码,不知道为什么没有解码成功
			//bigType=URLDecoder.decode(articleBigType,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		List<Article> articleList=as.findArticle(bigType, articleSmallType);
		map.put("articleList", articleList);
		return "main";
	}
	
	@RequestMapping(value="/recordArticle",produces={"application/json;charset=UTF-8"})
	public @ResponseBody Map<String, Object> findArticleToRecord(String articleBigType,
			String articleSmallType){
		List<Article> articleList=as.findArticle(articleBigType, articleSmallType);
		List<UserDetails> user=new ArrayList<UserDetails>();
		for (Article article : articleList) {
			user.add(article.getUser().getUd());
			article.setResponse(this.rs.getResponseTimes(article.getId()+""));
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("articleList", articleList);
		map.put("user", user);
		return map;
	}
	
	@RequestMapping(value="/findType")
	public String findType(ModelMap map){
		List<ArticleBigType> bigList=this.as.findBigTyep();
		
		Map<String, List<ArticleSmallType>> smallMap=new HashMap<String, List<ArticleSmallType>>();
		for (ArticleBigType articleBigType : bigList) {
			smallMap.put(articleBigType.getName(), this.as.findSmallTyep(articleBigType.getName()));
		}
		List<Article> articleList=as.findArticle(null, null);
		for (Article article : articleList) {
			article.setResponse(this.rs.getResponseTimes(article.getId()+""));
		}
		map.put("articleList", articleList);
		map.put("bigList", bigList);
		map.put("smallMap", smallMap);
		return "record";
	}
	
	@RequestMapping(value="/getDetails")
	public String getDetails(String id,ModelMap map,HttpServletResponse response){
		response.setContentType("text/html;charset=UTF-8");
		
		Map<String,Article> articleMap=this.as.findArticleByID(id);
		articleMap.get("center").setResponse(this.rs.getResponseTimes(id));
		int look_times=articleMap.get("center").getLook_times();
		look_times+=1;
		this.as.updateArticleLookTimes(look_times+"", id);
		List<ArticleResponse> responseList=this.rs.findResponse(id, null);
		
		map.put("articleMap", articleMap);
		map.put("responseList", responseList);
		return "details";
	}
	
	
	@RequestMapping(value="/clickMore",produces={"application/json;charset=UTF-8"})
	public @ResponseBody Map<String, Object> clickMore(String articleSmallType){
		List<Article> articleList=new ArrayList<Article>();
		List<UserDetails> user=new ArrayList<UserDetails>();
		if(articleSmallType==""){
			articleList=as.findArticle(null, null);
			for (Article article : articleList) {
				user.add(article.getUser().getUd());
				article.setResponse(this.rs.getResponseTimes(article.getId()+""));
			}
		}else{
			articleList=as.findArticle(null, articleSmallType);
			for (Article article : articleList) {
				user.add(article.getUser().getUd());
				article.setResponse(this.rs.getResponseTimes(article.getId()+""));
			}
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("articleList", articleList);
		map.put("user", user);
		
		return map;
	}
}
