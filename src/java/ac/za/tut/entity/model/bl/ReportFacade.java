/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.entity.model.bl;

import ac.za.tut.entity.model.Report;
import ac.za.tut.entity.model.User;
import java.util.Collections;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

/**
 *
 * @author junio
 */
@Stateless
public class ReportFacade extends AbstractFacade<Report> implements ReportFacadeLocal {

    @PersistenceContext(unitName = "SecureAppEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReportFacade() {
        super(Report.class);
    }
@Override
public List<Report> getReportsByUser(String username) {
    TypedQuery<Report> query = em.createQuery("SELECT r FROM Report r WHERE r.submittedBy = :user", Report.class);
    query.setParameter("user", username);  // Set username or user ID
    return query.getResultList();
}

@Override
public Long countReportsByUser(String username) {
    return em.createQuery("SELECT COUNT(r) FROM Report r WHERE r.submittedBy = :user", Long.class)
             .setParameter("user", username)
             .getSingleResult();
}

@Override
public Long countReportsByCategory(String username, String category) {
    return em.createQuery("SELECT COUNT(r) FROM Report r WHERE r.submittedBy = :user AND r.category = :category", Long.class)
             .setParameter("user", username)
             .setParameter("category", category)
             .getSingleResult();
}

@Override
public Long countReportsByStatus(String username, String status) {
    return em.createQuery("SELECT COUNT(r) FROM Report r WHERE r.submittedBy = :user AND r.status = :status", Long.class)
             .setParameter("user", username)
             .setParameter("status", status)
             .getSingleResult();
}

@Override
public List<Object[]> getReportCountsByCategory(String username) {
    return em.createQuery("SELECT r.category, COUNT(r) FROM Report r WHERE r.submittedBy = :user GROUP BY r.category", Object[].class)
             .setParameter("user", username)
             .getResultList();
}

@Override
public List<Object[]> getReportCountsByStatus(String username) {
    return em.createQuery("SELECT r.status, COUNT(r) FROM Report r WHERE r.submittedBy = :user GROUP BY r.status", Object[].class)
             .setParameter("user", username)
             .getResultList();
}

}


