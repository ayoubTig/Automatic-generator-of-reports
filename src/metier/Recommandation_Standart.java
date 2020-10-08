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
public class Recommandation_Standart  {
    
    
    private int id;
  private String reference_rec;
    private String rec;
    private String localisation;
    private String risque;
    private String type;
      private String nom_rec;

    private String page;

    public Recommandation_Standart(String reference_inc,  String recommandation ,String localisation, String risque,String categorie ) {
        this.reference_rec = reference_inc;
        this.rec = recommandation;
        this.localisation=localisation;
        this.risque=risque;
        this.type=categorie;
  
       
    }

   
    public Recommandation_Standart(){
        
    }

    public String getReference_rec() {
        return reference_rec;
    }

    public String getRec() {
        return rec;
    }

    public String getLocalisation() {
        return localisation;
    }

    public String getRisque() {
        return risque;
    }

    public String getType() {
        return type;
    }

    public String getPage() {
        return page;
    }

    public void setReference_rec(String reference_rec) {
        this.reference_rec = reference_rec;
    }

    public void setRec(String rec) {
        this.rec = rec;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setPage(String page) {
        this.page = page;
    }

   
    

    public void setLocalisation(String localisation) {
        this.localisation = localisation;
    }

    public void setRisque(String risque) {
        this.risque = risque;
    }

  
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom_rec() {
        return nom_rec;
    }

    public void setNom_rec(String nom_rec) {
        this.nom_rec = nom_rec;
    }
 
}
