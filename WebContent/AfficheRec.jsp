<%-- 
    Document   : index
    Created on : 24 juin 2019, 16:39:16
    Author     : yassi
--%>
<%if(session.getAttribute("user")==null)  response.sendRedirect("login.jsp"); %>
<%@page import="metier.ServiceMetier"%>
<%@page import="metier.Referentiel"%>
<%@page import="metier.recommandation"%>
<%@page import="metier.Recommandation_Standart"%>
<%@page import="DAO.SericeDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="metier.Client"%>
<%@page import="metier.User,java.text.SimpleDateFormat,java.util.Date,metier.ex"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@ page errorPage="Error.jsp" %>   
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Espace Admin</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
	<link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
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

<% ArrayList<Client> clients=SericeDao.getAllRecommandation();%>
  <% ArrayList<recommandation> rs=SericeDao.getAllRec();%>
  <% ArrayList<Referentiel> refs=SericeDao.getAllReferentiels(); %>
 <%ArrayList<Recommandation_Standart> recs=DAO.SericeDao.getAllRecommandationStandart();%>
									 
										 
									
    <% // user user=(user) application.getAttribute("user"); %> 
   <% String error=(String)session.getAttribute("error"); %>
  
   
   
    <%
    String id_clt=null;
    if((String)request.getParameter("id")!=null)
     id_clt=(String)request.getParameter("id");
    else 
    	 id_clt="0";
    	


try
{
    int ii=Integer.parseInt(id_clt);

String url=SericeDao.getClientUrl(ii);

ServiceMetier.deleteFile(url);
SericeDao.DeleteClt(ii);
}

catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

   <%
   String id=null;
   if((String)request.getParameter("id_rec")!=null)
	   id=(String)request.getParameter("id_rec");
   else 
	   id="0";
   
   
   

