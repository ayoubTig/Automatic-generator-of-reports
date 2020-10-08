/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

import java.util.logging.Logger;

/**
 *
 * @author yassi
 */
public class responsable {
  
    
   private String nom;
   private String fonction;

    public responsable(String nom, String fonction) {
        this.nom = nom;
        this.fonction = fonction;
    }
    

     public responsable() {
        
    }

    
    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setFonction(String fonction) {
        this.fonction = fonction;
    }
    
    
    public String getNom() {
        return nom;
    }

    public String getFonction() {
        return fonction;
    }

    @Override
    public String toString() {
        return "responsable{" + "nom=" + nom + ", fonction=" + fonction + '}';
    }
   
   
    
    
    
    
    
    
    
    
    
    
    
}
