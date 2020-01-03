package servlet;

import services.OrderService;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PaiementServlet extends HttpServlet {
    @EJB
    private OrderService orderService;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("sum", orderService.getSum());
        request.getRequestDispatcher("/WEB-INF/paiement.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect(req.getContextPath()+"/products#add");
        orderService.clearLst();
    }
}
