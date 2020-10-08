/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package metier;

import DAO.SericeDao;

import com.aspose.words.Cell;
import com.aspose.words.ControlChar;
import com.aspose.words.Document;
import com.aspose.words.DocumentBuilder;
import com.aspose.words.Font;
import com.aspose.words.ListTemplate;
import com.aspose.words.NodeType;
import com.aspose.words.RelativeHorizontalPosition;
import com.aspose.words.RelativeVerticalPosition;
import com.aspose.words.SaveFormat;
import com.aspose.words.Table;
import com.aspose.words.WrapType;

import java.awt.Color;
import java.io.File;
 
import java.sql.SQLException;
import java.util.ArrayList;
 
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import pl.jsolve.templ4docx.variable.TableVariable;
import pl.jsolve.templ4docx.variable.TextVariable;
import pl.jsolve.templ4docx.variable.Variable;
import pl.jsolve.templ4docx.variable.Variables;
 
import org.apache.poi.xwpf.usermodel.XWPFTable;
import pl.jsolve.templ4docx.core.Docx;
/**
 *
 * @author yassi
 */
public class ServiceMetier {
    
	
	 
//	public static String idii=Insertion.urldd();
 
	

//	 public static String  TOCdd( ) throws Exception{
//	 System.out.println("____________>"+idii);
//	 ret
//	   }
//	
   public static void TOC(String url) throws Exception {
       Document document = new Document(url);
       
document.updateFields();
document.updatePageLayout();
document.save(url);
   }
    

    
    
    public static void removeLastRow(String url){
           
        Docx docx = new Docx(url);    
        XWPFTable table=  docx.getXWPFDocument().getTableArray(6);
      table.removeRow(table.getNumberOfRows()-1);
      docx.save(url);

        
    }
    
    
    
    static public void inss3(String[] GENIRIQUE) throws Exception {
		System.out.println("hihi captine");
		Document doc = null;
                doc=new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");
		
		DocumentBuilder builder = new DocumentBuilder(doc);
 
		doc.getLists().add(ListTemplate.BULLET_DISK);
 
                  builder.moveToBookmark("referenciels");
                   if(GENIRIQUE ==null  ) {
                                               builder.writeln(" ");

                      
                  }
                   else{
		for (String posi : GENIRIQUE) {
			
                      
			//System.out.println("posiposi------> " + posi.getNom());
				  
				builder.writeln(String.format(posi));

//		        builder.insertBreak(BreakType.SECTION_BREAK_NEW_PAGE);
			}}
			
		builder.getListFormat().removeNumbers();
 
		doc.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");

	}
      
