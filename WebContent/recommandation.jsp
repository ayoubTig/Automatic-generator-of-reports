<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%-- 
    Document   : recommandation
    Created on : 19 juin 2019, 23:42:30
    Author     : yassi
--%>
<%if(session.getAttribute("user")==null)  response.sendRedirect("login.jsp"); %>
<%@page import="java.util.List"%>
<%@page import="DAO.SericeDao"%>
<%@page import="metier.Recommandation_Standart"%>
<%@page import="metier.User,java.text.SimpleDateFormat,java.util.Date,metier.ex"%>
<%@page import="metier.Referentiel"%>

<%@page import="metier.ServiceMetier"%>
<%@page import="java.util.ArrayList"%>
  <%@ page errorPage="Error.jsp" %>   
<!DOCTYPE html>
<html>
    <head>
        <title>Bienvenue sur l'Espace de recommandation</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        
       
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="assets/css/main.css">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
        
        
    </head>
    
    <%  ArrayList<Referentiel> refs= ServiceMetier.getAllReferentiels() ;%>
    <% ArrayList<Recommandation_Standart> recs=SericeDao.getAllRecommandationStandart();%>
    <% // user user=(user) application.getAttribute("user"); %> 
    
    
    
     
    
    
    <body>
        <div id="wrapper">
     		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="home.jsp"><span><img style='height: 30px;'
						src="assets/img/logo_front.png" alt="Klorofil Logo"> </span></a>
			</div>
			<div class="container-fluid">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth">
						<i class="lnr lnr-arrow-left-circle"></i>
					</button>
				</div>
				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <img src="assets/img/images.png"
								alt="Avatar"> <span><strong>
										<%if(session.getAttribute("user")!=null){ %>
										<%out.print(((User)session.getAttribute("user")).getNomPre()); }%>
								</strong></span> <i class="icon-subxmenu lnr lnr-chevron-down"></i></a>
							<ul class="dropdown-menu">
								<!-- 								<li><a href="#"><i class="lnr lnr-user"></i> <span>My Profile</span></a></li>
                           <li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li> -->
								  <% User uu=null;
                          if(session.getAttribute("user")!=null)
										  uu=(User)session.getAttribute("user");
										  if(uu.getChoix()==true){ %>
								<li><a href="inscription.jsp"><i class="lnr lnr-user"></i>
										<span>inscription</span></a></li> <% } %>
								<li><a href="login.jsp"><i class="lnr lnr-exit"></i> <span>déconnexion</span></a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
	 
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll">
				<nav>
					<ul class="nav">
						 <br> 
				 	<!-- <li><a href=" "><i></i> <span> </span></a></li>   --> 
				 	<li><a href="home.jsp" class=""><i class="lnr lnr-home""></i>
								<span class=".lead">Page d'acceuil </span></a></li>
			 
						<li><a href="index.jsp" class=" "><i
								class=" lnr lnr-layers "></i> <span>Espace
									d'Evaluation</span></a></li>
						<li><a href="tables.jsp" class=""><i class="lnr lnr-database"></i>
								<span>Consultation des rapports</span></a></li>
							 
									<li><a href="recommandation.jsp" class="active"><i class="lnr lnr-book"></i>
								<span class=".lead">Rapport de prévention </span></a></li>
									<%  User u=null;
									if(session.getAttribute("user")!=null)
										  u=(User)session.getAttribute("user");
									//	if(  u==null)  response.sendRedirect("login.jsp");
									
										if(u.getChoix()==true){
											
										
									
									%>
									
									<li><a href="Admin.jsp" class=""><i class="lnr lnr-star-half"></i>
								<span class=".lead">Espace admin prévention</span></a></li>
								 <%  } %>
									<% 
									
										if(u.getChoix()==true){
											
										
									
									%>
									
									<li><a href="AfficheRec.jsp" class=""><i class="lnr lnr-cog"></i>
								<span class=".lead">Gérer rapports prévention </span></a></li>
								 <%  } %>
									<li><a href="chart.jsp" class=""><i class="lnr lnr-pie-chart"></i>
								<span class=".lead">Statistique prévention  </span></a></li>
								
								<li><a href="Convertir.jsp" class=""><i class="lnr lnr-file-empty"></i>
								<span class=".lead">La conversion des documents en PDF </span></a></li>
								<li><a href="contact.jsp" class=""><i class="lnr lnr-bullhorn"></i>
								<span class=".lead">Contact </span></a></li>
					</ul>
				</nav>
			</div>
		</div>
            <div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
                                               <% 
	   String erreur= (String) request.getAttribute("errorP");
	   if (erreur!=null ){
			
	   
    %>
                            <div class="alert alert-danger alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Danger!  </strong> <%= erreur%>
                            </div><%} %>
                            
                            <div class="container-fluid">
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Choisir les fichiers de départ</a>
        </h3><div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
									</div>
						</div>
					   <div id="collapse1" class="panel-collapse collapse in">
                                               <div  class="panel-body" <% if (session.getAttribute("images")!=null && session.getAttribute("output")!=null ) {%>
                                                     style="display: none" <%}%>  
                                               >
                                                       
