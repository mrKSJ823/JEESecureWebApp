/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ac.za.tut.entity.model.bl;

import ac.za.tut.entity.model.Report;
import ac.za.tut.entity.model.User;
import java.util.List;
import javax.ejb.Local;

/**
 *
 * @author junio
 */
@Local
public interface ReportFacadeLocal {

    void create(Report report);

    void edit(Report report);

    void remove(Report report);

    Report find(Object id);

    List<Report> findAll();

    List<Report> findRange(int[] range);

    int count();
       List<Report> getReportsByUser(String username);
public Long countReportsByUser(String username);
public Long countReportsByCategory(String username, String category);
public Long countReportsByStatus(String username, String status);
public List<Object[]> getReportCountsByCategory(String username);
public List<Object[]> getReportCountsByStatus(String username);

}