    static public void insertPictures(String[] GENIRIQUE,String img) throws Exception {
		System.out.println("hihi captine");
		Document doc = null;
                doc=new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//entete_tmp.docx");
		
		DocumentBuilder builder = new DocumentBuilder(doc);
 
		doc.getLists().add(ListTemplate.BULLET_DISK);
		
                  builder.moveToBookmark("images");
		for (String posi : GENIRIQUE) {
			
                      System.out.println(posi);
			//System.out.println("posiposi------> " + posi.getNom());
				  
		builder.insertImage(img+"//"+posi,500, 624);
                
                  
                
                         builder.writeln(ControlChar.LINE_BREAK);
                         
                          

//		        builder.insertBreak(BreakType.SECTION_BREAK_NEW_PAGE);
			}
			
builder.getListFormat().removeNumbers();
 
		doc.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//entete.docx");

	}
      
public static  ArrayList<Referentiel>  getAllReferentiels( ) throws SQLException{
        ArrayList<Referentiel> refs=new ArrayList<Referentiel>();
        refs=SericeDao.getAllReferentiels();
        
        return refs;
}
       public static void remplirTab(recommandation rec,String url,String p){
        
     Docx docx = new Docx(url);
    Variables var = new Variables();
      XWPFTable table=  docx.getXWPFDocument().getTableArray(6);
      
      
    TableVariable tableVariable = new TableVariable();

    List<Variable> reference_inc = new ArrayList<Variable>();
    List<Variable> recommandation = new ArrayList<Variable>();
    List<Variable> localisation = new ArrayList<Variable>();
    List<Variable> risque = new ArrayList<Variable>();
    List<Variable> categorie = new ArrayList<Variable>();
    List<Variable> page = new ArrayList<Variable>();

List<recommandation> recs = new ArrayList<recommandation>();
rec.setPage(p);
recs.add(new recommandation(rec.getReference_rec(), rec.getRec(),rec.getLocalisation(),rec.getRisque(),rec.getType(),rec.getPage()));
recs.add(new recommandation("${Rf_inc}", "${recommandation}","${localisation}","${Ris}","${cgr}","${page}"));
int nbRows=table.getNumberOfRows();

for (recommandation student : recs) {

reference_inc.add(new TextVariable("${Rf_inc}", student.getReference_rec()));

recommandation.add(new TextVariable("${recommandation}", student.getRec()));

localisation.add(new TextVariable("${localisation}", student.getLocalisation()));

risque.add(new TextVariable("${Ris}", student.getRisque()));
categorie.add(new TextVariable("${cgr}", student.getType()));

page.add(new TextVariable("${page}",student.getPage()));
if( student.getRisque().equals("R1"))
     table.getRow(nbRows-1).getCell(3).setColor("499369");
if(student.getRisque().equals("R2"))
     table.getRow(nbRows-1).getCell(3).setColor("FFD700");
if(student.getRisque().equals("R3"))
     table.getRow(nbRows-1).getCell(3).setColor("FFA500");
if(student.getRisque().equals("R4"))
     table.getRow(nbRows-1).getCell(3).setColor("FF0000");

}

tableVariable.addVariable(reference_inc);
tableVariable.addVariable(recommandation);
tableVariable.addVariable(localisation);
tableVariable.addVariable(risque);
tableVariable.addVariable(categorie);
tableVariable.addVariable(page);
var.addTableVariable(tableVariable);
docx.fillTemplate(var);          

System.out.println("ddddd"+nbRows);
docx.save(url);
        
 }
         public static void remplirTabs(Recommandation_Standart rec,String url,String p){
         
     Docx docx = new Docx(url);
    Variables var = new Variables();
      XWPFTable table=  docx.getXWPFDocument().getTableArray(6);
      
      
    TableVariable tableVariable = new TableVariable();

    List<Variable> reference_inc = new ArrayList<Variable>();
    List<Variable> recommandation = new ArrayList<Variable>();
    List<Variable> localisation = new ArrayList<Variable>();
    List<Variable> risque = new ArrayList<Variable>();
    List<Variable> categorie = new ArrayList<Variable>();
    List<Variable> page = new ArrayList<Variable>();

List<recommandation> recs = new ArrayList<recommandation>();
rec.setPage(p);
recs.add(new recommandation(rec.getReference_rec(), rec.getRec(),rec.getLocalisation(),rec.getRisque(),rec.getType(),rec.getPage()));
recs.add(new recommandation("${Rf_inc}", "${recommandation}","${localisation}","${Ris}","${cgr}","${page}"));
int nbRows=table.getNumberOfRows();

for (recommandation student : recs) {

reference_inc.add(new TextVariable("${Rf_inc}", student.getReference_rec()));

recommandation.add(new TextVariable("${recommandation}", student.getRec()));

localisation.add(new TextVariable("${localisation}", student.getLocalisation()));

risque.add(new TextVariable("${Ris}", student.getRisque()));
categorie.add(new TextVariable("${cgr}", student.getType()));
page.add(new TextVariable("${page}",student.getPage()));

if( student.getRisque().equals("R1"))
     table.getRow(nbRows-1).getCell(3).setColor("499369");
if(student.getRisque().equals("R2"))
     table.getRow(nbRows-1).getCell(3).setColor("FFD700");
if(student.getRisque().equals("R3"))
     table.getRow(nbRows-1).getCell(3).setColor("FFA500");
if(student.getRisque().equals("R4"))
     table.getRow(nbRows-1).getCell(3).setColor("FF0000");

}

        
tableVariable.addVariable(reference_inc);
tableVariable.addVariable(recommandation);
tableVariable.addVariable(localisation);
tableVariable.addVariable(risque);
tableVariable.addVariable(categorie);
tableVariable.addVariable(page);
var.addTableVariable(tableVariable);
docx.fillTemplate(var);          

System.out.println("ddddd"+nbRows);
docx.save(url);
 
   
        
    }
 
    
 