<FORM action ="ServiceServlet" method ="post">
    <div class="row">
        <div class="col-md-4"><label  >Choisir le dossier de vos images   </label><input type="text"  name="images" class="form-control" placeholder="" required></div>
        
      <div class="col-md-4"><label  > Choisir votre rapport de générer   </label><input type="text"  name="words" class="form-control" placeholder="" required></div>
    			<br/>	
      <div class="col-md-4" > <input type="submit" name="action" class="btn btn-info" value=Parter></div>

</div> <br/>
            
            
        </div></div></form></div></div>
				<div class="container-fluid">
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse1">L'ASSURANT</a>
        </h3><div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
									</div>
						</div>
					   <div id="collapse1" class="panel-collapse collapse in">
						 <div  class="panel-body" <% if (session.getAttribute("save_rec")!=null || session.getAttribute("images")==null || session.getAttribute("output")==null ) {%>
                                                     style="display: none" <%}%>>
<FORM action = "SeviceServlet" method ="post">
    <div class="row">
        <div class="col-md-4"></div>   <div class="col-md-4">  <br/>
						 		<label class="radio-inline"><input type="radio" name="Prospect" value="Prospect" checked>Prospect</label>
                                                                <label class="radio-inline"><input type="radio" name="Prospect" value="Assuré">Assuré</label>
                           <input type="button"   value="+" class="glyphicon glyphicon-plus-sign" onClick="AfficherMasquer()" />

                                         <div id="divacacher" style="display:none;"><input type="text" name="numero_police"
                                                                                                                  placeholder="numero de police"></div></div>  <div class="col-md-4"></div> </div>
						 	<br/><br/>
                                                                                                                  <div class="row" style="border:dotted;" >
                                                          <br/>
                                                            <div class="col-md-4" > <label  > Date de visite </label><input type="Date" name="date_visite" class="form-control" placeholder="" required></div>
                                                            
                                                            <div class="col-md-4">
                                                                
                                                                <label  > Nom de l'entreprise   </label><input type="text"  name="name" class="form-control" placeholder="" required>

                                                                
                                                                
                                                            </div>	
                                                                                                                       
                                                            <div class="col-md-4">

                                                            
<label  > GPS   </label><input type="text" class="form-control" name="gps" placeholder="" required>
                                                            

<br/>
                                                            </div></div>
                                                            
 


    								<div class="row" style="border:dotted;" >
                                                                    <br>
	<br>
	
<div class="col-md-6"  >
					
