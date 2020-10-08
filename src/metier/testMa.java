package metier;

import java.text.ParseException;
import java.util.ArrayList;

public class testMa {

	public static void main(String[] args) {
		User us=new User();
//		us.setEmail("tigoud");
//		us.setNomPre("saluuuuuuuuuut");
//		us.setPassWord("aaaaaaaaaaaaaaaaaaaaaaaaax");
//		
////		Document(long idDoc, String numPolice, String nom_entreprise, String prospect, String url_Doc,
////				String uRL_dossierImage, String date_Viste, long capitale, String activite, String niveau_de_Risque,
////				String niveau_de_Prévention_Protection, String adresse, User auth)Document(int, String, String, String, String, String, String, int, String, String, String, User)
////		Document(int, String, String, String, String, String, String, int, String, String, String, User) 
//		 long f=232L;
// 	Document doc=new Document();
// 	doc.setActivite("hhhhhhhhhhh");
// 	doc.setAdresse("hhhhh");
// 	doc.setAuth(us);
// 	doc.setCapitale(f);
// 	doc.setDate_Viste("19/2/2019");
// doc.setNom_entreprise("hhhhhhhh");
// doc.setNumPolice("hhhhhhhhhhhhhhh");
// doc.setNbrRe(6);
// doc.setUrl_Doc("\"C:\\\\Users\\\\ACER\\\\Desktop\\\\centains images\\\\téléchargé.jpg\"");
// doc.setURL_dossierImage("\"C:\\\\Users\\\\ACER\\\\Desktop\\\\centains images\\\\téléchargé.jpg\"");
 //		Donnes don=new Donnes();
//
// //les_Doc.add(doc);
// User.les_Doc.add(doc);
// 	//	doc.setAuth(us);
// 	//	don.setUser(us);
//	//User.les_Doc.add(doc);
// 
//	try {
//
//  Dao.addUser(us);
//		if(Dao.ExisteDoc(doc.getUrl_Doc(), doc.getDate_Viste(),doc.getNom_entreprise())!=null) {
//		 	//Dao.update(doc,Dao.ExisteDoc(doc.getUrl_Doc(), doc.getDate_Viste()));
//			 Dao.addDocuemnt(doc);
// 
//		}else {
//			System.out.println("hihi id= "+doc.getIdDoc());
//		//	 Dao.addDocuemnt(doc);
//			
//		}
//	} catch (Exception e) {
//	 
//		e.printStackTrace();
//	}

//		String mess = null,mseea=null;
//		Construction cons2=new Construction("1111111","111111111","dfdfvdfv","dfvdfv","dssdc","sdvsdf","sdcdc","sdcs","sdcdcd","svdd","asda","dfsf","C:\\Users\\ACER\\Desktop\\centains images\\téléchargé.jpg","111111111");
//		Construction cons3=new Construction("222222222","ayoub","dfdfvdfv","dfvdfv","dssdc","sdvsdf","sdcdc","sdcs","sdcdcd","svdd","asda","dfsf","C:\\Users\\ACER\\Desktop\\centains images\\téléchargé.jpg","22222222222");
//
//		Construction cons4=new Construction("333333333","ayoub","dfdfvdfv","dfvdfv","dssdc","sdvsdf","sdcdc","sdcs","sdcdcd","svdd","asda","dfsf","C:\\Users\\ACER\\Desktop\\centains images\\téléchargé.jpg","33333333");
//		Construction cons5=new Construction("444444444444","ayoub","dfdfvdfv","dfvdfv","dssdc","sdvsdf","sdcdc","sdcs","sdcdcd","svdd","asda","dfsf","C:\\Users\\ACER\\Desktop\\centains images\\téléchargé.jpg","4444444444");
//		Construction cons6=new Construction("1111111","111111111","dfdfvdfv","dfvdfv","dssdc","sdvsdf","sdcdc","sdcs","sdcdcd","svdd","asda","dfsf","C:\\Users\\ACER\\Desktop\\centains images\\téléchargé.jpg","111111111");
//		Construction cons7=new Construction("222222222","ayoub","dfdfvdfv","dfvdfv","dssdc","sdvsdf","sdcdc","sdcs","sdcdcd","svdd","asda","dfsf","C:\\Users\\ACER\\Desktop\\centains images\\téléchargé.jpg","22222222222");
//
//		Construction cons8=new Construction("333333333","ayoub","dfdfvdfv","dfvdfv","dssdc","sdvsdf","sdcdc","sdcs","sdcdcd","svdd","asda","dfsf","C:\\Users\\ACER\\Desktop\\centains images\\téléchargé.jpg","33333333");
//		Construction cons9=new Construction("444444444444","ayoub","dfdfvdfv","dfvdfv","dssdc","sdvsdf","sdcdc","sdcs","sdcdcd","svdd","asda","dfsf","C:\\Users\\ACER\\Desktop\\centains images\\téléchargé.jpg","4444444444");
//		
//		
//		ArrayList<Construction> cons=new ArrayList<Construction>();
//		cons.add(cons2);
//		cons.add(cons3);
//		cons.add(cons4);
//		cons.add(cons5);
//		cons.add( cons6);
//		cons.add(cons7 );
//		cons.add( cons8);
//		cons.add(cons9 );
//		String diir=testMa.class.getProtectionDomain().getCodeSource().getLocation().getPath();
// 	System.out.println("***"+Insertion.urldd());
 		try {
			Insertion insert=new Insertion("/template.docx","C:\\Users\\ACER\\Desktop\\output.docx");
		} catch (ex | ParseException e) {
			System.out.println("...."+e.getMessage());
			e.printStackTrace();
		}
//		Insertion.template = "rma//template.docx";
//		Insertion.tmp="C:\\Users\\ACER\\Desktop\\output.docx";
//		Insertion.docIm="C:\\\\Users\\\\ACER\\\\Desktop\\\\centains images";
//		ArrayList<tabl_voisinage> vpos=new ArrayList<tabl_voisinage>();
//		 tabl_voisinage com=new tabl_voisinage("1111111", "téléchargé.jpg");
//		 tabl_voisinage com1=new tabl_voisinage("ayoub", "téléchargé.jpg");
//		 tabl_voisinage com2=new tabl_voisinage("1111111", "téléchargé.jpg");
//		 tabl_voisinage com3=new tabl_voisinage("1111111111", "téléchargé.jpg");
//		 vpos.add(com);
//		 vpos.add(com1);
//		 vpos.add(com2);
//		 vpos.add(com3);
//		 
//		 Tab1 tab=new Tab1("aaaaaaaa","bbbbbbbb","CCCCCCCCCC");
//		 Tab1 tab2=new Tab1("aaaaaaaa","bbbbbbbb","CCCCCCCCCC");
//		 Tab1 tab3=new Tab1("aaaaaaaa","bbbbbbbb","CCCCCCCCCC");
//		 Tab1 tab4=new Tab1("aaaaaaaa","bbbbbbbb","CCCCCCCCCC");
//		 ArrayList<Tab1> vv=new ArrayList<Tab1>();
//		 vv.add(tab);
//		 vv.add(tab2);
//		 vv.add(tab3);
//		 vv.add(tab4);
//		 ArrayList<String > list=new ArrayList<String>();
//		 ArrayList<String > list2=null;//new ArrayList<String>();
// 	 list.add("Ayoub");list.add("Ayoub");list.add("Ayoub");list.add("Ayoub");list.add("Ayoub");
////		  try {
////			  System.out.println("----"+Insertion.from);
// 			   try {
//				mseea=    insert.IndexROws(12);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} 
//			//  
// 		
// 			  insert.inserterInter(list, "Inter", "téléchargé.jpg");
// 	 	      insert.inserterInter(list, "NSc", "téléchargé.jpg");
// 		  insert.inserterInter(list, "RMA_Ass", "téléchargé.jpg");
// 		  insert.remplirTab(vv);
// 			  insert.inserterVoisi(vpos);
//  
//	    insert.Inserier_Marq(vv);
// // insert.Inserier_All(list , list  , list2, list ,"téléchargé.jpg","téléchargé.jpg","téléchargé.jpg","téléchargé.jpg",vv,"Ayouuuub","Ayouuuub","Ayouuuub","téléchargé.jpg");
//	//		 insert.Inserier_GPL(vv,"Ayouuuub","Ayouuuub","Ayouuuub","téléchargé.jpg");
//	 	  insert.remplirTab(vv);
//		    insert.inserterVoisi(vpos);
//		System.out.println(",,,"+Insertion.template);	  
//	  
//		System.out.println("template.docx "+insert.Inserier_transformateur(vpos)); 	 
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//   System.out.println("iiiiiiiiiiiiiiiiiiiindex et columns "+mess);
		   System.out.println("       "+Insertion.urldd());
		
	}

 

}
