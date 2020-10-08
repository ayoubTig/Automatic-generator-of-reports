package Contrôleur;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
 
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.*;
import DAO.*; 

/**
 * Servlet implementation class RMA
 */
@WebServlet("/RMA")
public class RMA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RMA() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String activite = "";
		String transfo = "";
		if (request.getParameter("activite") != null || request.getParameter("activite") != "")
			activite = request.getParameter("activite");
		else
			activite = null;
		if (request.getParameter("transfo") != null || request.getParameter("transfo") != "")
			transfo = request.getParameter("transfo");
		else
			transfo = null;

		Donnes dom = new Donnes();
		dom.setActivite(activite);
		dom.setTransfo(transfo);
		try {
			dom.setUser((User) getServletContext().getAttribute("user"));
			Dao.addDonnes(dom);
		} catch (Exception e) {

			e.printStackTrace();
		}
		request.getRequestDispatcher("tables.jsp").forward(request, response);
		// response.sendRedirect("tables.jsp");

		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sission = request.getSession();
		sission.removeAttribute("error") ;
		// Insertion.removeLastRow(6);
		response.setCharacterEncoding("UTF-8");
	//	ArrayList<String[]> list = new ArrayList<String[]>();

		ArrayList<Les_lits> listGe0 = new ArrayList<Les_lits>();
		ArrayList<Les_lits> listGe = new ArrayList<Les_lits>();
		ArrayList<Les_lits> listGe2 = new ArrayList<Les_lits>();
		ArrayList<Les_lits> listGe3 = new ArrayList<Les_lits>();
		Map<String, String> A = new HashMap<>();
		//		Map<String, String> B = new HashMap<>();
		Map<String, String> C = new HashMap<>();
		Map<String, String> D = new HashMap<>();
		Map<String, String> E = new HashMap<>();
		Map<String, String> F = new HashMap<>();
		Map<String, String> G = new HashMap<>();
		Map<String, String> H = new HashMap<>();
		Map<String, String> I = new HashMap<>();
		Map<String, String> J = new HashMap<>();

		ArrayList<tab2> tab2a = new ArrayList<tab2>();
		ArrayList<Tab1> tab1 = new ArrayList<Tab1>();
		ArrayList<Tab1> tab2 = new ArrayList<Tab1>();
		ArrayList<tab3> tab3 = new ArrayList<tab3>();

		ArrayList<String> NSc = new ArrayList<String>();
		ArrayList<String> RMA_Ass = new ArrayList<String>();
		ArrayList<String> Intermaidaire = new ArrayList<String>();

		/////////////////////// BBBBBBBBBBBB
		ArrayList<String> MPS = new ArrayList<String>();
		ArrayList<String> PSF = new ArrayList<String>();
		ArrayList<String> PF = new ArrayList<String>();
		ArrayList<String> SPDI = new ArrayList<String>();
		////////////// DDDDDDDDDDDDDDDDDDD
		ArrayList<tabl_voisinage> TT = new ArrayList<tabl_voisinage>();
		ArrayList<Tab1> marq = new ArrayList<Tab1>();

		//		ArrayList<String> Intermaidaire=new ArrayList<String>();
		ArrayList<tabl_voisinage> tabl_voisinage = new ArrayList<tabl_voisinage>();
		ArrayList<Construction> tab_Construction = new ArrayList<Construction>();

		if (request.getParameter("doc") != null && request.getParameter("doc").equals("doca")) {
			sission.removeAttribute("Urldoss");	
			sission.removeAttribute("UrlDoc");	
			sission.removeAttribute("A");	
			sission.removeAttribute("B");	
			sission.removeAttribute("C");	
			sission.removeAttribute("D");	
			sission.removeAttribute("E");	
			sission.removeAttribute("F");	
			sission.removeAttribute("G");
			sission.removeAttribute("H");	
			sission.removeAttribute("I");	
			sission.removeAttribute("J");
			//tab1  Intermaidaire imgInter RMA_Ass imgRMA_Ass NSc  tabl_voisinage
			sission.removeAttribute("tab1");	
			sission.removeAttribute("Intermaidaire");	
			sission.removeAttribute("imgInter");	
			sission.removeAttribute("RMA_Ass");	
			sission.removeAttribute("imgRMA_Ass");	
			sission.removeAttribute("NSc");
			sission.removeAttribute("tabl_voisinage");	
			//MPS PF PSF SPDI GPL imgMPS imgPF imgPSF imgSPDI imgGPL  listGe0		 
			sission.removeAttribute("MPS");	
			sission.removeAttribute("PF");	
			sission.removeAttribute("PSF");	
			sission.removeAttribute("SPDI");	
			sission.removeAttribute("GPL");	
			sission.removeAttribute("imgMPS");
			sission.removeAttribute("imgPF");	
			sission.removeAttribute("imgPSF");	
			sission.removeAttribute("imgSPDI");
			sission.removeAttribute("imgGPL");
			sission.removeAttribute("listGe0");
			//	listGe2 listGe3 TT marq tab3 tab2a
			
			sission.removeAttribute("listGe2");
			sission.removeAttribute("listGe3");
			sission.removeAttribute("TT");	
			sission.removeAttribute("marq");	
			sission.removeAttribute("tab3");
			sission.removeAttribute("tab2a");
		
			if (request.getParameter("Urldoss") == null || request.getParameter("UrlDoc") == ""
					|| request.getParameter("Urldoss") == "" || request.getParameter("UrlDoc") == "") {

				sission.setAttribute("error",
						"vous devez spécifier le chemine de rapport à remplir et le dossier des images");
				}
//			 else   {
//				sission.removeAttribute("error") ;
//			}
			
			if(Dao.ExisteDoc(request.getParameter("UrlDoc"))!=null && request.getParameter("exis").equals("non")){
			//	System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!-----------------");
				sission.setAttribute("error","Attention ce nom de fichier existé déjà dans la base des données il faut le changer!!!!!!!!!!!!");
			}else {
			Insertion.from = 0;
			String Urldoss = request.getParameter("Urldoss");
			String UrlDoc = request.getParameter("UrlDoc");
			String exis = request.getParameter("exis");
			Insertion.docIm = Urldoss;
	//		String heig, widi;
			Insertion.from = 0;
//			if (request.getParameter("heig") == null || request.getParameter("heig").equals("")
//					|| request.getParameter("widi") == null || request.getParameter("widi").equals("")) {
//				sission.removeAttribute("heig");
//				sission.removeAttribute("widi");
				// sission.setAttribute("heig", "200");
				
				
				// sission.setAttribute("widi", 270);
//				Insertion.from = 0;
//			} else {
//				heig = request.getParameter("heig");
//				widi = request.getParameter("widi");
//				sission.setAttribute("heig", heig);
//				sission.setAttribute("widi", widi);
//			}
			System.out.println("UrlDoc UrlDoc " + UrlDoc + " UrldossUrldoss " + Urldoss + " exis " + exis + " heig ");
			Insertion.from = 0;
			sission.setAttribute("UrlDoc", UrlDoc);
			
			sission.setAttribute("exis", exis);
			sission.setAttribute("Urldoss", Urldoss);

		}}

		if (request.getParameter("A") != null && request.getParameter("A").equals("AA")) {

			System.out.println("************A**************************");

			for (int i = 0; i < 17; i++) {if(i==9 || i==10) continue;
			String mees = "A" + i;

			String putt = request.getParameter(mees);

			A.put(mees, putt);

			}

			int nbrE = 2;
			if (request.getParameter("nbrTab1") != null && request.getParameter("nbrTab1") != "") {
				nbrE = Integer.parseInt(request.getParameter("nbrTab1"));
			}
			for (int p = 1; p < nbrE; p++) {

				String Abr = "Abr" + p;
				String Deta = "Deta" + p;
				String Super = "Super" + p;

				String AbrPut = request.getParameter(Abr);
				String DetaPut = request.getParameter(Deta);
				String SuperPut = request.getParameter(Super);
				Tab1 rec = new Tab1(AbrPut, DetaPut, SuperPut);
				tab1.add(rec);

			}

			int txtNameInter = 1;
			if (request.getParameter("nbrTabInter") != null && request.getParameter("nbrTabInter") != "") {
				txtNameInter = Integer.parseInt(request.getParameter("nbrTabInter"));
			}

			for (int p = 0; p < txtNameInter; p++) {
				String nn = "Inter" + p;
				String nom = request.getParameter(nn);
				Intermaidaire.add(nom);

			}

			int txtNameV = 1;
			if (request.getParameter("nbrTabV") != null && request.getParameter("nbrTabV") != "") {
				txtNameV = Integer.parseInt(request.getParameter("nbrTabV"));
			}

			for (int p = 0; p < txtNameV; p++) {
				String vo = "voi" + p;
				String fik = "fik" + p;
				String voPut = request.getParameter(vo);
				String fikPut = request.getParameter(fik);
				tabl_voisinage rec = new tabl_voisinage(voPut, fikPut);
				tabl_voisinage.add(rec);

			}
			System.out.println("--------------------______>" + tabl_voisinage.toString());

			int NScint = 1;
			if (request.getParameter("nbrTabNSc") != null && request.getParameter("nbrTabNSc") != "") {
				NScint = Integer.parseInt(request.getParameter("nbrTabNSc"));
			}

			for (int p = 0; p < NScint; p++) {
				String vo = "NSc" + p;

				String voPut = request.getParameter(vo);

				// tabl_voisinage rec=new tabl_voisinage( voPut,fikPut );
				NSc.add(voPut);

			}

			int RMA_AssInt = 1;
			if (request.getParameter("nbrTabRMA_Ass") != null && request.getParameter("nbrTabRMA_Ass") != "") {
				RMA_AssInt = Integer.parseInt(request.getParameter("nbrTabRMA_Ass"));
			}

			for (int p = 0; p < RMA_AssInt; p++) {

				String fik = "RMA_Ass" + p;

				String fikPut = request.getParameter(fik);
				// tabl_voisinage rec=new tabl_voisinage( voPut,fikPut );
				RMA_Ass.add(fikPut);

			}

			String imgInter = request.getParameter("Inter");
			String imgRMA_Ass = request.getParameter("RMA_Ass");
			String imgNSc = request.getParameter("NSc");

			sission.setAttribute("tab1", tab1);
			sission.setAttribute("Intermaidaire", Intermaidaire);
			sission.setAttribute("tabl_voisinage", tabl_voisinage);

			sission.setAttribute("RMA_Ass", RMA_Ass);
			sission.setAttribute("NSc", NSc);

			sission.setAttribute("imgInter", imgInter);
			sission.setAttribute("imgRMA_Ass", imgRMA_Ass);
			sission.setAttribute("imgNSc", imgNSc);

			sission.setAttribute("A", A);

		} else if (request.getParameter("B") != null && request.getParameter("B").equals("BB")) {
			System.out.println("************B**************************");
			int txtNameconst = Integer.parseInt(request.getParameter("nbrTabconst"));
			for (int j = 0; j < txtNameconst; j++) {

				if (j == 1)
					continue;

				String OssateurStand = "Ossature" + j;
				String mursStand = "murs" + j;
				String plancheStand = "planche" + j;
				String nbrNiStand = "nbrNi" + j;
				String couvirteureStand = "couevrture" + j;
				String amminaStand = "ammina" + j;

				String Ossateur = "OssatureInput" + j;
				String murs = "mursInput" + j;
				String planche = "plancheInput" + j;
				String nbrNi = "nbrNiInput" + j;
				String couvirteure = "couevrtureInput" + j;
				String ammina = "amminaInput" + j;
				String image = "ImageInput" + j;
				String nbrNiNmae = "nbrNiNmae" + j;
				String immge2 = " ";
				if (request.getParameter(image) != null && request.getParameter(image) != "") {
					immge2 = (String) request.getParameter(image);
					//////////afaree					  
					if (immge2.indexOf("\\") == -1) {
						immge2 = Insertion.docIm + "\\" + immge2;
					}
				} else
					immge2 = "C:\\Users\\ACER\\eclipse-workspace3\\RMAE\\WebContent\\assets\\img\\logo_front.png";
				String val1 = "...";
				String val2 = "...";
				String val3 = "...";
				String val4 = "...";
				String val5 = "...";
				String val6 = ".vv..";

				String val7 = "...";
				String val8 = "...";
				String val9 = "...";
				String val10 = "...";
				String val11 = "...";
				String val12 = "...";
				String vale222 = "...";
				if (request.getParameter(Ossateur) != null) {
					val1 = request.getParameter(Ossateur);
				}
				if (request.getParameter(murs) != null) {
					val2 = request.getParameter(murs);
				}
				if (request.getParameter(planche) != null) {
					val3 = request.getParameter(planche);
				}
				if (request.getParameter(nbrNi) != null) {
					val4 = request.getParameter(nbrNi);
				}
				if (request.getParameter(couvirteure) != null) {
					val5 = request.getParameter(couvirteure);
				}
				if (request.getParameter(ammina) != null) {
					val6 = request.getParameter(ammina);
				}

				if (request.getParameter(OssateurStand) != null) {
					val7 = request.getParameter(OssateurStand);
				}
				if (request.getParameter(mursStand) != null) {
					val8 = request.getParameter(mursStand);
				}
				if (request.getParameter(plancheStand) != null) {
					val9 = request.getParameter(plancheStand);
				}
				if (request.getParameter(nbrNiStand) != null) {
					val10 = request.getParameter(nbrNiStand);
				}
				if (request.getParameter(couvirteureStand) != null) {
					val11 = request.getParameter(couvirteureStand);
				}
				if (request.getParameter(amminaStand) != null) {
					val12 = request.getParameter(amminaStand);
				}
				if (request.getParameter(nbrNiNmae) != null) {
					vale222 = request.getParameter(nbrNiNmae);
				}
				//					Construction cons=new Construction(request.getParameter(OssateurStand), request.getParameter(mursStand ), request.getParameter(plancheStand),  request.getParameter(nbrNiStand),
				//							 request.getParameter(couvirteureStand),  request.getParameter(amminaStand ),val1,val2,val3 ,val4 ,val5, val6,immge2,"AAAAAAAAAAA");
				//					  
				Construction consV = new Construction();
				consV.setAmmina(val6);
				consV.setAmminaStand(val12);
				consV.setCouvirteure(val5);
				consV.setCouvirteureStand(val11);
				consV.setMurs(val2);
				consV.setMursStand(val8);
				consV.setNbrNi(val4);
				consV.setNbrNiStand(val10);
				consV.setOssateur(val1);
				consV.setOssateurStand(val7);
				consV.setPlanche(val3);
				consV.setPlancheStand(val9);

				consV.setImageInput(immge2);
				consV.setTitre(vale222);

				tab_Construction.add(consV);

			}

			sission.setAttribute("B", tab_Construction);

		} else if (request.getParameter("C") != null) {
			if (request.getParameter("C").equals("CC")) {
				sission.setAttribute("C", "true");
				//				
				for (int o = 3; o < 6; o++) {
					String mees = "C" + o;
					sission.setAttribute(mees, request.getParameter(mees));

				}
				sission.setAttribute("C", "true");
				////////////////// les tables
				int MPSInt = 1;
				if (request.getParameter("nbrTabMPS") != null && request.getParameter("nbrTabMPS") != "") {sission.setAttribute("C", "true");
				MPSInt = Integer.parseInt(request.getParameter("nbrTabMPS"));
				}

				for (int p = 0; p < MPSInt; p++) {

					String fik = "NatureMPS" + p;

					String fikPut = request.getParameter(fik);
					// tabl_voisinage rec=new tabl_voisinage( voPut,fikPut );
					MPS.add(fikPut);

				}
				String imgMPS = request.getParameter("MPS");

				int PSFInt = 1;
				if (request.getParameter("nbrTabPSF") != null && request.getParameter("nbrTabPSF") != "") {sission.setAttribute("C", "true");
				PSFInt = Integer.parseInt(request.getParameter("nbrTabPSF"));
				}

				for (int p = 0; p < PSFInt; p++) {

					String fik = "PSF" + p;

					String fikPut = request.getParameter(fik);

					PSF.add(fikPut);

				}

				String imgPSF = request.getParameter("PSF");

				int PFInt = 1;
				if (request.getParameter("nbrTabPF") != null && request.getParameter("nbrTabPF") != "") {
					sission.setAttribute("C", "true");
					PFInt = Integer.parseInt(request.getParameter("nbrTabPF"));
				}

				for (int p = 0; p < PFInt; p++) {

					String fik = "PF" + p;

					String fikPut = request.getParameter(fik);

					PF.add(fikPut);

				}
				String imgPF = request.getParameter("PF");

				int SPDIInt = 1;
				if (request.getParameter("nbrTabSPDI") != null && request.getParameter("nbrTabSPDI") != "") {sission.setAttribute("C", "true");
				SPDIInt = Integer.parseInt(request.getParameter("nbrTabSPDI"));
				}

				for (int p = 0; p < SPDIInt; p++) {

					String fik = "SPDI" + p;

					String fikPut = request.getParameter(fik);

					SPDI.add(fikPut);

				}

				String imgSPDI = request.getParameter("SPDI");

				int nbrE22 = 1;
				if (request.getParameter("nbrTab4") != null) {sission.setAttribute("C", "true");
				nbrE22 = Integer.parseInt(request.getParameter("nbrTab4"));
				}
				for (int p = 0; p < nbrE22; p++) {

					String GPL = "GPL" + p;
					String citernes = "citernes" + p;
					String litre = "litre" + p;

					String GPLS = request.getParameter(GPL);
					String citernesS = request.getParameter(citernes);
					String litreS = request.getParameter(litre);

					Tab1 rec = new Tab1(GPLS, citernesS, litreS);
					tab2.add(rec);

				}
				String imgciternes = request.getParameter("citernes");

				sission.setAttribute("MPS", MPS);
				sission.setAttribute("PF", PF);
				sission.setAttribute("SPDI", SPDI);
				sission.setAttribute("GPL", tab2);
				sission.setAttribute("PSF", PSF);
				sission.setAttribute("C", "true");
				sission.setAttribute("imgMPS", imgMPS);
				sission.setAttribute("imgPF", imgPF);
				sission.setAttribute("imgSPDI", imgSPDI);
				sission.setAttribute("imgGPL", imgciternes);
				sission.setAttribute("imgPSF", imgPSF);

				//C.put("nbrC", request.getParameter("nbrC"));

			//	sission.setAttribute("tab2", tab2);

				sission.setAttribute("listGe", listGe);

				sission.setAttribute("C", C);

			}
		} else if (request.getParameter("D") != null) {
			if (request.getParameter("D").equals("DD")) {

				int nbrTabTT = 1;
				if (request.getParameter("nbrTabTT") != null) {
					nbrTabTT = Integer.parseInt(request.getParameter("nbrTabTT"));
				}
				
				for (int n = 0; n < nbrTabTT; n++) {

					String GPL = "TT"+n;
					String KVATTd = "KAVTT"+n;

					String GPLS = request.getParameter(GPL);
					String KVATTSd = request.getParameter(KVATTd);
					System.out.println("..nameGPL"+GPL+"...KVATTS "+KVATTSd+"  GPLS "+GPLS);
					tabl_voisinage rec = new tabl_voisinage(GPLS, KVATTSd);

					TT.add(rec);

				}
				sission.setAttribute("TT", TT);

				int nbrTabmarq = 1;
				if (request.getParameter("nbrTabmarq") != null) {
					nbrTabmarq = Integer.parseInt(request.getParameter("nbrTabmarq"));
				}
				for (int p = 0; p < nbrTabmarq; p++) {
 					if (p == 1)
 						continue;
					String marql = "marq" + p;
					String KAVmarq = "KAVmarq" + p;
					String GEmarq = "GEmarq" + p;

					String GPLS = request.getParameter(marql);
					String KVATTSv = request.getParameter(KAVmarq);
					String GEmarqS = request.getParameter(GEmarq);
System.out.println(".....GEmarqS "+GEmarqS+"  KVATTS "+KVATTSv);
					Tab1 rec = new Tab1(GPLS, KVATTSv, GEmarqS);

					marq.add(rec);

				}
				sission.setAttribute("marq", marq);

				for (int k = 0; k < 8; k++) {
					String mees = "D" + k;

					D.put(mees, request.getParameter(mees));
				}
				sission.setAttribute("D", D);

			}
		} else if (request.getParameter("E") != null) {
			if (request.getParameter("E").equals("EE")) {
				//				for (int l = 0; l < 33; l++) {
				//					String mees = "E" + l;
				//
				//					
				//				}
				E.put("E30", request.getParameter("E30"));
				E.put("E31", request.getParameter("E31"));
				E.put("E19", request.getParameter("E19"));
				E.put("E18", request.getParameter("E18"));
				E.put("E20", request.getParameter("E20"));
				E.put("E29", request.getParameter("E29"));

				int nbrE24 = 1;
				if (request.getParameter("nbrTab5") != null) {
					nbrE24 = Integer.parseInt(request.getParameter("nbrTab5"));

					for (int p = 1; p <= nbrE24; p++) {
						if (p == 2)
							continue;
						String NombreC = "NombreC" + p; 
						String Debit = "Debit" + p;
						String CV = "CV" + p;

						String KW = "KW" + p;
						String bar = "bar" + p;
						String litre = "litre" + p;

						String NombreCS = request.getParameter(NombreC);
						String DebitS = request.getParameter(Debit);
						String CVS = request.getParameter(CV);

						String KWS = request.getParameter(KW);
						String barS = request.getParameter(bar);
						String litreS = request.getParameter(litre);

						tab3 rec = new tab3(NombreCS, DebitS, CVS, KWS, barS, litreS);
						tab3.add(rec);

					}

					sission.setAttribute("tab3", tab3);
					// Insertion.remplirTab3( tab1);
				} // Nbrchaud Type Marque Capacite

				if (request.getParameter("nbrTab6") != null) {
					System.out.println("-------------------------------------");

					int nbrE2q = 0;
					nbrE2q = Integer.parseInt(request.getParameter("nbrTab6"));
					System.out.println(" nbrE2q" + nbrE2q);
					for (int g = 1; g <= nbrE2q; g++) {
						if (g == 2)
							continue;
						String Nbrchaud = "Nbrchaud" + g;
						String Type = "Type" + g;
						String Capacite = "Capacite" + g;
						String Marque = "Marque" + g;
						System.out.println("    Nbrchaud  " + Nbrchaud + " Type " + Type);

						String NbrchaudS = request.getParameter(Nbrchaud);
						String TypeS = request.getParameter(Type);
						String CapaciteS = request.getParameter(Capacite);
						String MarqueS = request.getParameter(Marque);

						System.out.println("    Nbrchaud  " + request.getParameter("Nbrchaud2") + " Type "
								+ request.getParameter("Type2") + " CapaciteS  " + CapaciteS);
						tab2 fof = new tab2(NbrchaudS, TypeS, CapaciteS, MarqueS);
						tab2a.add(fof);

					}
					sission.setAttribute("tab2a", tab2a);

				}

				sission.setAttribute("E", E);
			}
		} else if (request.getParameter("F") != null) {
			if (request.getParameter("F").equals("FF")) {

				String[] F6 = null, F2 = null, F0 = null, F12 = null;

				if (request.getParameterValues("F0") != null) {
					F0 = request.getParameterValues("F0");
				}
				if (request.getParameterValues("F2") != null) {
					F2 = request.getParameterValues("F2");
				}
				if (request.getParameterValues("F6") != null) {
					F6 = request.getParameterValues("F6");
				}
				if (request.getParameterValues("F12") != null) {
					F12 = request.getParameterValues("F12");
				}
				//					try {
				// System.out.println(F12.toString());

				Les_lits F00 = new Les_lits();
				F00.setList(F0);
				F00.setNom("L1");

				Les_lits F10 = new Les_lits();
				F10.setList(F12);
				F10.setNom("L4");

				Les_lits F20 = new Les_lits();
				F20.setList(F2);
				F20.setNom("L2");

				Les_lits F60 = new Les_lits();
				F60.setList(F6);
				F60.setNom("L3");

				listGe0.add(F00);
				listGe0.add(F10);
				listGe0.add(F20);
				listGe0.add(F60);

				// Insertion.inss3(listGe);
				sission.setAttribute("listGe0", listGe0);
				//					} catch (Exception e) {
				//						
				//						e.printStackTrace();
				//					}

				for (int x = 0; x < 15; x++) {
					String mees = "F" + x;
					if (x == 0 || x == 6 || x == 12 || x == 2)
						continue;
					F.put(mees, request.getParameter(mees));
					System.out.println("F:" + x);
				}

				F.put("organisme", request.getParameter("organisme"));

				sission.setAttribute("F", F);
			}

		} else if (request.getParameter("G") != null) {
			if (request.getParameter("G").equals("GG")) {

				String[] G14 = null, G17 = null, G18 = null;

				if (request.getParameterValues("G14") != null) {
					G14 = request.getParameterValues("G14");
				}
				if (request.getParameterValues("G17") != null) {
					G17 = request.getParameterValues("G17");
				}
				if (request.getParameterValues("G18") != null) {
					G18 = request.getParameterValues("G18");
				}

				//				try {

				// list.clear();
				Les_lits G140 = new Les_lits();
				G140.setList(G14);
				G140.setNom("L5");
				listGe3.add(G140);

				Les_lits G170 = new Les_lits();
				G170.setList(G17);
				G170.setNom("L6");
				listGe3.add(G170);

				Les_lits G180 = new Les_lits();
				G180.setList(G18);
				G180.setNom("L7");

				listGe3.add(G180);

				sission.setAttribute("listGe3", listGe3);
				// Insertion.inss3(listGe);
				//				} catch (Exception e) {
				// 
				//				}
				for (int m = 0; m < 23; m++) {
					String mees = "G" + m;
					if (m == 14 || m == 17 || m == 18)
						continue;
					G.put(mees, request.getParameter(mees));
				}
				// int op = Insertion.instionG(G);
				sission.setAttribute("G", G);
			}
		} else if (request.getParameter("H") != null) {
			if (request.getParameter("H").equals("HH")) {

				String[] H0 = null, H2 = null, H4 = null, H8 = null;

				if (request.getParameterValues("H0") != null) {
					H0 = request.getParameterValues("H0");
				}
				if (request.getParameterValues("H2") != null) {
					H2 = request.getParameterValues("H2");
				}
				if (request.getParameterValues("H4") != null) {
					H4 = request.getParameterValues("H4");
				}
				if (request.getParameterValues("H8") != null) {
					H8 = request.getParameterValues("H8");
				}
				// list.clear();
				Les_lits H00 = new Les_lits();
				H00.setList(H0);
				H00.setNom("L8");
				listGe2.add(H00);

				Les_lits H20 = new Les_lits();
				H20.setList(H2);
				H20.setNom("L9");
				listGe2.add(H20);

				Les_lits H40 = new Les_lits();
				H40.setList(H4);
				H40.setNom("L10");
				listGe2.add(H40);

				Les_lits H80 = new Les_lits();
				H80.setList(H8);
				H80.setNom("L11");
				listGe2.add(H80);

				// try {
				sission.setAttribute("listGe2", listGe2);
				// Insertion.inss3(listGe);
				//				} catch (Exception e) {
				//
				//					e.printStackTrace();
				//				}

				for (int n = 0; n < 19; n++) {
					String mees = "H" + n;
					if (n == 0 || n == 2 || n == 4 || n == 8)
						continue;
					H.put(mees, request.getParameter(mees));

				}
				// int op = Insertion.instionH(H);
				sission.setAttribute("H", H);
			}
		} else if (request.getParameter("I") != null) {
			if (request.getParameter("I").equals("II")) {
				for (int o = 0; o < 9; o++) {
					// if (o == 6 || o == 7)
					// continue;
					String mees = "I" + o;

					I.put(mees, request.getParameter(mees));
				}
				// int op = Insertion.instionI(I);
				sission.setAttribute("I", I);
			}
		} else if (request.getParameter("J") != null) {
			if (request.getParameter("J").equals("JJ")) {
				for (int o = 0; o < 9; o++) {

					String mees = "J" + o;

					J.put(mees, request.getParameter(mees));

				}
				sission.setAttribute("J", J);
				// int op = Insertion.instionJ(J);
			}

		}

		int    b = 0; int jk=0;
		String na="";
		if (request.getParameter("fin") != null) {
			if (request.getParameter("fin").equals("fin")) {
				b++;
				Insertion insert=null;
			 	Document Doc = new Document();
//				if (sission.getAttribute("heig") == null || sission.getAttribute("widi") == null
//						|| sission.getAttribute("heig") == "" || sission.getAttribute("widi") == "") {
				 
				//} else {
					b++;
					Insertion.highet =150;// Integer.parseInt(((String) sission.getAttribute("heig")));
					Insertion.wight = 150;//Integer.parseInt(((String) sission.getAttribute("widi")));
			//	}
				na = (String) sission.getAttribute("Urldoss");
				Insertion.from = 0;
				Doc.setUrl_Doc((String) sission.getAttribute("UrlDoc"));
				Doc.setURL_dossierImage((String) sission.getAttribute("Urldoss"));
				b++;
//				if (sission.getAttribute("exis") == null) {
//
//					Insertion.highet = 200;
//					Insertion.wight = 200;
//					Insertion.template ="C:\\Users\\ACER\\eclipse-workspace3\\RMAE\\src\\rma\\template.docx";
//					Insertion.tmp = (String) sission.getAttribute("UrlDoc");
//					insert = new Insertion("C:\\Users\\ACER\\eclipse-workspace3\\RMAE\\src\\rma\\template.docx",
//							(String) sission.getAttribute("UrlDoc"));
//
//				} else
				if (((String) sission.getAttribute("exis")).equals("non")) {
				//	Insertion.template ="..\\rma\\template.docx";
				//	Insertion.tmp = (String) sission.getAttribute("UrlDoc");
					Insertion.highet = 200;
					Insertion.wight = 200;

					try {
						insert = new Insertion("template.docx",
								(String) sission.getAttribute("UrlDoc"));
					} catch (ex e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					// Insertion.from=0;
				} else if (((String) sission.getAttribute("exis")).equals("oui")) {

				//	Insertion.template = (String) sission.getAttribute("UrlDoc");
					Insertion.tmp = (String) sission.getAttribute("UrlDoc");
					try {
						insert = new Insertion((String) sission.getAttribute("UrlDoc"),
								(String) sission.getAttribute("UrlDoc"));
					} catch (ex e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					b++;

				}
				
				 
			
				
				if ((extracted2(sission, "A") != 0)) {
					System.out.println("**************************AAAAAAA******************************* ");
					
					Map<String, String> ll = new HashMap<>();
					ll = (Map<String, String>) sission.getAttribute("A");
				 	insert.instionA(ll);
					
					
					if ((extracted(sission, "tab1") != 0)) {
						b++;
						try {
							insert.remplirTab((ArrayList<Tab1>) sission.getAttribute("tab1"));
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						System.out.println("ICI servlete recuperration de tab1"+((ArrayList<Tab1>) sission.getAttribute("tab1")).toString());
					}
					
					if (sission.getAttribute("Intermaidaire") != null) {

						ArrayList<String> Ar = (ArrayList<String>) sission.getAttribute("Intermaidaire");
						String imgInter = (String) sission.getAttribute("imgInter");

						try {
							insert.inserterInter(Ar, "Inter", imgInter);
							System.out.println("ICI servlet le recuperation de Tab Inter"+Ar.toString());
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					if (sission.getAttribute("RMA_Ass") != null) {
						String imgRMA_Ass = (String) sission.getAttribute("imgRMA_Ass");
						ArrayList<String> as = (ArrayList<String>) sission.getAttribute("RMA_Ass");

						try {
							insert.inserterInter(as, "RMA_Ass", imgRMA_Ass);
						} catch (Exception e) {

							e.printStackTrace();
						}

					}
					if (sission.getAttribute("NSc") != null) {

						ArrayList<String> as2 = (ArrayList<String>) sission.getAttribute("NSc");
						String imgNSc = (String) sission.getAttribute("imgNSc");
						try {
							insert.inserterInter(as2, "NSc", imgNSc);
						} catch (Exception e) {

							e.printStackTrace();
						}

					}
					if (sission.getAttribute("tabl_voisinage") != null) {
						ArrayList<tabl_voisinage> tableau = new ArrayList<tabl_voisinage>();

						tableau = (ArrayList<tabl_voisinage>) sission.getAttribute("tabl_voisinage");

						try {
							insert.inserterVoisi(tableau);
						} catch (Exception e1) {

							e1.printStackTrace();
						}

					}

			
				
					Doc.setAdresse(ll.get("A8"));

					Doc.setCapitale(Long.parseLong(ll.get("A4"))+Long.parseLong(ll.get("A5"))+Long.parseLong(ll.get("A6")));

					String date1 = null;

					//								if(ll.get("A3")==null ||ll.get("A3").equals("") )  else {}
					date1 = ll.get("A3");

					Doc.setDate_Viste(date1);
					Doc.setNom_entreprise(ll.get("A2"));
					Doc.setNumPolice(ll.get("A1"));
					
				//	Doc.setAuth((User) getServletContext().getAttribute("user"));
					System.out.println("");
					Doc.setActivite(ll.get("A7"));

					b++;
					

				}
				
				
				
				
				
				
				
				
				
				
				//				System.out.println(
				//						"template template " + Insertion.template + "  " + Insertion.tmp + " heig " + " witde");


				b++;
//MPS PF PSF SPDI GPL imgMPS imgPF imgPSF imgSPDI imgGPL  listGe0
				if (sission.getAttribute("C") != null) {

					ArrayList<String> vv = null;//new ArrayList<String>();
					ArrayList<String> vv2 = null;//new ArrayList<String>();
					ArrayList<String> vv3 = null;//new ArrayList<String>();
					ArrayList<String> vv4 = null;//new ArrayList<String>();

					ArrayList<Tab1> vv6 = null;//new ArrayList<Tab1>();

					vv = (ArrayList<String>) sission.getAttribute("MPS");
					vv2 = (ArrayList<String>) sission.getAttribute("PF");
					vv3 = (ArrayList<String>) sission.getAttribute("PSF");
					vv4 = (ArrayList<String>) sission.getAttribute("SPDI");
					vv6 = (ArrayList<Tab1>) sission.getAttribute("GPL");
					String img = null;
					String img1 = null;
					String img2 = null;
					String img3 = null;
					String img4 = null;
					img = (String) sission.getAttribute("imgMPS");
					img1 = (String) sission.getAttribute("imgPF");
					img2 = (String) sission.getAttribute("imgPSF");
					img3 = (String) sission.getAttribute("imgSPDI");
					img4 = (String) sission.getAttribute("imgGPL");

					try {
						System.out.println("___________"+vv.toString()+"***********"+vv3.toString());
						insert.Inserier_All(vv, vv3, vv2, vv4, img, img2, img1, img3,vv6, (String) sission.getAttribute("C3"),(String) sission.getAttribute("C4"), (String) sission.getAttribute("C5"), img4);


						//						insert.Inserier_GPL(vv6, (String) sission.getAttribute("C3"),
						//								(String) sission.getAttribute("C4"), (String) sission.getAttribute("C5"), img4);
					} catch (Exception e1) {

						e1.printStackTrace();
					}
					
					
//					if ((extracted(sission, "tab2") != 0 && ((ArrayList<Tab1>) sission.getAttribute("tab2")).size() != 1)) {
//
//
//						b++;
//						insert.remplirTab2((ArrayList<Tab1>) sission.getAttribute("tab2"));
//					}
					
					

				}
				try {
					if (sission.getAttribute("F") != null) {
						b++;
						insert.inss3((ArrayList<Les_lits>) sission.getAttribute("listGe0"));
						b++;
					}
					//					if (sission.getAttribute("C") != null) {
					//						insert.inss3((ArrayList<Les_lits>) sission.getAttribute("listGe"));
					//						b++;
					//					}
					if (sission.getAttribute("H") != null) {
						insert.inss3((ArrayList<Les_lits>) sission.getAttribute("listGe2"));
						b++;
					}
					if (sission.getAttribute("G") != null) {
						insert.inss3((ArrayList<Les_lits>) sission.getAttribute("listGe3"));
						b++;
					}

				} catch (Exception e) {

					e.printStackTrace();
				}
				

			

				//	listGe2 listGe3 TT marq tab3 tab2a

			
				
				
				
				
				
				if ((extractedB(sission, "B") != 0)) {
					System.out.println("*******************BBBBBBBBB*************************************fin");
					b++;

					ArrayList<Construction> B = (ArrayList<Construction>) sission.getAttribute("B");
					// System.out.println("*******************BBBBBBBBB*******************"+B.toString());
					try {
						insert.ecrireConstruction(B);
					} catch (Exception e) {

						e.printStackTrace();
					}
					// Insertion.instionB((Map<String, String>) );
				}
				if ((extracted2(sission, "C") != 0)) {
					System.out.println("**********************CCCCCCCC***************************fin");
					b++;
					insert.instionC((Map<String, String>) sission.getAttribute("C"));
				}
				if ((extracted2(sission, "D") != 0)) {
					System.out.println("************************DDDDDD***************************");
					b++;
					
					ArrayList<tabl_voisinage> TTr =null; //new ArrayList<tabl_voisinage>();
					if (sission.getAttribute("TT") != null)
						TTr = (ArrayList<tabl_voisinage>) sission.getAttribute("TT");
					else
						TTr = null;

					ArrayList<Tab1> marqq =new ArrayList<Tab1>();
					if (sission.getAttribute("marq") != null)
						marqq = (ArrayList<Tab1>) sission.getAttribute("marq");
					else
						marqq = null;
					
					try {
						if(marqq!=null && marqq.size()!=1 )
							insert.Inserier_Marq(marqq);
						
						if(TTr!=null && TTr.size()!=1 ) {
							insert.Inserier_transformateur(TTr);}
					}
					catch(Exception e) {
						
						
					}
					
					
					insert.instionD((Map<String, String>) sission.getAttribute("D"));
				}
				if ((extracted2(sission, "E") != 0)) {
					
					try {	
					if ((extracted4(sission, "tab3") != 0)) {
					 
						insert.remplirTab3((ArrayList<tab3>) sission.getAttribute("tab3"));
					}
					
					if ((extracted3(sission, "tab2a") != 0)) {
						b++;
						
							insert.remplirTab44((ArrayList<tab2>) sission.getAttribute("tab2a"));
						
					}
					
					
					b++;
					insert.instionE((Map<String, String>) sission.getAttribute("E"));
					} catch (Exception e) {
						 
						e.printStackTrace();
					}
				}
				if ((extracted2(sission, "F") != 0)) {
					b++;
					insert.instionF((Map<String, String>) sission.getAttribute("F"));
				}
				if ((extracted2(sission, "G") != 0)) {
					b++;
					insert.instionG((Map<String, String>) sission.getAttribute("G"));
				}
				if ((extracted2(sission, "H") != 0)) {
					b++;
					insert.instionH((Map<String, String>) sission.getAttribute("H"));
				}
				if ((extracted2(sission, "I") != 0)) {
					b++;
					insert.instionI((Map<String, String>) sission.getAttribute("I"));
				}
				if ((extracted2(sission, "J") != 0)) {
					b++;
					Map<String, String>liss=	(Map<String, String>) sission.getAttribute("J");
					insert.instionJ(liss);
					  jk=Integer.parseInt(liss.get("J8"));
					Doc.setNbrRe(Integer.parseInt(liss.get("J8")));
//					Doc.setNiveau_de_Prévention_Protection(liss.get("J8"));
//					Doc.setNiveau_de_Risque(liss.get("J8"));
				}
				if (b == 0) {
					System.out.println("----------------------------------------------------------------------------");
					insert.template();
				}
				try {

				 
							if(Dao.ExisteDoc(na)!=null) {
		//					 	Dao.update(Doc,Dao.ExisteDoc(Doc.getUrl_Doc(), Doc.getDate_Viste(),Doc.getNom_entreprise()));
								// Dao.updateWW(Doc,(Document)Dao.ExisteDoc(Doc.getUrl_Doc(), Doc.getURL_dossierImage()));
								System.out.println("--------update here----------");
								 Dao.updateS(jk,Dao.ExisteDoc(na).getIdDoc());
							}else {
								System.out.println("---------------hihi id=---------> "+Doc.getIdDoc());
								 Dao.addDocuemnt(Doc);
								
							}
						} catch (Exception e) {}
				sission.removeAttribute("Urldoss");	
				sission.removeAttribute("UrlDoc");	
				sission.removeAttribute("A");	
				sission.removeAttribute("B");	
				sission.removeAttribute("C");	
				sission.removeAttribute("D");	
				sission.removeAttribute("E");	
				sission.removeAttribute("F");	
				sission.removeAttribute("G");
				sission.removeAttribute("H");	
				sission.removeAttribute("I");	
				sission.removeAttribute("J");
				//tab1  Intermaidaire imgInter RMA_Ass imgRMA_Ass NSc  tabl_voisinage
				sission.removeAttribute("tab1");	
				sission.removeAttribute("Intermaidaire");	
				sission.removeAttribute("imgInter");	
				sission.removeAttribute("RMA_Ass");	
				sission.removeAttribute("imgRMA_Ass");	
				sission.removeAttribute("NSc");
				sission.removeAttribute("tabl_voisinage");	
				//MPS PF PSF SPDI GPL imgMPS imgPF imgPSF imgSPDI imgGPL  listGe0		 
				sission.removeAttribute("MPS");	
				sission.removeAttribute("PF");	
				sission.removeAttribute("PSF");	
				sission.removeAttribute("SPDI");	
				sission.removeAttribute("GPL");	
				sission.removeAttribute("imgMPS");
				sission.removeAttribute("imgPF");	
				sission.removeAttribute("imgPSF");	
				sission.removeAttribute("imgSPDI");
				sission.removeAttribute("imgGPL");
				sission.removeAttribute("listGe0");
				//	listGe2 listGe3 TT marq tab3 tab2a
				
				sission.removeAttribute("listGe2");
				sission.removeAttribute("listGe3");
				sission.removeAttribute("TT");	
				sission.removeAttribute("marq");	
				sission.removeAttribute("tab3");
				sission.removeAttribute("tab2a");
		 
				
				
				
				
//				sission.invalidate();
				Insertion.from = 0;
		//    response.sendRedirect("index.jsp");

				// request.getRequestDispatcher("/index.jsp").forward(request, response);

			}
			
			
		}
	 	 
		//

		//		if(a==0) 
		//		{
 	response.sendRedirect("index.jsp");
		//			// getServletContext().getRequestDispatcher("/index.jsp").forward(request,  response);	
		//	request.getRequestDispatcher("/index.jsp").forward(request, response);
		//		//	 request.getRequestDispatcher("/index.jsp").forward(request,  response);
		//		}else if(a!=0) {
		//		 // 
		//		  request.getRequestDispatcher("/index.jsp").forward(request,  response); 
		//		}
		// response.sendRedirect("index.jsp");

		// doGet(request, response);
	}

	@SuppressWarnings("unchecked")
	private int extracted(HttpSession sission, String s) {
		ArrayList<Tab1> lis = new ArrayList<Tab1>();
		if (sission.getAttribute(s) == null || ((ArrayList<Tab1>) sission.getAttribute(s)).size() == 0)
			return 0;
		else {
			lis = (ArrayList<Tab1>) sission.getAttribute(s);
			return lis.size();
		}
	}

	@SuppressWarnings("unchecked")
	private int extracted3(HttpSession sission, String s) {
		ArrayList<tab2> lis = new ArrayList<tab2>();
		if (sission.getAttribute(s) == null || ((ArrayList<tab2>) sission.getAttribute(s)).size() == 0)
			return 0;
		else {
			lis = (ArrayList<tab2>) sission.getAttribute(s);
			return lis.size();
		}
	}

	@SuppressWarnings("unchecked")
	private int extracted4(HttpSession sission, String s) {
		ArrayList<tab3> lis = new ArrayList<tab3>();
		if (sission.getAttribute(s) == null || ((ArrayList<tab3>) sission.getAttribute(s)).size() == 0)
			return 0;
		else {
			lis = (ArrayList<tab3>) sission.getAttribute(s);
			return lis.size();
		}
	}

	private int extracted2(HttpSession sission, String s) {
	 
		@SuppressWarnings("unchecked")
		Map<String, String> map = (Map<String, String>) sission.getAttribute(s);
		if (sission.getAttribute(s) == null || map.size() == 0)
			return 0;
		else {
			 
			return map.size();
		}
	}

	private int extractedB(HttpSession sission, String s) {
	 
		@SuppressWarnings("unchecked")
		ArrayList<Construction> arrayList = (ArrayList<Construction>) sission.getAttribute(s);
		if (sission.getAttribute(s) == null || arrayList.size() == 0)
			return 0;
		else {
 
			return arrayList.size();
		}
	}

}
