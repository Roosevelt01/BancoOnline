
package web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {

    private static final String USSER = "Daniela";
    private static final String PASS = "blindma1den";
    private static final int ATTEMP = 3;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String usser = request.getParameter("usuario");
        String pass = request.getParameter("password");

        HttpSession session = request.getSession();

        Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");

        if (loginAttempts == null) {
            loginAttempts = 0;
        }

        if (USSER.equals(usser) && PASS.equals(pass)) {
            session.setAttribute("usuario", usser);
            session.setAttribute("contraseña",pass);
            session.removeAttribute("loginAttempts");
            response.sendRedirect("online.jsp");
        } else {
            loginAttempts++;
            session.setAttribute("loginAttempts", loginAttempts);
            
            if (loginAttempts >= ATTEMP) {
                response.sendRedirect("locked.jsp");
            }else{
            response.sendRedirect("index.jsp?loginAttempts=" + loginAttempts);
            }
        }

    }

}
