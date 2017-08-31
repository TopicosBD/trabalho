
package util;

public class Util {
    
    /**
     * Converte data no formato dd/mm/aaaa para aaaa/mm/dd
     * @param data
     * @return 
     */
    public String converteData(String data){
        String[] dataConvertida = data.split("/");
        return dataConvertida[2] + "/" + dataConvertida[1] + "/" + dataConvertida[0];
    }
    
}