<!--  <label >Nature des constructions :  </label> <input type="text" class="form-control" placeholder="" > -->
<table class="table table-bordered table-hover" id="tab_logClient"  >
                                            <thead class="thead-dark">
                                                <tr>
                                                   <th class="text-center">
                                                    #
                                                    </th>
                                                    <th class="text-center">
                                                       Nom de Client
                                                    </th>
                                                    <th class="text-center">
                                                       Sa fonction
                                                    </th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id='addClient0'>
                                                   <td>1</td>
                                                    <td> 
                                                        <input type="text" name='clt1'  placeholder='Client Nom ' class="form-control" />
                                                    </td>
                                                    <td>  
                                                        <input type="text" name='fonc1' placeholder='Fonction ' class="form-control" />
                                                    </td>
                                                 
                                                </tr>
                                              <tr id='addClient1'></tr>  
                                            </tbody>
                                        </table>
                                        <button  type="button" id="add_rowClient" class="btn btn-default pull-left"><i class="fa fa-plus-circle" style="font-size:20px"></i></button>
                                        <button type="button" id='delete_rowClient' class="pull-right btn btn-default"><i class="fa fa-minus-circle" style="font-size:20px"></i></button>
                                
                                                        <input type="text" hidden="" name="txtName5" value="1" id="txtName5"><BR><BR>
<label  > Adresse de client   </label><input type="text"  name="adresse" class="form-control" placeholder="" required>

  <label  >Image de client   </label><input type="file" id="fileUpload" value=""  name="image_client" class="form-control" placeholder="" >
</div>
<div class="col-md-6" >
<table class="table table-bordered table-hover" id="tab_logInter"  >
                                            <thead class="thead-dark">
                                                <tr>
                                                   <th class="text-center">
                                                    #
                                                    </th>
                                                    <th class="text-center">
                                                      Intermidiare
                                                    </th>
                                                    <th class="text-center">
                                                       Sa fonction
                                                    </th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id='addInter0'>
                                                   <td>1</td>
                                                    <td> 
                                                        <input type="text" name='inter1'  placeholder='Intermidiaire Nom ' class="form-control" />
                                                    </td>
                                                    <td>  
                                                        <input type="text" name='fonct1' placeholder='Fonction ' class="form-control" />
                                                    </td>
                                                 
                                                </tr>
                                              <tr id='addInter1'></tr>  
                                            </tbody>
                                        </table>
                                        <button  type="button" id="add_rowInter" class="btn btn-default pull-left"><i class="fa fa-plus-circle" style="font-size:20px"></i></button>
                                        <button type="button" id='delete_rowInter' class="pull-right btn btn-default"><i class="fa fa-minus-circle" style="font-size:20px"></i></button>
                                
<input type="text" hidden="" name="txtName6" value="1" id="txtName6"><br><BR><BR>
	
<label  >Image de l'intermidiaire  </label><input type="file" name="image_intermidiaire" class="form-control" placeholder="" >


					
<br/><br/><br/>
				
</div></div><br/>
                                           
                                                        
                                                        <div class="row" style="border:dotted;">
                                                            <br/>
                                                        <div class="col-md-6">

                         
                                    <table class="table table-bordered table-hover" id="tab_logicciternes"  >
                                            <thead class="thead-dark">
                                                <tr>
                                                   <th class="text-center">
                                                    #
                                                    </th>
                                                    <th class="text-center">
                                                       Responsable RMA Assurance
                                                    </th>
                                                    <th class="text-center">
                                                       Sa fonction
                                                    </th>
                                                    
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr id='addrciternes0'>
                                                   <td>1</td>
                                                    <td> 
                                                        <input type="text" name='resp1'  placeholder='Responsable ' class="form-control" />
                                                    </td>
                                                    <td>  
                                                        <input type="text" name='fonction1' placeholder='Fonction ' class="form-control" />
                                                    </td>
                                                 
                                                </tr>
                                              <tr id='addrciternes1'></tr>  
                                            </tbody>
                                        </table>
                                        <button  type="button" id="add_rowciternes" class="btn btn-default pull-left"><i class="fa fa-plus-circle" style="font-size:20px"></i></button>
                                        <button type="button" id='delete_rowciternes' class="pull-right btn btn-default"><i class="fa fa-minus-circle" style="font-size:20px"></i></button>
                                
                            <input type="text" hidden="" name="txtName4" value="1" id="txtName4">
                                </div>
				<div class="col-md-6" >


					
					
				<label  >Réunion d'ouverture  </label><input type="text" name="reunion_ouverture" class="form-control" placeholder="" >

				 <label  >Visite de site </label><input type="text" name="visite_site" class="form-control" placeholder="" >
				
				 <label  >Réunion de cloture </label><input type="text" name="reunion_cloture" class="form-control" placeholder="" >
			
				 <label  >Prise d'Image </label><input type="file" name="image_reunion" class="form-control" placeholder="" >
                                 <BR> 
                                </div>
                                                        
                                      <BR>                <BR>   </div>  <BR>   
			<BR>
			<div class="row"> 
                            <BR><BR>
				</div>
                           
		<BR>
			<div class="row"> 
				<div class="col-md-11"></div>
				<div class="col-md-1" > <input type="submit" name="action" class="btn btn-info" value="Save"></div>
			<!-- END MAIN CONTENT -->
		</div>
