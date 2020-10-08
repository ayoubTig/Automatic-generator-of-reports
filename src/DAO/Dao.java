package DAO;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.transaction.HeuristicMixedException;
import javax.transaction.HeuristicRollbackException;
import javax.transaction.RollbackException;


import org.hibernate.Query;
import org.hibernate.Session;


import DAO.HibernateUtil;
import metier.*;
import metier.Document;

public class Dao {

	
	
	
	private static final String User = null;
	public static boolean add(Object ob )  throws Exception  {
		  Session session=HibernateUtil.getSessionFactory().getCurrentSession();

	        session.beginTransaction();
	       

	      session.save(ob);  
	     session.persist(ob);
	     session.beginTransaction().commit();

			
		
//		
//	     Session session = HibernateUtil.sessionFactory.openSession();
//		  session.getTransaction().begin();
//		  session.save(ob);
//		  session.getTransaction().commit(); 
//		  session.close();
		  return true;
		
		
	}
	
	
	public static boolean updateww(Document Neveu ,Document oncien ) {
		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	
		 session.beginTransaction();
 	   session.delete(oncien);
		 session.save(Neveu);
		//  session.persist(ob2);
	   //   session.flush();
	      session.getTransaction().commit();
		return true;	
 
		
	}
 	
	public static  void updateS( int nbr ,int id) throws SQLException {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
        String sql="update  Document set nbrRe=:o  where idDoc=:l  ";
	Query req=session.createQuery(sql);
        req.setParameter("o", nbr);
        req.setParameter("l", id);
	req.executeUpdate();
	session.getTransaction().commit();

}
	
	
	
	
	
	
	
	
	
	
	
	
	public static boolean addDocuemnt(Document doc) throws Exception {
 
		return add(doc);
  }
	
	public static boolean addDonnes(Donnes doc) throws Exception {
 
		return add(doc);
}
	public static boolean addUser(User doc) throws Exception {
	
		return add(doc);
}
	
	public static ArrayList<Document> getAllDocuemnt(){
		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
    	session.beginTransaction();
		Query req=session.createQuery(" from Document");
		ArrayList<Document> ls=new ArrayList<Document>();
		ls=(ArrayList<Document>) req.list();
		 
		return ls;
    }
	
	public static int  LoginUser(String email ,String pass ) {
		
		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
    	session.beginTransaction();
     	 Query req=session.createQuery(" select count(*)  from User as r where r.Email=:p and r.PassWord=:k");
	//	int count = ((Long)session.createQuery(" select count(*)  from Reaction as r where r.user.email=:p and r.news.url=:k").uniqueResult()).intValue();
  		req.setString("p", email);
 		req.setString("k",pass);
 		int count =((Long)req.uniqueResult()).intValue();
//		List listRes = req.list();	//.intValue()
	  
				//((Integer) listRes.get(0));
		System.out.println("///////////email///////"+email);
		System.out.println("_______count_____________"+count);
		System.out.println("_________PassWord___________"+pass);
		return  count;
		
	}
	
	
//	public static ArrayList<Document> getAllDocuemnt(){
//		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
//    	session.beginTransaction();
//		Query req=session.createQuery("select Max(*)  from Document");
//		ArrayList<Document> ls=new ArrayList<Document>();
//		ls=(ArrayList<Document>) req.list();
//		 
//		return ls;
//    }
//	
	
	
	public static int  MaxId() {
		
		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
    	session.beginTransaction();
     	 Query req=session.createQuery(" select max(idDoc)  from Document ");
 
     	 if(req.uniqueResult()==null) return 1;
 		int count =((Integer)req.uniqueResult());
 
	 
		return  count;
		
	}
	
	public static Document  ExisteDoc(String Url_Doc ) {
		
		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
    	session.beginTransaction();
     	 Query req=session.createQuery(" from Document as r where r.Url_Doc=:p   ");
	//	and  r.idDoc=:o int count = ((Long)session.createQuery(" select count(*) r.Url_Doc=:p and r.Date_Viste=:k and from Reaction as r where r.user.email=:p and r.news.url=:k").uniqueResult()).intValue();
   		req.setString("p", Url_Doc);
 		//req.setString("k",URL_dossierImage);
 	 
 //		req.setInteger("o",id);
//	 
	 
		return  (Document) req.uniqueResult();
		
	}
	
	
	public static Long  Statis(int nbr ,String Date_Viste ) {
		
		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
    	session.beginTransaction();
    	session.flush();
    	System.out.println("Statis--_>"+Date_Viste);
     	 Query req=session.createQuery(" select count(*) from Document as r where r.nbrRe=:p and r.Date_Viste LIKE CONCAT('%',:searchKeyword,'%') ");
	//	and  r.idDoc=:o int count = ((Long)session.createQuery(" select count(*) r.Url_Doc=:p and r.Date_Viste=:k and from Reaction as r where r.user.email=:p and r.news.url=:k").uniqueResult()).intValue();
   		req.setInteger("p", nbr);
 		req.setString("searchKeyword",Date_Viste);
  
 		Long count =(Long)req.uniqueResult();
		return count;
		
	}
	
	
	public static long  Global(String Date_Viste ) {
		
		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
    	session.beginTransaction();
    	
     	 Query req=session.createQuery(" select count(*) from Document as r where  r.Date_Viste LIKE  CONCAT('%',:searchKeyword,'%') ");
 		req.setString("searchKeyword",Date_Viste);
 		Long count =(Long)(req.uniqueResult());
		return count;
		
	}
	
	
	
	
	
	public static User getUserByEmail(String email ,String motPA,boolean choix) {
		
		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
    	session.beginTransaction();
		Query req=session.createQuery("from User where Email=:p and PassWord=:k and choix=:c");
		req.setString("p", email);
		req.setString("k", motPA);
		req.setBoolean("c", choix);
		return (User) req.uniqueResult();
		
		
		
	}
	public static ArrayList<Donnes> getUserDonnes() {
		
		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
    	session.beginTransaction();
		Query req=session.createQuery("from Donnes ");
 
		return (ArrayList<Donnes>) req.list();
		
		
		
	}
	public static int UserExist(String email ) {
		
		Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
    	session.beginTransaction();
		Query req=session.createQuery("select count(*) from User where Email=:p ");
		req.setString("p", email);
		int count =((Long)req.uniqueResult()).intValue();
		return count;
			 
		
		
		
	}
	
	
	
}
