package com.ssm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object arg2) throws Exception {
		// TODO Auto-generated method stub
		String ContextPath = req.getRequestURI();
		System.out.println("================"+ContextPath);
		HttpSession session = req.getSession();
		String o = (String)session.getAttribute("uid");
		if(o == null) {
			System.out.println("not login");
			req.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(req, resp);
			
			return false;
		}else {
			System.out.println("ok!");
			return true;
		}
		
	}

}
