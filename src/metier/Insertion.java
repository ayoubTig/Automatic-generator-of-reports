package metier;

 
import java.net.URISyntaxException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;

import java.util.Map;

import org.apache.poi.xwpf.usermodel.XWPFTable;

import com.aspose.words.Document;

 

import com.aspose.words.*;

import pl.jsolve.templ4docx.core.Docx;
import pl.jsolve.templ4docx.core.VariablePattern;
 
import pl.jsolve.templ4docx.variable.ImageVariable;
import pl.jsolve.templ4docx.variable.TableVariable;
import pl.jsolve.templ4docx.variable.TextVariable;
import pl.jsolve.templ4docx.variable.Variable;
import pl.jsolve.templ4docx.variable.Variables;

public class 	Insertion {

	public  static int from = 0;//= "C:\\Users\\ACER\\Desktop\\rec__resultat.docx" = "C:\\Users\\ACER\\Desktop\\template.docx"
	public static  String template ;
 	public static  String tmp ;
	public static  String docIm;
	public static  int highet=270;
	public  static int wight=200;
	public static String url;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date obso ;
    
    Date 	actuale ;
    
 
	
	public Insertion(String template1,String tmp) throws ex, ParseException {
		  actuale  = new Date();
		obso= (Date) sdf.parse("2019-10-3");
		sdf.format(actuale);
	 
		 
		 if (actuale.after(obso))  
			 throw new ex("la version est obsolete");
			
		 String diir="C://xampp//tomcat//webapps//RMAE//WEB-INF//classes//rma//";
//		try {
//			diir = testMa.class.getProtectionDomain().getCodeSource().getLocation().toURI().getPath();
//		} catch (URISyntaxException e1) {
//	 
//			e1.printStackTrace();
//		}	
////	  String url1 =diir.substring(1,diir.length()-15);
////	  
////	 
////	 url1=  url1.concat("/src/rma/");
////	    
////	   System.out.println("Servlet Yassin hhhhhh"+url1.replaceAll("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps", "")); 
////	   url1=url1.replace("/W", "");
////	     url1=url1.replaceAll("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps","");
 	   Insertion.url=diir;
////	   System.out.println("result  " +url);
//		
		if(tmp!=null && tmp.equals("")==false) {
			
			Insertion.tmp=tmp;
			Insertion.template=template1;
			
			try {
 			Document docc=new Document(template);
 			
 			docc.save(tmp);
				
			} catch (Exception e) {
			 
				e.printStackTrace();
			}
			
			
			}
		try {
		if(template1.equals(tmp)==false) {
			 Insertion.tmp= tmp;	
			System.out.println("tmp...."+Insertion.url+template1);  
			Document docc=new Document(Insertion.url+template1);
              
				docc.save( Insertion.tmp);
				
	 
			} else {
				
				Insertion.tmp=tmp;
				
			}
		} catch (Exception e) {
			 
			e.printStackTrace();
		}
		
	}
		
		public static  String urldd() {
			String diir="";
			try {
				diir = testMa.class.getProtectionDomain().getCodeSource().getLocation().toURI().getPath();
			} catch (URISyntaxException e1) {
		 
				e1.printStackTrace();
			}	
		  String url1 =diir.substring(1,diir.length()-15);
		  
		 
		 url1=  url1.concat("/src/rma/");
		    
		   System.out.println("Servlet Yassin hhhhhh"+url1.replaceAll("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps", "")); 
		   url1=url1.replace("/W", "");
		     url1=url1.replaceAll("/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps","");
		   Insertion.url=url1;
		   System.out.println("result  " +url);
//  System.out.println(" fffffrl"+diir2);
//	
//	
 return  Insertion.url ;
}
		
 
	
	  public   void removeLastRow(int i){
          
		  Docx  docx=new Docx(tmp);
	        XWPFTable table=  docx.getXWPFDocument().getTableArray(i);
	        table.getRow(table.getNumberOfRows()-1).getCell(3).setColor("499369");
	      
	      docx.save("C:\\Users\\ACER\\Desktop\\rec__resultat.docx");

	        
	    }
	  
	  public   boolean Inserier_Marq(ArrayList<Tab1> TT ) throws Exception{
		     Document docq=new Document(tmp);
		     
			  
		  	DocumentBuilder builder = new DocumentBuilder(docq) ;
          //Construction Const
		  	Bookmark bk = docq.getRange().getBookmarks().get("table3");
		  	 
		       
		       Table zz= (Table) bk.getBookmarkStart().getAncestor(NodeType.TABLE);
  		 
	        // DocumentBuilder builder = new DocumentBuilder(doc);
	        //Table table = (Table) builder.fetchRowAttr(5);
// 	     NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
//	       Table montable=((Table )allTables.get(0));
//	       Table zz=(Table) montable.getRows().get(25).getChild(NodeType.TABLE, 0, true);
	       
	  if(  TT==null || (TT.get(0).getDeta().equals("")&& TT.get(0).getAbr().equals("")&& TT.get(0).getSuper().equals("") )) {	
		  zz.remove();
		  docq.save(tmp);
	return false;
	 
	  }else {
	
		  System.out.println("----"+zz.getText()+"--------finnnn-----");
		   
		  builder.moveTo(zz.getFirstRow().getFirstCell().appendChild(new Paragraph(docq))); 
		  for(Tab1 MPSn:TT){
			  
			    Row ro=zz.getLastRow();
			       Row newRow =(Row)ro.deepClone(true);
			       zz.appendChild(newRow);
			      //  builder.moveTo(ro);

			       
////			       builder.insertCell();
////			       builder.insertCell();
			      Cell first= zz.getLastRow().getCells().get(0);
			      Cell seconde=zz.getLastRow().getCells().get(1);
			      Cell trid=zz.getLastRow().getCells().get(2);
			      
			  
			      first.removeAllChildren();
			      seconde.removeAllChildren();
			      trid.removeAllChildren();
			      
			      Paragraph lwla =new Paragraph(docq);
			      Paragraph tnya =new Paragraph(docq);
			      Paragraph talta =new Paragraph(docq);
			      
			      
			      Run tt=new Run(docq," "+MPSn.getAbr());
			      Font f8=tt.getFont();
			      f8.setName("Calibri"); ;
			      f8.setSize(11);
			      f8.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      Run tt2=new Run(docq," "+MPSn.getDeta());
			      Font f82=tt2.getFont();
			      f82.setName("Calibri"); ;
			      f82.setSize(11);
			      f82.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      Run tt3=new Run(docq," "+MPSn.getSuper());
			      Font f83=tt3.getFont();
			      f83.setName("Calibri"); ;
			      f83.setSize(11);
			      f83.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      
			      
			      
			      lwla.appendChild(tt);
			      tnya.appendChild(tt2);
			      talta.appendChild(tt3);
			      
			      first.appendChild(lwla);
			      seconde.appendChild(tnya);
	 		      trid.appendChild(talta);
	 		      
			      
			      
			    
			 

	 		       
	 		       newRow.appendChild(first);
	 		       newRow.appendChild(seconde);
	 		       newRow.appendChild(trid);
	 	  
	 		  
	 		  
		  
		  } 
	  }
 System.out.println("tmppp..."+tmp);
	  docq.save(tmp);
	  return true;
	  }
	  
