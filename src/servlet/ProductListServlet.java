package servlet;

import domaine.Product;
import services.ProductService;

import javax.ejb.EJB;
import java.io.IOException;
import java.util.List;

public class ProductListServlet extends javax.servlet.http.HttpServlet {
    @EJB
    private ProductService productService;
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        List<Product> products = productService.allProduct();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/productList.jsp").forward(request, response);
    }
}