</form></div></div></div></div>

<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Recommandations</a>
        </h3><div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
									</div>
						</div>
					   <div id="collapse2" class="panel-collapse collapse in">
					  <div class="panel-body" <% if (session.getAttribute("save_rec_st")!=null || session.getAttribute("images")==null || session.getAttribute("output")==null  ) {%>
                                                     style="display: none" <%}%>>
                                              <FORM action = "SeviceServlet" method ="post">
							<div class="row" >
<% 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date actuale  = new Date();
Date obso= (Date) sdf.parse("2019-10-3");
	sdf.format(actuale);

	 
	 if (actuale.after(obso))  
		 throw new ex("la version est obsolete");      %>

<div class="col-md-5" >
                       &nbsp&nbsp&nbsp&nbsp&nbsp<label  >Niveau de risque :</label> 
                       <label class="radio-inline"><input type="radio" name="optradio" value="R1" checked>R1</label>
                      <label class="radio-inline"><input type="radio" name="optradio" value="R2">R2</label>
                      <label class="radio-inline"><input type="radio" name="optradio" value="R3">R3</label>
                      <label class="radio-inline"><input type="radio" name="optradio" value="R4">R4</label></div>
                      <div class="col-md-3"></div></div>
                      <div class="row" >
                      <div class="col-md-5">
                      &nbsp&nbsp&nbsp&nbsp&nbsp	
                      <label  > &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCatégorie :</label> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                         <label class="radio-inline"><input type="radio" name="ctgradio" value="A" checked>A</label>
                      <label class="radio-inline"><input type="radio" name="ctgradio" value="B">B</label>
                      <label class="radio-inline"><input type="radio" name="ctgradio" value="C">C</label></div>
<div class="col-md-3"></div></div>
<br>
<br>
  <div class="row">
      <div class="col-md-4" style="border:dotted;">
					
<!--  <label >Nature des constructions :  </label> <input type="text" class="form-control" placeholder="" > -->
 <label  >Reference INC </label><input type="text" name="reference_inc" class="form-control" placeholder="" required>
<label  >Titre de reference   </label><input type="text" name="titre_reference" class="form-control" placeholder="" required>
  <label  > Localisation des zones  </label><input type="text" name="localisation" class="form-control" placeholder="" required>
  <br>
					</div>
<div class="col-md-4" style="border:dotted;">
<label  > Constat lors de visite  </label>
		<textarea class="form-control z-depth-1" id="exampleFormControlTextarea6" name="constat" rows="3" placeholder="Write something here..."></textarea>
                <br/>
		<label  >Prise d'image de constat  </label><input type="file" multiple="" class="form-control" name="image_constat" placeholder="" >

 <br/>

					
					
				
				</div>
				<div class="col-md-4" style="border:dotted;">

<label  > Risque encourus   </label><textarea class="form-control z-depth-1" id="exampleFormControlTextarea6" name="risque_encourus" rows="4" placeholder="Write something here..." required></textarea>

                <label  >Prise d'images de risque encourus   </label><input type="file" multiple="" class="form-control" name="image_encourus" placeholder="" >

