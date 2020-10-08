package metier;

import java.io.Serializable;
import java.util.ArrayList;

public class Les_lits implements Serializable{

	
	public Les_lits() {
		super();
	}
	private  String Nom ; 
	private  String[] list ;
	public String getNom() {
		return Nom;
	}
	public  String[]  getList() {
		return list;
	}
	public void setNom(String nom) {
		Nom = nom;
	}
	public void setList(String[] f0) {
		this.list = f0;
	} 
	
}
