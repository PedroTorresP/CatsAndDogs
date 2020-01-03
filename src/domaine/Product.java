package domaine;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name="products")
public class Product {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String description;
    private String urlPictureOne;
    private String urlPictureTwo;
    private Double fare;

    public Product(){}

    public Product(String name, String description, String urlPictureOne, String urlPictureTwo, Double fare) {
        this.name = name;
        this.description = description;
        this.urlPictureOne = urlPictureOne;
        this.urlPictureTwo = urlPictureTwo;
        this.fare = fare;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        if (description.length() > 70) {
            return description.substring(0, 70) + "...";
        } else {
            return description;
        }
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUrlPictureOne() {
        return urlPictureOne;
    }

    public void setUrlPictureOne(String urlPictureOne) {
        this.urlPictureOne = urlPictureOne;
    }

    public String getUrlPictureTwo() {
        return urlPictureTwo;
    }

    public void setUrlPictureTwo(String urlPictureTwo) {
        this.urlPictureTwo = urlPictureTwo;
    }

    public Double getFare() {
        return fare;
    }

    public void setFare(Double fare) {
        this.fare = fare;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Product)) return false;
        Product product = (Product) o;
        return id == product.id;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "Product{" +
                "name='" + name + '\'' +
                ", fare=" + fare +
                '}';
    }

    public String getFullDescription() {
        return this.description;
    }
}
