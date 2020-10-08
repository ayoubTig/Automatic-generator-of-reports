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
public class Client {
    
    private String nom_entreprise;
   private  String date_visite;
   private String  Niveau_de_Risque;
   private String Niveau_de_protection;
   private int id;
      private  String url;
      private  String geo;
      private  String n_police;
    public Client(String nom_entreprise, String date_visite, String Niveau_risque, String Niveau_protection) {
        this.nom_entreprise = nom_entreprise;
        this.date_visite = date_visite;
        this.Niveau_de_Risque = Niveau_risque;
        this.Niveau_de_protection = Niveau_protection;
        
    }
    
     public Client() {
       
    }

    public String getNom_entreprise() {
        return nom_entreprise;
    }

    public String getDate_visite() {
        return date_visite;
    }

 


    public void setNom_entreprise(String nom_entreprise) {
        this.nom_entreprise = nom_entreprise;
    }

    public void setDate_visite(String date_visite) {
        this.date_visite = date_visite;
    }

    public String getNiveau_de_Risque() {
        return Niveau_de_Risque;
    }

    public String getNiveau_de_protection() {
        return Niveau_de_protection;
    }

    public void setNiveau_de_Risque(String Niveau_de_Risque) {
        this.Niveau_de_Risque = Niveau_de_Risque;
    }

    public void setNiveau_de_protection(String Niveau_de_protection) {
        this.Niveau_de_protection = Niveau_de_protection;
    }


 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getGeo() {
        return geo;
    }

    public String getN_police() {
        return n_police;
    }

    public void setGeo(String geo) {
        this.geo = geo;
    }

    public void setN_police(String n_police) {
        this.n_police = n_police;
    }
     
}
