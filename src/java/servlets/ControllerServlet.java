
package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerServlet extends Dispatcher {	
	
	private static final long serialVersionUID = 7150672192654206390L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
        request.setAttribute("dataErrorMessage", "");
        Double x = 0.0, y = 0.0, r = 0.0;
        boolean isDataCorrect = true;
        request.setAttribute("showResult", false);
        try {
            x = Double.parseDouble(request.getParameter("x"));
        }
        catch (NumberFormatException | NullPointerException e){
        	isDataCorrect = false;
                request.setAttribute("dataErrorMessage", request.getAttribute("dataErrorMessage") + "x должен быть вещественным числом<br>");
        }
        try {
            y = Double.parseDouble(request.getParameter("y"));
        }
        catch (NumberFormatException | NullPointerException e){
        	isDataCorrect = false;
                request.setAttribute("dataErrorMessage", request.getAttribute("dataErrorMessage") + "y должен быть вещественным числом<br>");
        }
        try {
            r = Double.parseDouble(request.getParameter("r"));
        }
        catch (NumberFormatException | NullPointerException e){
        	isDataCorrect = false;
                request.setAttribute("dataErrorMessage", request.getAttribute("dataErrorMessage") + "r должен быть вещественным числом <br>");
        }
        request.setAttribute("isDataCorrect", isDataCorrect);
        if (!isDataCorrect) 
        	super.redirectTo("/index.jsp", request, response);
        else super.redirectTo("/app/areaCheckServlet", request, response);
    }


}
