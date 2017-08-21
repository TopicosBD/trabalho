import java.util.Date;
import negocio.*;
import org.hibernate.Session;
import util.*;

public class Teste extends util.HibernateUtil{
    
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Date data = new Date();
        
        Medico medico = new Medico(123, "dwd", "8768", "iughiu", data, "uifgaef");
        
        session.beginTransaction();
        session.save(medico);
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    
}
