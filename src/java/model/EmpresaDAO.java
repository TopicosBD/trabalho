/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import negocio.Empresa;
import util.HibernateUtil;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;

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

    /**
     * Busca as empresas, limitando o resultado pelo parâmetro quantidade
     * @param quantidade
     * @return
     */
    public static List<Empresa> getEmpresas(int quantidade) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List empresas = session.createCriteria(Empresa.class).setMaxResults(quantidade).list();
        session.flush();
        session.close();
        return empresas;
    }
    
    /**
     * Busca todas as empresas
     * @return 
     */
    public static List<Empresa> findAll() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List empresas = session.createCriteria(Empresa.class).list();
        session.flush();
        session.close();
        return empresas;
    }
    
    /**
     * Salvar empresa
     */
    public void salvarEmpresa(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        try {
            session.save(this.empresa);
        } catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }
        session.getTransaction().commit();
        session.flush();
        session.close();
    }
    
}
