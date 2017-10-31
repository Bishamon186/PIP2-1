package servlets;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Dispatcher")
public class Dispatcher extends HttpServlet {
	private static final long serialVersionUID = 7150672192654206390L;

	public void redirectTo(String path, HttpServletRequest request, HttpServletResponse response){
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(path);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(Dispatcher.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
