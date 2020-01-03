package domaine;

public class ProductOrdered {
    private Product product;
    private int quantity;

    public ProductOrdered(Product product) {
        this.product = product;
        this.quantity = 1;
    }

    public Product getProduct() {
        return product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void addQuantity() {
        quantity++;
    }
    public void removeQuantity() {
        quantity--;
    }

    public Double total() {
        return product.getFare() * quantity;
    }
}
