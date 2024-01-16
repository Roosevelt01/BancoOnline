package web;

import bean.AccountBank;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.*;

@WebServlet("/Transfer")
public class Online extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        AccountBank account = (AccountBank) session.getAttribute("account");
        if (account == null) {
            account = new AccountBank();
            session.setAttribute("account", account);
        }

        if (request.getParameter("accion").equals("depositar")) {
            double monto = Double.parseDouble(request.getParameter("monto"));
            account.depositar(monto);
        } else if (request.getParameter("accion").equals("saldo")) {
            double saldo = account.verSaldo();
            session.setAttribute("saldo", saldo);
        } else if (request.getParameter("accion").equals("retirar")) {
            double monto = Double.parseDouble(request.getParameter("monto"));
            account.retirar(monto);
        } else if (request.getParameter("accion").equals("transferir")) {
            double monto = Double.parseDouble(request.getParameter("monto"));
            AccountBank cuentaDestino = new AccountBank();
            session.setAttribute("cuentaDestino", cuentaDestino);
            account.transferir(monto, cuentaDestino);
        }

        response.sendRedirect("online.jsp");
    }

}
