/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Contrôleur;

import DAO.SericeDao;
import java.io.IOException;
 
import java.net.URISyntaxException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import pl.jsolve.templ4docx.variable.ImageVariable;
import com.aspose.words.Document;
 

import com.aspose.words.ImportFormatMode;
 
import com.aspose.words.SaveFormat;
import com.aspose.words.SectionStart;
import com.sun.scenario.effect.Merge;
 
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import metier.*;
 
 
 
import pl.jsolve.templ4docx.core.Docx;
import pl.jsolve.templ4docx.core.VariablePattern;
import pl.jsolve.templ4docx.variable.ImageVariable;
import pl.jsolve.templ4docx.variable.TextVariable;
import pl.jsolve.templ4docx.variable.Variables;
 
@WebServlet("/ServiceServlet")
public class SeviceServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                request.getSession().setAttribute("user", null);
                request.getSession().setAttribute("images", null);
                  request.getSession().setAttribute("output", null);
                   request.getSession().setAttribute("save_rec", null);
                request.getSession().setAttribute("save_rec_st", null);
                  request.getSession().setAttribute("save_st", null);
                                    request.getSession().setAttribute("save_an", null);

		getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
              
       
    }
    

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session= request.getSession();
	    String page= (String) session.getAttribute("page");
	    String action=request.getParameter("action");
	    
