package metier;

import java.io.Serializable;

public class Construction implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String OssateurStand;
	
	private String mursStand;
	private String plancheStand;
	private String nbrNiStand;
	private String couvirteureStand;
	private String amminaStand;
	private String ImageInput;
	private String titre;
	
	
private String Ossateur;
	
	private String murs;
	private String planche;
	private String nbrNi;
	private String couvirteure;
	private String ammina;
	public String getOssateurStand() {
		return OssateurStand;
	}
	public String getMursStand() {
		return mursStand;
	}
	public String getPlancheStand() {
		return plancheStand;
	}
	public String getNbrNiStand() {
		return nbrNiStand;
	}
	public String getCouvirteureStand() {
		return couvirteureStand;
	}
	public String getAmminaStand() {
		return amminaStand;
	}
	public String getOssateur() {
		return Ossateur;
	}
	public String getMurs() {
		return murs;
	}
	public String getPlanche() {
		return planche;
	}
	public String getNbrNi() {
		return nbrNi;
	}
	public String getCouvirteure() {
		return couvirteure;
	}
	public String getAmmina() {
		return ammina;
	}
	public void setOssateurStand(String ossateurStand) {
		OssateurStand = ossateurStand;
	}
	public void setMursStand(String mursStand) {
		this.mursStand = mursStand;
	}
	public void setPlancheStand(String plancheStand) {
		this.plancheStand = plancheStand;
	}
	public void setNbrNiStand(String nbrNiStand) {
		this.nbrNiStand = nbrNiStand;
	}
	public void setCouvirteureStand(String couvirteureStand) {
		this.couvirteureStand = couvirteureStand;
	}
	public void setAmminaStand(String amminaStand) {
		this.amminaStand = amminaStand;
	}
	public void setOssateur(String ossateur) {
		Ossateur = ossateur;
	}
	public void setMurs(String murs) {
		this.murs = murs;
	}
	public void setPlanche(String planche) {
		this.planche = planche;
	}
	public void setNbrNi(String nbrNi) {
		this.nbrNi = nbrNi;
	}
	public void setCouvirteure(String couvirteure) {
		this.couvirteure = couvirteure;
	}
	public void setAmmina(String ammina) {
		this.ammina = ammina;
	}
	public Construction() {
		super();
	}
	public Construction(String ossateurStand, String mursStand, String plancheStand, String nbrNiStand,
			String couvirteureStand, String amminaStand, String ossateur, String murs, String planche, String nbrNi,
			String couvirteure, String ammina,String ImageInput,String titre) {
		super();
		OssateurStand = ossateurStand;
		this.mursStand = mursStand;
		this.plancheStand = plancheStand;
		this.nbrNiStand = nbrNiStand;
		this.couvirteureStand = couvirteureStand;
		this.amminaStand = amminaStand;
		Ossateur = ossateur;
		this.murs = murs;
		this.planche = planche;
		this.nbrNi = nbrNi;
		this.couvirteure = couvirteure;
		this.ammina = ammina;
		this.ImageInput=ImageInput;
		this.titre=titre;
	}
	public String getImageInput() {
		return ImageInput;
	}
	public void setImageInput(String imageInput) {
		ImageInput = imageInput;
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	@Override
	public String toString() {
		return "Construction [OssateurStand=" + OssateurStand + ", mursStand=" + mursStand + ", plancheStand="
				+ plancheStand + ", nbrNiStand=" + nbrNiStand + ", couvirteureStand=" + couvirteureStand
				+ ", amminaStand=" + amminaStand + ", ImageInput=" + ImageInput + ", titre=" + titre + ", Ossateur="
				+ Ossateur + ", murs=" + murs + ", planche=" + planche + ", nbrNi=" + nbrNi + ", couvirteure="
				+ couvirteure + ", ammina=" + ammina + "]";
	}
	
	
	
	
}
