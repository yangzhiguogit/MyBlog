package com.blog.web;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.blog.entity.User;
import com.blog.entity.UserDetails;
import com.blog.service.UserService;

@Component
@RequestMapping("/user")
@SessionAttributes({"msg"})
public class UserController {
	@Resource
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(params="method=index")
	public String index(HttpServletRequest req){
		ServletContext sc=req.getSession().getServletContext();
		sc.removeAttribute("msg");
		String articleBigType="";
		try {
			//通过URLEnCoder.encode对字符串进行编码
			articleBigType=URLEncoder.encode("项目记录", "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/article/mainArticle?articleBigType="+articleBigType+"";
	}
	
	@RequestMapping(value="/login",produces={"application/json;charset=UTF-8"})
	@ResponseBody 
	public String login(HttpServletRequest request,HttpServletResponse response,String lg_name,String pwd){
		List<User> list=this.userService.findUser(lg_name, pwd);
		HttpSession session=request.getSession();
		session.setAttribute("user", list.get(0));
		if(list.size()==1){
			return "true";
		}
		return "false";
	}
	
	
	@RequestMapping(value="/findDetails",method=RequestMethod.GET)
	public String findDetails(String lg_name,String pwd,ModelMap map,HttpServletRequest req){
		//查找用户详细资料
		User user=null;
		UserDetails ud=null;
		//获得application对象
		ServletContext sc=req.getSession().getServletContext();
		
		try {
			user=this.userService.findUser(lg_name, pwd).get(0);
			ud=this.userService.findUserDetails(user,"").get(0);
		} catch (Exception e) {
			//出现下标越界就返回null,没有异常就返回查找的对象
			map.put("msg", ud);
			sc.setAttribute("msg", ud);
			return "main";
		}
		map.put("msg", ud);
		sc.setAttribute("msg", ud);
		
		String articleBigType="";
		try {
			//通过URLEnCoder.encode对字符串进行编码
			articleBigType=URLEncoder.encode("项目记录", "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/article/mainArticle?articleBigType="+articleBigType+"";
		//return "main";
	}
	
	@RequestMapping(value="/reg",produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String reg(String lg_name,String pwd,String phone){
		boolean bl=this.userService.addUser(lg_name, pwd, phone);
		if(bl){
			return "true";
		}else{
			return "false";
		}
		
	}
	
	@RequestMapping(value="/regName",produces={"application/json;charset=UTF-8"})
	@ResponseBody 
	public String regName(String name){
		List<User> list=this.userService.findUser(name, "");
		if(list.size()>0){
			return "true";
		}
		return "false";
	}
	
	@RequestMapping(value="/regPhone",produces={"application/json;charset=UTF-8"})
	@ResponseBody 
	public String regPhone(String phone){
		List<UserDetails> list=this.userService.findUserDetails(new User(), phone);
		if(list.size()>0){
			return "true";
		}
		return "false";
	}
}
