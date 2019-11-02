package kr.ac.exlang.utill;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		/**
	 	 * @brief Session에 있는 login_id의 값을 체크하여 존재하지 않으면 login을 매핑으로 하는 컨트롤러로 다시 보내준다.
	 	 */
		if(session.getAttribute("login_id") == null) {
			
			response.sendRedirect("/login");
		
			return false;
		}
		
		return true;
	}
}