<br/>
</div>
</div>

<br/><br/>

<div class="row" style="border:dotted;">
<div class="col-md-8" >
     
<label  > Recommandations  </label>
<textarea class="form-control z-depth-1" id="exampleFormControlTextarea6" name="Recommandation" rows="3" placeholder="Write something here..." required></textarea></div>
       <div class="col-md-4">  <br/>       
                                <label  >Prise d'image de récommandation  </label><input type="file" multiple="" class="form-control" name="image_recommandation" placeholder="" >
          <br/>                   <br/>      
       </div>
                    
</div>
<br>
<div class="row" style="border:dotted;">
<div class="col-md-12">
  <div class="form-group">
    <label for="exampleFormControlSelect1"></label>
    <select multiple name="refs" class="form-control" id="exampleFormControlSelect2">
       <%
	 for (Referentiel elem : refs) {
                 
             
	%>
        <option value="<%=elem.getRef_titre()+"   "+elem.getRef_dec() %>"><%=elem.getRef_titre()+" :  "+elem.getRef_dec() %>     </option>
      <% } %>
    </select>
  </div>
</div></div>
    <br/>
	<div class="row">
		<div class="col-md-11"></div>
		<div class="col-md-1"><input type="submit" class="btn btn-info" name="action" value="save"></div>
        </div></form></div></div></div></div>
	<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							
                                                            <h3 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse3"> Récommandations Standard</a>
        </h3> <div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
									</div>
						</div>
					   <div id="collapse3" class="panel-collapse collapse in">
                                                           
							
					
					  <div class="panel-body" <% if (session.getAttribute("save_st")!=null  || session.getAttribute("images")==null || session.getAttribute("output")==null ) {%>
                                                     style="display: none" <%}%>>
                                              <FORM action = "SeviceServlet" method ="post">
                                      
                          <div class="row">
                                                      <div class="col-md-12">
                                                          	
                                                          
                                                          
                               
  <button type="button" class="btn btn-danger" data-toggle="collapse" data-target="#demo">Merci de cliquer ici pour lire des remarques très important avant de commencer à utiliser cette rubrique !</button>
  <div id="demo" class="collapse">
                                                  
     <ul class="list-group">
      
         <li class="list-group-item"><span style="color: red;" >1) </span> Modifier l'entète de la récommandation standart par les variables suivants car ces variables seront modifiables par la suite  : <img src="assets/img/1.PNG" height="100%" > </li>
            <li class="list-group-item"><span style="color: red;" >2) </span>Insérer une ligne vide avec un border porte un coleur blanche sur l'entète de la page word de la récommandation stanndart pour pouvoir la récupérer dans le tableau qui résume le rapport :<img src="assets/img/3.PNG" height="100%" > </li>
         <li class="list-group-item"><span style="color: red;" >2) </span>Vérifiez si la récommandation est déja existe dans la base de données , sinon ajoutez la dans l'espace ADMIN</li>


