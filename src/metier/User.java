package metier;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

 

public class User implements Serializable{
	
	private int id;
	private String NomPre;
	private String PassWord;
	private String Email;
	private boolean choix;
	//private static ArrayList<User> users = new ArrayList<User>();

 	private static int nb=0;
	
	public User() {	
	
		super();
		NomPre="";
		Email="";
	nb++;
	id=nb;//users.add(this);
	}
	
	public int getId() {
		return id;
	}

	public String getNomPre() {
		return NomPre;
	}

	public String getPassWord() {
		return PassWord;
	}

	public String getEmail() {
		return Email;
	}



 	public void setId(int id) {
 		this.id = id;
 	}

	public void setNomPre(String nomPre) {
		NomPre = nomPre;
	}

	public void setPassWord(String passWord) {
		PassWord = passWord;
	}

	public void setEmail(String email) {
		Email = email;
	}

 






	public boolean getChoix() {
		return choix;
	}

	public void setChoix(boolean choix) {
		this.choix = choix;
	}
	
	
}
