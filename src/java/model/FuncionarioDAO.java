/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import negocio.Funcionario;
import util.HibernateUtil;
import util.Util;
import org.hibernate.HibernateException;
import org.hibernate.Session;

public class FuncionarioDAO extends HibernateUtil{
    
    private Funcionario funcionario = new Funcionario();

    public FuncionarioDAO() {
    }
    
    public FuncionarioDAO(Funcionario funcionario) {
        this.funcionario = funcionario;
    }

    public Funcionario getFuncionario() {
        return funcionario;
    }

    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }
    
    /**
     * Salvar funcionário
     * @param func
     * @return 
     */
    public static int salvarFuncionario(Funcionario func){
        int status;
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        try {
            Util util = new Util();
            func.setDataNascimento(util.converteData(func.getDataNascimento()));
            session.save(func);
            status = 1;
        } catch (HibernateException e) {
            e.printStackTrace();
            session.getTransaction().rollback();
            status = 0;
        }
        session.getTransaction().commit();
        session.flush();
        session.close();
        return status;
    }
    
}

