package ac.za.tut.entity.model.bl;

import ac.za.tut.entity.model.User;
import java.util.List;
import javax.ejb.Local;

@Local
public interface UserFacadeLocal {

    void create(User user);

    void edit(User user);

    void remove(User user);

    User find(Object id);

    List<User> findAll();

    List<User> findRange(int[] range);

    int count();
    
    // Add the login method to authenticate users
    User login(String username, String password);
}