        public static void sendToBrowser(Document doc, String demoName, String formatType, boolean openNewWindow, HttpServletResponse response)
        throws Exception
{
    String extension = formatType;

    String fileName = demoName + "." + extension;

    // Add the Response header
    if(openNewWindow)
        response.setHeader("content-disposition","attachment; filename=" + fileName);
    else
        response.addHeader("content-disposition","inline; filename=" + fileName);


    response.setContentType("application/pdf");
    doc.save(response.getOutputStream(), SaveFormat.PDF);
}
        
        
        public static void remplirTab3(ArrayList<responsable> rec,String url) throws Exception {
	//	System.out.println("remplirTabremplirTabremplirTabremplirTab  ");
		Document doc = null;
                doc=new Document(url);
		
		DocumentBuilder builder = new DocumentBuilder(doc);
                Font font=builder.getFont();
		doc.getLists().add(ListTemplate.BULLET_DISK);
	 
                  builder.moveToBookmark("resps");
		for (responsable posi : rec) {
			
                      
			//System.out.println("posiposi------> " + posi.getNom());
                        font.setBidi(false);
                                builder.getParagraphFormat().setBidi(false);
				  font.setBold(true);
				builder.write(String.format( posi.getNom()+ControlChar.LINE_FEED));
                                font.setBold(false);
                                font.setBidi(true);
                                builder.getParagraphFormat().setBidi(true);

                                builder.writeln(posi.getFonction());
                                
		
			}
		
		
		builder.getListFormat().removeNumbers();
 
		doc.save(url);
	}
        
        
        static public void insertPictureConstat(String[] GENIRIQUE,String img) throws Exception {
		System.out.println("hihi captine");
		Document doc = null;
                doc=new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");
		
		DocumentBuilder builder = new DocumentBuilder(doc);
 
		doc.getLists().add(ListTemplate.BULLET_DISK);
		
                  builder.moveToBookmark("photo_constat");
                  if(GENIRIQUE[0].equals("")==true ) {
                      builder.write(" ");

}
                   else {
        
                	   int i=0;
		for (String posi : GENIRIQUE) {
			
                      System.out.println(posi);
			//System.out.println("posiposi------> " + posi.getNom());

                
                  
                
builder.insertImage(img+"//"+posi, RelativeHorizontalPosition.MARGIN, 100, 
        RelativeVerticalPosition.MARGIN, 100, 100, 100, WrapType.INLINE);
                 builder.write("    "); 
                if(i==3) builder.writeln(ControlChar.TAB+ControlChar.TAB+ControlChar.TAB+ControlChar.TAB); 

                	 i++;
//		        builder.insertBreak(BreakType.SECTION_BREAK_NEW_PAGE);
			}
                  }
builder.getListFormat().removeNumbers();
 
		doc.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");

	}
      
         static public void insertPictureRec(String[] GENIRIQUE,String img) throws Exception {
		System.out.println("hihi captine");
		Document doc = null;
                doc=new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");
		
		DocumentBuilder builder = new DocumentBuilder(doc);
 
		doc.getLists().add(ListTemplate.BULLET_DISK);
		
                  builder.moveToBookmark("photo_rec");
                  if(GENIRIQUE[0].equals("")==true ) {
                      builder.write(" ");

}
                  else {
                      
               	   int i=0;
		for (String posi : GENIRIQUE) {
			
                     System.out.println(posi);
			//System.out.println("posiposi------> " + posi.getNom());

               
                 
               
builder.insertImage(img+"//"+posi, RelativeHorizontalPosition.MARGIN, 100, 
       RelativeVerticalPosition.MARGIN, 100, 100, 100, WrapType.INLINE);
                builder.write("    "); 
               if(i==3) builder.writeln(ControlChar.TAB+ControlChar.TAB+ControlChar.TAB+ControlChar.TAB); 

               	 i++;
//		        builder.insertBreak(BreakType.SECTION_BREAK_NEW_PAGE);
			}
                 }
			
builder.getListFormat().removeNumbers();
 
		doc.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");

	}
         
         
         static public void insertPictureEncourus(String[] GENIRIQUE,String img) throws Exception {
		System.out.println("hihi captine");
		Document doc = null;
                doc=new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");
		
		DocumentBuilder builder = new DocumentBuilder(doc);
 
		doc.getLists().add(ListTemplate.BULLET_DISK);
		
                  builder.moveToBookmark("encourus");
                  if(GENIRIQUE[0].equals("")==true ) {
                                               builder.write(" ");
                     
                  }
                  else {
                      
               	   int i=0;
		for (String posi : GENIRIQUE) {
			
                     System.out.println(posi);
			//System.out.println("posiposi------> " + posi.getNom());

               
                 
               
builder.insertImage(img+"//"+posi, RelativeHorizontalPosition.MARGIN, 100, 
       RelativeVerticalPosition.MARGIN, 100, 100, 100, WrapType.INLINE);
                builder.write("    "); 
               if(i==3) builder.writeln(ControlChar.TAB+ControlChar.TAB+ControlChar.TAB+ControlChar.TAB); 

               	 i++;
//		        builder.insertBreak(BreakType.SECTION_BREAK_NEW_PAGE);
			}
                 }
			
builder.getListFormat().removeNumbers();
 
		doc.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");

	}
         
