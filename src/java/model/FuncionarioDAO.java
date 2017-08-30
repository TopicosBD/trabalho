/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import negocio.Funcionario;
import util.HibernateUtil;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
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
    
    public static int salvarFuncionario(Funcionario func){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(func);
        session.getTransaction().commit();
        session.flush();
        session.close();
        return 1;
    }
    
}

