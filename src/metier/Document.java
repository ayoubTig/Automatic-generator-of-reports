package metier;

import java.io.Serializable;

import DAO.Dao;
 

public class Document implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int idDoc;
	private static int nb=0;
	private String numPolice;
	private String Nom_entreprise ;
	private int nbrRe ;
	private String Url_Doc  ;
	private String URL_dossierImage; 
 
	private String  Date_Viste;
	private long  Capitale ;
	private String  activite ;
//	private String  Niveau_de_Risque ;
//	private String Niveau_de_Prévention_Protection;
	private String Adresse ;
	
	//private User auth;
	
	
	
	
	public Document(   String numPolice, String nom_entreprise, int prospect, String url_Doc,
			String uRL_dossierImage, String date_Viste, long capitale, String activite,String adresse, User auth) {
		super();
 
		nb++;
		idDoc=nb;
 
		this.numPolice = numPolice;
		Nom_entreprise = nom_entreprise;
		nbrRe = prospect;
		Url_Doc = url_Doc;
		URL_dossierImage = uRL_dossierImage;
		Date_Viste = date_Viste;
		Capitale = capitale;
		this.activite = activite;
//		Niveau_de_Risque = niveau_de_Risque;
//		Niveau_de_Prévention_Protection = niveau_de_Prévention_Protection;
		Adresse = adresse;
		//this.auth = auth;
	}




	public static long getSerialversionuid() {
		return serialVersionUID;
	}




	public int getIdDoc() {
		return idDoc;
	}




	public String getNumPolice() {
		return numPolice;
	}




	public String getNom_entreprise() {
		return Nom_entreprise;
	}




	public int getNbrRe() {
		return nbrRe;
	}




	public String getUrl_Doc() {
		return Url_Doc;
	}




	public String getURL_dossierImage() {
		return URL_dossierImage;
	}




	public String getDate_Viste() {
		return Date_Viste;
	}




	public long getCapitale() {
		return Capitale;
	}




	public String getActivite() {
		return activite;
	}




	public String getAdresse() {
		return Adresse;
	}



//
//	public User getAuth() {
//		return auth;
//	}




	public void setIdDoc(int idDoc) {
		this.idDoc = idDoc;
	}




	public void setNumPolice(String numPolice) {
		this.numPolice = numPolice;
	}




	public void setNom_entreprise(String nom_entreprise) {
		Nom_entreprise = nom_entreprise;
	}




	public void setNbrRe(int nbrRe) {
		this.nbrRe = nbrRe;
	}




	public void setUrl_Doc(String url_Doc) {
		Url_Doc = url_Doc;
	}




	public void setURL_dossierImage(String uRL_dossierImage) {
		URL_dossierImage = uRL_dossierImage;
	}




	public void setDate_Viste(String date_Viste) {
		Date_Viste = date_Viste;
	}




	public void setCapitale(long capitale) {
		Capitale = capitale;
	}




	public void setActivite(String activite) {
		this.activite = activite;
	}




	public void setAdresse(String adresse) {
		Adresse = adresse;
	}



//
//	public void setAuth(User auth) {
//		this.auth = auth;
//	}




	public Document() {
		super();
	//	nb=Dao.MaxId();
	 	nb++;
		//idDoc=nb;
		
	}
	 
	 
	
}