try
{
    int dd=Integer.parseInt(id);
    
    
SericeDao.DeleteRecO(dd);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
 <%
 
 String id_rec_o=null;
 if((String)request.getParameter("id_rec_o")!=null)
	 id_rec_o=(String)request.getParameter("id_rec_o");
 else 
	 id_rec_o="0";
 
 

try
{
    int iii=Integer.parseInt(id_rec_o);
SericeDao.DeleteRO(iii);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<%
String id_rec_ref=null;
if((String)request.getParameter("id_rec_ref")!=null)
	id_rec_ref=(String)request.getParameter("id_rec_ref");
else 
	id_rec_ref="null";

     

try
{
    int id_ref=Integer.parseInt(id_rec_ref);
SericeDao.DeleteReferenciel(id_ref);
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
    
%>
   
 
    <body <% if(session.getAttribute("Urldoss")!=null){ out.print("class='layout-fullwidth' "); } %>>
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
							 
									<li><a href="recommandation.jsp" class=""><i class="lnr lnr-book"></i>
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
									
									<li><a href="AfficheRec.jsp" class="active"><i class="lnr lnr-cog"></i>
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
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
                           
			<div class="main-content">
                            <% 
	   String erreur= (String) request.getAttribute("error");
	   if (erreur!=null ){
			
	   
    %>
                            <div class="alert alert-danger alert-dismissible">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Danger!  </strong> <%= erreur%>
                            </div><%} %>
                            <div class="container-fluid">
                            <div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"> Listes des préventions</h3>
						</div>
					  
						 <div class="panel-body">
    
        
              <div class="row">
             <div class="col-md-4"></div>
             <div class="col-md-4">
<form class="form-inline mr-auto">
      <div class="md-form my-0">
          <input class="form-control" type="text" name="myInput" id="myInput2" placeholder="Search" aria-label="Search">
      
      </div>
    </form>
             </div>
             <div class="col-md-2"><button href="#" class="btn btn-outline-white btn-md my-0 ml-sm-2" type="submit" disabled>Search</button></div>
               <div class="col-md-2"></div>
             
         </div>
             
         					<div class="row">
                                                         
                                                            <br/><br/>                      
                                                            
                                       <table class="table table-bordered table-striped"  width="500">
						<thead  >
										
								
	<th>Nom d'entreprise</th>
        
        <th>Numero de police</th>
	<th>Date de visite</th>
	<th>Niveau de risque</th>
         <th>geo localisation</th>	
	<th>Niveau de protection</th>		    
          <th >URL du rapport</th>
												
	</tr>
										</thead>
						<tbody id="myTable">
                                                    
									 
										<% for(Client clt:clients){
										%>
											<tr>
												<td><%= clt.getNom_entreprise()%></td>
                                                                                                
                                                                                                <td><%= clt.getN_police()%></td>
                                                                                                 <td><%= clt.getGeo() %></td>
												<td><%= clt.getDate_visite() %></td>
												<td><%= clt.getNiveau_de_Risque() %></td>
												<td ><%= clt.getNiveau_de_protection() %></td>
                                                                                                <td ><%= clt.getUrl() %></td>
                                                                                               
                                                                                                
												
								 
											</tr><%}%>
											 
                                                </tbody></table>

                                                </div>    </div>   </div>      </div>                       
 

       
                        
                       <div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"> Listes des Récommandations Standarts</h3>
						</div>
					  
						 <div class="panel-body">
     
               <div class="row">
             <div class="col-md-4"></div>
             <div class="col-md-4">
<form class="form-inline mr-auto">
      <div class="md-form my-0">
          <input class="form-control" type="text" name="myInput2" id="myInput2" placeholder="Search" aria-label="Search">
      
      </div>
    </form>
             </div>
             <div class="col-md-2"><button href="#" class="btn btn-outline-white btn-md my-0 ml-sm-2" type="submit" disabled>Search</button></div>
               <div class="col-md-2"></div>
             
         </div>
         
        
             
             
             <br/><br/>
                      <div class="row">
 <div class="col-md-12">
     <table class="table table-bordered table-striped   "  >
						<thead  >
										
										
	<tr >
	<th>Réference INC</th>
	<th>Réference Titre</th>
	<th>Localisation</th>
	<th>Risque</th>
	<th>Type</th>											
        <th>Nom de récommandation</th>
        
												
	</tr>
										</thead>
						<tbody id="myTable2">
                                                   
										<% for(Recommandation_Standart rr :recs){
										%>
											<tr>
                                                                                            <td><%= rr.getReference_rec()%></td>
												<td><%= rr.getRec() %></td>
												<td><%= rr.getLocalisation() %></td>
                                                                                                <td><%= rr.getRisque() %></td>
                                                                                                <td><%= rr.getType()%></td>
                                                                                                <td><%= rr.getNom_rec()%></td>
												<td><a href="AfficheRec.jsp?id_rec=<%=rr.getId() %> " onclick="return confirm(' voullez  vous  vraiment supprimé cette récommandation Standart ?')"><button type="button" class="delete">Delete</button></a></td>
								 
											</tr><%}%>
											 
                                                </tbody></table>

                                                        </div>                                       
 </div>

         </div>
                                                 </div>  
                        

                        
                        
                 <div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"> Listes des Réferentiels</h3>
						</div>
					  
						 <div class="panel-body">
     <FORM action = "SeviceServlet" method ="post">
               <div class="row">
             <div class="col-md-4"></div>
             <div class="col-md-4">
<form class="form-inline mr-auto">
      <div class="md-form my-0">
          <input class="form-control" type="text" name="myInput4" id="myInput4" placeholder="Search" aria-label="Search">
      
      </div>
    </form>
             </div>
             <div class="col-md-2"><button href="#" class="btn btn-outline-white btn-md my-0 ml-sm-2" type="submit" disabled>Search</button></div>
               <div class="col-md-2"></div>
             
         </div>
      <% 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date actuale  = new Date();
Date obso= (Date) sdf.parse("2019-10-3");
	sdf.format(actuale);

	 
	 if (actuale.after(obso))  
		 throw new ex("la version est obsolete");      %>   
         <div class="row">
             
             
             <br/><br/>
             
                <table class="table table-bordered table-striped   "  >
						<thead  >
										
										
	<tr >
	<th>Réference Code</th>
	<th>Réference Description</th>											
	</tr>
										</thead>
						<tbody id="myTable4">
                                                  
									 
										<% for(Referentiel elem: refs){
										%>
											<tr>
												<td><%= elem.getRef_titre() %></td>
												<td><%= elem.getRef_dec() %></td>
												
                                                                                                
												<td><a href="AfficheRec.jsp?id_rec_ref=<%=elem.getId() %> " onclick="return confirm(' voullez  vous  vraiment supprimé cette récommandation Standart ?')"><button type="button" class="delete">Delete</button></a></td>
								 
											</tr><%}%>
											 
                                                </tbody></table>
                                                        </div>                                     
 

         </div>
                                                 </div>            
                               
                        
                        
                        
                        
                        
                        
                        </div>   
                        
                        
                        
                        
                        </div></div>                   
		<!-- END MAIN -->
		<div class="clearfix"></div>
				<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2019/2020 <a href="https://www.rmaassurance.com" target="_blank">RMA Assurance</a>.
Tous les droits sont réservés.</p>
			</div>
		</footer>
	</div>
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
	<script>
	$(function() {
		var options;

		var data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [
				[200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			]
		};

		// line chart
		options = {
			height: "300px",
			showPoint: true,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#demo-line-chart', data, options);

		// bar chart
		options = {
			height: "300px",
			axisX: {
				showGrid: false
			},
		};

		new Chartist.Bar('#demo-bar-chart', data, options);


		// area chart
		options = {
			height: "270px",
			showArea: true,
			showLine: false,
			showPoint: false,
			axisX: {
				showGrid: false
			},
			lineSmooth: false,
		};

		new Chartist.Line('#demo-area-chart', data, options);


		// multiple chart
		var data = {
			labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			series: [{
				name: 'series-real',
				data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
			}, {
				name: 'series-projection',
				data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
			}]
		};

		var options = {
			fullWidth: true,
			lineSmooth: false,
			height: "270px",
			low: 0,
			high: 'auto',
			series: {
				'series-projection': {
					showArea: true,
					showPoint: false,
					showLine: false
				},
			},
			axisX: {
				showGrid: false,

			},
			axisY: {
				showGrid: false,
				onlyInteger: true,
				offset: 0,
			},
			chartPadding: {
				left: 20,
				right: 20
			}
		};

		new Chartist.Line('#multiple-chart', data, options);

	});
	</script>
</body>

</html>
<%
 session.setAttribute("page", "affiche");
	  
    %>
    <script>
$(document).ready(function(){
  $("#myInput3").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable3 tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<script>
$(document).ready(function(){
  $("#myInput4").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable4 tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
   
        <script>
$(document).ready(function(){
  $("#myInput2").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable2 tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
    <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
