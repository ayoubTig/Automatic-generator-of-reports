package metier;

import java.io.Serializable;

public class tab3 implements Serializable{
	private String lis;
	         
	private String NombreC;
	private String Debit;
	private String CV;
	private String KW;
	private String bar;
	private String litre;
	public String getLis() {
		return lis;
	}
	
	public tab3() {
		super();
	}

	public String getNombreC() {
		return NombreC;
	}
	public String getDebit() {
		return Debit;
	}
	public String getCV() {
		return CV;
	}
	public String getKW() {
		return KW;
	}
	public String getBar() {
		return bar;
	}
	public String getLitre() {
		return litre;
	}
	public void setLis(String lis) {
		this.lis = lis;
	}
	public void setNombreC(String nombreC) {
		NombreC = nombreC;
	}
	public void setDebit(String debit) {
		Debit = debit;
	}
	public void setCV(String cV) {
		CV = cV;
	}
	public void setKW(String kW) {
		KW = kW;
	}
	public void setBar(String bar) {
		this.bar = bar;
	}
	public void setLitre(String litre) {
		this.litre = litre;
	}
	public tab3(String nombreC, String debit, String cV, String kW, String bar, String litre) {
		super();
		NombreC = nombreC;
		Debit = debit;
		CV = cV;
		KW = kW;
		this.bar = bar;
		this.litre = litre;
	}
	
}
