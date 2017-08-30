/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import negocio.Cargo;
import util.HibernateUtil;

import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class CargoDAO extends HibernateUtil {
    
    private Cargo cargo = new Cargo();
    private int cargoId;
    private String cargoNome;
    private List<Cargo> cargos;
    private Map<String, Integer> cargoMap;

    public CargoDAO() {
    }
    
    public CargoDAO(Cargo cargo) {
        this.cargo = cargo;
    }

    public Map<String, Integer> getCargoMap() {
        return cargoMap;
    }

    public void setCargoMap(Map<String, Integer> cargoMap) {
        this.cargoMap = cargoMap;
    }
    
    public String getCargoNome() {
        return cargoNome;
    }

    public void setCargoNome(String cargoNome) {
        this.cargoNome = cargoNome;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public int getCargoId() {
        return cargoId;
    }

    public void setCargoId(int cargo_id) {
        this.cargoId = cargo_id;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }
    
    public void setCargos(List<Cargo> cargos) {
        this.cargos = cargos;
    }
    
    public static List<Cargo> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            return session.createCriteria(Cargo.class).list();
        } finally {
            //Fechamos a sess&atilde;o
            session.close();
        }
    }

    public void salvarCargo(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        session.beginTransaction();
        session.save(this.cargo);
         //session.save(medico);
        //session.save(cargo);
        //session.save(rc);
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    
}