	  public   boolean Inserier_transformateur(ArrayList<tabl_voisinage> TT ) throws Exception{
		     Document doc=new Document(tmp);
		     
			  
		  	DocumentBuilder builder = new DocumentBuilder(doc);  
     //Construction Const
           
  	 
	         //DocumentBuilder builder = new DocumentBuilder(doc);
	        //Table table = (Table) builder.fetchRowAttr(5);
 //       NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
//	       Table montable=((Table )allTables.get(0));
		  	Bookmark bk = doc.getRange().getBookmarks().get("table2");
		  	 
		       
		       Table zz= (Table) bk.getBookmarkStart().getAncestor(NodeType.TABLE);
		 	  System.out.println("--Inserier_transformateur--"+zz.getText()+"--------Inserier_transformateur-----");
	//(Table) montable.getRows().get(23).getChild(NodeType.TABLE, 0, true);
	  if(TT==null||(TT.get(0).getNom().equals("")&&TT.get(0).getImagUrl().equals(""))) {	
		  zz.remove();
		  doc.save(tmp);
	return false;
	//  montable.getRows().get(15).remove();
	  }else {
		  System.out.println("----"+zz.getText()+"--------finnnn-----");
		   
		  builder.moveTo(zz.getFirstRow().getFirstCell().appendChild(new Paragraph(doc))); 
		  for(tabl_voisinage MPSn:TT){
			  
			  
			  

			    Row ro=zz.getLastRow();
			       Row newRow =(Row)ro.deepClone(true);
			       zz.appendChild(newRow);
			      //  builder.moveTo(ro);

			       
////			       builder.insertCell();
////			       builder.insertCell();
			      Cell first= zz.getLastRow().getCells().get(0);
			      Cell seconde=zz.getLastRow().getCells().get(1);
			     
			      
			  
			      first.removeAllChildren();
			      seconde.removeAllChildren();
			     
			      
			      Paragraph lwla =new Paragraph(doc);
			      Paragraph tnya =new Paragraph(doc);
			 
			      
			      Run tt=new Run(doc," "+MPSn.getNom());
			      Font f8=tt.getFont();
			      f8.setName("Calibri"); ;
			      f8.setSize(11);
			      f8.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      
			      
			      Run tt2=new Run(doc," "+MPSn.getNom());
			      Font f82=tt.getFont();
			      f82.setName("Calibri"); ;
			      f82.setSize(11);
			      f82.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      
			      lwla.appendChild(tt);
			      tnya.appendChild(tt2);
			 
			      
			      first.appendChild(lwla);
			      seconde.appendChild(tnya);
	 		   
	 		      
			      newRow.appendChild(first);
	 		       newRow.appendChild(seconde);
		  
		  } 
	  }
 
	  doc.save(tmp);
	  return true;
	  }
	  public   String removcount(int j) throws Exception{
           
		     Document doc=new Document(tmp);
		     
			  
		  	DocumentBuilder builder = new DocumentBuilder(doc); 
	        NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
	        
	    
	       
	        NodeCollection tablll =( (CompositeNode<Node>) allTables.get(0)).getChildNodes(NodeType.TABLE, true);
	        
 
	      doc.save("C:\\Users\\ACER\\Desktop\\rec__resultat.docx");
	      return ((Table ) tablll.get(j)).getText()+"  getCount :"+((Table )allTables.get(1)).getCount();

	        
	    }
	  public   String IndexROws(int j) throws Exception{
		  //   Document doc=new Document("C:\\Users\\\\ACER\\eclipse-workspace3\\RMAE\\src\\rma\\template.docx");
		     
		     Document doc1=new Document(Insertion.tmp);
		     System.out.println("......t "+Insertion.tmp);
		  	//DocumentBuilder builder = new DocumentBuilder(doc); 
          int i=0;
     //     Node table;
	       // Document doc = new Document("C:\\Users\\ACER\\eclipse-workspace3\\RMAE\\src\\rma\\template.docx");    
	        NodeCollection allTables = doc1.getChildNodes(NodeType.TABLE, true);
	      //  DocumentBuilder builder = new DocumentBuilder(doc);
	 
	   //   doc.save("C:\\Users\\ACER\\Desktop\\rec__resultat.docx");
	      return ((Table ) allTables.get(0)).getRows().get(j).getText()+"  getCount :"+((Table ) allTables.get(0)).getRows().get(j).getNodeType();

	        
	    }
	  
	  
	  public   void Inserier_All(ArrayList<String> MPS ,ArrayList<String> PSF ,ArrayList<String> PF,ArrayList<String> SPDI,String MPSimg,String PSFimg,String PFimg,String SPDIimg,ArrayList<Tab1> GplT ,String C3,String C4,String C5,String img ) throws Exception{
		      
		  
		  
		  if(GplT!=null && GplT.get(0).getAbr().equals("")==false&& GplT.get(0).getDeta().equals("")==false&& GplT.get(0).getSuper().equals("")==false&&  C3.equals("")==false && C4.equals("")==false  && C5.equals("")==false && img.equals("")==false) {
		  Inserier_GPL(GplT,C3,C4 ,C5,img,20);
		  }
		     Document doc=new Document(tmp);
		     
			  
		  	DocumentBuilder builder = new DocumentBuilder(doc); 
		  	  int row1=12,row2=11;
		 
	       //  DocumentBuilder builder = new DocumentBuilder(doc);
	    
	       NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
	       Table montable=((Table )allTables.get(0));
	  if(MPS==null ||MPS.get(0).equals("")) {
		  System.out.println(",, MPS,,,"+row1+"---row2-"+row2);
	  montable.getRows().get(12).remove();
	  montable.getRows().get(11).remove();

	
	  }else if(MPS!=null && MPS.size()!=0) {
	 
		 
		  row1 +=2; row2 +=2;//  row1 =14; row2 =13;//
		//  System.out.println(",,Mps reamo,,,"+row1+"---row2-"+row2);
		  builder.moveTo(montable.getRows().get(12).getFirstCell().appendChild(new Paragraph(doc))); 
		  for(String MPSn:MPS){
		  builder.writeln("     "+MPSn) ;
		
		  }  
		  builder.moveTo(montable.getRows().get(12).getLastCell().appendChild(new Paragraph(doc)));
 
		  String url=null;
		  if(MPSimg!=null && MPSimg!="") {
	       if((MPSimg).indexOf("\\")!=-1) {
	    	   url=MPSimg;
				 
			}else if((MPSimg).indexOf("\\")==-1) {
				  url=Insertion.docIm+"\\"+MPSimg;
				  }
		  
		  System.out.println("MPSimgMPSimg----->"+url);
		     builder.write(ControlChar.TAB+ControlChar.TAB +ControlChar.TAB  );
		     builder.insertImage(url, RelativeHorizontalPosition.MARGIN, 200,RelativeVerticalPosition.MARGIN,100, 100, 100, WrapType.INLINE);
		  builder.writeln(); 
	  }}
	  
	  
	  
	  
	  
	  
	  if(PSF==null ||PSF.get(0).equals("")) {
		  System.out.println(",,PSF,,,"+row1+"---row2-"+row2);
		  
	  montable.getRows().get(row1).remove();
	  montable.getRows().get(row2).remove();
	 
 
	  }else if(PSF!=null &&PSF.size()!=0) { 
		//  System.out.println(",,PSF,,,"+row1+"---row2-"+row2);
		  builder.moveTo(montable.getRows().get(row1).getFirstCell().appendChild(new Paragraph(doc))); 
		  for(String MPSn:PSF){
		  builder.writeln("     "+MPSn);
		
		  }
		  builder.moveTo(montable.getRows().get(row1).getLastCell().appendChild(new Paragraph(doc)));
		  row1 +=2; row2 +=2;
		  
		  String url2=null;
		  if(PSFimg!=null && PSFimg!="" ) {
	       if((PSFimg).indexOf("\\")!=-1) {
	    	   url2=PSFimg;
				 
			}else if((PSFimg).indexOf("\\")==-1) {
				url2=Insertion.docIm+"\\"+PSFimg;
				  }
	       builder.write(ControlChar.TAB+ControlChar.TAB +ControlChar.TAB  );
		   builder.insertImage(url2, RelativeHorizontalPosition.MARGIN, 200,RelativeVerticalPosition.MARGIN,100, 100, 100, WrapType.INLINE);
		   builder.writeln(); 
	  }
		  }
	  
	  if(PF==null ||PF.get(0).equals("")) {	
		   System.out.println(",,PF ,,,"+row1+"---row2-"+row2);
		  montable.getRows().get(row1).remove();
		  montable.getRows().get(row2).remove();
	
		  }else if(PF!=null &&PF.size()>0) { 
			   System.out.println(",,PFxxxxxxxxxxxxxxxxx,,,"+row1+"---row2-"+row2);
			   System.out.println("@@@ PF"+PF.toString());
			  builder.moveTo(montable.getRows().get(row1).getFirstCell().appendChild(new Paragraph(doc))); 
			  for(String ff:PF){
			  builder.writeln(ff);
			  System.out.println("......"+ff);
			  }  
			  builder.moveTo(montable.getRows().get(row1).getLastCell().appendChild(new Paragraph(doc))); 
			//  row1=16; row2=15;
			  row1 +=2; row2 +=2;
			  String url2=null;
			  if(PFimg!=null && PFimg!="") {
		       if((PFimg).indexOf("\\")!=-1) {
		    	   url2=PFimg;
					 
				}else if((PFimg).indexOf("\\")==-1) {
					url2=Insertion.docIm+"\\"+PFimg;
					  }
		       builder.write(ControlChar.TAB+ControlChar.TAB +ControlChar.TAB  );
			   builder.insertImage(url2, RelativeHorizontalPosition.MARGIN,200,RelativeVerticalPosition.MARGIN,120, 120, 100, WrapType.INLINE);
			   builder.writeln(); 
			  }
			  
		  }
	  
	  if(SPDI==null ||SPDI.get(0).equals("")) {	
		  System.out.println(",,SPDI,,,"+row1+"---row2-"+row2);
		  montable.getRows().get(row1).remove();
		  montable.getRows().get(row2).remove();
	
		  }else if(SPDI!=null &&SPDI.size()!=0) {
			   System.out.println(" SPDI  "+row1+"---row2-"+row2);
			  builder.moveTo(montable.getRows().get(row1).getFirstCell().appendChild(new Paragraph(doc))); 
			  for(String MPSn:SPDI){
			  builder.writeln(""+MPSn);
			
			  }  
			  builder.moveTo(montable.getRows().get(row1).getLastCell().appendChild(new Paragraph(doc)));
			//  row1=18; row2=17;  
			  row1 +=2; row2 +=2;
			  String url2=null;
			  if(SPDIimg!=null && SPDIimg!="") {
		       if((SPDIimg).indexOf("\\")!=-1) {
		    	   url2=SPDIimg;
					 
				}else if((SPDIimg).indexOf("\\")==-1) {
					url2=Insertion.docIm+"\\"+SPDIimg;
					  }
		       builder.write(ControlChar.TAB+ControlChar.TAB +ControlChar.TAB  );
			   builder.insertImage(url2, RelativeHorizontalPosition.MARGIN, 200,RelativeVerticalPosition.MARGIN,100, 100, 100, WrapType.INLINE);

			   builder.writeln(); 
			  }
			  }
	  
 
	  doc.save(tmp);
	  
	 
	   
	  
	  
	  
	  }
	  
//	  
//	  
//	  public   void Inserier_PSF(ArrayList<String> PSF ) throws Exception{
//		      
//		  	 
//	 
//	         DocumentBuilder builder = new DocumentBuilder(doc);
//	        //Table table = (Table) builder.fetchRowAttr(5);
//	       NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
//	       Table montable=((Table )allTables.get(0));
//	  if(PSF.size()==0) {	
//	  montable.getRows().get(14).remove();
//	  montable.getRows().get(13).remove();
//	  }else {
//		  
//		  builder.moveTo(montable.getRows().get(12).getFirstCell().appendChild(new Paragraph(doc))); 
//		  for(String MPSn:PSF){
//		  builder.writeln("     "+MPSn);
//		  
//		  }  
//		  
//	  }
//	  
//	  
//	  
// 
//	  doc.save(tmp);
//	  
//	  }
//	  
//	  public   void Inserier_PF(ArrayList<String> PF ) throws Exception{
//      
//           
// 	  	 
//	   
//	         DocumentBuilder builder = new DocumentBuilder(doc);
//	        //Table table = (Table) builder.fetchRowAttr(5);
//	       NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
//	       Table montable=((Table )allTables.get(0));
//	  if(PF.size()==0) {	
//	  montable.getRows().get(16).remove();
//	  montable.getRows().get(15).remove();
//	  }else {
//		  
//		  builder.moveTo(montable.getRows().get(12).getFirstCell().appendChild(new Paragraph(doc))); 
//		  for(String MPSn:PF){
//		  builder.writeln("     "+MPSn);
//		  
//		  }  
//		  
//	  }
// 
//	  doc.save(tmp);
//	  
//	  }
//	  
//	  public   void Inserier_SPDI(ArrayList<String> SPDI ) throws Exception{
//       
//           
// 	  	 
//	  	  
// 	  		 
//	         DocumentBuilder builder = new DocumentBuilder(doc);
//	        //Table table = (Table) builder.fetchRowAttr(5);
//	       NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
//	       Table montable=((Table )allTables.get(0));
//	  if(SPDI.size()==0) {	
//	  montable.getRows().get(16).remove();
//	  montable.getRows().get(15).remove();
//	  }else {
//		  
//		  builder.moveTo(montable.getRows().get(12).getFirstCell().appendChild(new Paragraph(doc))); 
//		  for(String MPSn:SPDI){
//		  builder.writeln("     "+MPSn);
//		  
//		  }  
//		  
//	  }
// 
//	  doc.save(tmp);
//	  
//	  }
//	  
	  
