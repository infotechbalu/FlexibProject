package Flexib;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SecurityDemo myClass = new SecurityDemo();
		System.out.println("Hello");
        if (request.getParameter("button1") != null) {
            SecurityDemo.startDemo();
        } 
        request.getRequestDispatcher("/WEB-INF/test.jsp").forward(request, response);
    }

}
