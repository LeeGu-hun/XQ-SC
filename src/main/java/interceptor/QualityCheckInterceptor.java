package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import spring.AuthInfo;

public class QualityCheckInterceptor 
		extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session != null) {
			AuthInfo auth = (AuthInfo)session.getAttribute("authInfo");
			if(auth.getDepart().equals("ADMIN") || auth.getDepart().equals("QUALITY")) {
				return true;
			}else {
				response.sendRedirect(request.getContextPath()+"/main");
				return false;
			}
		}
		response.sendRedirect(request.getContextPath()+"/login");
		return false;
	}

}
