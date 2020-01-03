package services;

import domaine.Product;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import java.util.List;

@Stateless
public class ProductService {
    @PersistenceContext
    private EntityManager em;

    public void save(Product p) {em.persist(p);}

    public List<Product> allProduct() {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Product> cq = cb.createQuery(Product.class);
        cq.from(Product.class);
        TypedQuery<Product> q = em.createQuery(cq);
        return q.getResultList();
    }

    public Product getProduct(int id){
        return em.find(Product.class,id);
    }

    public void update(Product p){
        em.createQuery("UPDATE Product p " +
                "SET p.name=:name, p.description=:description, p.fare=:fare, " +
                "p.urlPictureOne=:urlPictureOne, p.urlPictureTwo=:urlPictureTwo" +
                " WHERE p.id=:id")
                .setParameter("name",p.getName())
                .setParameter("description",p.getDescription())
                .setParameter("fare",p.getFare())
                .setParameter("urlPictureOne",p.getUrlPictureOne())
                .setParameter("urlPictureTwo",p.getUrlPictureTwo())
                .setParameter("id",p.getId())
                .executeUpdate();
    }

    public void delete(Long id) {
        Product p = em.find(Product.class,id);
        em.remove(p);
    }
}
