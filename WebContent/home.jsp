<%-- 
    Document   : index
    Created on : 24 juin 2019, 16:39:16
    Author     : yassi
--%>
<%if(session.getAttribute("user")==null)  response.sendRedirect("login.jsp"); %>
<%@page import="metier.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>  <%@ page errorPage="Error.jsp" %>   
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Page d'accueil</title>
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
				 	<li><a href="home.jsp" class="active"><i class="lnr lnr-home""></i>
								<span class=".lead">Page d'acceuil </span></a></li>
			 
						<li><a href="index.jsp" class=" "><i
								class=" lnr lnr-layers "></i> <span>Espace
									d'Evaluation</span></a></li>
						<li><a href="tables.jsp" class=""><i class="lnr lnr-database"></i>
								<span>Consultation des rapports</span></a></li>
							 
									<li><a href="recommandation.jsp" class=""><i class="lnr lnr-book"></i>
								<span class=".lead">Rapport de prévention </span></a></li>
							
									<% User u=null;
									if(session.getAttribute("user")!=null)
									  u=(User)session.getAttribute("user");
									
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
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
                           
			<div class="main-content">
		
		<div class="row">
		<br>		
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="https://www.rmaassurance.com" target="_blank">
          <img src="assets/img/e.png" alt="Lights" style="width:100%"></a>
          <div class="caption">
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PROTÉGEZ VOS BIENS<br></p>
                   <br>
          </div>
         
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="https://www.rmaassurance.com" target="_blank">
          <img src="assets/img/g.png" alt="Nature" style="width:100%"></a>
          <div class="caption">
            <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PROTÉGEZ VOS SALARIÉS<br>  </p>
            <br>         <br>
          </div>
     
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail"  style="  ;">
        <a href="https://www.rmaassurance.com" target="_blank">
          <img src="assets/img/f.jpg" style="  "/> </a>
          <div class="caption">
            <p > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PROTÉGEZ-VOUS </p>
          </div>
       
         
      </div>
    </div>
  </div>
		
		
		
		
		
                        <div class="container-fluid">
					<h3 class="page-title">&nbsp;&nbsp;&nbsp;&nbsp;Quelques conseils pour  utiliser  application  </h3>
                                        <div class="right">
										
									</div>
					<div class="row">
						<div class="col-md-6">
							<!-- PANEL HEADLINE -->
							<div  class="panel panel-headline">
								<div  class="panel-heading">
                                                                    <h3 class="panel-title" >Rapport de prévention</h3>
                                                                    <div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								<!-- 	<br> -->
									<!-- <p class="panel-subtitle">Ces informations vont vous aider dans le bon création des rapports de prévention</p> -->
								</div>
								<div class="panel-body" style="display: none;">
									<ol> 
									
									<li>spécifier le chemin de dossier qui contient les images qui vont être insérées dans le rapport
												 </li>
                                                                                                     <li>  spécifier chemin et le nom de fichier   suivi par l'extension .Docx (Ex: /chmein/Nom. Docx)</li>
                                                                        <li> Dans la rubrique de l'assurant, il faut remplir les champs en vérifiant les informations remlis avant l'envoi du formulaire par l button save . <br/>
                                                                            <b> NB &nbsp&nbsp:&nbsp&nbsp</b> La rubrique Assurant n'affichera pas qu'après remplir le dossier des images et document génerée .</li>
                                                                        <li> -La rubrique  récommandations vous a permet de cérer à nouveau la récommandation en spécidiant (constats , risques encourus , reférentiels)</li>
                                                                      <li>  La rubrique récommandation standard vous a permet de créer une R.S avec la possibilité de modifer quelques élements(Réference INC ,localisation,Risque...)</li>
                                                                       <li>La rubrique annexes vous a permet ce crér des annexes en spécifiant le l'emplacement de des annexes qui doivent etre sous forme des images .</li>
                                                                      <li> La rubrique évaluation vous a donné la main d'evaluer le client assuré à travers une matrice d'évalution .</li>
                                                                       <li> La button finish vous a permet de cloturer votre rapport et aussi de faire la mise à jour du table de matière ainsi de vous génerer le rapport résultat.</li>
                                                               
                                                               </ol>
                                                                </div>
							</div>
							<!-- END PANEL HEADLINE -->
						</div>
                                            
                                            <div class="col-md-6">
							<!-- PANEL HEADLINE -->
							<div  class="panel panel-headline">
								<div  class="panel-heading">
                                                                    <h3 class="panel-title">Rapport d'évaluation</h3>
                                                                    <div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
							<!-- 		<p class="panel-subtitle">Ces informations vont vous aider dans le bon création des rapports d'évaluation</p> -->
								</div>
								<div class="panel-body" style="display: none;">
									<ol>
					<li>spécifier le chemin de dossier qui contient les images qui vont être insérées dans le rapport
												 </li>
                                                                                                     <li>  spécifier chemin et de nom le fichier   suivi par l'extension .Docx (Ex: /chmein/Nom. Docx)</li>
     	<li>Remplir séparément chaque rubrique,</li>
													<li>Cliquer sur le bouton « Enregistrer »,<br></li>
													<li>En cas d’erreur de saisie <strong>avant
															enregistrement</strong>,<br> vous pouvez modifier votre
														rubrique ou Réécrire tous les éléments de cette rubrique,
														sinon vous devez recommencer la saisie depuis le début,
													</li>
													<li>Pour une nouvelle saisie veuillez cocher la case <strong>«
															Création nouveau document »</strong>,
													</li>
													<li>Si vous n'avez pas terminé votre rédaction du
														rapport, vous pouvez copier l'URL de l’ancien « Template :
														Fichier .Docx » dans le champ « URL de votre document »
														puis cocher la case « Création nouveau document » afin de
														terminer de finaliser votre formulaire.</li>
												</ol>
                                                                </div>
							</div>
							<!-- END PANEL HEADLINE -->
						</div>
						
					</div>
					<div class="row">
						<div class="col-md-4">
							<!-- PANEL DEFAULT -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Espace Administrateur</h3>
									<div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body" style="display: none;">
									<p>Est un espace réservé pour l'administrateur dans lequel il peut intéroger la base de donnée soit pour l'ajout ( réferenciels , récommandations standards,...) ou la modification. </p>
								</div>
							</div>
							<!-- END PANEL DEFAULT -->
						</div>
						<div class="col-md-4">
							<!-- PANEL NO CONTROLS -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">Espce de consulttion</h3>
                                                                        <div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body" style="display: none;">
									<p>Est un espace qui vous permettre de consulter des informations stockées dans la base de données 
                                                                            avec une meilleur visibilitée à travers des tables et aussi l'option de suppression de quelques données
                                                                            unitiles pour optimiser et libérer la base de données.
							
							</div>
							<!-- END PANEL NO CONTROLS -->
                                                        </div></div>

                                        
                                        
                                        <div class="col-md-4">
							<!-- PANEL NO CONTROLS -->
							<div class="panel">
								<div class="panel-heading">
									<h3 class="panel-title">graphes et statistiques</h3>
                                                                        <div class="right">
										<button type="button" class="btn-toggle-collapse"><i class="lnr lnr-chevron-up"></i></button>
										<button type="button" class="btn-remove"><i class="lnr lnr-cross"></i></button>
									</div>
								</div>
								<div class="panel-body" style="display: none;">
		<p>Est un espace qui vous donne une idée claire et des statistiques dynamiques à travers des chart de différent types </p>

								
							</div>
							<!-- END PANEL NO CONTROLS -->
                                                        </div></div></div>
					</form></div></div></div>                   
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

</body>

</html>
<%
 session.setAttribute("page", "Admin");
	  
    %>
       
    