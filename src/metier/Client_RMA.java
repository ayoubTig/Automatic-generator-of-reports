/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

/**
 *
 * @author yassi
 */
public class Client_RMA {
    
    private String nom;
    private String fonction;

    
     public Client_RMA() {
      
    }
    public Client_RMA(String nom, String fonction) {
        this.nom = nom;
        this.fonction = fonction;
    }

    
    
    public String getNom() {
        return nom;
    }

    public String getFonction() {
        return fonction;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setFonction(String fonction) {
        this.fonction = fonction;
    }
    
    
}
