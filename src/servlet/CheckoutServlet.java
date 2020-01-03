package servlet;

import domaine.Product;
import domaine.ProductOrdered;
import services.OrderService;
import services.ProductService;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CheckoutServlet extends HttpServlet {
    @EJB
    private OrderService orderService;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession s = req.getSession();
        if (req.getParameter("prodId") != null) {
            orderService.addProduct(Integer.parseInt(req.getParameter("prodId")));
            resp.sendRedirect(req.getContextPath()+"/"+req.getParameter("whereIFrom"));
        } else if (req.getParameter("addProdId") != null) {
           orderService.addQuantityProduct(Integer.parseInt(req.getParameter("addProdId")));
            resp.sendRedirect(req.getContextPath()+"/checkout");
        } else if (req.getParameter("removeProdId") != null) {
            orderService.removeQuantityProduct(Integer.parseInt(req.getParameter("removeProdId")));
            resp.sendRedirect(req.getContextPath()+"/checkout");
        } else if (req.getParameter("delProdId") != null) {
            orderService.removeProduct(Integer.parseInt(req.getParameter("delProdId")));
            resp.sendRedirect(req.getContextPath()+"/checkout");
        }
        s.setAttribute("checkoutList", orderService.getList());
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession();
        request.setAttribute("checkoutList", s.getAttribute("checkoutList") != null ? (List<Product>) s.getAttribute("checkoutList"):new ArrayList<Product>());
        request.getRequestDispatcher("/WEB-INF/checkout.jsp").forward(request, response);
    }
}
