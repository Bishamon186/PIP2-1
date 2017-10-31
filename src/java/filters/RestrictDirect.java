package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebFilter;


@WebFilter("/RestrictDirect")
public class RestrictDirect implements Filter {


	public void destroy() {
		
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String referer = "";
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpServletRequest req = (HttpServletRequest) request;
		try
		{
			referer = req.getHeader("referer");
		}
		catch(NullPointerException e) {
			resp.sendRedirect("/Lab/index.jsp");
        	return;
		}
		if (referer == null)  {
			resp.sendRedirect("/Lab/index.jsp");
        	return;
		}
		if (referer.endsWith("/Lab/index.jsp") || referer.endsWith("/Lab/")) {
			chain.doFilter(request, response);
		}
		else {
			resp.sendRedirect("/Lab/index.jsp");
        	return;
		}
			
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