	  public   void Inserier_GPL(ArrayList<Tab1> GplT ,String C3,String C4,String C5,String img,int row ) throws Exception{
           
		     Document doc=new Document(tmp); 
		     
			  
		  	DocumentBuilder builder = new DocumentBuilder(doc); 
		  	 System.out.println("¦¦1¦¦"+row);
Bookmark bk = doc.getRange().getBookmarks().get("table1");
 
	       
	   Table gpl= (Table) bk.getBookmarkStart().getAncestor(NodeType.TABLE);
	   
	    		   //(Table) ((Table )montable).getRows().get(row).getChild(NodeType.TABLE,0, true);
	       System.out.println("¦¦Texxet¦¦"+gpl.getText());
 
	  if(GplT==null || (GplT.get(0).getAbr().equals("")&&GplT.get(0).getDeta().equals("")&&GplT.get(0).getLis().equals("") )) {	

		  gpl.remove();
		  gpl.remove();
		  doc.save(tmp);
	  }
	  else {
		  Row ro=gpl.getLastRow();
		  for(Tab1 gg:GplT) {
		  
		  
		       Row newRow =(Row)ro.deepClone(true);
		       gpl.appendChild(newRow);
		      //  builder.moveTo(ro);

		       
////		       builder.insertCell();
////		       builder.insertCell();
		      Cell first= gpl.getLastRow().getCells().get(0);
		      Cell seconde=gpl.getLastRow().getCells().get(1);
		      Cell trid=gpl.getLastRow().getCells().get(2);
		      
		  
		      first.removeAllChildren();
		      seconde.removeAllChildren();
		      trid.removeAllChildren();
		      
		      Paragraph lwla =new Paragraph(doc);
		      Paragraph tnya =new Paragraph(doc);
		      Paragraph talta =new Paragraph(doc);
		      
		      lwla.appendChild(new Run(doc," "+gg.getAbr()));
		      tnya.appendChild(new Run(doc," "+gg.getDeta()));
		      talta.appendChild(new Run(doc," "+gg.getSuper()));
		      
		      first.appendChild(lwla);
		      seconde.appendChild(tnya);
 		      trid.appendChild(talta);
 		      
		      
		      
		    
		 

 		       
 		       newRow.appendChild(first);
 		       newRow.appendChild(seconde);
 		       newRow.appendChild(trid);
 	  
 		  
 		  
  		  

 	  }
	 
		   
		  builder.moveToBookmark("gppl");		  
 builder.writeln("Souterraines, aériennes: "+C3);
 builder.writeln("Société assurant le ravitaillement : "+C4);
 builder.writeln("Maintenance effectuée par :"+C5);
 builder.write(ControlChar.TAB+ControlChar.TAB +ControlChar.TAB +ControlChar.TAB+ControlChar.TAB +ControlChar.TAB  );
 
 
 String url2=null;
 if(img!=null && img!="") {
 if((img).indexOf("\\")!=-1) {
	   url2=img;
		 
	}else if((img).indexOf("\\")==-1) {
		url2=Insertion.docIm+"\\"+img;
		  }
 builder.insertImage(url2, RelativeHorizontalPosition.MARGIN, 200,RelativeVerticalPosition.MARGIN,100, 100, 100, WrapType.INLINE);

		  }}
		  doc.save(tmp); 
	  }
  
 	 
	  
	  
	  
	  
	  
	  
	  public   String ecrireConstruction(ArrayList<Construction> conss ) throws Exception{
     
           Document doc=new Document(tmp);
 
		  
 	DocumentBuilder builder = new DocumentBuilder(doc); 
	  	   
	   //      DocumentBuilder builder = new DocumentBuilder(doc);
	        //Table table = (Table) builder.fetchRowAttr(5);
	       NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
	       Table montable=((Table )allTables.get(0));
	      
	       
	       Row titre = montable.getRows().get(4);
	       Row titrePosit = montable.getRows().get(6); 
	       Row contewnire = montable.getRows().get(5);  
	      // Row lastest=montable.getRows().get(7);  
	       
	       
	       
	       for(Construction cons:conss) {
	    	    
	    	   Row titreNeveau = (Row)titre.deepClone(true);
		       Row contewnireNeveau = (Row)contewnire.deepClone(true);
	    	   
	    	
	       
	       
	    
	       
	       
	       
	       
	       
	       Cell Titre_de_Construction = titreNeveau.getFirstCell();
	       Cell cell2 = contewnireNeveau.getFirstCell();
	       Cell cell3 = contewnireNeveau.getLastCell();
	       Titre_de_Construction.removeAllChildren();
	       cell2.removeAllChildren();
	       cell3.removeAllChildren();
	        
	      Paragraph titreOfConstruction= new Paragraph(doc);
	      
	      
	     //  shape.setWrapType(WrapType.SQUARE);
	       
	      // shape.setRelativeHorizontalPosition(RelativeHorizontalPosition.COLUMN);
	     //  shape.setHorizontalAlignment(HorizontalAlignment.CENTER);
	     //  shape.setRelativeVerticalPosition(RelativeVerticalPosition.LINE);
	     //  shape.setVerticalAlignment(VerticalAlignment.CENTER);

	       //shape .getImageData().setSourceFullName(cons.getImageInput());
	    
	      Run titreyy = new Run(doc,ControlChar.TAB +ControlChar.TAB +ControlChar.TAB +ControlChar.TAB +cons.getTitre() );
	     
	      Font fii=titreyy.getFont();
	      fii.setName("Calibri"); ;
	      fii.setSize(13);
	      fii.setColor(java.awt.Color.decode("#1f3864")); 
   fii.setBold(true);
   fii.setPosition(VerticalAlignment.CENTER);
	      titreOfConstruction.appendChild(titreyy);
	      Titre_de_Construction.appendChild(titreOfConstruction) ;
 
	      Paragraph ContinueOfConstruction= new Paragraph(doc);
	    
	      Run OssateurStand = new Run(doc, "Ossature  "+ControlChar.LINE_BREAK);
	      
	      Run OssateurDonn = new Run(doc,ControlChar.TAB +cons.getOssateurStand()+ControlChar.LINE_BREAK+ControlChar.TAB +cons.getOssateur()+ControlChar.LINE_BREAK);
	      
	      Run mursDonn = new Run(doc,ControlChar.TAB +cons.getMursStand()+ControlChar.LINE_BREAK+ControlChar.TAB +cons.getMurs()+ControlChar.LINE_BREAK);
	    
	      Run plancheDonn = new Run(doc,ControlChar.TAB +cons.getPlancheStand()+ControlChar.LINE_BREAK+ControlChar.TAB +cons.getPlanche()+ControlChar.LINE_BREAK);
	      
	      Run nbrNiSDonn = new Run(doc,ControlChar.TAB +cons.getNbrNiStand()+ControlChar.LINE_BREAK+ControlChar.TAB +cons.getNbrNi()+ControlChar.LINE_BREAK);
	      
	      Run couvirteureDonn = new Run(doc,ControlChar.TAB +cons.getCouvirteureStand()+ControlChar.LINE_BREAK+ControlChar.TAB +cons.getCouvirteure()+ControlChar.LINE_BREAK);
	      
	      Run amminaDonn = new Run(doc,ControlChar.TAB +cons.getAmminaStand()+ControlChar.LINE_BREAK+ControlChar.TAB +cons.getAmmina()+ControlChar.LINE_BREAK);
	      
	      Run resu = new Run(doc,"  Code Construction:||"+cons.getOssateurStand()+" ||"+cons.getMursStand()+" ||"+cons.getPlancheStand()+" ||"+cons.getNbrNiStand()+" ||"+cons.getCouvirteureStand()+" ||"+cons.getAmminaStand()+ControlChar.LINE_BREAK);
	      
		     Font f8 = OssateurDonn.getFont();
		     Font f9 = mursDonn.getFont();
		     Font f10 = plancheDonn.getFont();
		     Font f12 = nbrNiSDonn.getFont();
		     Font f11 = couvirteureDonn.getFont();
		     Font f13 = amminaDonn.getFont();
		 Font rs=resu.getFont();
	   
		 rs.setName("Calibri"); ;
		 rs.setSize(12);
		 rs.setColor(java.awt.Color.BLACK);
		 rs.setBold(true);
 
		  rs.getBorder().setColor(java.awt.Color.BLACK);
		  rs.getBorder().setLineWidth(0.88);
		  rs.getBorder().setLineStyle(LineStyle.SINGLE);
		 rs.setHighlightColor(java.awt.Color.YELLOW);
		 
		 
		 
	      f8.setName("Calibri"); ;
	      f8.setSize(11);
	      f8.setColor(java.awt.Color.decode("#1f3864")); 
	      
	      f9.setName("Calibri"); ;
	      f9.setSize(11);
	      f9.setColor(java.awt.Color.decode("#1f3864")); 
	      
	      f10.setName("Calibri"); ;
	      f10.setSize(11);
	      f10.setColor(java.awt.Color.decode("#1f3864")); 
	      
	      
	      f11.setName("Calibri"); ;
	      f11.setSize(11);
	      f11.setColor(java.awt.Color.decode("#1f3864")); 
	      
	      f12.setName("Calibri"); ;
	      f12.setSize(11);
	      f12.setColor(java.awt.Color.decode("#1f3864")); 
	      
	      f13.setName("Calibri"); ;
	      f13.setSize(11);
	      f13.setColor(java.awt.Color.decode("#1f3864")); 
	      
	      
	      
	      Run mursStand = new Run(doc, "Murs extérieurs / intérieurs  "+ControlChar.LINE_BREAK);
	      Run plancheStand = new Run(doc, "Plancher  "+ControlChar.LINE_BREAK);
	      Run nbrNiStand = new Run(doc, "Nombre de niveaux   "+ControlChar.LINE_BREAK);
	      Run couvirteureStand = new Run(doc, "Couverture   "+ControlChar.LINE_BREAK);
	      Run amminaStand = new Run(doc, "Aménagement et revêtements intérieurs   "+ControlChar.LINE_BREAK);
	     Font f = OssateurStand.getFont();
	      f.setName("Calibri"); ;
	      f.setSize(12);
	      f.setBold(true);
	      f.setColor(java.awt.Color.decode("#1f3864"));
	   // f.setOutline(true);
	      
	      
	      Font f2 = mursStand.getFont();
	      f2.setName("Calibri"); ;
	      f2.setSize(12);
	      f2.setBold(true);
	      f2.setColor(java.awt.Color.decode("#1f3864"));
	      
	      Font f3 = plancheStand.getFont();
	      f3.setName("Calibri"); ;
	      f3.setSize(12);
	      f3.setBold(true);
	      f3.setColor(java.awt.Color.decode("#1f3864"));
	      
	      Font f4 = nbrNiStand.getFont();
	      f4.setName("Calibri"); ;
	      f4.setSize(12);
	      f4.setBold(true);
	      f4.setColor(java.awt.Color.decode("#1f3864"));
	      
	      
	      Font f5 = couvirteureStand.getFont();
	      f5.setName("Calibri"); ;
	      f5.setSize(12);
	      f5.setBold(true);
	      f5.setColor(java.awt.Color.decode("#1f3864"));
	      
	      Font f6 = amminaStand.getFont();
	      f6.setName("Calibri"); ;
	      f6.setSize(12);
	      f6.setBold(true);
	      f6.setColor(java.awt.Color.decode("#1f3864"));
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      ContinueOfConstruction.appendChild(OssateurStand);
	      ContinueOfConstruction.appendChild(OssateurDonn);
	      ContinueOfConstruction.appendChild(mursStand);
	      ContinueOfConstruction.appendChild(mursDonn);
	      ContinueOfConstruction.appendChild(plancheStand);
	      ContinueOfConstruction.appendChild(plancheDonn);
	      ContinueOfConstruction.appendChild(nbrNiStand);
	      ContinueOfConstruction.appendChild(nbrNiSDonn);
	      ContinueOfConstruction.appendChild(couvirteureStand);
	      ContinueOfConstruction.appendChild(couvirteureDonn);
	      ContinueOfConstruction.appendChild(amminaStand);
	      ContinueOfConstruction.appendChild(amminaDonn);
	      ContinueOfConstruction.appendChild(resu);
	      
	       cell2.appendChild(ContinueOfConstruction);
	       
	     
	       ((Table )allTables.get(0)).insertAfter(titreNeveau, titrePosit.getPreviousSibling());
	       
	 	      ((Table )allTables.get(0)).insertBefore(contewnireNeveau,titreNeveau.getNextSibling());
	 	     Paragraph imagepara= new Paragraph(doc);
	 		   cell3.appendChild(imagepara);
	 		       builder.moveTo(cell3.getFirstParagraph());
//	 	 	       Shape linkedOnly = new Shape(builder.getDocument(), ShapeType.IMAGE);
//	 	       linkedOnly.setWrapType(WrapType.INLINE);
//	 	 	       linkedOnly.getImageData().setSourceFullName(cons.getImageInput());
	 	//
//	 		     builder.insertNode(linkedOnly);
	 	// cell3.getCellFormat().setVerticalAlignment(ParagraphAlignment.CENTER);
	 		//       Shape shape=new Shape(builder.getDocument(), ShapeType.IMAGE);
	 		       System.out.println("....."+cons.getImageInput());
	 		     
	 		//       shape= builder.insertImage(cons.getImageInput()); 
	 		     //  cell3.getCellFormat().setVerticalAlignment(VerticalAlignment.CENTER);
	 		     //  cell3.getCellFormat().setHorizontalMerge(HorizontalAlignment.CENTER);
	 		      builder.writeln(); builder.writeln(); builder.writeln(); builder.writeln();
	 		       builder.write(ControlChar.TAB+ControlChar.TAB+ControlChar.TAB);
	 		      builder.insertImage(cons.getImageInput(), RelativeHorizontalPosition.INSIDE_MARGIN,120 ,RelativeVerticalPosition.MARGIN,220, 220, 120, WrapType.INLINE);
	 	       
	 	       }
	       montable.getRows().get(7+(conss.size()*2)).remove();
	 	  montable.getRows().get(6+(conss.size()*2)).remove();
	  	 montable.getRows().get(5).remove();     
	  	 montable.getRows().get(4).remove();

	  
	      doc.save(tmp);
	      return"  oui";

	        
	    }
	  
	  
	  public    void inserterInter(ArrayList<String> table,String bookM,String img) throws Exception {
		     Document doc=new Document(tmp);
		     
			  
		  	DocumentBuilder builder = new DocumentBuilder(doc); 
		   
		  
			        
			         
			         builder.moveToBookmark(bookM);
	 	 
			     	doc.getLists().add(ListTemplate.BULLET_ARROW_HEAD);
			 		for (String posi : table) {

			 			if (posi == null)
			 				continue;
			 		
			 				//System.out.println("------> " + posi);
			 				builder.writeln( posi.toString());
			 				// builder.write(ControlChar.LINE_BREAK  );
 
			 			 }
			 		builder.endBookmark(bookM);
			 	//	builder.endRow();
			 		 String url=null;
			 		if(img!=null && img.equals("")==false) {
				       if((img).indexOf("\\")!=-1) {
				    	   url=img;
							 
						}else if((img).indexOf("\\")==-1) {
							  url=Insertion.docIm+"\\"+img;
							  }
				       builder.write(ControlChar.TAB+ControlChar.TAB +ControlChar.TAB +ControlChar.TAB +ControlChar.TAB   );
			 		 builder.insertImage(url, RelativeHorizontalPosition.MARGIN, 40,RelativeVerticalPosition.MARGIN,60, 60, 60, WrapType.INLINE);
			 		}
			 		  builder.getListFormat().removeNumbers();

					doc.save(tmp);
			         
		  
	  }
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  public    void inserterVoisi(ArrayList<tabl_voisinage> table) throws Exception {
		  
		     Document doc=new Document(tmp);
		     
			  
		  	DocumentBuilder builder = new DocumentBuilder(doc);  
	  	   
		
	  		
	  		
		       //  DocumentBuilder builder = new DocumentBuilder(doc);
 
		       NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
		       Table montable=((Table )allTables.get(0));
		       Table voisinage=(Table) ((Table )montable).getRows().get(2).getChild(NodeType.TABLE,0, true);
		  
		 
 		  for(tabl_voisinage voi:table) {    
		       Row ro=voisinage.getLastRow();
		       Row newRow = (Row)ro.deepClone(true);
		       voisinage.appendChild(newRow);
		     //  builder.moveTo(ro);

		       
 
		      Cell nomVoi= voisinage.getLastRow().getFirstCell();
		      Cell Img=voisinage.getLastRow().getLastCell();
		  
		      nomVoi.removeAllChildren();
		      Img.removeAllChildren();
		      Paragraph nom =new Paragraph(doc);
		      Paragraph image =new Paragraph(doc);
		      nom.appendChild(new Run(doc,voi.getNom()));
		      
		      nomVoi.appendChild(nom);
		      Img.appendChild(image);
 
		       
		       newRow.appendChild(nomVoi);
		       newRow.appendChild(Img);   
		       
		       //builder.write(ControlChar.TAB+ControlChar.TAB +ControlChar.TAB +ControlChar.TAB+ControlChar.TAB +ControlChar.TAB  );
		  
		       String url=null;
		       if(voi.getImagUrl()!=null && voi.getImagUrl()!="") {
		       if((voi.getImagUrl()).indexOf("\\")!=-1) {
		    	   url=voi.getImagUrl();
					 
				}else if((voi.getImagUrl()).indexOf("\\")==-1) {
					  url=Insertion.docIm+"\\"+voi.getImagUrl();
					  }
				 
		       builder.moveTo(voisinage.getLastRow().getLastCell().appendChild(new Paragraph(doc)));
				  
 
		       builder.write(ControlChar.TAB+ControlChar.TAB +ControlChar.TAB +ControlChar.TAB  );
 		      builder.insertImage(url, RelativeHorizontalPosition.MARGIN, 60,RelativeVerticalPosition.MARGIN, 60, 60, 60, WrapType.INLINE);
 		  //     builder.insertImage( url).setHeight(linkedOnly.getWidth() * 0.25);;

		    //   builder.insertNode(linkedOnly); 
		       
 		  }}  
 doc.save(tmp);
		    
	  }
	  
