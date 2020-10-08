package DAO;
import java.sql.*;
import java.util.Date;
import java.util.ArrayList;
import metier.*;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import metier.*;
import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
;
public class SericeDao {



	 public static void refresh(Object obj)
	 {
	Session session=HibernateUtil.getSessionFactory().getCurrentSession();
	  session.getTransaction().begin();
	  session.refresh(obj);
	  session.getTransaction().commit();

	 }

public static  void  AddReferentiel(Referentiel ref) throws SQLException{
	
	Session session=HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(ref);
        
        session.persist(ref);
         
       session.getTransaction().commit();
	
	//chercher le nom de rec_stra et recuereer les valeur de rec et l'ajouter
}
public static  void  AddRecommandation(recommandation rec) throws SQLException{
	Session session=HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(rec);
        session.persist(rec);
       session.getTransaction().commit();
	
	//chercher le nom de rec_stra et recuereer les valeur de rec et l'ajouter
}





public static  void  AddRecommandationStandart(Recommandation_Standart rec) throws SQLException{
	
	Session session=HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(rec);
        session.persist(rec);
       session.getTransaction().commit();
       
	//chercher le nom de rec_stra et recuereer les valeur de rec et l'ajouter
}



public static  ArrayList<Referentiel>  getAllReferentiels( ) throws SQLException{
        ArrayList<Referentiel> refs=new ArrayList<Referentiel>();
        
	
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();

	Query req=session.createQuery("from  Referentiel");
	return (ArrayList < Referentiel >)req.list();
		
	//chercher le nom de rec_stra et recuereer les valeur de rec et l'ajouter
}

public static  ArrayList<Client>  getAllRecommandation( ) throws SQLException{
        ArrayList<Client> recs=new ArrayList<Client>();

	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("from  Client");
        
	return (ArrayList < Client >)req.list();
	
	//chercher le nom de rec_stra et recuereer les valeur de rec et l'ajouter
}

public static void DeleteClt(int id) throws SQLException{
    
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("DELETE FROM Client WHERE id=:id");
	Client cl=(Client)session.load(Client.class, id);
        req.setParameter("id", id);
        req.executeUpdate();
         session.persist(cl);
         SericeDao.refresh(cl);
         session.getTransaction().commit();  
        
        
}
public static void DeleteRecO(int id) throws SQLException{
    
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("DELETE FROM Recommandation_Standart WHERE id=:id");
	Recommandation_Standart rr=(Recommandation_Standart)session.load(Recommandation_Standart.class,id);
	session.persist(rr);
        req.setParameter("id", id);
   
        
        req.executeUpdate();
        SericeDao.refresh(rr);
        session.getTransaction().commit();  
       
     
}
  
    
    
    

public static void DeleteRO(int id) throws SQLException{
        Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("DELETE FROM recommandation WHERE id=:id");
	recommandation rt=(recommandation) session.load(recommandation.class, id);
	
        req.setParameter("id", id);     
        req.executeUpdate();
        session.persist(rt);
        SericeDao.refresh(rt);        

        session.getTransaction().commit();  
       
  


    
}

public static void DeleteReferenciel(int id) throws SQLException{
        Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("DELETE FROM Referentiel where id=:id");

	
        req.setParameter("id", id);     
        req.executeUpdate();
       session.flush();
        session.getTransaction().commit();  
       
       

    
}
public static  recommandation getRecommandatio() throws SQLException {

        recommandation rec=null;
        Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();       
	String sql="from recommandation where id=(select max(id) from recommandation)";
	Query req=session.createQuery(sql);    
	rec=(recommandation)req.uniqueResult();
	return rec;	
}

public static  Recommandation_Standart getRecommandatioStandart(String nom) throws SQLException {
	
	Recommandation_Standart rec=null;
        Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery(" from Recommandation_Standart  where nom_rec=:id");
        req.setParameter("id", nom);     
	rec=(Recommandation_Standart)req.uniqueResult();
	return rec;	

}

public static  String getClientUrl(int  id) throws SQLException {

        
	Client u=null;
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
         
        u = (Client)session.load(Client.class, id);
        if(u.getUrl()==null) return null;
	return u.getUrl();	
}

public static  void MoifierRecommandation( String reference,String nom_rec,String localisation,String Risque,String type) throws SQLException {
        Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
        String sql="update  Recommandation_Standart set reference_rec =:ref,localisation=:loc,risque=:rsq,type=:typ  where nom_rec=:nom  ";
	Query req=session.createQuery(sql);
        req.setParameter("ref", reference);
        req.setParameter("loc", localisation);
        req.setParameter("rsq", Risque);
        req.setParameter("typ", type);
        req.setParameter("nom", nom_rec);
	req.executeUpdate();
	session.getTransaction().commit();

}


public static User getUser(String email, String motPasse) throws SQLException {
	 
	User u=null;
        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query query = session.createQuery("from user where email=:email and mot_passe=:mpasse");
        query.setParameter("email", email);
        query.setParameter("mpasse", motPasse);
        u = (User)query.uniqueResult();
        if(u==null) return null;
	return u;	

}
//public static void  AddUser(User u) throws SQLException {
//
//        Session session=HibernateUtil.getSessionFactory().getCurrentSession();
//        session.beginTransaction();
//       session.save(u);
//       
//       session.getTransaction().commit();
//       
//}

public static void  AddClient(Client u) throws SQLException {
   Session session=HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
       session.save(u);
       session.persist(u);
       session.getTransaction().commit();
}
public static ArrayList<Recommandation_Standart> getAllRecommandationStandart() throws SQLException {
	
	
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("from  Recommandation_Standart");
	return (ArrayList < Recommandation_Standart >)req.list();

}
public static ArrayList<recommandation> getAllRec() throws SQLException {
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("from  recommandation");
	return (ArrayList < recommandation >)req.list();


}

public static long getAllBon(int date) throws SQLException {
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("select count(*) from Client  where  Niveau_de_Risque='bon' and Year(date_visite)=:date");
	         req.setParameter("date", date);

        return (Long)req.uniqueResult();


}
public static long getAllMoyen(int date) throws SQLException {
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("select count(*) from Client  where  Niveau_de_Risque='Moyen' and Year(date_visite)=:date");
         req.setParameter("date", date);
	return (Long)req.uniqueResult();


}
public static long getAllMédiocre(int date) throws SQLException {
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
        Query req=session.createQuery("select count(*) from Client  where  Niveau_de_Risque='Médiocre' and Year(date_visite)=:date");
	 req.setParameter("date", date);

        return (Long)req.uniqueResult();


}
public static long getAllMauvais(int date) throws SQLException {
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("select count(*) from Client  where  Niveau_de_Risque='Mauvais' and Year(date_visite)=:date");
               req.setParameter("date", date);

	return (Long)req.uniqueResult();


}
public static long getAllPauvre(int date) throws SQLException {
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
       Query req=session.createQuery("select count(*) from Client  where  Niveau_de_protection='Pauvre'  and Year(date_visite)=:date");
       req.setParameter("date", date);
	return (Long)req.uniqueResult();


}
public static long getAllBesoin ( int date) throws SQLException {
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("select count(*) from Client where Niveau_de_protection='Besoin d amélioration' and Year(date_visite)=:date");
	req.setParameter("date", date);
        return (Long)req.uniqueResult();


}
public static long getAllAu_dessus(int date) throws SQLException {
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("select count(*) from Client  where  Niveau_de_protection='Au-dessus de la normale' and Year(date_visite)=:date");
	 req.setParameter("date", date);
        return (Long)req.uniqueResult();


}
public static long getAllAdéquat(int date) throws SQLException {
	Session session=HibernateUtil.getSessionFactory().getCurrentSession() ;
	session.beginTransaction();
	Query req=session.createQuery("select count(*) from Client  where  Niveau_de_protection='Adéquat,Standard' and Year(date_visite)=:date");
        req.setParameter("date", date);
	return (Long)req.uniqueResult();


}



}
