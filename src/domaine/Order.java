package domaine;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.HashMap;

public class Order {

    private int id;
    private HashMap<Product, Integer> map;

    public Order(int id) {
        this.id = id;
        this.map = new HashMap<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public HashMap<Product, Integer> getLst() {
        return map;
    }

    public void setLst(HashMap<Product, Integer> map) {
        this.map = new HashMap<>(map);
    }

    public void addProduct(Product product) {
        if (map.containsKey(product)) {
            Integer qty = map.get(product);
            qty++;
            map.put(product, qty);
        } else {
            map.put(product, 1);
        }
    }

    public void removeProduct(Product p) {
        map.remove(p);
    }
}
