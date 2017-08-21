package negocio;
// Generated 21/08/2017 13:54:56 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * ResultadoExame generated by hbm2java
 */
public class ResultadoExame  implements java.io.Serializable {


     private Integer idTipoResultadoExame;
     private String tipo;
     private Set exames = new HashSet(0);

    public ResultadoExame() {
    }

	
    public ResultadoExame(String tipo) {
        this.tipo = tipo;
    }
    public ResultadoExame(String tipo, Set exames) {
       this.tipo = tipo;
       this.exames = exames;
    }
   
    public Integer getIdTipoResultadoExame() {
        return this.idTipoResultadoExame;
    }
    
    public void setIdTipoResultadoExame(Integer idTipoResultadoExame) {
        this.idTipoResultadoExame = idTipoResultadoExame;
    }
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public Set getExames() {
        return this.exames;
    }
    
    public void setExames(Set exames) {
        this.exames = exames;
    }




}


