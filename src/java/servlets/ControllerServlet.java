
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "controllerServlet", urlPatterns = {"/app/controllerServlet"})
public class ControllerServlet extends Dispatcher {	
	
	private static final long serialVersionUID = 7150672192654206390L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
        Double x = 0.0, y = 0.0, r = 0.0;
        boolean isDataCorrect = true;
        request.setAttribute("showResult", false);
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
                isDataCorrect ){
        	isDataCorrect = true;
        }
        else{
        	isDataCorrect = false;
        }
        request.setAttribute("isDataCorrect", isDataCorrect);
        if (!isDataCorrect) 
        	super.redirectTo("/index.jsp", request, response);
        else super.redirectTo("/app/areaCheckServlet", request, response);
    }


}