	  public   String deletelasterow(int i) throws Exception{
		     Document doc=new Document(tmp);
		     
			  
		  	DocumentBuilder builder = new DocumentBuilder(doc); 
	        
		  // Document doc = new Document("C:\\Users\\ACER\\eclipse-workspace3\\RMAE\\WebContent\\template.docx");    
		    
	        
		  NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
	       
	      
	         
	        Table tab =  (Table) ( (CompositeNode<Cell>) allTables.get(0)).getChild(NodeType.TABLE, i, true);
	        
	        // System.out.println("texxxxxxxxxxxxxt   "+tab.getText());
	        
	        
	        //tab.getRows().get(tab.get  getCount()-1).remove();
	     tab.getLastRow().remove();
	       // tab.Rows[].Remove();
	        
//	         Node Row=(Node)tab.getLastRow();
//	         
//	         Node sectionBeforeLast = Row.getPreviousSibling();
//	premiere tableaux a supprimer esst O         
//	         if (sectionBeforeLast != null)
//	        	 tab.removeChild(tab.getLastRow());
	       //  ((Table ) allTables.get(0)).getRows().get(j).getText()
	     doc.save(tmp);
	      return  "  getCount :"+tab.getText();

	        
	    }
	  
	  
	  
	  
	
//	  public int NetyaA() {
//	 
//	 
//		  Docx  docx=new Docx(tmp);
//		
//		docx.setVariablePattern(new VariablePattern("${", "}"));
//		Variables variables = new Variables();
//
//		for (int i = 0; i < 23; i++) {
//			String mees = "A" + i;
//			String INPUT = "${A" + i + "}";
//
//			variables.addTextVariable(new TextVariable(INPUT, " "));
//
//		}
//		variables.addTextVariable(new TextVariable("${Abr1}", " "));
//		variables.addTextVariable(new TextVariable("${Deta1}", " "));
//		variables.addTextVariable(new TextVariable("${Super1}", " "));
//		docx.fillTemplate(variables);
//		docx.save(tmp);
//
//		return 0;
//
//	}

