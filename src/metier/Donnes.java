package metier;

import java.io.Serializable;

public class Donnes implements Serializable{

	private int idD;
	private User user;
	private static int nb=0;
 
	private String activite;
	private String transfo;
	
	
	public String getActivite() {
		return activite;
	}
	public String getTransfo() {
		return transfo;
	}
	public void setActivite(String activite) {
		this.activite = activite;
	}
	public void setTransfo(String transfo) {
		this.transfo = transfo;
	}
	public Donnes() {
		super();
		
		nb++;
		idD=nb;
	}
	public long getIdD() {
		return idD;
	}
	public User getUser() {
		return user;
	}
	public void setIdD(int id) {
		this.idD = id;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
