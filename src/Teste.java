import java.util.Date;
import java.util.Set;
import negocio.*;
import org.hibernate.Session;
import util.*;

public class Teste extends util.HibernateUtil{
    
    //Teste de persistência em tabelas intermediárias
    public static void main(String[] args) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Date data = new Date();
        
        //Medico medico = new Medico(123, "dwd", "8768", "iughiu", data, "uifgaef");
        Cargo cargo = new Cargo("Pedreiro");
        RiscosOcupacionais rc = new RiscosOcupacionais("Morte");
        rc.getCargos().add(cargo);
        
        session.beginTransaction();
        //session.save(medico);
        session.save(cargo);
        session.save(rc);
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    
}