         public static void ColorerRisque(String risque)  throws Exception{

             Document doc = new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");
             Table table = (Table)doc.getChild(NodeType.TABLE, 0, true);
                     Cell firstCell = table.getFirstRow().getLastCell();

            if( risque.equals("R1"))
               firstCell.getCellFormat().getShading().setBackgroundPatternColor(Color.decode("#499369"));



      if(risque.equals("R2"))
                   firstCell.getCellFormat().getShading().setBackgroundPatternColor(Color.decode("#FFD700"));

      if(risque.equals("R3"))
                       firstCell.getCellFormat().getShading().setBackgroundPatternColor(Color.decode("#FFA500"));
      if(risque.equals("R4"))

      firstCell.getCellFormat().getShading().setBackgroundPatternColor(Color.decode("#FF0000"));
              
              doc.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");
            
                   
      }
                      public static void ColorerRisqueS(String risque)  throws Exception{
                        
                     Document doc = new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//Rec_standart_resultat.docx");
      	
      	Table table = (Table)doc.getChild(NodeType.TABLE, 0, true);
              Cell firstCell = table.getFirstRow().getLastCell();
           if( risque.equals("R1"))
               firstCell.getCellFormat().getShading().setBackgroundPatternColor(Color.decode("#499369"));



      if(risque.equals("R2"))
                   firstCell.getCellFormat().getShading().setBackgroundPatternColor(Color.decode("#FFD700"));

      if(risque.equals("R3"))
                       firstCell.getCellFormat().getShading().setBackgroundPatternColor(Color.decode("#FFA500"));
      if(risque.equals("R4"))

      firstCell.getCellFormat().getShading().setBackgroundPatternColor(Color.decode("#FF0000"));
             
             doc.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//Rec_standart_resultat.docx");

                   
      } 
               
               
             
           
           public static void deleteFile(String url){
                


 File file = new File(url); 
               System.out.println("salinnnnaa");
          
       if(file.delete())   { 
            System.out.println("File deleted successfully"); 
        } 
        else
        { 
            System.out.println("Failed to delete the file"); 
        } 
           }

          
         
         static public void EcrireText(String constat,String encourus,String rec) throws Exception {
		System.out.println("hihi captine");
		Document doc = null;
                doc=new Document("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");
		
		DocumentBuilder builder = new DocumentBuilder(doc);
                  Font font = builder.getFont();
		doc.getLists().add(ListTemplate.BULLET_DISK);
		
                   builder.moveToBookmark("constat");   
                     font.setBold(false);
                   String [] text=constat.split("\\n");
                   for (String tt:text){
                         builder.write(tt);
                   }                                                    
                   builder.moveToBookmark("encourusText");   
                   font.setColor(Color.decode("#1f3864"));
                   font.setBold(false);

                  String [] yy=encourus.split("\\n");
                   for (String y:yy){
                         builder.write(y);
                   }
                  
                           
                   builder.moveToBookmark("rec");
                     font.setBold(false);
                      font.setColor(Color.decode("#1f3864"));
                     String [] zz=rec.split("\\n");
                   for (String z:zz){
                         builder.write(z);
                   }
                  
		doc.save("C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//d.docx");
	
}
         
       
             
               public static void remplirClients(ArrayList<Clt> rec,String url) throws Exception {
	//	System.out.println("remplirTabremplirTabremplirTabremplirTab  ");
		Document doc = null;
                doc=new Document(url);
		
		DocumentBuilder builder = new DocumentBuilder(doc);
                Font font=builder.getFont();
		doc.getLists().add(ListTemplate.BULLET_DISK);
		 
                  builder.moveToBookmark("clients");
		for (Clt posi : rec) {
			
                      
			//System.out.println("posiposi------> " + posi.getNom());
				 font.setBidi(false);
                                builder.getParagraphFormat().setBidi(false);
				  font.setBold(true);
				builder.write(String.format( posi.getNom()+ControlChar.LINE_FEED));
                                font.setBold(false);
                                font.setBidi(true);
                                builder.getParagraphFormat().setBidi(true);

                                builder.writeln(posi.getFonction());
		
			}
		
		
		builder.getListFormat().removeNumbers();
 
		doc.save(url);
	}
        
       
               public static void remplirInters(ArrayList<Inter> rec,String url) throws Exception {
	//	System.out.println("remplirTabremplirTabremplirTabremplirTab  ");
		Document doc = null;
                doc=new Document(url);
		
		DocumentBuilder builder = new DocumentBuilder(doc);
                Font font=builder.getFont();
		doc.getLists().add(ListTemplate.BULLET_DISK);
	 
                  builder.moveToBookmark("inters");
		for (Inter posi : rec) {
			
                      
			//System.out.println("posiposi------> " + posi.getNom());
				   font.setBidi(false);
                                builder.getParagraphFormat().setBidi(false);
				  font.setBold(true);
				builder.write(String.format( posi.getNom()+ControlChar.LINE_FEED));
                                font.setBold(false);
                                font.setBidi(true);
                                builder.getParagraphFormat().setBidi(true);

                                builder.writeln(posi.getFonction());
			}
		
		
		builder.getListFormat().removeNumbers();
 
		doc.save(url);
	}
        
      
}