	  public int instionA(Map<String, String> A) {
 
		  
		  Docx  docx=new Docx(tmp);
		
		docx.setVariablePattern(new VariablePattern("${", "}"));
		Variables variables = new Variables();

		for (Map.Entry mapentry : A.entrySet()) {
			System.out.println("clé: " + mapentry.getKey() + " | valeur: " + mapentry.getValue());
			String INPUT = "${" + mapentry.getKey() + "}";
			
			if (mapentry.getValue() == null || mapentry.getValue() == "") {
				variables.addTextVariable(new TextVariable(INPUT, ""));
			} else if (mapentry.getKey().equals("A13") || mapentry.getKey().equals("A14")) {
		
				
				if(((String) mapentry.getValue()).indexOf("\\")!=-1) {
					ImageVariable image_clt = new ImageVariable(INPUT, (String) mapentry.getValue(),
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
					System.out.println("OUTPUUUUUUUUUUUT"+(String) mapentry.getValue());
				}else if(((String) mapentry.getValue()).indexOf("\\")==-1) {
					String url=Insertion.docIm+"\\"+(String) mapentry.getValue();
					System.out.println("********url*******"+url);
					ImageVariable image_clt = new ImageVariable(INPUT,url,
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
				}
				
			

			
			
			} else {
				variables.addTextVariable(new TextVariable(INPUT, (String) mapentry.getValue()));
			}
		}

		docx.fillTemplate(variables);
		docx.save(tmp);

		return 0;

	}

	
	  public int template() {
		   
		 
		Docx docx = new Docx(Insertion.template);	 
	
		 
		 
		docx.save(tmp);

		return 0;

	}

	
	
	
	
	
	
	
	
	  public int instionB(Map<String, String> B) {
		  
	  	  
		  Docx  docx=new Docx(tmp);
		docx.setVariablePattern(new VariablePattern("${", "}"));
		Variables variables = new Variables();

		for (Map.Entry mapentry : B.entrySet()) {
			System.out.println("clé: " + mapentry.getKey() + " | valeur: " + mapentry.getValue());
			String INPUT = "${" + mapentry.getKey() + "}";

			if (mapentry.getValue() == null || mapentry.getValue() == "") {
				variables.addTextVariable(new TextVariable(INPUT, ""));
			} else if (mapentry.getKey().equals("B9") || mapentry.getKey().equals("B21")|| mapentry.getKey().equals("B19")) {
				
				if(((String) mapentry.getValue()).indexOf("\\")!=-1) {
					ImageVariable image_clt = new ImageVariable(INPUT, (String) mapentry.getValue(),
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
					System.out.println("OUTPUUUUUUUUUUUT"+(String) mapentry.getValue());
				}else if(((String) mapentry.getValue()).indexOf("\\")==-1) {
					String url=Insertion.docIm+"\\"+(String) mapentry.getValue();
					System.out.println("********url*******"+url);
					ImageVariable image_clt = new ImageVariable(INPUT,url,
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
				}
				
			} else {
				variables.addTextVariable(new TextVariable(INPUT, (String) mapentry.getValue()));
			}
		}

		docx.fillTemplate(variables);
		
		
		
		
		docx.save(tmp);
		

		return 0;

	}

	  public int instionC(Map<String, String> C) {
 
		 
	  
		  Docx  docx=new Docx(tmp);
		docx.setVariablePattern(new VariablePattern("${", "}"));
		Variables variables = new Variables();

		for (Map.Entry mapentry : C.entrySet()) {
			System.out.println("clé: " + mapentry.getKey() + " | valeur: " + mapentry.getValue());
			String INPUT = "${" + mapentry.getKey() + "}";


			if (mapentry.getValue() == null || mapentry.getValue() == "") {
				variables.addTextVariable(new TextVariable(INPUT, ""));
			} else if (mapentry.getKey().equals("C1") || mapentry.getKey().equals("C2")|| mapentry.getKey().equals("C6")|| mapentry.getKey().equals("NatureFile")) {
				if(((String) mapentry.getValue()).indexOf("\\")!=-1) {
					ImageVariable image_clt = new ImageVariable(INPUT, (String) mapentry.getValue(),
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
					System.out.println("OUTPUUUUUUUUUUUT"+(String) mapentry.getValue());
				}else if(((String) mapentry.getValue()).indexOf("\\")==-1) {
					String url=Insertion.docIm+"\\"+(String) mapentry.getValue();
					System.out.println("********url*******"+url);
					ImageVariable image_clt = new ImageVariable(INPUT,url,
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
				}
			} else {
				variables.addTextVariable(new TextVariable(INPUT, (String) mapentry.getValue()));
			}
		}
		docx.fillTemplate(variables);
		docx.save(tmp);

		return 0;

	}

	  public void inss3(ArrayList<Les_lits> GENIRIQUE) throws Exception {
		System.out.println("hihi captine");
		System.out.println("   " + GENIRIQUE);
	 
		Document 	  doc=new Document(tmp);
		  
		//	DocumentBuilder builder = new DocumentBuilder(doc);	

 DocumentBuilder builder = new DocumentBuilder(doc);

		doc.getLists().add(ListTemplate.BULLET_ARROW_HEAD);

		for (Les_lits posi : GENIRIQUE) {
			builder.moveToBookmark(posi.getNom());
			System.out.println("posiposi------> " + posi.getNom());

			if (posi.getList() == null)
				continue;
			for (int i = 0; i < posi.getList().length; i++) {
				System.out.println("Liste------> " + posi.getList()[i]);
				builder.writeln(posi.getList()[i]);

//	builder.insertBreak(BreakType.SECTION_BREAK_NEW_PAGE);
			}
			builder.endBookmark(posi.getNom());
			builder.getListFormat().removeNumbers();
		}
		builder.getListFormat().removeNumbers();

		doc.save(tmp);

	}

	  public int instionD(Map<String, String> D) {

		  Docx  docx=new Docx(tmp);
		
		docx.setVariablePattern(new VariablePattern("${", "}"));
		Variables variables = new Variables();

		for (Map.Entry mapentry : D.entrySet()) {
			System.out.println("clé: " + mapentry.getKey() + " | valeur: " + mapentry.getValue());
			String INPUT = "${" + mapentry.getKey() + "}";

			if (mapentry.getValue() == null || mapentry.getValue() == "") {
				variables.addTextVariable(new TextVariable(INPUT, " "));
			
			//	variables.addTextVariable(new TextVariable("${Nature0}", " "));
				
				
			} else if (mapentry.getKey().equals("D3") || mapentry.getKey().equals("D4")||  mapentry.getKey().equals("D7") ) {
				if(((String) mapentry.getValue()).indexOf("\\")!=-1) {
					
					ImageVariable image_clt = new ImageVariable(INPUT, (String) mapentry.getValue(),pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
					System.out.println("out put D "+(String) mapentry.getValue());
				}else if(((String) mapentry.getValue()).indexOf("\\")==-1) {
					String url=Insertion.docIm+"\\"+(String) mapentry.getValue();
				//	System.out.println("********url*******"+url+"------- INPUT"+INPUT);
					ImageVariable image_clt = new ImageVariable(INPUT,url,
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), 200, 200);
					variables.addImageVariable(image_clt);
				}
			} else {	System.out.println("----D"+INPUT+"_____"+(String) mapentry.getValue());
				variables.addTextVariable(new TextVariable(INPUT, (String) mapentry.getValue()));
			}
		}

		docx.fillTemplate(variables);
		docx.save(tmp);

		return 0;

	}

	  public int instionE(Map<String, String> E) {

		 
		  Docx  docx=new Docx(tmp);
		
		docx.setVariablePattern(new VariablePattern("${", "}"));
		Variables variables = new Variables();

		for (Map.Entry mapentry : E.entrySet()) {
			System.out.println("clé: " + mapentry.getKey() + " | valeur: " + mapentry.getValue());
			String INPUT = "${" + mapentry.getKey() + "}";

			if (mapentry.getValue() == null || mapentry.getValue() == "") {
				variables.addTextVariable(new TextVariable(INPUT, ""));
			} else if (mapentry.getKey().equals("E20") || mapentry.getKey().equals("E29")) {
				if(((String) mapentry.getValue()).indexOf("\\")!=-1) {
					ImageVariable image_clt = new ImageVariable(INPUT, (String) mapentry.getValue(),
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
					System.out.println("OUTPUUUUUUUUUUUT"+(String) mapentry.getValue());
				}else if(((String) mapentry.getValue()).indexOf("\\")==-1) {
					String url=Insertion.docIm+"\\"+(String) mapentry.getValue();
					System.out.println("********url*******"+url);
					ImageVariable image_clt = new ImageVariable(INPUT,url,pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
				}
			} else {
				variables.addTextVariable(new TextVariable(INPUT, (String) mapentry.getValue()));
			}
		}

//		variables.addTextVariable(new TextVariable("${E0}", ""));
//		variables.addTextVariable(new TextVariable("${E1}", ""));
//		variables.addTextVariable(new TextVariable("${E2}", ""));
//		variables.addTextVariable(new TextVariable("${E3}", ""));
//		variables.addTextVariable(new TextVariable("${E4}", ""));
//		variables.addTextVariable(new TextVariable("${E5}", ""));
//		variables.addTextVariable(new TextVariable("${E21}", ""));
//		variables.addTextVariable(new TextVariable("${E22}", ""));
//		variables.addTextVariable(new TextVariable("${E23}", ""));
//		variables.addTextVariable(new TextVariable("${E24}", ""));
		docx.fillTemplate(variables);
		docx.save(tmp);

		return 0;

	}

	public   void remplirTab2(ArrayList<Tab1> rec) {
	 
 
		
		  
		  Docx  docx=new Docx(tmp); 
		
		
		
		
		
		
		Variables var = new Variables();

		TableVariable tableVariable = new TableVariable();

		ArrayList<Variable> Abr = new ArrayList<Variable>();
		ArrayList<Variable> Deta = new ArrayList<Variable>();
		ArrayList<Variable> Super = new ArrayList<Variable>();

		ArrayList<Tab1> recs = new ArrayList<Tab1>();
		for (Tab1 recc : rec) {

			recs.add(new Tab1(recc.getAbr(), recc.getDeta(), recc.getSuper() + " "));

		}
		recs.add(new Tab1("${C11}", "${C12}", "${C13}"));
		for (Tab1 student : recs) {

			Abr.add(new TextVariable("${C11}", student.getAbr()));

			Deta.add(new TextVariable("${C12}", student.getDeta()));

			Super.add(new TextVariable("${C13}", student.getSuper()));

		}

		tableVariable.addVariable(Abr);

		tableVariable.addVariable(Deta);

		tableVariable.addVariable(Super);

		var.addTableVariable(tableVariable);
		
		

		docx.fillTemplate(var);
		
		docx.save(tmp);
		try {
			deletelasterow(4);
		} catch (Exception e) {
 
			e.printStackTrace();
		}
	
		

	}

	public   void remplirTab3(ArrayList<tab3> rec) throws Exception {
		System.out.println("remplirTabremplirTabremplirTabremplirTab  ");
		
 
		Document 	  doc=new Document(tmp);
		  
	//	DocumentBuilder builder = new DocumentBuilder(doc);
 
		
		
	  	Bookmark bk = doc.getRange().getBookmarks().get("table4");
	  	 
	       
	       Table gpl= (Table) bk.getBookmarkStart().getAncestor(NodeType.TABLE);
	       
	       
		     //  NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true) 
	 
		      // Table montable=((Table )allTables.get(0));
		       //Table gpl=  (Table)((Table )montable).getRows().get(20).getChild(NodeType.TABLE,0, true);
		       
		    //   Table gpl=(Table) ((Table )montable).getRows().get(27).getChild(NodeType.TABLE,0, true);
	 
	 
		       if(rec==null || (rec.get(0).getBar().equals("")&&rec.get(0).getCV().equals("")&&rec.get(0).getDebit().equals("")&&rec.get(0).getLitre().equals("")&&rec.get(0).getNombreC().equals("")  )) {	

		    	   gpl.getFirstRow().remove();
		    	   
		    	   doc.save(tmp);
 
		  }
		  else {
			  Row ro=gpl.getLastRow();
			  for(tab3 gg:rec) {
			  
			  
			       Row newRow =(Row)ro.deepClone(true);
			       gpl.appendChild(newRow);
			      //  builder.moveTo(ro);

			       
////			       builder.insertCell();
////			       builder.insertCell();
			      Cell first= gpl.getLastRow().getCells().get(0);
			      Cell seconde=gpl.getLastRow().getCells().get(1);
			      Cell trid=gpl.getLastRow().getCells().get(2);
			      
			      
			      Cell first2= gpl.getLastRow().getCells().get(3);
			      Cell seconde2=gpl.getLastRow().getCells().get(4);
			      Cell trid2=gpl.getLastRow().getCells().get(5);
			  
			      first.removeAllChildren();
			      seconde.removeAllChildren();
			      trid.removeAllChildren();
			      
			      first2.removeAllChildren();
			      seconde2.removeAllChildren();
			      trid2.removeAllChildren();
			      
			      Paragraph lwla =new Paragraph(doc);
			      Paragraph tnya =new Paragraph(doc);
			      Paragraph talta =new Paragraph(doc);
			      
			      Paragraph lwla2 =new Paragraph(doc);
			      Paragraph tnya2 =new Paragraph(doc);
			      Paragraph talta2 =new Paragraph(doc);
			      
			      Run tt1=new Run(doc," "+gg.getNombreC());
			      Font f81=tt1.getFont();
			      f81.setName("Calibri"); ;
			      f81.setSize(11);
			      f81.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      Run tt2=new Run(doc," "+gg.getDebit());
			      Font f82=tt2.getFont();
			      f82.setName("Calibri"); ;
			      f82.setSize(11);
			      f82.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      Run tt3=new Run(doc," "+gg.getCV());
			      Font f83=tt3.getFont();
			      f83.setName("Calibri"); ;
			      f83.setSize(11);
			      f83.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      Run tt4=new Run(doc," "+gg.getKW());
			      Font f84=tt4.getFont();
			      f84.setName("Calibri"); ;
			      f84.setSize(11);
			      f84.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      Run tt5=new Run(doc," "+gg.getBar());
			      Font f85=tt5.getFont();
			      f85.setName("Calibri"); ;
			      f85.setSize(11);
			      f85.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      Run tt6=new Run(doc," "+gg.getLitre());
			      Font f86=tt6.getFont();
			      f86.setName("Calibri"); ;
			      f86.setSize(11);
			      f86.setColor(java.awt.Color.decode("#1f3864")); 
			      
			      
			      
			      
			      
			      lwla.appendChild(tt1);
			      tnya.appendChild(tt2);
			      talta.appendChild(tt3);
			      
			      lwla2.appendChild(tt4);
			      tnya2.appendChild(tt5);
			      talta2.appendChild(tt6);
			      
			      first.appendChild(lwla);
			      seconde.appendChild(tnya);
	 		      trid.appendChild(talta);
	 		      
	 		     first2.appendChild(lwla2);
			      seconde2.appendChild(tnya2);
	 		      trid2.appendChild(talta2);
	 		      
			      
			      
			    
			 

	 		       
	 		       newRow.appendChild(first);
	 		       newRow.appendChild(seconde);
	 		       newRow.appendChild(trid);
	 	  
	 		      
	 		       newRow.appendChild(first2);
	 		       newRow.appendChild(seconde2);
	 		       newRow.appendChild(trid2);
	 		  
	  		  

	 	  }
		
			  
			  
		  }
		       try {
				doc.save(tmp);
			} catch (Exception e) {
		 
				e.printStackTrace();
			}
		
  
	}
	public   boolean  remplirTab44(ArrayList<tab2> rec) throws Exception {
		Document 	  doc=new Document(tmp);
		  
		DocumentBuilder builder = new DocumentBuilder(doc);
	 
  	Bookmark bk = doc.getRange().getBookmarks().get("table5");
	  	 
	       
	       Table gpl= (Table) bk.getBookmarkStart().getAncestor(NodeType.TABLE);

	  		
		  if(rec==null||(rec.get(0).getF1().equals("")&&rec.get(0).getF2().equals("")&&rec.get(0).getF3().equals("")&&rec.get(0).getF4().equals("")))
		  {     gpl.remove();
			doc.save(tmp);
	 
		  return false;
		  }
	  else {
		  Row ro=gpl.getLastRow();
		  for(tab2 gg:rec) {
		  
		  
		       Row newRow =(Row)ro.deepClone(true);
		       gpl.appendChild(newRow);
		      //  builder.moveTo(ro);

		       
////		       builder.insertCell();
////		       builder.insertCell();
		      Cell first= gpl.getLastRow().getCells().get(0);
		      Cell seconde=gpl.getLastRow().getCells().get(1);
		      Cell trid=gpl.getLastRow().getCells().get(2);
		      
		      
		      Cell first2= gpl.getLastRow().getCells().get(3);
 
		  
		      first.removeAllChildren();
		      seconde.removeAllChildren();
		      trid.removeAllChildren();
		      
		      first2.removeAllChildren();
 
		      
		      Paragraph lwla =new Paragraph(doc);
		      Paragraph tnya =new Paragraph(doc);
		      Paragraph talta =new Paragraph(doc);
		      
		      Paragraph lwla2 =new Paragraph(doc);
	 
		      
		      Run tt1=new Run(doc," "+gg.getF1());
		      Font f81=tt1.getFont();
		      f81.setName("Calibri"); ;
		      f81.setSize(11);
		      f81.setColor(java.awt.Color.decode("#1f3864")); 
		      
		      Run tt2=new Run(doc," "+gg.getF2());
		      Font f82=tt2.getFont();
		      f82.setName("Calibri"); ;
		      f82.setSize(11);
		      f82.setColor(java.awt.Color.decode("#1f3864")); 
		      
		      Run tt3=new Run(doc," "+gg.getF3());
		      Font f83=tt3.getFont();
		      f83.setName("Calibri"); ;
		      f83.setSize(11);
		      f83.setColor(java.awt.Color.decode("#1f3864")); 
		      
		      Run tt4=new Run(doc," "+gg.getF4());
		      Font f84=tt4.getFont();
		      f84.setName("Calibri"); ;
		      f84.setSize(11);
		      f84.setColor(java.awt.Color.decode("#1f3864")); 
		      
 
		      
		      
		      
		      
		      
		      lwla.appendChild(tt1);
		      tnya.appendChild(tt2);
		      talta.appendChild(tt3);
		      
		      lwla2.appendChild(tt4);
	 
		      
		      first.appendChild(lwla);
		      seconde.appendChild(tnya);
		      trid.appendChild(talta);
		      
		     first2.appendChild(lwla2);
		  
		      
		      
		      
		    
		 

		       
		       newRow.appendChild(first);
		       newRow.appendChild(seconde);
		       newRow.appendChild(trid);
	  
		      
		       newRow.appendChild(first2);
		 
		  
 		  

	  }
	
		  
		  
	  }
	      doc.save(tmp);
	 
		return true;

	}
	
	
	
	
	
	
	public   boolean remplirTab(ArrayList<Tab1> rec ) throws Exception {
		System.out.println("remplirTabremplirTabremplirTabremplirTab  ") ;

	Document 	  doc=new Document(tmp);
		  
	DocumentBuilder builder = new DocumentBuilder(doc);
 		 
       // DocumentBuilder builder = new DocumentBuilder(doc);
       //Table table = (Table) builder.fetchRowAttr(5);
 
 if(  rec==null) {	
return false;

 }else {
	     NodeCollection allTables = doc.getChildNodes(NodeType.TABLE, true);
	       Table montable=((Table )allTables.get(0));
	       Table zz=(Table) montable.getRows().get(1).getChild(NodeType.TABLE, 0, true);
	  System.out.println("----"+zz.getText()+"--------finnnn-----");
	   
	  builder.moveTo(zz.getFirstRow().getFirstCell().appendChild(new Paragraph(doc))); 
	  for(Tab1 MPSn:rec){
		  
		    Row ro=zz.getLastRow();
		       Row newRow =(Row)ro.deepClone(true);
		       zz.appendChild(newRow);
		      //  builder.moveTo(ro);

		       
////		       builder.insertCell();
////		       builder.insertCell();
		      Cell first= zz.getLastRow().getCells().get(0);
		      Cell seconde=zz.getLastRow().getCells().get(1);
		      Cell trid=zz.getLastRow().getCells().get(2);
		      
		  
		      first.removeAllChildren();
		      seconde.removeAllChildren();
		      trid.removeAllChildren();
		      
		      Paragraph lwla =new Paragraph(doc);
		      Paragraph tnya =new Paragraph(doc);
		      Paragraph talta =new Paragraph(doc);
		      
		      lwla.appendChild(new Run(doc," "+MPSn.getAbr()));
		      tnya.appendChild(new Run(doc," "+MPSn.getDeta()));
		      talta.appendChild(new Run(doc," "+MPSn.getSuper()));
		      
		      first.appendChild(lwla);
		      seconde.appendChild(tnya);
		      trid.appendChild(talta);
		      
     newRow.appendChild(first);
		       newRow.appendChild(seconde);
		       newRow.appendChild(trid);

	  } 
 }

 try {
	doc.save(tmp);
} catch (Exception e) {
 
	e.printStackTrace();
}
		
	return true;	
	}	
		
		
		
		
		
		
		
		
		
		
		
		
//		
//		
//		
//	 //	Docx  	docx=new Docx(tmp);	 
//	 
//		Variables var = new Variables();
//
//		TableVariable tableVariable = new TableVariable();
//
//		ArrayList<Variable> Abr = new ArrayList<Variable>();
//		ArrayList<Variable> Deta = new ArrayList<Variable>();
//		ArrayList<Variable> Super = new ArrayList<Variable>();
//
//		ArrayList<Tab1> recs = new ArrayList<Tab1>();
//		for (Tab1 recc : rec) {
//
//			recs.add(new Tab1(recc.getAbr(), recc.getDeta(), recc.getSuper() + "m²"));
//
//		}
//		recs.add(new Tab1("${Abr1}", "${Deta1}", "${Super1}"));
//		for (Tab1 student : recs) {
//
//			Abr.add(new TextVariable("${Abr1}", student.getAbr()));
//
//			Deta.add(new TextVariable("${Deta1}", student.getDeta()));
//
//			Super.add(new TextVariable("${Super1}", student.getSuper()));
//
//		}
//
//		tableVariable.addVariable(Abr);
//
//		tableVariable.addVariable(Deta);
//
//		tableVariable.addVariable(Super);
//
//		var.addTableVariable(tableVariable);
//
//		docx.fillTemplate(var);
//		docx.save(tmp);
//		
//		try {
//		 deletelasterow(0);
//		} catch (Exception e) {
//			 
//			e.printStackTrace();
//		}
//	

	 

	  public int instionF(Map<String, String> E) {

		  
		  Docx  docx=new Docx(tmp);	 
		docx.setVariablePattern(new VariablePattern("${", "}"));
		Variables variables = new Variables();

		for (Map.Entry mapentry : E.entrySet()) {
			System.out.println("clé: " + mapentry.getKey() + " | valeur: " + mapentry.getValue());
			String INPUT = "${" + mapentry.getKey() + "}";

			if (mapentry.getValue() == null || mapentry.getValue() == "") {
				variables.addTextVariable(new TextVariable(INPUT, ""));
			} else if (mapentry.getKey().equals("F3") || mapentry.getKey().equals("F13") ) {
				
				if(((String) mapentry.getValue()).indexOf("\\")!=-1) {
					ImageVariable image_clt = new ImageVariable(INPUT, (String) mapentry.getValue(),
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
					System.out.println("OUTPUUUUUUUUUUUT"+(String) mapentry.getValue());
				}else if(((String) mapentry.getValue()).indexOf("\\")==-1) {
					String url=Insertion.docIm+"\\"+(String) mapentry.getValue();
					System.out.println("********url*******"+url);
					ImageVariable image_clt = new ImageVariable(INPUT,url,
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
				}
				
				
			} else {
				variables.addTextVariable(new TextVariable(INPUT, (String) mapentry.getValue()));
			}
		}
		docx.fillTemplate(variables);
		docx.save(tmp);

		return 0;

	}

	  public int instionG(Map<String, String> E) {

		  Docx  docx=new Docx(tmp);
	  		 
		docx.setVariablePattern(new VariablePattern("${", "}"));
		Variables variables = new Variables();

		for (Map.Entry mapentry : E.entrySet()) {
			System.out.println("clé: " + mapentry.getKey() + " | valeur: " + mapentry.getValue());
			String INPUT = "${" + mapentry.getKey() + "}";


			if (mapentry.getValue() == null || mapentry.getValue() == "") {
				variables.addTextVariable(new TextVariable(INPUT, ""));
			} else if (mapentry.getKey().equals("G1") ||mapentry.getKey().equals("G5") ||mapentry.getKey().equals("G13") || mapentry.getKey().equals("G10")|| mapentry.getKey().equals("G21")|| mapentry.getKey().equals("G19")|| mapentry.getKey().equals("G22")) {
				if(((String) mapentry.getValue()).indexOf("\\")!=-1) {
					ImageVariable image_clt = new ImageVariable(INPUT, (String) mapentry.getValue(),
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
					System.out.println("OUTPUUUUUUUUUUUT"+(String) mapentry.getValue());
				}else if(((String) mapentry.getValue()).indexOf("\\")==-1) {
					String url=Insertion.docIm+"\\"+(String) mapentry.getValue();
					System.out.println("********url*******"+url);
					ImageVariable image_clt = new ImageVariable(INPUT,url,
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
				}
			} else {
				variables.addTextVariable(new TextVariable(INPUT, (String) mapentry.getValue()));
			}
		}

		docx.fillTemplate(variables);
		docx.save(tmp);

		return 0;

	}

	  public int instionH(Map<String, String> E) {

		  Docx  docx=new Docx(tmp);	   
	  		  
		docx.setVariablePattern(new VariablePattern("${", "}"));
		Variables variables = new Variables();

		for (Map.Entry mapentry : E.entrySet()) {
			System.out.println("clé: " + mapentry.getKey() + " | valeur: " + mapentry.getValue());
			String INPUT = "${" + mapentry.getKey() + "}";


			if (mapentry.getValue() == null || mapentry.getValue() == "") {
				variables.addTextVariable(new TextVariable(INPUT, ""));
			} else if (mapentry.getKey().equals("H1") || mapentry.getKey().equals("H3")|| mapentry.getKey().equals("H5")|| mapentry.getKey().equals("H7")|| mapentry.getKey().equals("H14")|| mapentry.getKey().equals("H18")) {
				if(((String) mapentry.getValue()).indexOf("\\")!=-1) {
					ImageVariable image_clt = new ImageVariable(INPUT, (String) mapentry.getValue(),
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
					System.out.println("OUTPUUUUUUUUUUUT"+(String) mapentry.getValue());
				}else if(((String) mapentry.getValue()).indexOf("\\")==-1) {
					String url=Insertion.docIm+"\\"+(String) mapentry.getValue();
					System.out.println("********url*******"+url);
					ImageVariable image_clt = new ImageVariable(INPUT,url,
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
				}
			} else {
				variables.addTextVariable(new TextVariable(INPUT, (String) mapentry.getValue()));
			}
		}
		docx.fillTemplate(variables);
		docx.save(tmp);

		return 0;

	}

	  public int instionI(Map<String, String> E) {

		  
		  Docx  docx=new Docx(tmp);	 
		docx.setVariablePattern(new VariablePattern("${", "}"));
		Variables variables = new Variables();
		String url = null;
		for (Map.Entry mapentry : E.entrySet()) {
			System.out.println("clé: " + mapentry.getKey() + " | valeur: " + mapentry.getValue());
			String INPUT = "${" + mapentry.getKey() + "}";

		
			if (mapentry.getValue() == null || mapentry.getValue() == "") {
				variables.addTextVariable(new TextVariable(INPUT, ""));
			} else if (mapentry.getKey().equals("I1") || mapentry.getKey().equals("I3")|| mapentry.getKey().equals("I5")|| mapentry.getKey().equals("I7")) {
				if(((String) mapentry.getValue()).indexOf("\\")!=-1) {
					ImageVariable image_clt = new ImageVariable(INPUT, (String) mapentry.getValue(),
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
					System.out.println("OUTPUUUUUUUUUUUT"+(String) mapentry.getValue());
				}else if(((String) mapentry.getValue()).indexOf("\\")==-1)  
					  url=Insertion.docIm+"\\"+(String) mapentry.getValue();
					System.out.println("********url*******"+url); 
					ImageVariable image_clt = new ImageVariable(INPUT,url,
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), wight, highet);
					variables.addImageVariable(image_clt);
					
			} else {
				if(((String) mapentry.getValue()).indexOf("\\n")==-1) {
					variables.addTextVariable(new TextVariable(INPUT," "));
				}else {
				variables.addTextVariable(new TextVariable(INPUT, (String) mapentry.getValue()));
				}
			}
		}

		docx.fillTemplate(variables);
		docx.save(tmp);

		return 0;

	}
		

	  public int instionJ(Map<String, String> E) {

		   
		  Docx  docx=new Docx(tmp);	   
		String   kk = null;String url = null;
		docx.setVariablePattern(new VariablePattern("${", "}"));
		Variables variables = new Variables();

		for (Map.Entry mapentry : E.entrySet()) {
			System.out.println("clé: " + mapentry.getKey() + " | valeur: " + mapentry.getValue());
			String INPUT = "${" + mapentry.getKey() + "}";


			if (mapentry.getValue() == null || mapentry.getValue() == "") {
				variables.addTextVariable(new TextVariable(INPUT, ""));
				System.out.println("J NULLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLl");
			} else if (mapentry.getKey().equals("J1") || mapentry.getKey().equals("J3")) {
				
				if(((String) mapentry.getValue()).indexOf("\\")!=-1) {
					ImageVariable image_clt = new ImageVariable(INPUT, (String) mapentry.getValue(),
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), 100, 100);
					variables.addImageVariable(image_clt);
					System.out.println("OUTPUUUUUUUUUUUT"+(String) mapentry.getValue());
				}else if(((String) mapentry.getValue()).indexOf("\\")==-1)  
					  url=Insertion.docIm+"\\"+(String) mapentry.getValue();
					System.out.println("********url*******"+url);
					ImageVariable image_clt = new ImageVariable(INPUT,url,
							pl.jsolve.templ4docx.variable.ImageType.findImageTypeForPath((String) mapentry.getValue()), 100, 100);
					variables.addImageVariable(image_clt);
				 
			} else if(mapentry.getKey().equals("J8")) {
				kk=(String) mapentry.getValue();
				//Insertion.matriccs((String) mapentry.getValue());
				System.out.println("INPUTINPUT -------------------> Value" +    (String) mapentry.getValue());
				ImageVariable image_clt2 = new ImageVariable("${"+(String) mapentry.getValue()+ "}","C:\\Users\\ACER\\eclipse-workspace3\\RMAE\\WebContent\\assets\\img\\—Pngtree—good_1297518.png",
						pl.jsolve.templ4docx.variable.ImageType.PNG, 20, 20);
				variables.addImageVariable(image_clt2);
			} else {
				variables.addTextVariable(new TextVariable(INPUT, (String) mapentry.getValue()));
			}
			
		}
		for(int z=1;z<17;z++) {
			if( kk==null) {kk="0";}
			 if(Integer.parseInt(kk)==z  ) continue;
			String var="${"+z+ "}";
			variables.addTextVariable(new TextVariable(var, ""));
			
		}
		
		docx.fillTemplate(variables);
		docx.save(tmp);

		return 0;

	}
	
	

}
