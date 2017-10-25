package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "areaCheckServlet", urlPatterns = {"/areaCheckServlet"})
public class AreaCheckServlet extends HttpServlet {

    /**
	 * 
	 */
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
        response.setContentType("text/html");
        response.setStatus(HttpServletResponse.SC_OK);
        PrintWriter out = response.getWriter();
        Double x = 0.0, y = 0.0, r = 0.0;
        boolean isDataCorrect = true, strike = false;

        try {
            x = Double.parseDouble(request.getParameter("x"));
        }
        catch (NumberFormatException | NullPointerException e){
            isDataCorrect = false;
        }
        try {
            y = Double.parseDouble(request.getParameter("y"));
        }
        catch (NumberFormatException | NullPointerException e){
        	isDataCorrect = false;
        }
        try {
            r = Double.parseDouble(request.getParameter("r"));
        }
        catch (NumberFormatException | NullPointerException e){
        	isDataCorrect = false;
        }
        if (x>= -3 && x <= 3 &&
                (y == -4 || y == -3 || y == -2 || y == -1 || 
                y == 0 || y == 1 || y == 2 || y == 3 || y == 4) &&
                (r == 1 || r == 1.5 || r == 2 || r == 2.5 || r == 3) &&
                isDataCorrect){
        	
        	strike = checkArea(x, y, r);
        	out.write("Coordinats: (" + x + "; " + y + "), radius: " + r + "<br>");
        	if (strike) {
            	out.write("Point strikes in area <br>");
            }
            else out.write("Point doesn't strike in area <br>");
        }
        else out.write("Incorrect data");
    }

}
