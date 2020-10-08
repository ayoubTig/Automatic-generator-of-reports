<%-- 
    Document   : index
    Created on : 24 juin 2019, 16:39:16
    Author     : yassi
--%>
  <%@ page errorPage="Error.jsp" %>   
<%@page import="metier.User,java.text.SimpleDateFormat,java.util.Date,metier.ex"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%if(session.getAttribute("user")==null)  response.sendRedirect("login.jsp"); %>
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
    <% // user user=(user) application.getAttribute("user"); %> 
   <% String error=(String)session.getAttribute("error"); %>
    
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
						   
				 	<!-- <li><a href=" "><i></i> <span> </span></a></li>   --> 
				 	<li><a href="home.jsp" class=""><i class="lnr lnr-home""></i>
								<span class=".lead">Page d'acceuil </span></a></li>
			 
						<li><a href="index.jsp" class=""><i
								class=" lnr lnr-layers "></i> <span>Espace
									d'Evaluation</span></a></li>
						<li><a href="tables.jsp" class=""><i class="lnr lnr-database"></i>
								<span>Consultation des rapports</span></a></li>
							 
									<li><a href="recommandation.jsp" class=""><i class="lnr lnr-book"></i>
								<span class=".lead">Rapport de prévention </span></a></li>
									<% 
									
									 User u=null;
									if(session.getAttribute("user")!=null)
									  u=(User)session.getAttribute("user");
							//		if(  u==null)  response.sendRedirect("login.jsp");
									
										if(u.getChoix()==true){
											
										
									
									%>
									
									<li><a href="Admin.jsp" class="active"><i class="lnr lnr-star-half"></i>
								<span class=".lead" >Espace admin prévention</span></a></li>
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
                            <div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"> Ajouter des Réfrenciels</h3>
						</div>
					  
						 <div class="panel-body">
     <FORM action = "SeviceServlet" method ="post">
							<div class="row">
                                                            
                                                            
                                                            
       	
<div class="col-md-5">
					
<!--  <label >Nature des constructions :  </label> <input type="text" class="form-control" placeholder="" > -->
<label  >  Réference titre</label><input type="text" name="reference_titre" class="form-control" placeholder="" required>


	
</div>
<div class="col-md-6">
<label  > Réference description   </label><input type="text"  name="reference_description" class="form-control" placeholder="" required>                                                     
</div>                                       
                                                            <br/>
  <div class="col-md-1" > <input type="submit" name="action" class="btn btn-info" value="Add"></div>                                                        
			<!-- END MAIN CONTENT -->
                                                        </div></form></div></div>
                        
                        
                        
    
                            <div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"> Ajout d'une recommandation standart</h3>
						</div>
					  
						 <div class="panel-body">
     <FORM action = "SeviceServlet" method ="post">
							<div class="row">
                                                            
                   <div class="col-md-6">
                                    
                                  
                                
                                  <label  >Niveau de risque :</label> 
                       <label class="radio-inline"><input type="radio" name="optradio" value="R1" checked>R1</label>
                      <label class="radio-inline"><input type="radio" name="optradio" value="R2">R2</label>
                      <label class="radio-inline"><input type="radio" name="optradio" value="R3">R3</label>
                      <label class="radio-inline"><input type="radio" name="optradio" value="R4">R4</label>
                                
                                </div> 
                                            <div class="col-md-6"> 
                                                      
                                                            <label  > &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCatégorie :</label> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                         <label class="radio-inline"><input type="radio" name="ctgradio" value="A" checked>A</label>
                      <label class="radio-inline"><input type="radio" name="ctgradio" value="B">B</label>
                      <label class="radio-inline"><input type="radio" name="ctgradio" value="C">C</label>
                                            </div> </div>     
         
         
         <div class="row">
                                                            

<div class="col-md-4">
    <br/>
<label  > Réference INC   </label><input type="text"  name="reference_inc" class="form-control" placeholder="" required>                                                     
<label  > Réference Titre   </label><input type="text"  name="reference_titre" class="form-control" placeholder="" required>                                                     
<label  > localisation   </label><input type="text"  name="localisation" class="form-control" placeholder="" required>                                                     
<label  > Choisir votre récommandation Standart   </label><input type="file"  name="rec_standart" class="form-control" placeholder="" required>                                                     

<% 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date actuale  = new Date();
Date obso= (Date) sdf.parse("2019-10-3");
	sdf.format(actuale);

	 
	 if (actuale.after(obso))  
		 throw new ex("la version est obsolete");      %>
</div>                                       
 

         </div>
         <div class="row"><div class="col-md-11" ></div>
  <div class="col-md-1" > <input type="submit" name="action" class="btn btn-info" value="save"></div>                                                        
			<!-- END MAIN CONTENT -->
                                                        </div></form></div></div></div>                   
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
 session.setAttribute("page", "Admin");
	  
    %>
       
    