/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import negocio.Cargo;
import util.HibernateUtil;

import java.util.List;
import org.hibernate.Session;

public class CargoDAO extends HibernateUtil {
    
    private Cargo cargo = new Cargo();

    public CargoDAO() {
    }
    
    public CargoDAO(Cargo cargo) {
        this.cargo = cargo;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
    }
    
    public static List<Cargo> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List cargos = session.createCriteria(Cargo.class).list();
        session.flush();
        session.close();
        return cargos;
    }
    
    public void salvarCargo(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(this.cargo);
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    
}
