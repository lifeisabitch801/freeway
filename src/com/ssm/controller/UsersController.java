package com.ssm.controller;


import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ssm.pojo.Menu;
import com.ssm.pojo.Role_Menu;
import com.ssm.pojo.Users;
import com.ssm.service.MenuService;
import com.ssm.service.Role_MenuService;
import com.ssm.service.UsersService;


@Controller
@RequestMapping("users")
public class UsersController {
	
	@Autowired
	private UsersService uservice;
	@Autowired
	private MenuService meservice;
	@Autowired
	private Role_MenuService rmservice;
	//TO LOGIN
	@RequestMapping("tologin")
	public String toLogin(){
		
		return "login";
	}
	
	//LOGIN
	@RequestMapping("login")
	public String login(String uid,String upwd,Model model,HttpSession session,HttpSession session1,HttpSession session2){
		Users users = uservice.selectByUid(uid);
		if(users == null) {
			model.addAttribute("msg1", "用户账号错误!");
			return "login";
		}else if(users != null && ! users.getUpwd().equals(upwd)) {
			model.addAttribute("msg2","密码错误!");
			return "login";
		}else {
			session.setAttribute("uid", users.getUid());
			session.setAttribute("users",users);
			List<Role_Menu> rmlist = rmservice.selectByRoid(users.getUrole());
			List<Menu> melist = meservice.selectByMeid();
			//model.addAttribute("melist", melist);
			model.addAttribute(users);
			//model.addAttribute("rmlist", rmlist);
			List<Menu> menulist = new ArrayList();
			for(int i=0;i<melist.size();i++) {
				for(int j=0;j<rmlist.size();j++) {
					if(melist.get(i).getMeid()==rmlist.get(j).getMeid()) {
						menulist.add(melist.get(i));
					}
				}
			}
			session2.setAttribute("menulist", menulist);
			//model.addAttribute("menulist", menulist);
			for(Menu m : menulist) {
				System.out.println(m);
			}
			return mainPage(session,model);
		}
	}
	//TO LOGOUT
	@RequestMapping("tologout")
	public String toLogout() {
		return "logout";
	}
	
//	@public String nav() {
//		
//	}
	//MAIN
	@RequestMapping("mainpage")
	public String mainPage(HttpSession session,Model model){
		String uidstr = (String) session.getAttribute("uid");
		Users users = uservice.selectByUid(uidstr);
//		List<Role_Menu> rmlist = rmservice.selectByRoid(users.getUrole());
//		List<Menu> melist = meservice.selectByMeid();
//		//model.addAttribute("melist", melist);
		model.addAttribute(users);
//		//model.addAttribute("rmlist", rmlist);
//		List<Menu> menulist = new ArrayList();
//		for(int i=0;i<melist.size();i++) {
//			for(int j=0;j<rmlist.size();j++) {
//				if(melist.get(i).getMeid()==rmlist.get(j).getMeid()) {
//					menulist.add(melist.get(i));
//				}
//			}
//		}
//		model.addAttribute("menulist", menulist);
//		for(Menu m : menulist) {
//			System.out.println(m);
//		}
		return "main";
	}
	//TO UPDATE UER PWD
	@RequestMapping("toupdateupwd")
	public String toUpdateUpwd() {
		
		return "updateupwd";
	} 
	
	//VALID UPWD
		@ResponseBody
		@RequestMapping("validupwd")
		public String validUpwd(String oldupwd,HttpSession session) {
			String str = (String) session.getAttribute("uid");
			Users u = uservice.selectByUid(str);
			if(u.getUpwd().equals(oldupwd)) {
				return "ok";
			}else {
				return "error";
			}
		}
		
	
		
	//UPDATE USERS--PASSWORD
	@RequestMapping("updateupwd")
	public String updateUpwd(String uid,String oldupwd,String upwd,String reupwd,Model model,HttpSession session) {
		Users users = uservice.selectByUid(uid);
		if(users.getUpwd().equals(oldupwd)) {
			if(upwd.equals(reupwd)&& !upwd.equals(oldupwd)) {
				users.setUpwd(upwd);
				uservice.updateUpwd(users);
			}else if(upwd.equals(reupwd)&& !upwd.equals(oldupwd)) {
				model.addAttribute("msg2", "NEW PASSWORD IS REPEAT!");
			}
		}else {
			model.addAttribute("msg1", "PASSWORD IS ERROR");
		}
		
		//return mainPage(session,model);
		return null;
	}
	//UPDATE USER--FACE
	
	//TOUPDATE USER--INFO
	@RequestMapping("toupdateuserinfo")
	public String toUpdateUserInfo(HttpSession session,Model model){
		String uidstr = (String) session.getAttribute("uid");
		Users users = uservice.selectByUid(uidstr);
		model.addAttribute(users);
		return "updateuinfo";
	}
	//UPDATE USER--INFO
	@RequestMapping("updateuserinfo")
	public String updateUserInfo(MultipartFile nuface,Users users,String olduface,Model model,HttpSession session)throws Exception {

		if(!nuface.isEmpty()){
			String filename = UUID.randomUUID().toString();
			int index = nuface.getOriginalFilename().lastIndexOf(".");
			String ext = nuface.getOriginalFilename().substring(index);
			File dest = new File("D:\\img",filename+ext);
			nuface.transferTo(dest);
			String fileurl = "/pic/"+filename+ext;
			users.setUface(fileurl);
		}else {
			users.setUface(olduface);
		}
		uservice.updateUserInfo(users);
		//return mainPage(session,model);
		return null;
	}
	//TO UPDATE USER UFACE
	@RequestMapping("toupdateuseruface")
	public String toUpdateUserUface(HttpSession session,Model model){
		String uidstr = (String) session.getAttribute("uid");
		Users users = uservice.selectByUid(uidstr);
		model.addAttribute(users);
		return "updateuface";
	}
	//UPDATE USER UFACE
	@RequestMapping("updateuseruface")
	public String updateUserUface(MultipartFile nuface,Users users,String olduface,HttpSession session,Model model)throws Exception {

		if(!nuface.isEmpty()){
			String filename = UUID.randomUUID().toString();
			int index = nuface.getOriginalFilename().lastIndexOf(".");
			String ext = nuface.getOriginalFilename().substring(index);
			File dest = new File("D:\\img",filename+ext);
			nuface.transferTo(dest);
			String fileurl = "/pic/"+filename+ext;
			users.setUface(fileurl);
		}else {
			users.setUface(olduface);
		}
		uservice.updateUserUface(users);
		//uservice.updateUserInfo(users);
		//return mainPage(session,model);
		return null;
	}
	
}
