package mvc.test.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import mvc.test.controller.domain.AdminVO;


public class adminInterceptor implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handle) throws Exception {

	    HttpSession httpSession = request.getSession();
	    AdminVO adminVO = (AdminVO)httpSession.getAttribute("admin");

	    String requestURI = request.getRequestURL().toString();
	    System.out.println("requestURI : " + requestURI);
	    System.out.println("session : " + adminVO);
	    if (requestURI.endsWith("adminLogin") || requestURI.endsWith("adminLoginCheck")) {
	    	System.out.println();
	    	return true;
	    }if (adminVO == null) {
	    	PrintWriter printwriter = response.getWriter();
	    	printwriter.print("<script>alert('로그인이 필요합니다.);</script>");
	    	response.sendRedirect("adminLogin");
	    	
	    	return false;
	    }
	    return true;
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)	throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
	}
	
}
