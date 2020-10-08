/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;
import java.util.ArrayList;
/**
 *
 * @author yassi
 */
public class Referentiel {
    private String ref_titre;
    private String ref_dec;
    private int id;

    public Referentiel(String reference_titre, String reference_desc) {
        this.ref_titre = reference_titre;
        this.ref_dec = reference_desc;
    }
    
     public Referentiel() {
        
    }
  

    public String getRef_titre() {
        return ref_titre;
    }

    public String getRef_dec() {
        return ref_dec;
    }

    public void setRef_titre(String ref_titre) {
        this.ref_titre = ref_titre;
    }

    public void setRef_dec(String ref_dec) {
        this.ref_dec = ref_dec;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    
}
