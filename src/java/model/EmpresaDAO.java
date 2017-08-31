/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import negocio.Empresa;
import util.HibernateUtil;

import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

public class EmpresaDAO extends HibernateUtil {
    
    private Empresa empresa = new Empresa();

    public EmpresaDAO() {
    }
    
    public EmpresaDAO(Empresa empresa) {
        this.empresa = empresa;
    }

    public Empresa getCargo() {
        return empresa;
    }

    public void setCargo(Empresa empresa) {
        this.empresa = empresa;
    }

    public static List<Empresa> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List empresas = session.createCriteria(Empresa.class).setMaxResults(5).list();
        session.flush();
        session.close();
        return empresas;
    }
    
    public void salvarCargo(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(this.empresa);
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    
}