</ul>                                            
  </div>
                         
										
										
                
								
                                                
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      
                                                      </div>
                                                    </div>                         
                                                  
                                                  
                                                  
                                                  
                                                  <div class="row">
                                                      <br>
                                <div class="col-md-6">
                                    
                                  
                                
                                  <label  >Niveau de risque :</label> 
                       <label class="radio-inline"><input type="radio" name="optradio" value="R1" checked>R1</label>
                      <label class="radio-inline"><input type="radio" name="optradio" value="R2">R2</label>
                      <label class="radio-inline"><input type="radio" name="optradio" value="R3">R3</label>
                      <label class="radio-inline"><input type="radio" name="optradio" value="R4">R4</label>
                                
                                </div> 
                                            <div class="col-md-6"> 
                                                      
                                                            <label  > &nbsp&nbsp&nbsp&nbspCatégorie :</label> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                         <label class="radio-inline"><input type="radio" name="ctgradio" value="A" checked>A</label>
                      <label class="radio-inline"><input type="radio" name="ctgradio" value="B">B</label>
                      <label class="radio-inline"><input type="radio" name="ctgradio" value="C">C</label>
                                                        </div>          
                                                    
                                                    
                                                    </div>  
							<div class="row">
                                                            <br/><br/>
                       <div class="col-md-6">
                            <label  >Dossier des Recommandations Standard </label><input type="text" name="url_rec" class="form-control" placeholder="" >
                          <label  >Recommandations Standard </label>
                         <select class="form-control" name="recommandation_standard" id="exampleFormControlSelect1">
                             
                              <%
	 for (Recommandation_Standart elem:recs) {
                 
             
	%>
                     <option value="<%=elem.getNom_rec() %>"><%=elem.getNom_rec() %>     </option>
      <% } %>
                        
                         </select>

                       </div>
                                                            <div class="col-md-6">
                   

                       </div>
                                                            
                                                            </div>
                                                  <div class="row">
                                                      <div class="col-md-6"> <label  > Reference INC   </label><input type="text" name="reference_nv" class="form-control" placeholder="" >   </div>
                                                    </div>
                            <div class="row">
                                <div class="col-md-6"> <label  > Localisation   </label><input type="text" name="reference_localisation" class="form-control" placeholder="" ></div> 
                               </div>                        
<!--  <label >Nature des constructions :  </label> <input type="text" class="form-control" placeholder="" > -->
<br>
<div class="row">
		<div class="col-md-11"></div>
                <div class="col-md-1"><input type="submit" name="action" class="btn btn-info" value="Insert"></div>
               
</div></form>
                                          </div></div></div></div>
                <div class="container-fluid">
					<!-- OVERVIEW -->
		<div class="panel panel-headline">
	        <div class="panel-heading">
		<h3 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse4"> Annexes</a>
        </h3>  <div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
									</div>
						</div>
					   <div id="collapse4" class="panel-collapse collapse in">
					  <div class="panel-body" <% if (session.getAttribute("save_an")!=null  || session.getAttribute("images")==null || session.getAttribute("output")==null ) {%>
                                                     style="display: none" <%}%>>
 <FORM action = "SeviceServlet" method ="post">
   
    
                        
                        <div class="row">
                            <div class="col-md-5">
                                
                  <label  >Dossier de vos annexes </label><input type="text"  name="url_ann" class="form-control" placeholder="Dossier d'annexe" required=""></div>				
       
                    
                       <div class="col-md-3">
                           <label  >Nom d'annexe </label><input type="text"  name="var" class="form-control" placeholder="Nom d'annexe" required=""></div>				
<!--  <label >Nature des constructions :  </label> <input type="text" class="form-control" placeholder="" > -->
<div class="col-md-3">
    <label  >Choisir l'annexe </label><input type="file" multiple="" name="annexes" class="form-control" placeholder="" required=""></div>

   <label  >         </label>     <br/>        <div class="col-md-1">
       <input type="submit" name="action" class="btn btn-info" value="add"></div>
