package metier;

import java.io.Serializable;

public class tabl_voisinage implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
 
	private String nom;
	private String imagUrl;
	public String getNom() {
		return nom;
	}
	public String getImagUrl() {
		return imagUrl;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public void setImagUrl(String imagUrl) {
		this.imagUrl = imagUrl;
	}
	public tabl_voisinage(String nom, String imagUrl) {
		super();
		this.nom = nom;
		this.imagUrl = imagUrl;
	}
	@Override
	public String toString() {
		return "tabl_voisinage [nom----=" + nom + ", imagUrl---=" + imagUrl + "]";
	}
	
		
	
	
}
