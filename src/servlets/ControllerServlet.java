
package servlets;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet(name = "controllerServlet", urlPatterns = {"/controllerServlet"})
public class ControllerServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 7150672192654206390L;

	public void redirectTo(String path, HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(path);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ControllerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
        Double x = 0.0, y = 0.0, r = 0.0;
        
        try {
            x = Double.parseDouble(request.getParameter("x"));
        }
        catch (NumberFormatException | NullPointerException e){
            redirectTo("/index.jsp", request, response);
        }
        try {
            y = Double.parseDouble(request.getParameter("y"));
        }
        catch (NumberFormatException | NullPointerException e){
            redirectTo("/index.jsp", request, response);
        }
        try {
            r = Double.parseDouble(request.getParameter("r"));
        }
        catch (NumberFormatException | NullPointerException e){
            redirectTo("/index.jsp", request, response);
        }
        if (x>= -3 && x <= 3 &&
                (y == -4 || y == -3 || y == -2 || y == -1 || 
                y == 0 || y == 1 || y == 2 || y == 3 || y == 4) &&
                (r == 1 || r == 1.5 || r == 2 || r == 2.5 || r == 3)){
            redirectTo("/areaCheckServlet", request, response);
        }
        else{
            redirectTo("/index.jsp", request, response);
        }
    }


}
