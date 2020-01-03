package servlet;

import domaine.Product;
import services.ProductService;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProductServlet extends HttpServlet {
    @EJB
    private ProductService productService;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] uri = request.getRequestURI().split("/");
        String id = uri[uri.length-1];
        Product product = productService.getProduct(Integer.parseInt(id));
        request.setAttribute("productName", product != null ? product.getName() : "");
        request.setAttribute("productId", product != null ? product.getId() : "");
        request.setAttribute("productPicture1", product != null ? product.getUrlPictureOne() : "");
        request.setAttribute("productDescription", product != null ? product.getFullDescription() : "");
        request.setAttribute("productFare", product != null ? product.getFare() : "");
        request.setAttribute("productPicture2", product != null ? product.getUrlPictureTwo() : "");
        request.getRequestDispatcher("/WEB-INF/productDetail.jsp").forward(request, response);
    }
}