//		String diir="";
//		try {
//			diir = testMa.class.getProtectionDomain().getCodeSource().getLocation().toURI().getPath();
//		} catch (URISyntaxException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}	
//	  String url =diir.substring(1,diir.length()-15);
//	  
//	 
//	 url=  url.concat("/src/rma/");
//	    
//	   System.out.println("Servlet Yassin hhhhhh"+url.replaceAll("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps", "")); 
//	   url=url.replace("/W", "");
//	     url=url.replaceAll("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps","");
//	   
//	   System.out.println("result  " +url);
 
          
	 
	   
          if(page.equals("convertir")){
              String url1=request.getParameter("pdf");
              String chemin=request.getParameter("chemin");
              System.out.println(url1 +"$$$$$$$$$$ "+chemin);
              // load the file to be converted
Document document;
      try {
          document = new Document(url1);
//save in different formats
      

document.save(chemin, SaveFormat.PDF);

          } catch (Exception ex) {
          Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
      }
       
                             getServletContext().getRequestDispatcher("/Convertir.jsp").forward(request, response);


}
          

	    if (page.equals("AjoutRecommandation")) {
	    
	    
	    
        if (action.equals("Parter")) {
          session.setAttribute("images", request.getParameter("images"));
          session.setAttribute("output", request.getParameter("words"));
	    getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request,  response);
      }
	    
                if(action.equals("Save")){
                	String nom_entreprise=null;
                    session.setAttribute("save_rec", "save");
                    if(request.getParameter("name")!=null)
                      nom_entreprise=request.getParameter("name");
                    else  nom_entreprise="---";
                    session.setAttribute("entreprise", nom_entreprise);
                    String Date=request.getParameter("date_visite");
                    session.setAttribute("Date_visite", Date);

                    String radioProspect=request.getParameter("Prospect");
                    String image_client=request.getParameter("image_client");
                    String nom_client=request.getParameter("nom_client");
                    String fonction_client=request.getParameter("fonction_client");
                    String adresse=request.getParameter("adresse");
                    String gps=request.getParameter("gps");
                     session.setAttribute("gps", gps);
                    String image_intermidiaire=request.getParameter("image_intermidiaire");
                  //  if(request.getParameter("nom_intermidiaire")!=null)
                 String nom_intermidiaire="";
                    //request.getParameter("nom_intermidiaire");
                    String fonction_intermidiaire=request.getParameter("fonction_intermidiaire");
                 
                    String reunion_ouverture=request.getParameter("reunion_ouverture");
                    String visite_site=request.getParameter("visite_site");
                    String reunion_cloture=request.getParameter("reunion_cloture");
                    String image_reunion=request.getParameter("image_reunion");
                    
                    if(radioProspect.equals("Prospect")){
               
                    Docx docx = new Docx("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//temp_rec.docx" );
//               System.out.println("uuuuuu uuuu "+url.replace("/W", "")+"/temp_rec.docx");
                    docx.setVariablePattern(new VariablePattern("${", "}"));
    
                  // preparing variables
                   Variables variables = new Variables();
                   variables.addTextVariable(new TextVariable("${prospect_radio}",radioProspect ));
                   variables.addTextVariable(new TextVariable("${name}",nom_entreprise));
                   variables.addTextVariable(new TextVariable("${n_police}",""));
                   variables.addTextVariable(new TextVariable("${date_visite}",Date));
                   variables.addTextVariable(new TextVariable("${nom_client}",nom_client));
                   variables.addTextVariable(new TextVariable("${fonction_client}",fonction_client));
                   variables.addTextVariable(new TextVariable("${adresse}",adresse));
                   variables.addTextVariable(new TextVariable("${gps}",gps));
                   ArrayList<Inter> Interm=new ArrayList<Inter>();

                   
                   int nbrE2222=1;

      if(request.getParameter("txtName6")!=null)  {
	  nbrE2222 = Integer.parseInt(request.getParameter("txtName6"));
	}
      String cl="";
      String ff ="";
	for (int p = 1; p <= nbrE2222; p++) {

		String xx = "inter" + p;
		String dd = "fonct" + p;
	       
       if(request.getParameter(xx)!=null)

		 cl = request.getParameter(xx);
       if(request.getParameter(dd)!=null)
		 ff = request.getParameter(dd);
	
		
		Inter rec=new Inter(cl,ff);
		Interm.add(rec);
                   } 
                   for(Inter r:Interm){
                       if(r!=null)
                       nom_intermidiaire= r.getNom()+ "  "+nom_intermidiaire ;
                   }
                   variables.addTextVariable(new TextVariable("${nom_intermidiaire}",nom_intermidiaire));
                   variables.addTextVariable(new TextVariable("${fonction_intermidiaire}",fonction_intermidiaire));
             
                   variables.addTextVariable(new TextVariable("${reunion_ouverture}",reunion_ouverture));
                   variables.addTextVariable(new TextVariable("${visite_site}",visite_site));
                   variables.addTextVariable(new TextVariable("${reunion_cloture}",reunion_cloture));
                   
                     if(image_client.equals("") ){
                       
                       variables.addTextVariable(new TextVariable("${image_client}",""));
                       
                   }
                   else {
                   ImageVariable image_clt = new ImageVariable("${image_client}",session.getAttribute("images")+"//"+ image_client, pl.jsolve.templ4docx.variable.ImageType. JPEG,90, 60);
                   variables.addImageVariable(image_clt); 
                   }
                   if(image_intermidiaire.equals("") ){
                       
                       variables.addTextVariable(new TextVariable("${image_intermidiaire}",""));
                       
                   }
                   else {
                   ImageVariable image_int = new ImageVariable("${image_intermidiaire}", session.getAttribute("images")+"//"+image_intermidiaire, pl.jsolve.templ4docx.variable.ImageType. JPEG, 90, 60);
                   variables.addImageVariable(image_int);}
                   if(image_reunion.equals("") ){
                       
                       variables.addTextVariable(new TextVariable("${image_reunion}",""));
                   }
                   else {
                   ImageVariable image_re = new ImageVariable("${image_reunion}", session.getAttribute("images")+"//"+image_reunion, pl.jsolve.templ4docx.variable.ImageType. JPEG, 90, 60);             
                   variables.addImageVariable(image_re); }
                 // fill template
                  docx.fillTemplate(variables);
        
                  // save filled .docx file
                 docx.save((String) session.getAttribute("output"));
                        
                    }
                    if(radioProspect.equals("Assuré")){
                        String numero_police=request.getParameter("numero_police");
                        session.setAttribute("n_police", numero_police);
                        Docx docx = new Docx("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//temp_rec.docx");
                    docx.setVariablePattern(new VariablePattern("${", "}"));
    
                  // preparing variables
                   Variables variables = new Variables();
                   variables.addTextVariable(new TextVariable("${prospect_radio}",radioProspect ));
                   variables.addTextVariable(new TextVariable("${name}",nom_entreprise));
                   variables.addTextVariable(new TextVariable("${n_police}",numero_police));
                   variables.addTextVariable(new TextVariable("${date_visite}",Date));
                   variables.addTextVariable(new TextVariable("${nom_client}",nom_client));
                   variables.addTextVariable(new TextVariable("${fonction_client}",fonction_client));
                   variables.addTextVariable(new TextVariable("${adresse}",adresse));
                   variables.addTextVariable(new TextVariable("${gps}",gps));
                   
                   ArrayList<Inter> Interm=new ArrayList<Inter>();
                   int nbrE2222=1;

                   if(request.getParameter("txtName6")!=null)  {
				  nbrE2222 = Integer.parseInt(request.getParameter("txtName6"));
				}
                   String cl="";
                   String ff ="";
				for (int p = 1; p <= nbrE2222; p++) {

					String xx = "inter" + p;
					String dd = "fonct" + p;
				       
                    if(request.getParameter(xx)!=null)
    
					 cl = request.getParameter(xx);
                    if(request.getParameter(dd)!=null)
					 ff = request.getParameter(dd);
				
					
					Inter rec=new Inter(cl,ff);
					Interm.add(rec);
                                } 
                                for(Inter r:Interm){
                                	if(r!=null) {
                                    nom_intermidiaire= r.getNom()+ "  "+nom_intermidiaire ;
                                    System.out.println("----"+nom_intermidiaire);
                                	
                                	}
                                }
                   variables.addTextVariable(new TextVariable("${nom_intermidiaire}",nom_intermidiaire));
                   variables.addTextVariable(new TextVariable("${fonction_intermidiaire}",fonction_intermidiaire));
                   
                   variables.addTextVariable(new TextVariable("${reunion_ouverture}",reunion_ouverture));
                   variables.addTextVariable(new TextVariable("${visite_site}",visite_site));
                   variables.addTextVariable(new TextVariable("${reunion_cloture}",reunion_cloture));
                   
                   

                   if(image_client.equals("") ){
                       
                       variables.addTextVariable(new TextVariable("${image_client}",""));
                       
                   }
                   else {
                   ImageVariable image_clt = new ImageVariable("${image_client}",session.getAttribute("images")+"//"+ image_client, pl.jsolve.templ4docx.variable.ImageType. JPEG,90, 60);
                   variables.addImageVariable(image_clt); 
                   }
                   if(image_intermidiaire.equals("") ){
                       
                       variables.addTextVariable(new TextVariable("${image_intermidiaire}",""));
                       
                   }
                   else {
                   ImageVariable image_int = new ImageVariable("${image_intermidiaire}", session.getAttribute("images")+"//"+image_intermidiaire, pl.jsolve.templ4docx.variable.ImageType. JPEG, 90, 60);
                   variables.addImageVariable(image_int);}
                   if(image_reunion.equals("") ){
                       
                       variables.addTextVariable(new TextVariable("${image_reunion}",""));
                   }
                   else {
                   ImageVariable image_re = new ImageVariable("${image_reunion}", session.getAttribute("images")+"//"+image_reunion, pl.jsolve.templ4docx.variable.ImageType. JPEG, 90, 60);             
                   variables.addImageVariable(image_re); }
                 // fill template
                  docx.fillTemplate(variables);
        
                  // save filled .docx file
                 docx.save((String) session.getAttribute("output"));
                        
                    }
                    int nbrE22=1;
                                ArrayList<responsable> resp=new ArrayList<responsable>();
				if(request.getParameter("txtName4")!=null)  {
				  nbrE22 = Integer.parseInt(request.getParameter("txtName4"));
				}
				
				for (int p = 1; p <= nbrE22; p++) {

					String rsp = "resp" + p;
					String fon = "fonction" + p;
				

					String responsale = request.getParameter(rsp);
					String fonction = request.getParameter(fon);
				
					
					responsable rec=new responsable(responsale,fonction);
					resp.add(rec);
                                } 
                    try {
                        ServiceMetier.remplirTab3(resp,(String) session.getAttribute("output"));
                        
                    } catch (Exception ex) {
                                          getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);

                    }
                    
                       int nbrE222=1;
                                ArrayList<Clt> clts=new ArrayList<Clt>();
				if(request.getParameter("txtName5")!=null)  {
				  nbrE222 = Integer.parseInt(request.getParameter("txtName5"));
				}
				for (int p = 1; p <= nbrE222; p++) {

					String rsp = "clt" + p;
					String fon = "fonc" + p;
				

					String cl = request.getParameter(rsp);
					String ff = request.getParameter(fon);
				
					
					Clt rec=new Clt(cl,ff);
					clts.add(rec);
                                } 
                    try {
                        ServiceMetier.remplirClients(clts,(String) session.getAttribute("output"));
                        
                    } catch (Exception ex) {
                                          getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);

                    }
				
                            int nbrE2222=1;
                                ArrayList<Inter> Interm=new ArrayList<Inter>();
				if(request.getParameter("txtName6")!=null)  {
				  nbrE2222 = Integer.parseInt(request.getParameter("txtName6"));
				}
				for (int p = 1; p <= nbrE2222; p++) {

					String xx = "inter" + p;
					String dd = "fonct" + p;
				

					String cl = request.getParameter(xx);
					String ff = request.getParameter(dd);
				
					
					Inter rec=new Inter(cl,ff);
					Interm.add(rec);
                                } 
                    try {
                        ServiceMetier.remplirInters(Interm,(String) session.getAttribute("output"));
                        
                    } catch (Exception ex) {
                                          getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);

                    }          





                    
                    

                 
                   
                  
                  getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);
                    
                    
                    
                }
                  if(action.equals("save")){
                                           session.setAttribute("save_rec_st", "save");

                      String []tab=request.getParameterValues("refs");
                       String   risque=request.getParameter("optradio");
                      
                      String ctgradio=request.getParameter("ctgradio");
                      String Ref_inc=request.getParameter("reference_inc");
                      String titre_reference=request.getParameter("titre_reference");         
                      String localisation=request.getParameter("localisation");
                   //   String gps_rec=request.getParameter("gps_rec");
                      String risque_encourus=request.getParameter("risque_encourus");                               
                      String constat=request.getParameter("constat");             
                      String Recommandation=request.getParameter("Recommandation");
                      String[] image_recommandation=request.getParameterValues("image_recommandation");
                      String[]  image_constat=request.getParameterValues("image_constat"); 
                      
                       String[]  image_encourus=request.getParameterValues("image_encourus"); 

                    
                     
                     
                    Docx docx = new Docx("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//RecommandationARemplis.docx");
                     
                    docx.setVariablePattern(new VariablePattern("${", "}"));
                  //insertion de recommandation dans la base de donnée
                   recommandation rec=new recommandation();
                   rec.setReference_rec(Ref_inc);
                   rec.setRec(titre_reference);
                   rec.setLocalisation(localisation);
                   rec.setRisque(risque);
                   rec.setType(ctgradio);
                    try {
                        SericeDao.AddRecommandation(rec);
                    } catch (SQLException ex) {  
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                  
                  
                  
                  // preparing variables
                   Variables variables = new Variables();
                   variables.addTextVariable(new TextVariable("${Rsq}",risque ));
                  
                   if(ctgradio.equals("A")){
                   variables.addTextVariable(new TextVariable("${aa}","+"));
                   variables.addTextVariable(new TextVariable("${bb}",""));
                   variables.addTextVariable(new TextVariable("${cc}",""));}
                    if(ctgradio.equals("B")){
                   variables.addTextVariable(new TextVariable("${aa}",""));
                   variables.addTextVariable(new TextVariable("${bb}","+"));
                   variables.addTextVariable(new TextVariable("${cc}",""));}
                   if(ctgradio.equals("C")){
                   variables.addTextVariable(new TextVariable("${aa}",""));
                   variables.addTextVariable(new TextVariable("${bb}",""));
                   variables.addTextVariable(new TextVariable("${cc}","+"));}
                   
                   
                   variables.addTextVariable(new TextVariable("${reference}",Ref_inc));
                   variables.addTextVariable(new TextVariable("${reference_name}",titre_reference));
                  // variables.addTextVariable(new TextVariable("${constat}",constat));
                 
                   variables.addTextVariable(new TextVariable("${localisation_name}",localisation));
                   //variables.addTextVariable(new TextVariable("${risques_encourus}",risque_encourus));
                   //variables.addTextVariable(new TextVariable("${point}",Recommandation));
                  
                  
                    
                   
                   
                 // fill template
                  docx.fillTemplate(variables);
                 // fill template
                  docx.fillTemplate(variables);
        
                  // save filled .docx file
                 docx.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");
                   
                   try {
                        ServiceMetier.EcrireText(constat,risque_encourus,Recommandation);
                    } catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                 
                 try {
               
                 ServiceMetier.ColorerRisque(risque);
            }
            catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                 try {
                    
                      ServiceMetier.insertPictureConstat(image_constat, (String) session.getAttribute("images"));
                      
                        
                    } catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                 try {
                    
                        ServiceMetier.insertPictureEncourus(image_encourus, (String) session.getAttribute("images"));
                      
                       
                    } catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                 
                 try {
                    
                        ServiceMetier.insertPictureRec(image_recommandation, (String) session.getAttribute("images"));
                      
                        
                    } catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                 
                  
                   try {
                                           ServiceMetier.inss3(tab);
                    } catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                 
                      System.out.println(risque);
                             
                      
                       
        
                
                      
                      Document document;
                      String p=null;
   				try {
   					document = new Document((String) session.getAttribute("output"));
   					p=Integer.toString(document.getPageCount()+1); 
   				} catch (Exception e) {
   					// TODO Auto-generated catch block
   					e.printStackTrace();
   				}
                      
                       Document  srcDoc;
                  
                    try {
                        srcDoc = new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");
                 
      
           Document dstDoc = new Document((String) session.getAttribute("output"));
           // set the appended document to start from a new page
           // Append the content of the document so it flows continuously.
           
          srcDoc.getFirstSection().getPageSetup().setSectionStart(SectionStart.NEW_PAGE);

          dstDoc.appendDocument(srcDoc, ImportFormatMode.KEEP_SOURCE_FORMATTING);
           // save final result
           dstDoc.save((String) session.getAttribute("output"));
                       } catch (Exception ex) {
 Logger.getLogger(Merge.class.getName()).log(Level.SEVERE, null, ex);
                       }
                    
                    
                    
                      try {
                        //recupérer la recomandation ajouté dans le premier resumé
                       recommandation recommandation= SericeDao.getRecommandatio();
                    
                       ServiceMetier.remplirTab(recommandation,(String) session.getAttribute("output"),p);
                               
                    } catch (SQLException ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } 
                getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);

                    
                  }
             
                   
              if(action.equals("Insert")){
                                      session.setAttribute("save_st", "save");

                      String   risque=request.getParameter("optradio");
                      String   url_rec=request.getParameter("url_rec");
                      String ctgradio=request.getParameter("ctgradio");
                      String reference_nv=request.getParameter("reference_nv");
                      String reference_localisation=request.getParameter("reference_localisation");
                   //   String reference_risque=request.getParameter("reference_risque");
                 //     String reference_ctgr=request.getParameter("reference_ctgr");
                      String recommandation_standard=request.getParameter("recommandation_standard");
                      Docx docx = new Docx(url_rec+"//"+recommandation_standard);

                        docx.setVariablePattern(new VariablePattern("${", "}"));
    
                  // preparing variables
                   Variables variables = new Variables();
                   variables.addTextVariable(new TextVariable("${localisation}",reference_localisation ));
                    variables.addTextVariable(new TextVariable("${reference}",reference_nv ));
                   variables.addTextVariable(new TextVariable("${NR}",risque));
                      if(ctgradio.equals("A")){
                   variables.addTextVariable(new TextVariable("${aa}","+"));
                   variables.addTextVariable(new TextVariable("${bb}",""));
                   variables.addTextVariable(new TextVariable("${cc}",""));}
                    if(ctgradio.equals("B")){
                   variables.addTextVariable(new TextVariable("${aa}",""));
                   variables.addTextVariable(new TextVariable("${bb}","+"));
                   variables.addTextVariable(new TextVariable("${cc}",""));}
                   if(ctgradio.equals("C")){
                   variables.addTextVariable(new TextVariable("${aa}",""));
                   variables.addTextVariable(new TextVariable("${bb}",""));
                   variables.addTextVariable(new TextVariable("${cc}","+"));}
                       // fill template
                  docx.fillTemplate(variables);
                 // fill template
                  docx.fillTemplate(variables);
        
                  // save filled .docx file
                 docx.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//Rec_standart_resultat.docx");
                      
   
           
                    try {
                        SericeDao.MoifierRecommandation(reference_nv, recommandation_standard,reference_localisation,risque,ctgradio);
                    } catch (SQLException ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                  
                  
                      try {
               
                 ServiceMetier.ColorerRisqueS(risque);
            }
            catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                   
                   Document  srcDoc;

                   Document document;
                   String p=null;
				try {
					document = new Document((String) session.getAttribute("output"));
					p=Integer.toString(document.getPageCount()+1); 
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                             
               
                   
                    try {
                        srcDoc = new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//Rec_standart_resultat.docx");
                 
      
           Document dstDoc = new Document((String) session.getAttribute("output"));
           // set the appended document to start from a new page
           // Append the content of the document so it flows continuously.
           
          srcDoc.getFirstSection().getPageSetup().setSectionStart(SectionStart.NEW_PAGE);

          dstDoc.appendDocument(srcDoc, ImportFormatMode.KEEP_SOURCE_FORMATTING);
           // save final result
           dstDoc.save((String) session.getAttribute("output"));
                       } catch (Exception ex) {
 Logger.getLogger(Merge.class.getName()).log(Level.SEVERE, null, ex);
                       }
                    try {
                        //recupérer la recomandation ajouté dans le premier resumé
                      Recommandation_Standart rec= SericeDao.getRecommandatioStandart(recommandation_standard);
  
                      System.out.println(p);
                       ServiceMetier.remplirTabs(rec,(String) session.getAttribute("output"),p);
                               
                    } catch (SQLException ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                          
                  getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);
                      
                  }
                
                     
                     
       
                         
                     if(action.equals("add")){
                                             session.setAttribute("save_an", "save");

                      String[] annexes=request.getParameterValues("annexes");
                      String var=request.getParameter("var");
                       String url4=request.getParameter("url_ann");
                   
                      
                    try {
                        ServiceMetier.insertPictures(annexes, url4);
                    } catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                         Docx docx = new Docx("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//entete.docx");
                       docx.setVariablePattern(new VariablePattern("${", "}"));
                      // preparing variables
                      Variables variables = new Variables();
                      variables.addTextVariable(new TextVariable("${var}",var));
                       // fill template
                      docx.fillTemplate(variables);
                      // fill template
                      docx.fillTemplate(variables);
        
                  // save filled .docx file
                 docx.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//entete.docx");
                             
                     
                  
                      
                    Document  srcDoc;
                    try {
                        srcDoc = new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//entete.docx");
                 
      
           Document dstDoc = new Document((String) session.getAttribute("output"));
           // set the appended document to start from a new page
           srcDoc.getFirstSection().getPageSetup().setSectionStart(SectionStart.NEW_PAGE);
           // append the source document using its original styles
           dstDoc.appendDocument(srcDoc, ImportFormatMode.KEEP_SOURCE_FORMATTING);
           // save final result
           dstDoc.save((String) session.getAttribute("output"));
                       } catch (Exception ex) {
                       getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);
                    }
        
      
                  getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);
            
            
            
            
            
            
            
            }
                      
                     
                      if(action.equals("Finish")){
                    	  int a=0;
                               String ma=null;
                          String risque = null;
                          String protection=null;
                            if(request.getParameter("J8")!=null)  {
                                ma=request.getParameter("J8");   
                                  if(ma.equals("1")){
                              risque="bon";
                              protection="Pauvre";
                          }
                             if(ma.equals("2")){
                              risque="Moyen";
                              protection="Pauvre";
                          }
                             
                             if(ma.equals("3")){
                              risque=" Médiocre  ";
                              protection="Pauvre";
                          }
                          
                             
                                if(ma.equals("4")){
                              risque="Mauvais";
                              protection="Pauvre";
                          }
                                  if(ma.equals("5")){
                              risque="bon";
                              protection="Besoin d amélioration";
                          }
                             
                               if(ma.equals("6")){
                              risque="Moyen";
                               protection="Besoin d amélioration";
                          }
                                 if(ma.equals("7")){
                              risque="Médiocre";
                              protection="Besoin d amélioration";
                          }
                                   if(ma.equals("8")){
                              risque="Mauvais";
                              protection="Besoin d amélioration";
                          }
                                     if(ma.equals("9")){
                              risque="bon";
                              protection="Adéquat,Standard";
                          }
                                          if(ma.equals("10")){
                              risque="Moyen";
                              protection="Adéquat,Standard";
                          }
                              if(ma.equals("11")){
                              risque="Médiocre";
                              protection="Adéquat,Standard";
                          }
                              if(ma.equals("12")){
                              risque="Mauvais";
                              protection="Adéquat,Standard";
                          }
                               if(ma.equals("13")){
                              risque="bon";
                              protection="Au-dessus de la normale";
                          }
                               if(ma.equals("14")){
                              risque="Moyen";
                              protection="Au-dessus de la normale";
                          }
                               
                            if(ma.equals("15")){
                              risque="Médiocre";
                              protection="Au-dessus de la normale";
                          } 
                            if(ma.equals("16")){
                              risque="Mauvais";
                              protection="Au-dessus de la normale";
                          }
                            }
                            else {
                                request.setAttribute("errorP"," Vous pouvez pas cloturer votre rapport avant d'evaluer le client sur la matrice d'Evaluation!");
                     getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);
a++;
                            }

                      if(a==0) {
                            ServiceMetier.removeLastRow((String) session.getAttribute("output"));
                      
                           
                            System.out.println(session.getAttribute("entreprise")+" "+ session.getAttribute("Date_visite"));
                            Client client=new Client();
                            
                            client.setNom_entreprise((String) session.getAttribute("entreprise"));
                            client.setDate_visite((String) session.getAttribute("Date_visite"));
                            client.setNiveau_de_Risque(risque);
                            client.setNiveau_de_protection(protection);
                            client.setUrl((String) session.getAttribute("output"));
                            client.setGeo((String) session.getAttribute("gps"));
                            
                         
                            if( session.getAttribute("n_police")==null){
                                 client.setN_police("NULL");
                            }
                            else{
                             client.setN_police((String) session.getAttribute("n_police"));}
                             System.out.println((String) session.getAttribute("gps") );
                    try {
                        SericeDao.AddClient(client);
                    } catch (SQLException ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                       
                      Document  srcDoc;
                    try {
                        srcDoc = new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//finish.docx");
                 
      
           Document dstDoc = new Document((String) session.getAttribute("output"));
           // set the appended document to start from a new page
           srcDoc.getFirstSection().getPageSetup().setSectionStart(SectionStart.NEW_PAGE);
           // append the source document using its original styles
           dstDoc.appendDocument(srcDoc, ImportFormatMode.KEEP_SOURCE_FORMATTING);
           
           // save final result
           dstDoc.save((String) session.getAttribute("output"));
            
                       } catch (Exception ex) {
                 Logger.getLogger(Merge.class.getName()).log(Level.SEVERE, null, ex);
                       }
                     try {
                        ServiceMetier.TOC((String) session.getAttribute("output"));
                    } catch (Exception ex) {
                        Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
             
       
                  
                      request.getSession().setAttribute("images", null);
                  request.getSession().setAttribute("output", null);
                        request.getSession().setAttribute("save_rec", null);  
                          request.getSession().setAttribute("save_rec_st", null);
                  request.getSession().setAttribute("save_st", null);
                        request.getSession().setAttribute("save_an", null); 
                    
                  getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);
                      
                  
                      }   
                          
                          
                          
                      }
                      if(action.equals("Reset")){
                            request.getSession().setAttribute("images", null);
                  request.getSession().setAttribute("output", null);
                   request.getSession().setAttribute("save_rec", null);
                request.getSession().setAttribute("save_rec_st", null);
                  request.getSession().setAttribute("save_st", null);
                                    request.getSession().setAttribute("save_an", null);
             getServletContext().getRequestDispatcher("/recommandation.jsp").forward(request, response);


                      }
	    }                      
                      
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
              if (page.equals("Admin")) {
                  if(action.equals("Add")){
                    
                      String ref_titre=request.getParameter("reference_titre");
                      String ref_description=request.getParameter("reference_description");
                      Referentiel ref=new Referentiel(ref_titre, ref_description);
                      
                      try {
                          SericeDao.AddReferentiel(ref);
                      } catch (Exception ex) {
                          System.out.println("-----Message Exec"+ex.getMessage());
                          request.setAttribute("error"," La réferenciel que vous avez choisis est existe déja dans la base de données !");
                      }
                      
                      
                                                                 getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);

                      
                      
                  }
                   if(action.equals("save")){
                       
                      String   risque=request.getParameter("optradio");
                      
                      String ctgradio=request.getParameter("ctgradio");
                      String reference_nv=request.getParameter("reference_inc");
                      String reference_Titre=request.getParameter("reference_titre");
                      String localisation=request.getParameter("localisation");
                      String rec_standart_nom=request.getParameter("rec_standart");
                      
                      
                       Recommandation_Standart rec=new Recommandation_Standart();
                     rec.setReference_rec(reference_nv);
                     rec.setRec(reference_Titre);
                     rec.setLocalisation(localisation);
                     rec.setRisque(risque);
                     rec.setType(ctgradio);
                     rec.setNom_rec(rec_standart_nom);
                    try {
                        SericeDao.AddRecommandationStandart(rec);
                    } catch (Exception ex) {
                        request.setAttribute("error"," Attention la récommandation que vous avez choisis est déja existe dans la Base de donées .");
                    }

      getServletContext().getRequestDispatcher("/Admin.jsp").forward(request, response);

                   }
                    
                  
              }
              if (page.equals("chart")) {
               if(action.equals("Display")){
                         System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                       String a=request.getParameter("dd");
                       int date=Integer.parseInt(a);
                        Long bon=null;
                         Long moyen=null;
                         Long Mediocre=null;
                         Long Mauvais=null;
                       
                      try {
                           bon=(Long)SericeDao.getAllBon(date);
                            moyen=(Long)SericeDao.getAllMoyen(date);
                             Mediocre=(Long)SericeDao.getAllMédiocre(date);
                             Mauvais=(Long)SericeDao.getAllMauvais(date);
                      } catch (SQLException ex) {
                          Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                      }
                           
                      request.setAttribute("bon", bon);
                      request.setAttribute("moyen", moyen);
                      request.setAttribute("mediocre", Mediocre);
                      request.setAttribute("mauvais", Mauvais);
                      request.setAttribute("annee", date);
                         
                               getServletContext().getRequestDispatcher("/chart.jsp").forward(request, response);

                         
                         
                     }
                                          if(action.equals("Show")){
                       String b=request.getParameter("ddd");
                       int date =Integer.parseInt(b);
                        Long pauvre=null;
                          Long besoin=null;
                             Long adequat=null;
                        Long dessus=null;
                       
                      try {
                           pauvre=(Long)SericeDao.getAllPauvre(date);
                            besoin=(Long)SericeDao.getAllBesoin(date);
                             adequat=(Long)SericeDao.getAllAdéquat(date);
                             dessus=(Long)SericeDao.getAllAu_dessus(date);
                      } catch (SQLException ex) {
                          Logger.getLogger(SeviceServlet.class.getName()).log(Level.SEVERE, null, ex);
                      }
                           
                      request.setAttribute("pauvre", pauvre);
                      request.setAttribute("besoin", besoin);
                      request.setAttribute("adequat", adequat);
                      request.setAttribute("dessus", dessus);
                      request.setAttribute("anneee", date);
                         
                               getServletContext().getRequestDispatcher("/chart.jsp").forward(request, response);

                         
                         
                     }
              }
    }
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