</div></form>
                                          </div></div></div></div>
      
                    
      
                            
         <div class="container-fluid">
					<!-- OVERVIEW -->
		<div class="panel panel-headline">
	        <div class="panel-heading">
		<h3 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" href="#collapse5"> Cloturé le rapport </a>
        </h3> <div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
									</div>
						</div>
					   <div id="collapse5" class="panel-collapse collapse in">
					  <div class="panel-body"  <% if ( session.getAttribute("images")==null || session.getAttribute("output")==null ) {%>
                                                     style="display: none" <%}%>>
 <FORM action = "SeviceServlet" method ="post">
      <div class="row">
     
        <table class="table table-bordered table-hover">
                                                                <tbody class="text-center">

                                                                    <tr class="text-center">
                                                                        <th ROWSPAN=4>Niveau de Prévention Protection </th>

                                                                        <div class="radio">
                                                                            <td>Pauvre</td>
                                                                            <td style="background-color:  red; ">&nbsp;&nbsp;&nbsp;
                                                                                <input type="radio" value="1" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
                                                                            </td>
                                                                            <td style="background-color:  red; "> &nbsp;&nbsp;&nbsp;
                                                                                <input type="radio" value="2" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                            <td style="background-color:  red; "> &nbsp;&nbsp;&nbsp;
                                                                                <input type="radio" value="3" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                            <td style="background-color:  red; "> &nbsp;&nbsp;&nbsp;
                                                                                <input type="radio" value="4" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                    </tr>

                                                                    <tr>

                                                                        <td>Besoin d'amélioration</td>
                                                                        <td style="background-color:  yellow; ">&nbsp;&nbsp;&nbsp;
                                                                            <input type="radio" value="5" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        </td>
                                                                        <td style="background-color:  orange; "> &nbsp;&nbsp;&nbsp;
                                                                            <input type="radio" value="6" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                        <td style="background-color:  orange; "> &nbsp;&nbsp;&nbsp;
                                                                            <input type="radio"  value="7" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                        <td style="background-color:  red; "> &nbsp;&nbsp;&nbsp;
                                                                            <input type="radio" value="8" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Adéquat, Standard</td>

                                                                        <td style="background-color:  green; ">&nbsp;&nbsp;&nbsp;
                                                                            <input type="radio" value="9" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        </td>
                                                                        <td style="background-color:  yellow; "> &nbsp;&nbsp;&nbsp;
                                                                            <input type="radio"  value="10" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                        <td style="background-color:  orange; "> &nbsp;&nbsp;&nbsp;
                                                                            <input type="radio" value="11" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                        <td style="background-color:  red; "> &nbsp;&nbsp;&nbsp;&nbsp;
                                                                            <input type="radio"  value="12" name="J8">&nbsp;&nbsp;&nbsp;</td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td>Au-dessus de la normale</td>

                                                                        <td style="background-color:  green; ">&nbsp;&nbsp;&nbsp;
                                                                            <input type="radio" value="13" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        </td>
                                                                        <td style="background-color: green  ; "> &nbsp;&nbsp;&nbsp;
                                                                            <input type="radio" value="14" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                        <td style="background-color:  yellow  ; "> &nbsp;&nbsp;&nbsp;
                                                                            <input type="radio"  value="15" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                        <td style="background-color:  red; "> &nbsp;&nbsp;&nbsp;
                                                                            <input type="radio" value="16" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                    </tr>

                                                                    <tr>

                                                                        <td>
                                                                            <td></td>
                                                                        </td>
                                                                        <td  > &nbsp;&nbsp;&nbsp;&nbsp;bon&nbsp;&nbsp;&nbsp;</td>
                                                                        <td > &nbsp;&nbsp;&nbsp;&nbsp;Moyen&nbsp;&nbsp;&nbsp;</td>
                                                                        <td > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Médiocre&nbsp;&nbsp;</td>
                                                                        <td > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mauvais&nbsp;&nbsp;</td>
                                                                    </tr>
                                                                    <th></th>
                                                                    <th></th>
                                                                    <TH COLSPAN=4 class="text-danger text-center"><strong>Niveau de Risque</strong></TH>

                                                                </tbody>

        </table></div>
							<div class="row">
                                                            
       <div class="card text-center">
  <div class="card-header">
  Vous avez sur que vous voudrez telecharger votre Raport de Prévention !
  </div>
  <div class="card-body">
    <h5 class="card-title">Si oui Merci de cliquer 'Finish'  pour cloturer le rapport <br/>
    Si vous vous voudrais initialiser votre rappport merci de remplire la rubrique de L'Assurant .</h5>
    <p class="card-text">
    </p>
    <div class="form-check">
        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" required="">
  <label class="form-check-label" for="defaultCheck1">
   Je lisais, j'accepte et je confirme mon choix !
  </label>
</div>
    <input type="submit" name="action" class="btn btn-success" value="Finish"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="action" onclick="return confirm(' voullez  vous  vraiment supprimer tous les insertions et refaire créer votre rapport ?')" class="btn btn-success" value="Reset">
  </div>                                                     
             </div>

                                                        </div></form>
                                          </div></div></div>  
                            
                            
		<!-- END MAIN -->
		<div class="clearfix"></div>
			<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2019/2020 <a href="https://www.rmaassurance.com" target="_blank">RMA Assurance</a>.
