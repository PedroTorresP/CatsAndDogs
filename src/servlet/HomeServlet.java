package servlet;

import domaine.Product;
import services.ProductService;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class HomeServlet extends HttpServlet {
    @EJB
    private ProductService productService;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> products = productService.allProduct();
        if (products != null) {
            products = products.subList(0, 3);
        }
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
    }



}
