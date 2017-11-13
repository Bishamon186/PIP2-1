package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xml.internal.utils.URI;


//@WebServlet(name = "areaCheckServlet", urlPatterns = {"/areaCheckServlet"})
public class AreaCheckServlet extends Dispatcher {

	
	private static final long serialVersionUID = 7150672192654206390L;
	private boolean checkArea(double x, double y, double r) {
		if (x <=0 ) {
        	if (y<=0) {
        		if (x >= -r/2 && y <= -r) return true;
        	}
        	else if (x <= y + r) return true;           		
        }
        else if (y >=0 && x*x + y*y <= r*r) return true;
        return false;        
	}
	
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        Double x = 0.0, y = 0.0, r = 0.0;
        boolean strike = false;
        x = Double.parseDouble(request.getParameter("x"));
        y = Double.parseDouble(request.getParameter("y"));
        r = Double.parseDouble(request.getParameter("r"));
        if (x>= -3 && x <= 3 &&
                (y >= -4  && y <= 4) &&
                (r == 1 || r == 1.5 || r == 2 || r == 2.5 || r == 3)){
            strike = checkArea(x, y, r);
            request.setAttribute("showResult", true);
            request.setAttribute("strike", strike);
        }
        else {
            request.setAttribute("showResult", false);
            request.setAttribute("isDataCorrect", false);
            request.setAttribute("strike", false);
        }
        super.redirectTo("/index.jsp", request, response);
    }

}