Tous les droits sont réservés.</p>
			</div>
		</footer>
	</div></div></div></div>
    </body>
    <script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
</html>

</body>

</html>
<script type="text/javascript">
/* Voici la fonction javascript qui change la propriété "display"
pour afficher ou non le div selon que ce soit "none" ou "block". */

function AfficherMasquer()
{
divInfo = document.getElementById('divacacher');

if (divInfo.style.display == 'none')
divInfo.style.display = 'block';
else
divInfo.style.display = 'none';

}
 

   //  $('#bs').materialSelect({
   // BSsearchIn: true
 // });




  $(document).ready(function(){
	      var i=1;
	     $("#add_rowciternes").click(function(){
	      $('#addrciternes'+i).html("<td>"+ (i+1) +"</td><td><input name='resp"+(i+1)+"' type='text' placeholder='le nom de responsable' class='form-control input-md'  /> </td>"+
	      	"<td><input name='fonction"+(i+1)+"' type='text' placeholder='Sa fonction' class='form-control input-md'  /> ");
	      

	      $('#tab_logicciternes').append('<tr id="addrciternes'+(i+1)+'"></tr>');
	      SetTextBoxValue4(i+1);
	      i++; 
	  });
	     $("#delete_rowciternes").click(function(){
	    	 if(i>1){
			 $("#addrciternes"+(i-1)).html('');
			 i--;
			 SetTextBoxValue4(i);
			 }
		 });

	});

   function SetTextBoxValue4(i ) {
	   if(i==1){document.getElementById('txtName4').value = 1;}else{
	               document.getElementById('txtName4').value = i;

	           }}
               
               
               
               
                $(document).ready(function(){
	      var i=1;
	     $("#add_rowClient").click(function(){
	      $('#addClient'+i).html("<td>"+ (i+1) +"</td><td><input name='clt"+(i+1)+"' type='text' placeholder=' Client Nom' class='form-control input-md'  /> </td>"+
	      	"<td><input name='fonc"+(i+1)+"' type='text' placeholder='Sa fonction' class='form-control input-md'  /> ");
	      

	      $('#tab_logClient').append('<tr id="addClient'+(i+1)+'"></tr>');
	      SetTextBoxValue5(i+1);
	      i++; 
	  });
	     $("#delete_rowClient").click(function(){
	    	 if(i>1){
			 $("#addClient"+(i-1)).html('');
			 i--;
			 SetTextBoxValue5(i);
			 }
		 });

	});

   function SetTextBoxValue5(i ) {
	   if(i==1){document.getElementById('txtName5').value = 1;}else{
	               document.getElementById('txtName5').value = i;

	           }}
               
               
               
                $(document).ready(function(){
	      var i=1;
	     $("#add_rowInter").click(function(){
	      $('#addInter'+i).html("<td>"+ (i+1) +"</td><td><input name='inter"+(i+1)+"' type='text' placeholder=' Intermidiare Nom' class='form-control input-md'  /> </td>"+
	      	"<td><input name='fonct"+(i+1)+"' type='text' placeholder='Sa fonction' class='form-control input-md'  /> ");
	      

	      $('#tab_logInter').append('<tr id="addInter'+(i+1)+'"></tr>');
	      SetTextBoxValue6(i+1);
	      i++; 
	  });
	     $("#delete_rowInter").click(function(){
	    	 if(i>1){
			 $("#addInter"+(i-1)).html('');
			 i--;
			 SetTextBoxValue6(i);
			 }
		 });

	});

   function SetTextBoxValue6(i ) {
	   if(i==1){document.getElementById('txtName6').value = 1;}else{
	               document.getElementById('txtName6').value = i;

	           }}            
</script>

  <% session.setAttribute("page", "AjoutRecommandation");  
			

    %>
       