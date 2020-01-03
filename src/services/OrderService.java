package services;

import domaine.Product;
import domaine.ProductOrdered;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import java.util.ArrayList;
import java.util.List;

@Stateless
public class OrderService {
    @EJB
    private ProductService productService;
    private List<ProductOrdered> checkout = new ArrayList<>();

    public List<ProductOrdered> getList(){
        return checkout;
    }

    public void addProduct(int productId){
        Product product = productService.getProduct(productId);
        ProductOrdered productOrdered = searchProductOrdered(product);
        if (productOrdered != null) {
            addQuantityProduct(productId);
        } else {
            checkout.add(new ProductOrdered(product));
        }
    }
    public void addQuantityProduct(int productId) {
        Product product = productService.getProduct(productId);
        ProductOrdered productOrdered = searchProductOrdered(product);
        productOrdered.addQuantity();
    }
    public void removeQuantityProduct(int productId) {
        Product product = productService.getProduct(productId);
        ProductOrdered productOrdered = searchProductOrdered(product);
        if (!(productOrdered.getQuantity() - 1 <1)) {
            productOrdered.removeQuantity();
        }
    }
    public void removeProduct(int productId) {
        Product product = productService.getProduct(productId);
        removeFromLst(product);
    }
    private ProductOrdered searchProductOrdered(Product product) {
        for (ProductOrdered productOrdered: checkout) {
            if (productOrdered.getProduct().equals(product)) {
                return productOrdered;
            }
        }
        return null;
    }

    public int countProduct(){
        int nb = 0;
        for (ProductOrdered productOrdered: checkout) {
            nb += productOrdered.getQuantity();
        }
        return nb;
    }

    private void removeFromLst(Product product) {
        int i = 0;
        for (ProductOrdered productOrdered: checkout) {
            if (productOrdered.getProduct().equals(product)) {
                break;
            }
            i++;
        }
        checkout.remove(i);
    }

    public void clearLst(){
        checkout.clear();
    }

    public Double getSum(){
        Double sum = 0.0;
        for (ProductOrdered productOrdered: checkout) {
            sum += productOrdered.total();
        }
        return sum;
    }

}
