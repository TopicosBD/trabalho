/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import negocio.TipoExame;
import util.HibernateUtil;

import java.util.List;
import org.hibernate.Session;

public class TipoExameDAO extends HibernateUtil {
    
    private TipoExame tipoExame = new TipoExame();

    public TipoExameDAO() {
    }
    
    public TipoExameDAO(TipoExame tipoExame) {
        this.tipoExame = tipoExame;
    }

    public TipoExame getTipoExame() {
        return tipoExame;
    }

    public void setTipoExame(TipoExame tipoExame) {
        this.tipoExame = tipoExame;
    }

    /**
     * Busca os tipos de exames, limitando o resultado pelo parâmetro quantidade
     * @param quantidade
     * @return
     */
    public static List<TipoExame> getTipoExames(int quantidade) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        List tiposExame = session.createCriteria(TipoExame.class).list();
        session.flush();
        session.close();
        return tiposExame;
    }
    
}
