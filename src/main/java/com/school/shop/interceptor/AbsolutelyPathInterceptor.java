package com.school.shop.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//HandlerInterceptorAdapter是单例 所有变量会被共享
//you can implements ServletContextAware to get servletContext, the servletContext is application scope.
public class AbsolutelyPathInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {


		request.setAttribute("absoluteContextPath", getAbsolutelypath(request));
		return super.preHandle(request, response, handler);
	}

	private String getAbsolutelypath(HttpServletRequest request) {
		String absoluteContextPath;
		if (request.getServerPort() == 80) {
			absoluteContextPath = "http://" + request.getServerName()
					+ request.getContextPath();
		} else if (request.getServerPort() == 443) {
			absoluteContextPath = "https://" + request.getServerName()
					+ request.getContextPath();
		} else {
			absoluteContextPath = "http://" + request.getServerName() + ":"
					+ request.getServerPort() + request.getContextPath();
		}
		//
//		System.out.println("absoluteContextPath="+absoluteContextPath);
		return absoluteContextPath;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}