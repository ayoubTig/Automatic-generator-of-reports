package metier;

import java.io.Serializable;

public class Tab1 implements Serializable {
	private String Abr;
	private String Deta;
	private String Super;
	
	public Tab1() {
		super();
	}
	private String lis;
	public String getAbr() {
		return Abr;
	}
	public String getDeta() {
		return Deta;
	}
	public String getSuper() {
		return Super;
	}
 
	public Tab1(String abr, String deta, String super1, String lis) {
		super();
		Abr = abr;
		Deta = deta;
		Super = super1;
		this.lis = lis;
	}
	public Tab1(String abr, String deta, String super1) {
		super();
		Abr = abr;
		Deta = deta;
		Super = super1;
		this.lis = lis;
	}
	public void setAbr(String abr) {
		Abr = abr;
	}
	public void setDeta(String deta) {
		Deta = deta;
	}
	public void setSuper(String super1) {
		Super = super1;
	}
	public String getLis() {
		return lis;
	}
	public void setLis(String lis) {
		this.lis = lis;
	}
}
