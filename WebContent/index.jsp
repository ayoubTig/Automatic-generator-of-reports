<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,DAO.*, metier.*"%>
	<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<!doctype html>
  <%@ page errorPage="Error.jsp" %>   
<html lang="fr">
<%if(session.getAttribute("user")==null)  response.sendRedirect("login.jsp"); %>
<head>
<title>RMA Particulier/pro</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta contentType="text/html; charset=" UTF-8"/>
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
<link rel="stylesheet"
	href="assets/vendor/chartist/css/chartist-custom.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="assets/css/main.css">
<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
<link rel="stylesheet" href="assets/css/demo.css">
<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700"
	rel="stylesheet">
<!-- ICONS -->
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<style type="text/css">
.map-responsive {
	overflow: hidden;
	padding-bottom: 56.25%;
	position: relative;
	height: 0;
}

.map-responsive iframe {
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	position: absolute;
}

fieldset {
	border: 1px solid #090909 !important;
	margin: 0;
	xmin-width: 0;
	padding: 4px;
	position: relative;
	border-radius: 4px;
	background-color: #f2f1f1; /*  #f5f5f5   background-color: #f5f5f5;*/
	padding-left: 4px !important;
}

legend {
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 0px;
	width: 40%;
	border: 1px solid #090909;
	border-radius: 4px;
	padding: 5px 5px 5px 10px;
	background-color: #ffffff;
}
</style>
<%
         request.setCharacterEncoding("UTF-8");
         out.print(request.getParameter("mydata"));
         HttpSession sission=request.getSession();
         %>
</head>
<body
	<% if(sission.getAttribute("Urldoss")!=null){ out.print("class='layout-fullwidth' "); } %>>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
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
			 
						<li><a href="index.jsp" class="active"><i
								class=" lnr lnr-layers "></i> <span>Espace
									d'Evaluation</span></a></li>
						<li><a href="tables.jsp" class=""><i class="lnr lnr-database"></i>
								<span>Consultation des rapports</span></a></li>
							 
									<li><a href="recommandation.jsp" class=""><i class="lnr lnr-book"></i>
								<span class=".lead">Rapport de prévention </span></a></li>
									<% User u=null;
									if(session.getAttribute("user")!=null)
										  u=(User)session.getAttribute("user");
									//	if(  u==null)  response.sendRedirect("login.jsp");
										if(u.getChoix()==true){
											
										
									
									%>
									
									<li><a href="Admin.jsp" class=""><i class="lnr lnr-star-half"></i>
								<span class=".lead">Espace admin prévention</span></a></li>
								 <%  } %>
								<% 
									
										if( u.getChoix()==true ){
											
										
									
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
		<div class="main" id="toastr-demo">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<form method="post" action="RMA">
						<div class="panel panel-headline">
							<div class="panel-heading">
								<h2 class="panel-title text-centre">
									Paramétrer votre document
									<%if( sission.getAttribute("error")!=null){ out.print("<h3 Style='color:red;'>"+(String)sission.getAttribute("error")+"</h3>");}%>
								</h2>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
									<!-- <button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button> -->
								</div>
							</div>
							<div class="panel-body"
								<% if( sission.getAttribute("error")==null &&    sission.getAttribute("Urldoss")!=null){ out.print("style='display:none;'"); } %>>
								<div class="row">
									<fieldset class="col-md-7">
										<legend class="text-center lead">
											<strong> Paramétrer votre document</strong>
										</legend>
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="col-md-6"> <br>
														<p class="panel-subtitle">Url de votre document </p> <input required='required' class="form-control input-lg"
														name="UrlDoc" placeholder="URL de votre nouveau  Doc"
														type="text">  
													
												 
												</div>
												<div class="col-md-6">
													<p class="panel-subtitle">URL de dossier des images qui
														va être insère dans le document</p>
													<input required='required' class="form-control input-lg"
														placeholder="URL de dossier" name="Urldoss" type="text">
													<br> <br>
													<!-- <div class="col-md-6 ">
														&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<strong
															class=" text-center">hauteur de les images</strong><input
															name="heig" class="form-control input-lg"
															placeholder="height" type="number">
													</div> -->
													<!-- <div class="col-md-6">
														&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<strong>
															largeur de les images</strong> <input
															class="form-control input-lg" name="widi"
															placeholder="width" type="number">
													</div> -->
													
												</div>
													<div class="col-md-12">
													<p class="panel-subtitle">&nbsp;&nbsp;&nbsp;&nbsp;si vous vous avez déjà
														commencé la rédaction de votre rapport Oui/Non</p>
													<label class="fancy-radio"> <input name="exis"
														value="oui" type="radio"> <span>
															&nbsp;&nbsp;&nbsp;&nbsp;<i></i>
															&nbsp;&nbsp;&nbsp;&nbsp;Oui si vous avez déjà rempli
															quelque rubrique
													</span>
													</label> <label class="fancy-radio"> <input name="exis"
														value="non" type="radio" checked="checked"> <span>
															&nbsp;&nbsp;&nbsp;&nbsp;<i></i>
															&nbsp;&nbsp;&nbsp;&nbsp;Création nouveau document
													</span>
													</label>
													</div>
											</div>
										</div>
									</fieldset>
									<div class="col-md-5">
										<br>
										<div class="panel">
											<div class="panel-heading">
												<h3 class="panel-title">Quelques conseils pour bien
													rédiger :</h3>
											</div>
											<div class="panel-body">
											 
												 
												<ol>
												<li>spécifier le chemin de dossier qui contient les images qui vont être insérées dans le rapport
												 </li>
                                                                                                     <li>  spécifier chemin et le nom le fichier   suivi par l'extension .Docx (Ex: /chmein/Nom. Docx)</li>
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
										<br>
									</div>
								</div>
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<button type="submit" value="doca" name="doc"
										class="btn btn-success btn-block">Enregistrer</button>
								</div>
								<div class="col-md-3"></div>
							</div>
						</div>
					</form>
				</div>

				<!-- __________________________________________________________________________A_______________________________________________________  -->
				<div class="container-fluid">
					<form method="post" action="RMA">
						<!-- OVERVIEW -->
						<div class="panel panel-headline">
							<div class="panel-heading" <% if(sission.getAttribute("A")!=null    || sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
								<h3 class="panel-title">Client</h3>

								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
									<!-- <button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button> -->
								</div>
							</div>
							<div class="panel-body"
								<% if(sission.getAttribute("A")!=null    || sission.getAttribute("Urldoss")==null ){ out.print("style='display:none; '"); } %>>
								<fieldset class="col-md-12">
									<legend>Informations Assuré :</legend>
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-5">
													<br>
													<div class="col-md-6">
														<label> <input type="radio" name="A0"
															value="Prospect" checked>
															&nbsp;&nbsp;&nbsp;&nbsp;Prospect
														</label> <label>&nbsp;&nbsp; &nbsp;&nbsp; <input
															type="radio" name="A0" value="Assure"> Assuré
														</label>
													</div>
													<div class="col-md-6">
														<input type="text" name="A1" class="form-control"
															placeholder="numero de police">
													</div>
													Nom de l'entreprise <input required='required' type="text" name="A2"
														class="form-control" placeholder=""> Adresse <input required='required'
														type="text" name="A16" class="form-control" placeholder="">
													Date de visite <input required='required' type="Date" name="A3"
														class="form-control" placeholder="">
												</div>
												<div class="col-md-3">
													<label class="text-center"> Capitaux </label> <br>
													Bâtiment <input  type="number" class="form-control"
														name="A4" placeholder="C Bâtiment" required="required"> Matériel professionnels
													<input type="number" class="form-control" name="A5"
														placeholder="C-Matériel professionnels" required="required"> Marchandises 
														<input type="number"class="form-control" name="A6" placeholder="C-Marchandises" required="required">
												</div>
												<div class="col-md-4">
													<label for="validationCustom03">Famille d’activité</label>
													<select name="A7" class="form-control input-lg"
														class="form-control form-control-lg"
														id="validationCustom03" onchange="ChangecatList()"
														required>
														<option value="">choisir...</option>
														<option
															value="Production d'énergie, traitement des déchets">Production
															d'énergie, traitement des déchets</option>
														<option
															value="Industrie Agricole et Alimentaire (IAA) (Agro-alimentaire)">Industrie
															Agricole et Alimentaire (IAA) (Agro-alimentaire)</option>
														<option value="Chimie, pharmacie">Chimie,
															pharmacie</option>
														<option
															value="Métallurgie, Mécanique, Electricité, Electronique">Métallurgie,
															Mécanique, Electricité, Electronique</option>
														<option value="Textile, Habillement, Cuir">Textile,
															Habillement, Cuir</option>
														<option value="Scieries, meubles, papier-carton">Scieries,
															meubles, papier-carton</option>
														<option value="Imprimerie, édition">Imprimerie,
															édition</option>
														<option value="Plasturgie">Plasturgie</option>
														<option
															value="Commerce et magasins alimentaires ou spécialisés (CAS)">Commerce
															et magasins alimentaires ou spécialisés (CAS)</option>
														<option value="Hôtels, restaurants, cliniques">Hôtels,
															restaurants, cliniques</option>
														<option value="Stockage (Plateforme logistique / dépôt)">Stockage
															(Plateforme logistique / dépôt)</option>
														<option value="Transport">Transport</option>
														<%ArrayList<Donnes> doo=new ArrayList<Donnes>(); doo=Dao.getUserDonnes(); for(Donnes don:doo){ %>
														<option
															value="<% if(don.getActivite()!=null && don.getActivite().equals("")) out.print(don.getActivite()); %>">
															<% if(don.getActivite()!=null) out.print(don.getActivite());%>
														</option>
														<%} %>
													</select> <label for="validationCustom04">Secteur d’activité
													</label> <select class="form-control form-control-lg"
														id="validationCustom04" name="A8" name="detail" required></select>
													<label>Activité déclarée par le client</label> <input
														type="text" class="form-control" name="A15" placeholder="">
												</div>
											</div>
										</div>
									</div>
								</fieldset>

								<br> <br>

								<div class="panel-body">
									<fieldset class="col-md-12">
										<legend>Participants à la visite </legend>
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="col-md-6">
						 





													<br>
													<table class="table table-bordered table-hover"
														id="tab_logicNSc">
														<thead>
															<tr>
																<th class="text-center">#</th>
																<th class="text-center">Nom de responsable (poste) </th>
															</tr>
														</thead>
														<tbody>
															<tr id='addrNScr0'>
																<td>1</td>
																<td><input required='required' type="text" name='NSc0'
																	placeholder="..." class="form-control" />
																</td>
															</tr>
															<tr id='addrNSc1'></tr>
														</tbody>
													</table>
													<button type="button" id="add_rowNSc"
														class="btn btn-default pull-left">Ajouter une
														ligne</button>

													<div class="col-md-1">
														 
														<br> <input required='required' type="file" name='NSc'
															class="custom-file-input" />
															<br>
													</div>

													<button type="button" id='delete_rowNSc'
														class="pull-right btn btn-default">supprimer une
														ligne</button>

													<input id="txtNameNSc" type="text" value="1" hidden
														name="nbrTabNSc" /><br>
<br>
<table class="table table-bordered table-hover"
															id="tab_logicRMA_Ass">
															<thead>
																<tr>
																	<th class="text-center">#</th>
																	<th class="text-center">RMA Assurance</th>
																</tr>
															</thead>
															<tbody>
																<tr id='addrRMA_Ass0'>
																	<td>1</td>
																	<td><input required='required' type="text" name='RMA_Ass0'
																		placeholder=" RMA Assurance" class="form-control" />
																	</td>
																</tr>
																<tr id='addrRMA_Ass1'></tr>
															</tbody>
														</table>
														<button type="button" id="add_rowRMA_Ass"
															class="btn btn-default pull-left">Ajouter une
															ligne</button>
														<div class="col-md-3">

															&nbsp;&nbsp;&nbsp;&nbsp; <input required='required' type="file"
																name='RMA_Ass' class="pull-center custom-file-input" />
														</div>
														<button type="button" id='delete_rowRMA_Ass'
															class="pull-right btn btn-default">supprimer une
															ligne</button>
														<input id="txtNameRMA_Ass" type="text" value="1" hidden
															name="nbrTabRMA_Ass" />


												</div>

<% 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date actuale  = new Date();
Date obso= (Date) sdf.parse("2019-10-3");
	sdf.format(actuale);

	 
	 if (actuale.after(obso))  
		 throw new ex("la version est obsolete");      %>
												<div class="col-md-6">
													<div class="row clearfix">



														<fieldset class="col-md-12">
															<legend>Situation géographique </legend>
															<div class="panel panel-default">
																<div class="panel-body">
																	<div class="col-md-2">
																		&nbsp;&nbsp;&nbsp;&nbsp; X <input type="text"
																			class="form-control" placeholder="" name="A11">
																	</div>
																	<div class="col-md-2">
																		&nbsp;&nbsp;&nbsp;&nbsp; Y <input type="text"
																			class="form-control" placeholder="" name="A12">
																		<br>
																	</div>
																	<div class="col-md-8">
																		<div class="col-md-12">
																			<br> <input type="file"
																				class="custom-file-input" id="inputGroupFile03"
																				name="A13">
																		</div>
																		<div class="col-md-12">
																			<br> <input type="file" name="A14"
																				class="custom-file-input">
																		</div>
																	</div>
																</div>
															</div>
														</fieldset>

														<div>
															<br>
															<br>
														</div>

														<table class="table table-bordered table-hover"
															id="tab_logicInter">
															<thead>

																<tr>
																	<th class="text-center">#</th>
																	<th class="text-center">Nom de l’intermédiaire</th>
																</tr>
															</thead>
															<tbody>
																<tr id='addrInter0'>
																	<td>1</td>
																	<td><input required='required' type="text" name='Inter0'
																		placeholder=" Nom de l'intermaidaire"
																		class="form-control" /></td>
																</tr>
																<tr id='addrInter1'></tr>
															</tbody>
														</table>
														<button type="button" id="add_rowInter"
															class="btn btn-default pull-left">Ajouter une
															ligne</button>
														<div class="col-md-3">
															<br>
															<br> <input required='required' type="file" name='Inter'
																class="pull-center custom-file-input" />
														</div>
														<button type="button" id='delete_rowInter'
															class="pull-right btn btn-default">supprimer une
															ligne</button>
														<input required='required' id="txtNameInter" type="text" value="1" hidden
															name="nbrTabInter" /> <br>

													</div>
												</div>
												<div class="col-md-12">
													<br>
													<div class="col-md-2"></div>
													<div class="col-md-8">
														 
														 
														 
														 
													</div>
													<div class="col-md-2"></div>
												</div>
											</div>
										</div>
									</fieldset>
								</div>
								<br>
								<fieldset class="col-md-12">

									<div class="panel panel-default">
										<div class="panel-body">
											<div class="col-md-6">
												<label class="text-center">Légende Plan de masse </label>
												<table class="table table-bordered table-hover"
													id="tab_logic">
													<br>
													<thead>
														<tr>
															<th class="text-center">#</th>
															<th class="text-center">Abréviation</th>
															<th class="text-center">Détails</th>
															<th class="text-center">Superficie (mètre carré)</th>
														</tr>
													</thead>
													<tbody>
														<tr id='addr0'>
															<td>1</td>
															<td><input required='required' type="text" name='Abr1'
																placeholder='Abréviation' class="form-control" /></td>
															<td><input required='required' type="text" name='Deta1'
																placeholder='Détails' class="form-control" /></td>
															<td><input required='required' type="number" name='Super1'
																placeholder='Superficie' class="form-control" /></td>
														</tr>
														<tr id='addr1'></tr>
													</tbody>
												</table>
												<button type="button" id="add_row"
													class="btn btn-default pull-left">Ajouter une
													ligne</button>
												<button type="button" id="delete_row"
													class="pull-right btn btn-default">supprimer une
													ligne</button>
												<input id="txtName" type="text" hidden="true" name="nbrTab1" />
												<br> <br>
											</div>
											<div class="col-md-6">
												<label class="text-center">Voisinage </label> <br>
												<div class="col-md-12 text-center">
													<table class="table table-bordered table-hover"
														id="tab_logicV">
														<thead>
															<tr>
																<th class="text-center">#</th>
																<th class="text-center">Nom de voisinage</th>
																<th class="text-center">image</th>
															</tr>
														</thead>
														<tbody>
															<tr id='addrV0'>
																<td>1</td>
																<td><input required='required' type="text" name='voi0'
																	placeholder='  Nom de voisinage' class="form-control" />
																</td>
																<td><input required='required' type="file" name='fik0'
																	placeholder=' fichier' class="form-control" /></td>
															</tr>
															<tr id='addrV1'></tr>
														</tbody>
													</table>
													<button type="button" id="add_rowV"
														class="btn btn-default pull-left">Ajouter une
														ligne</button>
													<button type="button" id='delete_rowV'
														class="pull-right btn btn-default">supprimer une
														ligne</button>
													<input id="txtNameV" type="text" value="1" hidden
														name="nbrTabV" />
												</div>

											</div>
										</div>
									</div>
								</fieldset>
								<br> <br>
								<div class="col-md-10"></div>
								<div class="col-md-2">
									<br>
									<button type="submit" value="AA" name="A"
										class="btn btn-success ">Enregistrer</button>
								</div>
							</div>
						</div>
					</form>
				</div>

			<!-- </div> -->
			<!-- _______________________________________________________Géolocalisation__________________________________________________________________________  -->

			<div class="container-fluid">

				<div class="panel panel-headline">
					<div class="panel-heading"<% if( sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
						<h1 class="panel-title text-centre">Géolocalisation et la
							Situation géographique</h1>
						<div class="right">
							<button type="button" class="btn-toggle-collapse">
								<i class="lnr lnr-chevron-up"></i>
							</button>
<!-- 							<button type="button" class="btn-remove">
								<i class="lnr lnr-cross"></i>
							</button> -->
						</div>
					</div>
					<div class="panel-body" <%  out.print("style='display:none;'");%>>
						<div class="row">
							<div class="map-responsive">
								<iframe
									src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1018924.333481742!2d-7.1491742835359045!3d33.18666356377071!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sfr!2sma!4v1561594114603!5m2!1sfr!2sma"
									width="600" height="450" frameborder="0" style="border: 0"
									allowfullscreen></iframe>
							</div>
							<div class="col-md-1"></div>
							<!--                       <div class="col-md-3"></div><div class="col-md-6"  ><button type="submit" value="doca" name="doc" class="btn btn-success btn-block"">Enregistrer</button> </div><div class="col-md-3"> -->
						</div>
					</div>
				</div>

			</div>
			<!-- _______________________________________________________B__________________________________________________________________________  -->
			<div class="container-fluid">
				<form method="post" action="RMA">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading" <% if(sission.getAttribute("B")!=null   || sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
							<h3 class="panel-title">Nature des constructions</h3>
							<p class="panel-subtitle">les information de la Nature des
								constructions</p>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
<!-- 								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button> -->
							</div>
						</div>
						<div class="panel-body"
							<% if(sission.getAttribute("B")!=null   || sission.getAttribute("Urldoss")==null){ out.print("style='display:none;  background-color: #f5f5f5;'"); } %>>
							<div class="row">
								<!--  <h2 class="head text-center" id="head">  -->
								<div class="col-md-12" id="head" style="display: none">

									<div class="panel">
										<div class="panel-body">
											<h4 id="head1"></h4>
											<!-- <p>Objectively network visionary methodologies via best-of-breed users. Phosfluorescently initiate go forward leadership skills before an expanded array of infomediaries. Monotonectally incubate web-enabled communities rather than process-centric.</p> -->
										</div>
									</div>
								</div>
								<!--   </h2> -->
							</div>
							<table class="table table-bordered table-hover"
								id="tab_logicconst">
								<thead>
									<tr>
										<th class="text-center">#</th>
										<th class="text-center">Ossature</th>
										<th class="text-center">Classement des murs extérieurs</th>
										<th class="text-center">Plancher</th>
										<th class="text-center">Nombre de niveaux</th>
										<th class="text-center">Couverture</th>
										<th class="text-center">Aménagement et revêtements
											intérieurs</th>
										<th class="text-center">Image et le titre de construction
										</th>
									</tr>
								</thead>
								<tbody>
									<tr id='addrconst0'>
										<td>1</td>
										<td><select class="form-control form-control-lg"
											name="Ossature0" id="select1">
												<option value="..."></option>
												<option value="1">Ossature 01</option>
												<option value="2">Ossature 02</option>
												<option value="3">Ossature 03</option>
												<option value="4">Ossature 04</option>
										</select> <br> <input type="text" name='OssatureInput0'
											placeholder='Ossature ' class="form-control" /></td>
										<td><select class="form-control form-control-lg"
											name="murs0" id="select2">
												<option value="..."></option>
												<option value="Me1">murs extérieurs Me1</option>
												<option value="Me2">murs extérieurs Me2</option>
												<option value="Me3">murs extérieurs Me3</option>
										</select> <br> <input type="text" name='mursInput0'
											placeholder='murs extérieurs' class="form-control" />
										<td><select class="form-control form-control-lg"
											name="planche0" id="select3">
												<option value="..."></option>
												<option value="P0">palnche p0</option>
												<option value="P1">palnche p1</option>
												<option value="P2">palnche P2</option>
												<option value="P3">palnche P3</option>
												<option value="P4">palnche P4</option>
										</select> <br> <input type="text" name='plancheInput0'
											placeholder='planche' class="form-control" /></td>
										<td><select class="form-control form-control-lg"
											name="nbrNi0" id="select4">
												<option value="..."></option>
												<option value="A">le nombre de niveaux A</option>
												<option value="B">le nombre de niveaux B</option>
												<option value="C">le nombre de niveaux C</option>
										</select> <br> <input type="text" name='nbrNiInput0'
											placeholder='le nombre de niveaux' class="form-control" /></td>
										<td><select class="form-control form-control-lg"
											name="couevrture0" id="select5">
												<option value="..."></option>
												<option value="Co1">Type Co1</option>
												<option value="Co2">Type Co2</option>
												<option value="Co3">Type Co3</option>
												<option value="Co4">Type Co4</option>
										</select> <br> <input type="text" name='couevrtureInput0'
											placeholder='couevrture' class="form-control" /></td>
										<td><select class="form-control form-control-lg"
											name="ammina0" id="select6">
												<option value="..."></option>
												<option value="A1">CARI de type A1</option>
												<option value="A2">CARI de type A2</option>
										</select> <br> <input type="text" name="amminaInput0"
											placeholder='CARI' class="form-control" /></td>
										<td class="text-center"><input type="text"
											name='nbrNiNmae0' placeholder='le nom de construction '
											class="form-control" /> <br>
										<input type="file" name="ImageInput0" class="form-control" /></td>
									</tr>
									<tr id='addrcomp1'></tr>
								</tbody>
							</table>
							<button type="button" id="add_rowconst"
								class="btn btn-default pull-left">Ajouter une ligne</button>
							<button type="button" id='delete_rowconst'
								class="pull-right btn btn-default">supprimer une ligne</button>
							<input id="txtNameconst" type="text" value="1" hidden
								name="nbrTabconst" />
							<div class="col-md-10"></div>
							<div class="col-md-2">
								<br>
								<button type="submit" value="BB" name="B"
									class="btn btn-success ">Enregistrer</button>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- _______________________________________________________C__________________________________________________________________________  -->
			<div class="container-fluid">
				<form action="RMA" method="post">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading" <% if( sission.getAttribute("C")!=null   ||sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
							<h3 class="panel-title">Stockage : Matières premières (MP),
								Produits semi-finis (PSF), produits finis (PF),GPL</h3>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
<!-- 								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button> -->
							</div>
							<p class="panel-subtitle"></p>
						</div>
						<div class="panel-body"
							<% if(sission.getAttribute("C")!=null   || sission.getAttribute("Urldoss")==null){ out.print("style='display:none;'"); } %>>
							<!--  <input id="txtName2" type="text"   name="nbrTab2" /> -->
							<div class="row">
								<fieldset class="col-md-6">
									<legend> Matières premières </legend>
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-12">
													<table class="table table-bordered table-hover"
														id="tab_logicMPS">
														<thead>
															<tr>
																<th class="text-center">#</th>
																<th class="text-center">Matière première stockés</th>
															</tr>
														</thead>
														<tbody>
															<tr id='addrMPS0'>
																<td>1</td>
																<td><input type="text" name='NatureMPS0'
																	placeholder=' 	 Matière  première  stockés '
																	class="form-control" /></td>
															</tr>
															<tr id='addrMPS1'></tr>
														</tbody>
													</table>
													<a id="add_rowMPS" class="btn btn-default pull-left">ajouter
														ligne</a>
													<div class="col-md-3">
														<br> &nbsp;&nbsp;&nbsp;&nbsp; <input type="file"
															name='MPS' class="pull-center custom-file-input" />
													</div>
													<a id='delete_rowMPS' class="pull-right btn btn-default">supprimer
														ligne</a>
												</div>
												<input type="text" name="nbrTabMPS" id="txtNameMPS" hidden
													value="1"> <br>
												<br>
												<br>
												<!--  <input type="file" name="NatureFile"> -->
												<br>
											</div>
										</div>
									</div>
								</fieldset>
								<fieldset class="col-md-6">
									<legend>Produits semi-finis </legend>
									<div class="panel panel-default">
										<div class="panel-body">
											<div class="row">



												<table class="table table-bordered table-hover"
													id="tab_logicPSF">
													<thead>
														<tr>
															<th class="text-center">#</th>
															<th class="text-center">Produits semi-finis PSF</th>
														</tr>
													</thead>
													<tbody>
														<tr id='addrPSF0'>
															<td>1</td>
															<td><input type="text" name='PSF0'
																placeholder=" Produits semi-finis PSF"
																class="form-control" /></td>
														</tr>
														<tr id='addrPSF1'></tr>
													</tbody>
												</table>
												<button type="button" id="add_rowPSF"
													class="btn btn-default pull-left">Ajouter une
													ligne</button>
												<div class="col-md-3">
													<br> &nbsp;&nbsp;&nbsp;&nbsp; <input type="file"
														name='PSF' class="pull-center custom-file-input" />
												</div>
												<button type="button" id='delete_rowPSF'
													class="pull-right btn btn-default">supprimer une
													ligne</button>
												<input id="txtNamePSF" type="text" value="1" hidden
													name="nbrTabPSF" />




											</div>
										</div>
									</div>
								</fieldset>
								<fieldset class="col-md-6">
									<legend>Produits finis </legend>
									<div class="panel panel-default">
										<div class="panel-body">




											<table class="table table-bordered table-hover"
												id="tab_logicPF">
												<thead>
													<tr>
														<th class="text-center">#</th>
														<th class="text-center">Produits finis PF</th>
													</tr>
												</thead>
												<tbody>
													<tr id='addrPF0'>
														<td>1</td>
														<td><input type="text" name='PF0'
															placeholder=" Produits finis" class="form-control" /></td>
													</tr>
													<tr id='addrPF1'></tr>
												</tbody>
											</table>
											<button type="button" id="add_rowPF"
												class="btn btn-default pull-left">Ajouter une ligne</button>
											<div class="col-md-3">
												<br> &nbsp;&nbsp;&nbsp;&nbsp; <input type="file"
													name='PF' class="pull-center custom-file-input" />
											</div>
											<button type="button" id='delete_rowPF'
												class="pull-right btn btn-default">supprimer une
												ligne</button>
											<input id="txtNamePF" type="text" value="1" hidden
												name="nbrTabPF" />




										</div>
									</div>
								</fieldset>
								<fieldset class="col-md-6">
									<legend style="width: 80%;"> Stockage produits
										dangereux, inflammables</legend>
									<div class="panel panel-default">
										<div class="panel-body">
											<table class="table table-bordered table-hover"
												id="tab_logicSPDI">
												<thead>
													<tr>
														<th class="text-center">#</th>
														<th class="text-center">Stockage produits dangereux,
															inflammables SPDI</th>
													</tr>
												</thead>
												<tbody>
													<tr id='addrSPDI0'>
														<td>1</td>
														<td><input type="text" name='SPDI0'
															placeholder=' Stockage produits dangereux, inflammables  '
															class="form-control" /></td>
													</tr>
													<tr id='addrSPDI1'></tr>
												</tbody>
											</table>
											<button type="button" id="add_rowSPDI"
												class="btn btn-default pull-left">Ajouter une ligne</button>
											<div class="col-md-3">
												<br> &nbsp;&nbsp;&nbsp;&nbsp; <input type="file"
													name='SPDI' class="pull-center custom-file-input" />
											</div>
											<button type="button" id='delete_rowSPDI'
												class="pull-right btn btn-default">supprimer une
												ligne</button>
											<input id="txtNameSPDI" type="text" value="1" hidden
												name="nbrTabSPDI" />

										</div>
									</div>
								</fieldset>
								<fieldset class="col-md-12">

									<legend>Stockage gaz de pétrole liquéfié (GPL)</legend>
									<div class="panel panel-default">
										<div class="panel-body">
											<!--     <div class="col-md-5">
                                 <br> Nature des gaz stockés
                                 <input type="text" name='nbrC' class="form-control" placeholder="">
                                 <br>   Nombre de citernes : 
                                 <input type="text" name='C8' class="form-control" placeholder="">
                              </div> -->
											<div class="col-md-6">
												<table class="table table-bordered table-hover"
													id="tab_logicciternes">
													<thead>
														<tr>
															<th class="text-center">#</th>
															<th class="text-center">Type de GPL</th>
															<th class="text-center">Nombre de citernes</th>
															<th class="text-center">Capacité en litre</th>
														</tr>
													</thead>
													<tbody>
														<tr id='addrciternes0'>
															<td>1</td>
															<td><input type="text" name='GPL0'
																placeholder='Type de GPL ' class="form-control" /></td>
															<td><input type="number" name='citernes0'
																placeholder='Nombre de citernes' class="form-control" />
															</td>
															<td><input type="number" name='litre0'
																placeholder='Capacité en litre' class="form-control" />
															</td>
														</tr>
														<tr id='addrciternes1'></tr>
													</tbody>
												</table>
												<button type="button" id="add_rowciternes"
													class="btn btn-default pull-left">Ajouter une
													ligne</button>
												<div class="col-md-3">
													<br> &nbsp;&nbsp;&nbsp;&nbsp; <input type="file"
														name='citernes' class="pull-center custom-file-input" />
												</div>
												<button type="button" id='delete_rowciternes'
													class="pull-right btn btn-default">supprimer une
													ligne</button>
											</div>
											<input id="txtName4" type="text" value="1" hidden
												name="nbrTab4" />
											<div class="col-md-6">
												<!--  <label class="custom-file-label">Matières premières : </label>
                        <input type="text" name='C0' class="form-control" placeholder=""> -->







												Souterraines, aériennes <input type="text" name="C3"
													class="form-control" placeholder=""> Société
												assurant le ravitaillement <input type="text" name="C4"
													class="form-control" placeholder=""> Maintenance
												effectuée par <input type="text" name="C5"
													class="form-control" placeholder="">

											</div>
										</div>
									</div>
								</fieldset>
								<!--    <div class="col-md-4">
                   
                      Insertion images
                        <input type="file" name="C6">
                     </div> -->
								<!--      <div class="col-md-4">
                        Stockage produits dangereux, inflammables
                        <div class="control-group" id="fields">
                           <label class="control-label" for="field1">
                              <h5>-	Nature des produits stockés : </h5>
                           </label>
                           <br>
                           <div class="row clearfix">
                              <div class="col-md-12 column">
                                 <table class="table table-bordered table-hover" id="tab_logicL">
                                    <thead>
                                       <tr >
                                          <th class="text-center">
                                             #
                                          </th>
                                          <th class="text-center">
                                             Nature des produits stockés 
                                          </th>
                                       </tr>
                                    </thead>
                                    <tbody>
                                       <tr id='addrL0'>
                                          <td>
                                             1
                                          </td>
                                          <td>
                                             <input type="text" name='Nature0'  placeholder=' 	Nature des produits stockés ' class="form-control"/>
                                          </td>
                                       </tr>
                                       <tr id='addrL1'></tr>
                                    </tbody>
                                 </table>
                              </div>
                           </div>
                           <a id="add_rowL" class="btn btn-default pull-left">ajouter ligne</a><a id='delete_rowL' class="pull-right btn btn-default">supprimer ligne</a>
                           <br><br><br> <input type="file" name="NatureFile"><br><br><br>
                           <input type="text" name="Nature" id="Nature"   value="1">
                        </div>
                     </div> -->





								<div class="col-md-6"></div>
								<div class="col-md-2">
									<br>
									<button type="submit" value="CC" name="C"
										class="btn btn-success ">Enregistrer</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!-- _______________________________________________________D__________________________________________________________________________  -->
			<div class="container-fluid">
				<form method="post" action="RMA">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading"<% if( sission.getAttribute("D")!=null   ||sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
							<h3 class="panel-title">Utilités:</h3>
							<p class="panel-subtitle">Installations électriques/ Groupes
								électrogène</p>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
<!-- 								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button> -->
							</div>
						</div>
						<div class="panel-body"
							<% if(sission.getAttribute("D")!=null  || sission.getAttribute("Urldoss")==null){ out.print("style='display:none;'"); } %>>
							<fieldset class="col-md-6">
								<legend> Installations électriques</legend>
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="row">
											<div class="col-md-12">
												<label class="custom-text-label"> Nombre de
													transformateur   </label> <input type="number" class="form-control"
													name="D0" placeholder="Nombre de transformateur " required="required">

												<br>

												<table class="table table-bordered table-hover"
													id="tab_logicTT">
													<thead>
														<tr>
															<th class="text-center">#</th>
															<th class="text-center">Type transformateur</th>
															<th class="text-center">Puissances kVA</th>

														</tr>
													</thead>
													<tbody>
														<tr id='addrTT0'>
															<td>1</td>
															<td><SELECT name="TT0" class="form-control input-lg">
																	<OPTION value="A bain d’huile avec cuve de rétention">
																		A bain d’huile avec cuve de rétention</OPTION>
																	<OPTION value="A sec">A sec</OPTION>
																	<% ArrayList<Donnes> doo1=new ArrayList<Donnes>(); doo=Dao.getUserDonnes();  %>
																	<% for(Donnes don:doo1){ %>
																	<option
																		value="<% if(don.getActivite()!=null && don.getActivite().equals("")) out.print(don.getActivite()); %>">
																		<% if(don.getActivite()!=null) out.print(don.getTransfo());%>
																	</option>
																	<%} %>
															</SELECT></td>
															<td><input type="number" name='KAVTT0'
																placeholder='  ' class="form-control" /></td>

														</tr>
														<tr id='addrTT1'></tr>
													</tbody>
												</table>
												<button type="button" id="add_rowTT"
													class="btn btn-default pull-left">Ajouter une
													ligne</button>
												<!--                                  <div class="col-md-3">
     <br>
         &nbsp;&nbsp;&nbsp;&nbsp;   <input type="file" name='' class="pull-center custom-file-input"  />
            </div> -->
												<button type="button" id='delete_rowTT'
													class="pull-right btn btn-default">supprimer une
													ligne</button>

												<input id="txtNameTT" type="text" value="1" hidden
													name="nbrTabTT" />











												<div class="col-md-8">
													<br> Contrôle des installations électrique par un
													organisme agréé FMSAR

													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
														<input type="radio" value="oui" name="D1" checked>
														&nbsp;&nbsp; oui
													</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
														<input type="radio" value="non" name="D1">&nbsp;&nbsp;non
													</label> <br> le nom de la société qui effectue le contrôle en
													cas de oui <input type="text" name="D2"
														class="form-control" placeholder="">
												</div>
												<div class="col-md-6">
													<br> <br> <input type="file" name="D3"> <br>
													<input type="file" name="D4">
												</div>
											</div>
										</div>
									</div>
							</fieldset>
							<fieldset class="col-md-6">
								<legend>Groupes électrogène </legend>
								<div class="panel panel-default">
									<div class="panel-body">
										<div class="col-md-12">



											<label class="custom-text-label"> Nombre de groupes  
											</label> <input type="text" class="form-control" placeholder=" NBR"
												name="D5"> <br>

											<table class="table table-bordered table-hover"
												id="tab_logicmarq">
												<thead>
													<tr>
														<th class="text-center">#</th>
														<th class="text-center">Marques <br>
														</th>
														<th class="text-center">Puissances en kVA</th>
														<th class="text-center">Capacité de stockage gasoil
															interne par GE en litre</th>
													</tr>
												</thead>
												<tbody>
													<tr id='addrmarq0'>
														<td>1</td>
														<td><input type="text" name='marq0'
															placeholder='Marques' class="form-control" /></td>
														<td><input type="number" name='KAVmarq0'
															placeholder='Puissances en kVA  KAV' class="form-control" />
														</td>
														<td><input type="number" name='GEmarq0'
															placeholder=' Capacité de stockage gasoil interne par GE en litre '
															class="form-control" /></td>
													</tr>
													<tr id='addrmarq0' ></tr>
												</tbody>
											</table>
											<button type="button" id="add_rowmarq"
												class="btn btn-default pull-left">Ajouter une ligne</button>

											<button type="button" id='delete_rowmarq'
												class="pull-right btn btn-default">supprimer une
												ligne</button>
										</div>
										<input id="txtNamemarq" type="text" value="1" 
											name="nbrTabmarq" hidden="true" /> <label class="custom-text-label">
											Capacité de la citerne commune en litre </label> <input type="number"
											name='D6' placeholder='Capacité de la citerne commune en litre' class="form-control" /> insertion
										d'une image <input type="file" name="D7" class="form-control"><br>
									</div>
								</div>

							</fieldset>
							<div class="col-md-10"></div>
							<div class="col-md-2">
								<br>
								<button type="submit" value="DD" name="D"
									class="btn btn-success ">Enregistrer</button>
							</div>
						</div>
					</div>
				</form>
</div>
				<!-- _______________________________________________________E__________________________________________________________________________  -->
				<div class="container-fluid">
					<form action="RMA" method="post">
						<!-- OVERVIEW -->
						<div class="panel panel-headline"<% if( sission.getAttribute("E")!=null   ||sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
							<div class="panel-heading">
								<h3 class="panel-title">Utilités 2: Air comprimé et
									Chaufferie</h3>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
<!-- 									<button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button> -->
								</div>
								<p class="panel-subtitle"></p>
							</div>
							<div class="panel-body"
								<% if(sission.getAttribute("E")!=null  || sission.getAttribute("Urldoss")==null){ out.print("style='display:none;'"); } %>>
								<div class="row">
									<!--    <div class="col-md-7"> -->
									<fieldset class="col-md-7">
										<legend>Air comprimé </legend>
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="col-md-6">
													Nombre de compresseurs <input type="number" name='E30'
														placeholder='Nombre de compresseurs ' class="form-control" />
												</div>
												<div class="col-md-6">
													Marques <input type="text" name='E31' placeholder='Marques'
														class="form-control" /><br>
													<br>
												</div>
												<br>
												<table class="table table-bordered table-hover"
													id="tab_logiccomp">
													<thead>
														<tr>
															<th class="text-center">#</th>
															<th class="text-center">Nombre des compresseurs</th>
															<th class="text-center">Débit réel en m3/h</th>
															<th class="text-center">Puissance en CV</th>
															<th class="text-center">Puissance en KW</th>
															<th class="text-center">Pression maxi en bar</th>
															<th class="text-center">Capacité réservoir air
																comprimé en litre</th>
														</tr>
													</thead>
													<tbody>
														<tr id='addrcomp0'>
															<td>1</td>
															<td><input type="number" name='NombreC1'
																placeholder='N com ' class="form-control" /></td>
															<td><input type="number" name='Debit1'
																placeholder='Débit' class="form-control" /></td>
															<td><input type="number" name='CV1'
																placeholder=' Puissance' class="form-control" /></td>
															<!--           //NombreC Debit CV KW bar litre  comp -->
															<td><input type="number" name='KW1' placeholder=' '
																class="form-control" /></td>
															<td><input type="number" name='bar1' placeholder=' '
																class="form-control" /></td>
															<td><input type="number" name='litre1'
																placeholder=' ' class="form-control" /></td>
														</tr>
														<tr id='addrcomp1'></tr>
													</tbody>
												</table>
												<button type="button" id="add_rowcomp"
													class="btn btn-default pull-left">Ajouter une
													ligne</button>
												<button type="button" id='delete_rowcomp'
													class="pull-right btn btn-default">supprimer une
													ligne</button>
												<input id="txtName5" type="text" value="1" hidden
													name="nbrTab5" /> <br>
												<br>
												<br>
												<div class="col-md-3">
													Maintenance <br> <input type="radio" value="oui"
														name="E18" checked>&nbsp;&nbsp;&nbsp;oui <input
														type="radio" value="Non" name="E18">&nbsp;&nbsp;&nbsp;Non
												</div>
												<div class="col-md-6">
													le nom de la société qui effectue la maintenance en cas de
													oui <input type="text" name="E19" class="form-control">
												</div>
												<div class="col-md-3">
													<br> <input type="file" name="E20">
												</div>
											</div>
										</div>
									</fieldset>
									<!--   </div> -->

									<fieldset class="col-md-5">
										<legend>Chaufferie </legend>
										<div class="panel panel-default">
											<div class="panel-body">
												<table class="table table-bordered table-hover"
													id="tab_logicchaud">
													<br>
													<br>
													<thead>
														<tr>
															<th class="text-center">#</th>
															<th class="text-center">Nombre de chaudières</th>
															<th class="text-center">Type</th>
															<th class="text-center">Marque</th>
															<th class="text-center">Capacité de production de
																vapeur en Tn/h</th>
														</tr>
													</thead>
													<tbody>
														<tr id='addrchaud0'>
															<td>1</td>
															<td><input type="number" name='Nbrchaud1'
																placeholder=' ' class="form-control" /></td>
															<td><input type="text" name='Type1' placeholder=' '
																class="form-control" /></td>
															<td><input type="text" name='Capacite1'
																placeholder=' ' class="form-control" /></td>
															<td><input type="text" name='Marque1'
																placeholder=' ' class="form-control" /></td>
														</tr>
														<tr id='addrchaud1'></tr>
													</tbody>
												</table>
												<button type="button" id="add_rowchaud"
													class="btn btn-default pull-left">Ajouter une
													ligne</button>
												<button type="button" id='delete_rowchaud'
													class="pull-right btn btn-default">supprimer une
													ligne</button>
												<input id="txtName6" type="text" value="1" hidden
													name="nbrTab6" /> <br> <br>
												<br>
												<br>insertion d'une image <input type="file" name="E29"
													class="form-control"> <br> <br>
											</div>
										</div>
									</fieldset>
									<br> <br> <br> <br>
									<div class="col-md-10"></div>
									<div class="col-md-2">
										<br>
										<button type="submit" value="EE" name="E"
											class="btn btn-success ">Enregistrer</button>
									</div>

								</div>
							</div>
						</div>
					</form>
				</div>
			<!-- 	</div> -->
				<!-- _______________________________________________________F__________________________________________________________________________  -->
				<div class="container-fluid">
					<form method="post" action="RMA">
						<!-- OVERVIEW -->
						<div class="panel panel-headline">
							<div class="panel-heading"<% if( sission.getAttribute("F")!=null   ||sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
								<h3 class="panel-title">Protection et prévention incendie 1
								</h3>
								<p class="panel-subtitle">Extincteurs Portatifs et Mobiles
									et Réseau robinet Incendie Armé R.I.A</p>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								<!-- 	<button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button> -->
								</div>
							</div>
							<div class="panel-body"
								<% if(sission.getAttribute("F")!=null  || sission.getAttribute("Urldoss")==null){ out.print("style='display:none;'"); } %>>
								<div class="row">
									<fieldset class="col-md-12">
										<legend>Extincteurs Portatifs et Mobiles </legend>
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="col-md-6">
													<div class="col-md-6">
														Organisme vérificateur <input type="text" name="F4"
															class="form-control">
													</div>
													<div class="col-md-6">
														Prochaine date de vérification <input class="form-control"
															type="date" name="F1" class="form_datetime">
													</div>
													<br> <label class="custom-file-label"> Type
														des extincteurs utilisés : </label><br> <select name="F0"
														class="form-control" multiple>
														<option value="A poudre ABC">A poudre ABC</option>
														<option value=" A eau pulvérisée avec additif">A
															eau pulvérisée avec additif</option>
														<option value="Extincteur Gaz Carbonique (Co2)">
															Extincteur Gaz Carbonique (Co2)</option>
													</select>
												</div>
												<div class="col-md-6">
													<div class="col-md-6">
														Référentiel appliqué <br> <br> <select name="F2"
															class="form-control" multiple>
															<option value="APSAD / R4">APSAD / R4</option>
															<option value="NM 21.09.015">NM 21.09.015</option>
															<option value="NFPA">NFPA</option>
														</select>
													</div>
													<div class="col-md-6">
														<br> insertion d'une image <input type="file"
															name="F3" class="form-control">
													</div>
												</div>
											</div>
										</div>
									</fieldset>
									<fieldset class="col-md-12">


										<legend> Réseau robinet Incendie Armé R.I.A </legend>
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="col-md-4">
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <Strong>Réseau
														robinet Incendie Armé R.I.A</Strong><br> <br> Organisme
													vérificateur : <input type="text" name="organisme"
														class="form-control"><br> Nombre de RIA : <input
														type="text" class="form-control" name="F5"> Date
													de vérification <input type="date" class="form-control"
														name="F14"> <br> - Diamètre nominal (DN)
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<select name="F6" class="form-control" multiple>
														<option value="DN 19/6">DN 19/6</option>
														<option value="DN 25/8">DN 25/8</option>
														<option value=" DN 33/12">DN 33/12</option>
													</select> <br>
												</div>
												<div class="col-md-4">
													<br>
													<br> - Source d’alimentation en eau : <input
														type="text" class="form-control" name="F8"> <br>
													- Débit électropompe en m3/h <input type="text"
														class="form-control" name="F9"> <br> Débit
													pompe jockey en m3/h : <input type="number"
														class="form-control" name="F10"> <br> Débit
													motopompe en m3/h : <input type="number"
														class="form-control" placeholder="" name="F11">
												</div>
												<div class="col-md-4">
													<br> Référentiel appliqué : <br>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<select name="F12" class="form-control" multiple>
														<option value="DN 19/6">DN 19/6</option>
														<option value=" DN 25/8">DN 25/8</option>
														<option value="DN 33/12">DN 33/12</option>
													</select> insertion d'une image <input type="file" name="F13"
														class="form-control" name="F13"><br>
												</div>
											</div>
										</div>
									</fieldset>
									<br>
									<div class="col-md-10"></div>
									<div class="col-md-2">
										<br>
										<button type="submit" value="FF" name="F"
											class="btn btn-success ">Enregistrer</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- _______________________________________________________G__________________________________________________________________________  -->
				<div class="container-fluid">
					<form action="RMA" method="post">
						<!-- OVERVIEW -->
						<div class="panel panel-headline">
							<div class="panel-heading"<% if( sission.getAttribute("G")!=null   ||sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
								<h3 class="panel-title">Protection et prévention incendie 2
								</h3>
								<p class="panel-subtitle">Nombre de postes PIA &amp;
									Colonnes humides &amp; Colonnes sèches &amp; Poteaux et bouche
									incendie &amp; Réserve d’eau incendie &amp; (SDI)&amp; (SMSI)</p>

								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								<!-- 	<button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button> -->
								</div>
							</div>
							<div class="panel-body"
								<% if(sission.getAttribute("G")!=null  || sission.getAttribute("Urldoss")==null){ out.print("style='display:none;'"); } %>>
								<div class="row">
									<fieldset class="col-md-12">
										<legend style="width: 60%;">Protection et prévention
											incendie 2 eme partie </legend>
										<div class="panel panel-default">
											<div class="panel-body">
												<div class="col-md-4">
													<fieldset class="col-md-12">
														<legend style="width: 70%;">Nombre de postes PIA
															 </legend>
														<div class="panel panel-default">
															<div class="panel-body">
																<label class="custom-file-label"> Nombre de
																	postes PIA : </label> <input type="number" name="G0"
																	class="form-control" placeholder="Nombre de postes PIA">
																insertion d'une image <input type="file" name="G1"
																	class="form-control">
															</div>
														</div>
													</fieldset>
													<fieldset class="col-md-12">
														<legend style='width: 70%;'>Colonnes humides (En
															charge) </legend>
														<div class="panel panel-default">
															<div class="panel-body">
																-Capacité de la réserve d’eau en m3   <input
																	type="number" name="G2" class="form-control"
																	placeholder=""> - Diamètre nominal DN de la
																colonne en mm   <input type="number" name="G3"
																	class="form-control" placeholder=""> - Pression
																de fonctionnement en bar   <input type="number"
																	name="G4" class="form-control" placeholder="">
																insertion d'une image <input type="file" name="G5"
																	class="form-control">
															</div>
														</div>
													</fieldset>
													<fieldset class="col-md-12">
														<legend> Colonnes sèches </legend>
														<div class="panel panel-default">
															<div class="panel-body">
																- Diamètre nominal DN de la colonne en mm   <input
																	type="number" name="G6" class="form-control"
																	placeholder=""> <br> insertion d'une image
																<input type="file" name="G13" class="form-control">
															</div>
														</div>
													</fieldset>
												</div>
												<div class="col-md-4">
													<fieldset class="col-md-12">
														<legend style="width: 70%;">Poteaux et bouche
															incendie</legend>
														<div class="panel panel-default">
															<div class="panel-body">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br> -
																Nombre de poteau incendie   <input type="number"
																	name="G7" class="form-control" placeholder="">
																- Nombre de bouche incendie   <input type="number"
																	name="G8" class="form-control" placeholder="">
																<br> - Pression de fonctionnement en bar   <input
																	type="number" name="G9" class="form-control"
																	placeholder=""> <br> insertion d'une image
																<input type="file" name="G10" class="form-control">
															</div>
														</div>
													</fieldset>
													<fieldset class="col-md-12">
														<legend style="width: 60%;">Réserve d’eau
															incendie </legend>
														<div class="panel panel-default">
															<div class="panel-body">
																<br> Type de citerne   <input type="text"
																	name="G11" class="form-control" placeholder="">
																<br> - Capacité en litre   <input type="text"
																	name="G12" class="form-control" placeholder="">
																<br> insertion d'une image <input type="file"
																	name="G21" class="form-control"><br> <br>
															</div>
														</div>
													</fieldset>
												</div>
												<div class="col-md-4">
													<fieldset class="col-md-12">
														<legend style="width: 70%;">Système de détection
															incendie (SDI) </legend>
														<div class="panel panel-default">
															<div class="panel-body">
																Type de détecteur incendie   <select name="G14"
																	class="form-control" multiple>
																	<option value="D. de fumées ponctuelles">D. de
																		fumées ponctuelles</option>
																	<option value="D. de fumées linaires">D. de
																		fumées linaires</option>
																	<option value="D. thermique (chaleur : Type S, Type R)">
																		D. thermique (chaleur : Type S, Type R)</option>
																	<option value="D. de flamme IR">D. de flamme
																		IR</option>
																	<option value=" D. multicapteurs">D.
																		multicapteurs</option>
																	<option value="D. de fumées par aspiration">
																		D. de fumées par aspiration</option>
																</select> <br> Indicateur d’action (IA) 
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
																	<input type="radio" value="oui" name="G15" checked>&nbsp;&nbsp;&nbsp;oui
																</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
																	<input type="radio" value="Non" name="G15">&nbsp;&nbsp;&nbsp;Non
																</label> <br> Déclencheur Manuel (DM)  
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
																	<input type="radio" value="oui" name="G16" checked>&nbsp;&nbsp;&nbsp;oui
																</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
																	<input type="radio" value="Non" name="G16">&nbsp;&nbsp;&nbsp;non
																</label> <br> Equipement de contrôle et de signalisation
																(ECS / TDS) : <br> <select name="G17"
																	class="form-control" multiple>
																	<option value="Système conventionnel">Système
																		conventionnel</option>
																	<option
																		value="Système adressable avec ligne principale ouverte">
																		Système adressable avec ligne principale ouverte</option>
																	<option
																		value="Système adressable avec ligne principale rebouclée">
																		Système adressable avec ligne principale rebouclée</option>
																</select> <br>   Référentiel appliqué   <select name="G18"
																	class="form-control" multiple>
																	<option value="APSAD / R7">APSAD / R7</option>
																	<option value="IMANOR / NM">IMANOR / NM</option>
																	<option value=" NFPA">NFPA</option>
																</select> insertion d'une image <input type="file" name="G19"
																	class="form-control">
															</div>
														</div>
													</fieldset>
													<fieldset class="col-md-12">
														<legend style="width: 70%;">Système de mise en
															sécurité Incendie (SMSI) </legend>
														<div class="panel panel-default">
															<div class="panel-body">
																- Centralisateur de mise en sécurité incendie (CMSI)  
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
																	<input type="radio" value="oui" name="G20" checked>oui
																</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
																	<input type="radio" value="Non" name="G20">non
																</label> <input type="file" name="G22">
															</div>
														</div>
													</fieldset>
												</div>
											</div>
									</fieldset>
								</div>
								<div class="col-md-10"></div>
								<div class="col-md-2">
									<br>
									<button type="submit" value="GG" name="G"
										class="btn btn-success ">Enregistrer</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- _______________________________________________________H__________________________________________________________________________  -->
				<div class="container-fluid">
					<form method="post" action="RMA">
						<!-- OVERVIEW -->
						<div class="panel panel-headline">
							<div class="panel-heading"<% if( sission.getAttribute("H")!=null   ||sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
								<h3 class="panel-title">Protection et prévention incendie
									partie 3 &amp; Surveillance du site</h3>
								<p class="panel-subtitle">Désenfumage Naturel (SDN) /
									Mécanique &amp; Sapeurs-pompiers &amp; Vidéosurveillance &amp;
									Gardiennage / Intrusion</p>
								<p class="panel-subtitle"></p>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
<!-- 									<button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button> -->
								</div>
							</div>
							<div class="panel-body"
								<% if(sission.getAttribute("H")!=null  || sission.getAttribute("Urldoss")==null ){ out.print("style='display:none;'"); } %>>
								<div class="row">
									<div class="col-md-12">
										<fieldset class="col-md-12">
											<legend>Désenfumage Naturel (SDN) / Mécanique</legend>
											<div class="panel panel-default">
												<div class="panel-body">
													<div class="col-md-4">
														- Matériel de désenfumage   <br> <select name="H0"
															class="form-control" multiple>
															<option value="Amenées d’air naturelles">
																Amenées d’air naturelles</option>
															<option value="Amenées d’air mécaniques">
																Amenées d’air mécaniques</option>
															<option value="DENFC : Exutoire Dôme">DENFC :
																Exutoire Dôme</option>
															<option value="DENFC : Exutoire à 2 vantaux">
																DENFC : Exutoire à 2 vantaux</option>
															<option value=" DENFC : Exutoire à lamelles">
																DENFC : Exutoire à lamelles</option>
														</select> <br> insertion d'une image <input type="file"
															name="H1"> <br>   Matériel de désenfumage  
														<select name="H2" class="form-control" multiple>
															<option value="Amenées d’air naturelles">
																Amenées d’air naturelles</option>
															<option value="Amenées d’air mécaniques">
																Amenées d’air mécaniques</option>
														</select>
													</div>
													<div class="col-md-4">
														insertion d'une image <input type="file" name="H3"
															class="form-control"> - Dispositif de
														déclanchement  <br> <select name="H4"
															class="form-control" multiple>
															<option value="Commande manuelle">Commande
																manuelle</option>
															<option value="Commande automatique">Commande
																automatique</option>
														</select> <br> insertion d'une image <input type="file"
															name="H5" class="form-control">
													</div>
													<div class="col-md-4">
														<br> Canton de désenfumage 
														<div class="radio">
															<label> <input type="radio" value="Oui" name="H6"
																checked>oui
															</label> <label> <input type="radio" value="Non"
																name="H6">non
															</label> <br> insertion d'une image <input type="file"
																name="H7" class="form-control">
														</div>
														<br>  Référentiel appliqué <select name="H8"
															class="form-control" multiple>
															<option value="APSAD / R17">APSAD / R17</option>
															<option value="IMANOR / NM">IMANOR / NM</option>
															<option value="NFPA">NFPA</option>
														</select>
													</div>
													<fieldset class="col-md-8">
														<legend>Sapeurs-pompiers</legend>
														<div class="panel panel-default">
															<div class="panel-body">
																Sapeurs-pompiers  Distance de la plus proche caserne en
																km   <input type="number" class="form-control" name="H9"
																	placeholder=" Sapeurs-pompiers ">   Temps
																d’intervention en min   <input type="number" name="H10"
																	class="form-control"
																	placeholder="Temps d’intervention en min :">
															</div>
														</div>
													</fieldset>
												</div>
											</div>
										</fieldset>
									</div>
									<fieldset class="col-md-12">
										<legend>Surveillance du site</legend>
										<div class="panel panel-default">
											<div class="panel-body">
												<fieldset class="col-md-6">
													<legend>Vidéosurveillance </legend>
													<div class="panel panel-default">
														<div class="panel-body">
															<br>  Nombre des caméras   <input type="number"
																name="H11" class="form-control"
																placeholder=" Nombre des caméras :">   Archivage
															 
															<div class="radio">
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
																	<input type="radio" value="Oui" name="H12" checked>oui
																</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
																	<input type="radio" value="Non" name="H12">non
																</label> <br>
															</div>
															 en cas de oui la durée  <input type="text"
																class="form-control" name="H13" placeholder="">
															<br> insertion d'une image <input type="file"
																name="H14" class="form-control">
														</div>
													</div>
												</fieldset>
												<fieldset class="col-md-6">
													<legend>Gardiennage / Intrusion </legend>
													<div class="panel panel-default">
														<div class="panel-body">
															<br>   Type de gardiennage : <input type="text"
																name="H15" class="form-control" placeholder="">
															  Nom de la société de gardiennage : <input type="text"
																name="H16" class="form-control" placeholder="">
															<br>  Système de contrôle des rondes : <br>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
																<input type="radio" value="Oui" name="H17" checked>&nbsp;&nbsp;oui
															</label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label>
																<input type="radio" value="Non" name="H17">&nbsp;&nbsp;non
															</label> <br> insertion d'une image <input type="file"
																name="H18" class="form-control"><br>
														</div>
													</div>
												</fieldset>
											</div>
										</div>
									</fieldset>
									<div class="col-md-10"></div>
									<div class="col-md-2">
										<br>
										<button type="submit" value="HH" name="H"
											class="btn btn-success ">Enregistrer</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- _______________________________________________________I__________________________________________________________________________  -->
				<div class="container-fluid">
					<form method="post" action="RMA">
						<!-- OVERVIEW -->
						<div class="panel panel-headline">
							<div class="panel-heading"<% if( sission.getAttribute("I")!=null   ||sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
								<h2 class="panel-title">Appréciation du risque 1</h2>
								<p class="panel-subtitle"></p>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
	<!-- 								<button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button> -->
								</div>
							</div>
							<div class="panel-body"
								<% if(sission.getAttribute("I")!=null  || sission.getAttribute("Urldoss")==null){ out.print("style='display:none;'"); } %>>
								<div class="row">
									<div class="col-md-12">
										<table class="table table-bordered table-hover">
											<thead>
												<tr>
													<th class="text-center">
														<h3 style="color: green;">Points forts</h3>
													</th>
													<th class="text-center">
														<h3 style="color: red;">Points faibles</h3>
													</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>Risques incendie : <textarea class="form-control"
															name="I0" placeholder="Risques incendie " rows="4"></textarea>
														<input type="file" name='I1' placeholder='image'
														class="form-control" />
													</td>
													<td><textarea class="form-control" name='I2'
															placeholder="textarea" rows="4"></textarea> <input
														type="file" name='I3' placeholder=' ' class="form-control" />
													</td>
												</tr>
												<tr>
													<td>Risques électrique : <textarea
															class="form-control" name='I4'
															placeholder="Risques électrique " rows="4"></textarea> <input
														type="file" name='I5' placeholder=' ' class="form-control" />
													</td>
													<td><textarea class="form-control" placeholder=""
															name="I6" rows="4"></textarea> <input type="file"
														name='I7' placeholder=' ' class="form-control" /></td>
												</tr>
											</tbody>
										</table>
										<div class="col-md-10"></div>
										<div class="col-md-2">
											<button type="submit" value="II" name="I"
												class="btn btn-success ">Enregistrer</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- _______________________________________________________J__________________________________________________________________________  -->
				<div class="container-fluid">
					<form action="RMA" method="post">
						<!-- OVERVIEW -->
						<div class="panel panel-headline">
							<div class="panel-heading"<% if( sission.getAttribute("J")!=null   ||sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
								<h2 class="panel-title">Appréciation du risque 2</h2>

								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
								<!-- 	<button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button> -->
								</div>
							</div>
							<div class="panel-body"
								<% if(sission.getAttribute("J")!=null  || sission.getAttribute("Urldoss")==null){ out.print("style='display:none;'"); } %>>
								<div class="row">
									<div class="col-md-12">
										<table class="table table-bordered table-hover">
											<tbody>
												<tr>
													<td>Risques liés aux événements naturels (Inondation…)
														: <textarea name="J0" class="form-control" placeholder=" "
															rows="4"></textarea> <input type="file" name='J1'
														placeholder=' ' class="form-control" />
													</td>
													<td>texte <textarea name="J2" class="form-control"
															placeholder=" " rows="4"></textarea> <br> <br>
														<input type="file" name='J3' placeholder=' '
														class="form-control" />
													</td>
												</tr>
											</tbody>
										</table>
										<br>
										<h2 class="panel-title">Matrice d'évaluation</h2>
										<table class="table table-bordered table-hover">
											<tbody>
												<tr>
													<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
													<td>
														<h4 class="text-success text-center">Le niveau de
															risque</h4> <input type="text" class="form-control" name="J4">
														<br> <!-- <input type="file" name='J5' placeholder=' ' class="form-control" /> -->
														<h4 class="text-success text-center">Niveau de
															protection et prévention :</h4> <input type="text"
														class="form-control" name="J5"> <br> <!-- <input type="file" name='J7' id="J7" placeholder=' ' class="form-control"  webkitdirectory directory multiple />
                                          <img src="" width="200" style="display:none;" /> -->
														<!-- <div id="disp_tmp_path"></div> -->
													</td>
													<td>
														<table class="table table-bordered table-hover">
															<tbody class="text-center">
																<tr class="text-center">
																	<th ROWSPAN=4>Niveau de Prévention Protection</th>

																	<td>Pauvre</td>
																	<td style="background-color: red;">&nbsp;&nbsp;&nbsp;
																		<input type="radio" value="1" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: red;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="2"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: red;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="3"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: red;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="4"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																</tr>
																<tr>
																	<td>Besoin d'amélioration</td>
																	<td style="background-color: yellow;">&nbsp;&nbsp;&nbsp;
																		<input type="radio" value="5" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: orange;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="6"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: orange;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="7"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: red;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="8"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																</tr>
																<tr>
																	<td>Adéquat, Standard</td>
																	<td style="background-color: green;">&nbsp;&nbsp;&nbsp;
																		<input type="radio" value="9" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: yellow;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="10"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: orange;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="11"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: red;">
																		&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"
																		value="12" name="J8">&nbsp;&nbsp;&nbsp;
																	</td>
																</tr>
																<tr>
																	<td>Au-dessus de la normale</td>
																	<td style="background-color: green;">&nbsp;&nbsp;&nbsp;
																		<input type="radio" value="13" name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: green;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="14"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: yellow;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="15"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																	<td style="background-color: red;">
																		&nbsp;&nbsp;&nbsp; <input type="radio" value="16"
																		name="J8">&nbsp;&nbsp;&nbsp;&nbsp;
																	</td>
																</tr>
																<tr>
																	<td>
																	<td></td>

																	<td>
																		&nbsp;&nbsp;&nbsp;&nbsp;bon&nbsp;&nbsp;&nbsp;</td>
																	<td style="background-color:;">
																		&nbsp;&nbsp;&nbsp;&nbsp;Moyen&nbsp;&nbsp;&nbsp;</td>
																	<td style="background-color:;">
																		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Médiocre&nbsp;&nbsp;</td>
																	<td style="background-color:;">
																		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Mauvais&nbsp;&nbsp;</td>
																</tr>
																<tr></tr>
																<tr></tr>
																<tr><Th COLSPAN='6' class="text-danger text-center"><strong>Niveau
																		de Risque</strong></Th> </tr>
															</tbody> 
														</table>
													</td>
												</tr>
											</tbody>
										</table>
										<div class="col-md-10"></div>
										<div class="col-md-2">
											<button type="submit" value="JJ" name="J"
												class="btn btn-success ">Enregistrer</button>
										</div>
									</div>
								</div>
						</div>		</div>
					</form>
					
				</div>
		<!-- 	</div> -->
		<!-- </div> -->
		<!-- END MAIN CONTENT -->

		<!-- END MAIN -->
		<div class="container-fluid">
			<form method="post" action="RMA">
				<!-- OVERVIEW -->
				<div class="panel panel-headline">
					<div class="row">
						<div class="col-md-12">
							<div class="panel-heading"<% if(sission.getAttribute("Urldoss")==null){ out.print("style='  background-color: #f5f5f5;'"); } %>>
								<h2 class="panel-title text-center">L'enregisrement et
									l'ecriture de document</h2>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
<!-- 									<button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button> -->
								</div>
								<p class="panel-subtitle text-center">
									s'il vous plaît vérifier que le document à remplir et était
									fermé avant cette étape .<br> si vous avez met une erreur
									durant le saisir des donnes d'une rubrique juste ressaisir tous
									les éléments de cette dernière et faire l'enregistrement de cet
									ongle avant le enregistrement .
								</p>
							</div>
							<div class="panel-body"
								<%   if(sission.getAttribute("Urldoss")==null){ out.print("style='display:none;'"); } %>>
								<div class="col-md-3"></div>
								<div class="col-md-6">
									<button type="submit" name="fin" value="fin"
										class="btn btn-success btn-block">Enregistrer
										définitivement</button>
								</div>
								<div class="col-md-3"></div>
							</div>
						</div>
					</div>
					</div>
			</form>
		</div>
	</div>
	<!--              
            <div class="container-fluid">
               <form method="post" action="RMA"> 
                   OVERVIEW
                   <div class="panel panel-headline">
                       <div class="panel-heading">
                           <h2 class="panel-title">l'enregisrement et l'ecriture  </h2>
                           <p class="panel-subtitle"> </p>
                       </div>
                       <div class="panel-body">
                      
                           <div class="row">
                               <div class="col-md-12">
            
            
            
            
            
            
               <div class="col-md-10"  ></div><div class="col-md-2">
                                 <button type="submit" value="fin" name="fin" class="btn btn-primary">Enregistrer</button> 
                               </div>
            
                           </div>
            
                       </div>
            
                   </div>
            </form>
               </div>    -->
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
	<script
		src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
	<script src="assets/vendor/chartist/js/chartist.min.js"></script>
	<script src="assets/scripts/ayouu.js"></script>




	<!--      <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script> -->
	<!-- <script type="text/javascript">
    $(document).ready(function() {
        $("#form_img").submit(function(e){
            e.preventDefault();
            var formData = new FormData($("#form_img")[0]);

            $.ajax({
                url : $("#form_img").attr('action'),
                type : 'POST',
                data : formData,
                contentType : false,
                processData : false,
                success: function(resp) {
                    console.log(resp);                        
                }
            });
        });
    });

</script> -->



	<script>
   
         
        function change(name, i){
              
                 document.getElementById(name).value = i; 
        	 
         } 
         
         
         
         
         
         
         
         
         $(document).ready(function(){
      	      var i=1; //marq0 KAVmarq0 GEmarq0
      	     $("#add_rowmarq").click(function(){
      	      $('#addrmarq'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='marq"+(i)+"' type='text' placeholder='Marque' class='form-control input-md'  /> </td>"+
      	      	"<td><input required='required'  name='KAVmarq"+(i)+"' type='number' placeholder='KAV' class='form-control input-md'  /> </td>"+"<td><input required='required' name='GEmarq"+(i)+"' type='number' placeholder='Capacité' class='form-control input-md'  /> </td>");
      	    
      
      	      $('#tab_logicmarq').append('<tr id="addrmarq'+(i+1)+'"></tr>');
      	  //    SetTextBoxValue4(i+1);
      	    change("txtNamemarq",i+1);
      	      i++; 
      	  });
      	     $("#delete_rowmarq").click(function(){
      	    	 if(i>1){
      			 $("#addrmarq"+(i-1)).html('');
      			 i--;
      			change("txtNamemarq",i-1);
      			 }
      		 });
      
      	});
         
         $(document).ready(function(){
     	      var i=1;
     	     $("#add_rowTT").click(function(){
     	      $('#addrTT'+i).html("<td>"+ (i+1) +"</td><td>  <SELECT name='TT"+(i)+"' class='form-control input-lg'>"+
                      "<OPTION value='A bain d’huile avec cuve de rétention'>  A bain d’huile avec cuve de rétention </OPTION><OPTION value='A sec'>A sec</OPTION> </SELECT>"+
     	      	"<td><input required='required' name='KAVTT"+(i)+"' type='number' placeholder='  ' class='form-control input-md'  /> </td>");
     	    
     
     	      $('#tab_logicTT').append('<tr id="addrTT'+(i+1)+'"></tr>');
     	  //    SetTextBoxValue4(i+1);
     	  
     	      i++; 
     	     change("txtNameTT",i);
     	  });
     	     $("#delete_rowTT").click(function(){
     	    	 if(i>1){
     			 $("#addrTT"+(i-1)).html('');
     			 i--;
     			change("txtNameTT",i);
     			 }
     		 });
     
     	});
         
         
         
         
         
         
         
         
              $(document).ready(function(){
               var i=1;
              $("#add_rowPF").click(function(){
               $('#addrPF'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='PF"+(i)+"' type='text' placeholder='produit  fini  stocké  ' class='form-control input-md'  /> </td>");
         
               $('#tab_logicPF').append('<tr id="addrPF'+(i+1)+'"></tr>');
               change("txtNamePF",i+1);
               i++; 
           });
              $("#delete_rowPF").click(function(){
             	 if(i>1){
         		 $("#addrPF"+(i-1)).html('');
         		  change("txtNamePF",i-1);
         		 i--;
         		 }
         	 });
         
         });
              

              $(document).ready(function(){
               var i=1;
              $("#add_rowPSF").click(function(){
               $('#addrPSF'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='PSF"+(i)+"' type='text' placeholder='	 produit  fini  stocké  ' class='form-control input-md'  /> </td>");
         
               $('#tab_logicPSF').append('<tr id="addrPSF'+(i+1)+'"></tr>');
               change("txtNamePSF",i+1);
               i++; 
           });
              $("#delete_rowPSF").click(function(){
             	 if(i>1){
         		 $("#addrPSF"+(i-1)).html('');
         		  change("txtNamePSF",i-1);
         		 i--;
         		 }
         	 });
         
         });     
              
              
              $(document).ready(function(){
                  var i=1;
                 $("#add_rowSPDI").click(function(){
                  $('#addrSPDI'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='SPDI"+(i)+"' type='text' placeholder='Stockage produits dangereux, inflammables   ' class='form-control input-md'  /> </td>");
            
                  $('#tab_logicSPDI').append('<tr id="addrSPDI'+(i+1)+'"></tr>');
                  change("txtNameSPDI",i+1);
                  i++; 
              });
                 $("#delete_rowSPDI").click(function(){
                	 if(i>1){
            		 $("#addrSPDI"+(i-1)).html('');
            		  change("txtNameSPDI",i-1);
            		 i--;
            		 }
            	 });
            
            });
              
              
              $(document).ready(function(){
                  var i=1;
                 $("#add_rowMPS").click(function(){
                  $('#addrMPS'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='NatureMPS"+(i)+"' type='text' placeholder=' Matière  première  stockés ' class='form-control input-md'  /> </td>");
         
                  $('#tab_logicMPS').append('<tr id="addrMPS'+(i+1)+'"></tr>');
                  i++; 
                  SetTextBoxValueMPS(i );
              });
                 $("#delete_rowMPS").click(function(){
                	 if(i>1){
            		 $("#addrMPS"+(i-1)).html('');
            		 i--;
            		 SetTextBoxValueMPS(i );
            		 }
            	 });
         
            }); 
              $(document).ready(function(){
                  var i=1;
                 $("#add_rowNSc").click(function(){
                  $('#addrNSc'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='NSc"+i+"' type='text' placeholder='...' class='form-control input-md'  /> </td>");
         
                  $('#tab_logicNSc').append('<tr id="addrNSc'+(i+1)+'"></tr>');
                  i++; 
                  change("txtNameNSc",i+1);
              });
                 $("#delete_rowNSc").click(function(){
                	 if(i>1){
            		 $("#addrNSc"+(i-1)).html('');
            		 i--;
            		 change("txtNameNSc",i);
            		 }
            	 });
         
            }); 
              $(document).ready(function(){
                  var i=1;
                 $("#add_rowRMA_Ass").click(function(){
                  $('#addrRMA_Ass'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='RMA_Ass"+i+"' type='text' placeholder=' RMA Assurance  ' class='form-control input-md'  /> </td>");
         
                  $('#tab_logicRMA_Ass').append('<tr id="addrRMA_Ass'+(i+1)+'"></tr>');
                  i++; 
                  change("txtNameRMA_Ass",i+1);
              });
                 $("#delete_rowRMA_Ass").click(function(){
                	 if(i>1){
            		 $("#addrRMA_Ass"+(i-1)).html('');
            		 i--;
            		 change("txtNameRMA_Ass",i);
            		 }
            	 });
         
            }); 
              function SetTextBoxValueMPS(i ) {
             	 if(i==1){document.getElementById('txtNameMPS').value = 1;}else{
             	             document.getElementById('txtNameMPS').value = i;
         
             	         }}
         
         
         
         
         
         
         
         
         
         
         
         
         
                         function AfficherMasquer() {
                      divInfo = document.getElementById('divacacher');
         
                            if (divInfo.style.display == 'none')
                               divInfo.style.display = 'block';
                            else
                                divInfo.style.display = 'none';
         
                        }
         
              
         
            function SetTextBoxValue2(i ) {
         if(i==1){document.getElementById('txtName').value = 1;}else{
                     document.getElementById('txtName').value = i;
         
                 }}
         
         
                    function SetTextBoxValue3(i ) {
         if(i==1){document.getElementById('txtName2').value = 1;}else{
                     document.getElementById('txtName2').value = i;
         
                 }}
                 function rename(){
         
           $("input:text[name='name']").attr('name', 'name'+$('input[name=nbrTab1]').val());
                                  
                                  $("input:text[id='mail']").attr('name', 'mail'+$('input[name=nbrTab1]').val());
                                  $("input[name='mobile']").attr('name', 'mobile'+$('input[name=nbrTab1]').val());
         
         
         
                 }
         
          
         
         
         
            $(document).ready(function(){
               var i=1;
              $("#add_row").click(function(){
               $('#addr'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='Abr"+(i+1)+"' type='text' placeholder='	Abréviation ' class='form-control input-md'  /> </td>"+
               	"<td><input required='required' name='Deta"+(i+1)+"' type='text' placeholder='Détails' class='form-control input-md'  /> </td>"+"<td><input required='required' name='Super"+(i+1)+"' type='number' placeholder='Superficie' class='form-control input-md'  /> </td>");
               
         
               $('#tab_logic').append('<tr id="addr'+(i+1)+'"></tr>');
               SetTextBoxValue2(i+1);
               i++; 
           });
              $("#delete_row").click(function(){
             	 if(i>1){
         		 $("#addr"+(i-1)).html('');
         		 i--;
         		 SetTextBoxValue2(i);
         		 }
         	 });
         
         });
            
            function SetTextBoxValue7(i ) {
         	   if(i==1){document.getElementById('txtName5').value = 1;}else{
         	               document.getElementById('txtName5').value = i;
         
         	           }}   
          /*   function SetTextBoxValue7(i ) {
         	   if(i==1){document.getElementById('txtName5').value = 1;}else{
         	               document.getElementById('txtName5').value = i;
         
         	           }}  */
            
            $(document).ready(function(){
         	      var i=1;
         	     $("#add_rowchaud").click(function(){ 
         	      $('#addrchaud'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='Nbrchaud"+(i+1)+"' type='number' placeholder='	  ' class='form-control input-md'  /> </td>"
         	    		  +"<td><input required='required' name='Type"+(i+1)+"' type='text' placeholder='	Abréviation ' class='form-control input-md'  /> </td>"+
         	    		  "<td><input required='required' name='Marque"+(i+1)+"' type='text' placeholder='	  ' class='form-control input-md'  /> </td>"
         	    		  +"<td><input required='required' name='Capacite"+(i+1)+"' type='number' placeholder='	  ' class='form-control input-md'  /> </td>"
         	     );
         	    
         
         	      $('#tab_logicchaud').append('<tr id="addrchaud'+(i+1)+'"></tr>');
         	      SetTextBoxValueaa(i+1);
         	      i++; 
         	  });
         	     $("#delete_rowchaud").click(function(){
         	    	 if(i>1){
         			 $("#addrchaud"+(i-1)).html('');
         			 i--;
         			 SetTextBoxValueaa(i);
         			 }
         		 });
         
         	});
            
            
            $(document).ready(function(){
         	      var i=1;
         	     $("#add_rowcomp").click(function(){ 
         	      $('#addrcomp'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='NombreC"+(i+1)+"' type='number' placeholder='	  ' class='form-control input-md'  /> </td>"
         	    		  +"<td><input required='required' name='Debit"+(i+1)+"' type='number' placeholder='	Abréviation ' class='form-control input-md'  /> </td>"+
         	    		  "<td><input required='required' name='CV"+(i+1)+"' type='number' placeholder='	  ' class='form-control input-md'  /> </td>"
         	    		  +"<td><input required='required' name='KW"+(i+1)+"' type='number' placeholder='	  ' class='form-control input-md'  /> </td>"
         	    		  +"<td><input required='required' name='bar"+(i+1)+"' type='number' placeholder='	  ' class='form-control input-md'  /> </td>"
         	    		  +"<td><input required='required' name='litre"+(i+1)+"' type='number' placeholder=' ' class='form-control input-md'  /> </td>"
         	     );
         	    
         	      $('#tab_logiccomp').append('<tr id="addrcomp'+(i+1)+'"></tr>');
         	      SetTextBoxValue7(i+1);
         	      i++; 
         	  });
         	     $("#delete_rowcomp").click(function(){
         	    	 if(i>1){
         			 $("#addrcomp"+(i-1)).html('');
         			 i--;
         			 SetTextBoxValue7(i);
         			 }
         		 });
         
         	});
                
                
            
              
            
            $(document).ready(function(){
         	      var i=1;
         	     $("#add_rowconst").click(function(){ 
         	      $('#addrconst'+i).html("<td>"+ (i+1) +"</td><td><select class='form-control form-control-lg' name='Ossature"+(i)+"' id='select"+(i)+"'>"
                 +"<option value='...' ></option>"+"<option value='1' >Ossature 01</option><option value='2' > Ossature 02</option>"
                 +"<option value='3' > Ossature 03</option><option value='4'>Ossature 04 </option> </select>"
                 +"<br> <input type='text' name='OssatureInput"+(i)+"'  placeholder='murs extérieurs' class='form-control' /></td>"
                 +"<td><select  class='form-control form-control-lg' name='murs"+(i)+"' id='select"+(i)+"'>"
                 +"<option value='...' ></option>"
                 +"<option value='Me1'> murs extérieurs  Me1</option>" 
                 +"<option  value='Me2'>  murs extérieurs  Me2 </option>"
                 +"<option  value='Me3'> murs extérieurs   Me3</option>" 
                 +"</select><br> <input type='text' name='mursInput"+(i)+"' placeholder='murs extérieurs' class='form-control' /></td>"
                 +"<td> <select class='form-control form-control-lg' name='planche"+(i)+"' id='select"+(i)+"'>"
                 +"<option value='...' ></option>"
                 +"<option value='P0'>  palnche p0</option>"
                 +"<option  value='P1'>  palnche  p1</option>"
                 +"<option  value='P2'>  palnche P2</option>"
                 +"<option  value='P3'>  palnche P3</option>" 
                 +"<option  value='P4'>  palnche P4</option>"
                 +"</select><br> <input type='text' name='plancheInput"+(i)+"' placeholder='Planche' class='form-control' /></td>"
                 +"<td> <select class='form-control form-control-lg' name='nbrNi"+(i)+"' id='select"+(i)+"'>"
                 +"<option value='...' ></option>"
                 +" <option value='A'> le nombre de niveaux  A  </option>"
                 +"<option  value='B'>     le nombre de niveaux B </option>"
                 +"<option  value='C'>  le nombre de niveaux  C  </option>"
                 +"</select><br> <input type='text' name='nbrNiInput"+(i)+"' placeholder='le nombre de niveaux' class='form-control' /></td>"
                 
         
                 +"<td> <select class='form-control form-control-lg' name='couevrture"+(i)+"' id='select"+(i)+"'>"
                 +"<option value='...' ></option>"
                 +"  <option value='Co1'> Type Co1</option>"
                 +"<option  value='Co2'>  Type  Co2 </option>"
                 +"<option  value='Co3'>  Type Co3</option>"
                 +" <option  value='Co4'>  Type Co4</option>" 
               
                 +"</select><br> <input type='text' name='couevrtureInput"+ (i)+"' placeholder='couevrture' class='form-control' /></td>"
                 +"<td> <select class='form-control form-control-lg' name='ammina"+(i)+"' id='select"+(i+6)+"'>"
                 +"<option value='...' ></option>"
                 +"<option value='A1'>  CARI de type  A1</option>"
                 +"<option  value='A2'>  CARI de type   A2 </option>"
          		+"</select><br> <input type='text' name='amminaInput"+(i)+"' placeholder='CARI' class='form-control' /></td>"
          		 + "<td class='text-center'><input type='text' name='nbrNiNmae"+i+"'  placeholder='le nom de construction ' class='form-control' />"
          		+"<br><input type='file' name='ImageInput"+(i)+"'     class='form-control' /></td>"
          		
          );
         	    
         	      $('#tab_logicconst').append('<tr id="addrconst'+(i+1)+'"></tr>');
         	      SetTextBoxValueconst(i+1);
         	      i++; 
         	  });
         	     $("#delete_rowconst").click(function(){
         	    	 if(i>1){
         			 $("#addrconst"+(i-1)).html('');
         			 i--;
         			 SetTextBoxValueconst(i);
         			 }
         		 });
         
         	});
            
            function SetTextBoxValueconst(i ) {
         	   if(i==1){document.getElementById('txtNameconst').value = 1;}else{
         	               document.getElementById('txtNameconst').value = i;
         
         	           }} 
            
            
            
            function SetTextBoxValueaa(i ) {
         	   if(i==1){document.getElementById('txtName6').value = 1;}else{
         	               document.getElementById('txtName6').value = i;
         
         	           }}  
          //Nbrchaud Type Marque Capacite     
         
            
            
         
            $(document).ready(function(){
         	      var i=1;
         	     $("#add_rowciternes").click(function(){
         	      $('#addrciternes'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='GPL"+(i)+"' type='text' placeholder='T GPL' class='form-control input-md'  /> </td>"+
         	      	"<td><input required='required' name='citernes"+(i)+"' type='number' placeholder='Nbr citernes' class='form-control input-md'  /> </td>"+"<td><input required='required' name='litre"+(i)+"' type='number' placeholder='Capacité' class='form-control input-md'  /> </td>");
         	      
         
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
            
            function SetTextBoxValueV(i ) {
         	   if(i==1){document.getElementById('txtNameV').value = 1;}else{
         	               document.getElementById('txtNameV').value = i;
         
         	           }}
         	           function SetTextBoxValueInter(i ) {
         	        	   if(i==1){document.getElementById('txtNameInter').value = 1;}else{
         	        	               document.getElementById('txtNameInter').value = i;
         
         	        	           }}
         
               $(document).ready(function(){
               var i=1;
              $("#add_rowL").click(function(){
               $('#addrL'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='Nature"+i+"' type='text' placeholder='	Nature des produits stockés ' class='form-control input-md'  /> </td>");
         
               $('#tab_logicL').append('<tr id="addrL'+(i+1)+'"></tr>');
               i++; 
                   SetTextBoxValue3(i );
           });
              $("#delete_rowL").click(function(){
             	 if(i>1){
         		 $("#addrL"+(i-1)).html('');
         		     SetTextBoxValue3(i );
         		 i--;
         		 }
         	 });
         
         });
         //Inter
               $(document).ready(function(){
                   var i=1;
                  $("#add_rowV").click(function(){
                   $('#addrV'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='voi"+i+"' type='text' placeholder='	Voisinage ' class='form-control input-md'  /> </td>"+"<td><input required='required' name='fik"+i+"' type='file' placeholder=' ' class='form-control input-md'  /> </td>");
         
                   $('#tab_logicV').append('<tr id="addrV'+(i+1)+'"></tr>');
                   i++; 
                       SetTextBoxValueV(i );
               });
                  $("#delete_rowV").click(function(){
                 	 if(i>1){
             		 $("#addrV"+(i-1)).html('');
             		     SetTextBoxValueV(i );
             		 i--;
             		 }
             	 });
         
             });
             
               $(document).ready(function(){
                   var i=1;
                  $("#add_rowInter").click(function(){
                   $('#addrInter'+i).html("<td>"+ (i+1) +"</td><td><input required='required' name='Inter"+i+"' type='text' placeholder='L intermédaire' class='form-control input-md'  /> </td>");
         
                   $('#tab_logicInter').append('<tr id="addrInter'+(i+1)+'"></tr>');
                   i++; 
                       SetTextBoxValueInter(i );
               });
                  $("#delete_rowInter").click(function(){
                 	 if(i>1){
             		 $("#addrInter"+(i-1)).html('');
             		     SetTextBoxValueInter(i );
             		 i--;
             		 }
             	 });
         
             });
                   
                            
         
                   /*       $(document).ready(function() {
                             var i = 1;
                             $("#add_rowa").click(function() {
                                 b = i - 1;
                                 $('#addra' + i).html($('#addra' + b).html()).find('td:first-child').html(i + 1);
                                 $('#tab_logica').append('<tr id="addra' + (i + 1) + '"></tr>');
                                 i++;
                                 SetTextBoxValue2(i);
                             });
                             $("#delete_rowa").click(function() {
                                 if (i > 1) {
                                     $("#addra" + (i - 1)).html('');
                                     i--;
                                     SetTextBoxValue2(i);
                                 }
                             });
         
         SetTextBoxValue2(i);
                         }); */
         
         
          
         
         
         
         
         
         
         
         
                  
         
                       /*   Production d'énergie, traitement des déchets 
                            Industrie Agricole et Alimentaire (IAA) (Agro-alimentaire)
                            Chimie, pharmacie
                            Métallurgie, Mécanique, Electricité, Electronique
                            Textile, Habillement, Cuir
                            Scieries, meubles, papier-carton
                            Imprimerie, édition */
                         
                         
                         var catAndActs = {};
                         catAndActs["Production d'énergie, traitement des déchets"] = ["Extraction de houille, de lignite et de tourbe", "Extraction d'hydrocarbures et services annexes", "Extraction de minerais d'uranium", "Extraction des minerais métalliques", "Autres industries extractives", "Cokéfaction, raffinage", "Récupération", "Production et distribution d'électricité, de gaz et de chaleur", "Captage, traitement et distribution de l'eau", "Assainissement, voierie et gestion des déchets"];
                         catAndActs['Industrie Agricole et Alimentaire (IAA) (Agro-alimentaire)'] = ["Industries alimentaires : industrie des viandes / industrie du lait / industrie des boissons / travail du grain (Minoterie industrielle) ... ", "Industrie du tabac : Fabrication de produits à base de tabac : cigarettes et cigares / Fabrication de tabac à pipe, à mâcher ou à priser...."];
                         catAndActs['Chimie, pharmacie'] = ["Industrie chimique : Fabrication de gaz industriels, colorants et de pigments, produits chimiques inorganiques de base, produits chimiques organiques de base, produits azotés et d'engrais, ..."];
                         
                         catAndActs['Métallurgie, Mécanique, Electricité, Electronique'] = ["Fabrication d'autres produits minéraux non métalliques", "Métallurgie (Briqueterie, céramique, verre, cimenterie…)", 'Travail des métaux', 'Fabrication de machines et équipements', 'Fabrication de machines de de bureai et de matériel informatique', 'Fabrication de machines et appareils électriques', "Fabrication d'équipement de radio, télévision et communication", "Fabrication d'instruments médicaux, de précision,...", 
                         	"Industrie automobile", "Fabrication d'autres matériels de transport"
                         	];
                         catAndActs["Textile, Habillement, Cuir"] = [ "Industrie textile : Filature, tissage, moulinage et texturation, ennoblissement, articles textiles, étoffes à maille…",
                         	"Industrie de l'habillement et des fourrures : Confection fabrication de tous articles (Vêtements en textile ou cuir, industrie de fourrures)",
                         	"Industrie du cuir et de la chaussure : apprêt et tannage du cuir, articles de voyage et de maroquinerie, fabrication chaussures."
                         	
                         	 
                 ];
                         catAndActs['Scieries, meubles, papier-carton'] = [
                         	  "Travail du bois (TMB) : Sciage et rabotage, placage panneaux, parrquets, charpentes, emballage, objets en liège, vannerie et sparterie, objets divers en bois"
                         	, "Industrie du papier et du carton : Fabrication de pâte à papier, papier et carton (ondulés), emballages…"
                         	, "Fabrication de meubles et Industries diverses : Fabrication de meubles de bureau et de magasin, meubles de cuisine, matelas, meubles."
                         	];
                         
                         catAndActs['Imprimerie, édition'] = ["Imprimerie de journaux et livre, Autre imprimerie (labeur), Activités de pré-presse, Reliure et activités connexes, Reproduction d'enregistrements."];
                         catAndActs['Plasturgie'] = ["Industrie du caoutchouc et des plastiques : Fabrication et rechapage de pneumatiques, articles en caoutchouc, plaques, feuilles, tubes et profilés en matières plastiques, ..."
                         	];
                         catAndActs['Commerce et magasins alimentaires ou spécialisés (CAS)'] = [
                         	"Commerce alimentaire général : épiceries, supérettes, grandes surfaces alimentaire."
                         	,"Commerce alimentaire spécialisé (Vente d’une seule gamme de produits) : boulangeries-pâtisseries, boucheries-charcuteries,..."
                         	,"Commerce de gros et intermédiaires du commerce"
                         	,"Commerce de détail et réparation d'articles domestiques"];
                         catAndActs["Hôtels, restaurants, cliniques"] = ["Hôtels et restaurants" ];
                         catAndActs['Stockage (Plateforme logistique / dépôt)'] = ["Plateforme logistique, stockage grande surface.",
                         	"Dépôts divers articles."
                         	,"Négoce denrées et céréales (Silos de stockage)."];
                         catAndActs['Transport']=["Transport"]
                        
                         
                         function ChangecatList() {
                             var catList = document.getElementById("validationCustom03");
                             var actList = document.getElementById("validationCustom04");
                             var selCat = catList.options[catList.selectedIndex].value;
                             while (actList.options.length) {
                                 actList.remove(0);
                             }
                             var cats = catAndActs[selCat];
                             if (cats) {
                                 var i;
                                 for (i = 0; i < cats.length; i++) {
                                     var cat = new Option(cats[i], cats[i]);
                                     actList.options.add(cat);
                                 }
                             }
                         }
                         
            
                         
                         $(document).ready(function(){
                         	var i=parseInt($('#txtNameconst').val());
                       	  $('#select'+i).change(function(){
                       	    
                       	    if($('#select'+i).val()==""){
                       	   
                       	    }else{
         
                       	    }
         
                       	    if($('#select'+i).val()=="1"){
                       	    	$('#head').show();
                       	      $('#head1').html("-  Maçonnerie");
                       	      $('#head1').css("color","black");
                       	    }else{
                       	  
                       	    }
                       	     
                       	     if($('#select'+i).val()=="2"){
                       	     // $('#Me2').show();
                       	     $('#head').show();
                       	      $('#head1').html( 
                       	    		"Acier protégé<br>"+
                       	    		" Ossature en bois lamellé-collé ou en bois massif conforme aux exigences de l’assureur");
                       	      $('#head1').css("color","black");
                       	     }else{
                       	     // $('#female').hide();
                       	     }
         
                       	     if($('#select'+i).val()=="3"){
                       	      
                       	      $('#head1').html("Acier non protégé");
                       	      $('#head1').css("color","black");
                       	      
                       	     }
                       	   if($('#select'+i).val()=="4"){
                        	      
                        	      $('#head1').html("Bois, panneaux « sandwich » autoporteurs");
                        	      $('#head1').css("color","black");
                        	      
                        	     }
                       	     else{
                       	     }
                       	  });
         
                       	});
         
         
                         $(document).ready(function(){
                         	var j=parseInt($('#txtNameconst').val());
                         	 
                         	  $('#head1').html("HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH"+(j+1))
                         	  $('#select'+(j+1)).change(function(){
                         	    
                         	    if($('#select'+(j+1)).val()==""){
                         	        $('#head1').html("  Maçonnerie*y<br>"+
                   	    		  "Maçonnerie + isolant de tout type  Maçonnerie*");
                         	    }else{
         
                         	    }
         
                         	    if($('#select'+(j+1)).val()=="Me1"){
                         	    	$('#head').show();
                         	      $('#head1').html("  Maçonnerie*y<br>"+
                         	    		  "Maçonnerie + isolant de tout type  Maçonnerie*");
                         	      $('#head1').css("color","black");
                         	    }else{
                         	    
                         	    }
                         	     
                         	     if($('#select'+(j+1)).val()=="Me2"){
                         	     // $('#Me2').show();
                         	     $('#head').show();
                         	      $('#head1').html( 
                         	    		  "-  Acier, aluminium, fibre-ciment, plâtre (plaques), verre<br>"+
                         	    		  "-  A** + isolant minéral (avec ou sans parement, quel que soit le parement) + A**e<br>"+
                         	    		  "-  Mur extérieur réalisé conformément aux exigences de l’assureur***, au moyen :e<br>"+
                         	    		  ".  de plaques ou rouleaux de polyester armé de fibres de verre relevant dudit cahiere<br>"+
                         	    		  ".  de plaques de PVC portant la marque PVC NP (polychlorure de vinyle non plastifié)e<br>");
                         	      $('#head1').css("color","black");
                         	     }else{
                         	     // $('#female').hide();
                         	     }
         
                         	     if($('#select'+(j+1)).val()=="Me3"){
                         	      
                         	      $('#head1').html("-  A** + isolant du type mousses matières plastiques + A** (2)<br>"+
                         	    		  "-  Bois, matières plastiques");
                         	      $('#head1').css("color","black");
                         	      
                         	     }else{
                         	     }
                         	  });
         
                         	});
         
                      
                         
         
                         
                         
         $(document).ready(function(){
         	var l=parseInt($('#txtNameconst').val());
                         	  $('#select'+(l+2)).change(function(){
                         	    
                         	    if($('#select'+(l+2)).val()==""){
                         	   
                         	    }else{
         
                         	    }
         
                         	    if($('#select'+(l+2)).val()=="P0"){
                         	    	$('#head').show();
                         	      $('#head1').html('<table class="table table-bordered"><thead><tr><th colspan="2" rowspan="2">Protection des communicationsNature des matériaux consicutifs du plancher</th><th>Communications DIRECTES</th>'+
         								'<th colspan="3">Communications ENCAGEES</th>'+
         						'<th  rowspan="2">Catégorie</th></tr><tr>'+
         								'<th>Dispositifd d obturation (portes ou trappes)</th><th>Matériaux consicutifs des parios de la cage d escalier</th>'+
         								'<th>Portes</th></tr></thead><tbody>'+'<tr><td colspan="2" >  Bâtiment à un seul niveau</td><td>----------------------------</td><td>-----------</td><td>-------- </td><td colspan="2">P0</td></tr>' +'  </tbody></table>');
                         	      $('#head1').css("color","black");
                         	    }else{
                         	  
                         	    }
                         	     
                         	     if($('#select'+(l+2)).val()=="P1"){
                         	     // $('#Me2').show();
                         	     $('#head').show();
                         	     $('#head1').html('<table class="table table-bordered"><thead><tr><th colspan="2" rowspan="2">Protection des communications Nature des matériaux consicutifs du plancher</th><th>Communications DIRECTES</th>'+
             								'<th colspan="3">Communications ENCAGEES</th>'+
             						'<th  rowspan="2">Catégorie</th></tr><tr>'+
             								'<th>Dispositifd d obturation (portes ou trappes)</th><th>Matériaux consicutifs des parios de la cage d escalier</th>'+
             								'<th>Portes</th></tr></thead><tbody>'+
             								'<tr><td colspan="2" >  ¤ Plancher maçonnerie* sur solives béton   </td>'
             								+'<td>Comportement  au  feu  au moins  équivalent  à  celui des portes conformes aux exigences de l’assureur</td>'
             								+'<td>Même   nature   que   ceux qui   constituent le plancher </td><td>Comportement  au  feu  au moins équivalent  à  celui d une     porte     en     bois massif de 30 mm d épais- seur,   ou   à  celui   d une porte métallique</td>'
             								+'<td colspan="2">P1</td></tr>' 
             								+'  </tbody></table>');
                         	     
                         	     $('#head1').css("color","black");
                         	     }else{
                         	     // $('#female').hide();
                         	     }
         
                         	     if($('#select'+(l+2)).val()=="P2"){
                         	    	   $('#head1').html('<table class="table table-bordered"><thead><tr><th colspan="2" rowspan="2">Protection des communications Nature des matériaux consicutifs du plancher</th><th>Communications DIRECTES</th>'+
                   								'<th colspan="3">Communications ENCAGEES</th>'+
                   						'<th  rowspan="2">Catégorie</th></tr><tr>'+
                   								'<th>Dispositifd d obturation (portes ou trappes)</th><th>Matériaux consicutifs des parios de la cage d escalier</th>'+
                   								'<th>Portes</th></tr></thead><tbody>'+
                   								'<tr><td colspan="2" >   Plancher type P1<br> Plancher  maçonnerie sur solives bois ou acier protégées<br> Plancher bois ou acier protégé sur solives  béton  ou  solives bois ou acier protégées<br> Plancher   béton, coulé sur bac acier protégé sur solives béton ou solives acier protégées</td>'
                   								+'<td>d° Comportement  au  feu  au moins  équivalent  à  celui d une  porte  en  bois  mas- sif de 30 mm d épaisseur, ou   à   celui   d une   porte métallique</td>'
                   								+'<td>d° ci-dessus</td><td>d° ci-dessus </td>'
                   								+'<td colspan="2">P2</td></tr>' 
                   								+'  </tbody></table>');
                         	    	 $('#head1').css("color","black");
                         	      
                         	     }
                         	     if($('#select'+(l+2)).val()=="P3"){
                             	      
                         	    	   $('#head1').html('<table class="table table-bordered"><thead><tr><th colspan="2" rowspan="2">Protection des communications Nature des matériaux consicutifs du plancher</th><th>Communications DIRECTES</th>'+
                   								'<th colspan="3">Communications ENCAGEES</th>'+
                   						'<th  rowspan="2">Catégorie</th></tr><tr>'+
                   								'<th>Dispositifd d obturation (portes ou trappes)</th><th>Matériaux consicutifs des parios de la cage d escalier</th>'+
                   								'<th>Portes</th></tr></thead><tbody>'+
                   								'<tr><td colspan="2" >  ¤  Plancher maçonnerie*,   bois   ou   acier protégé sur solives acier non protégées<br> Plancher acier  non  protégé  sur  solives béton, bois protégé ou acier (protégé ou non)<br> Plancher béton  coulé  sur  bac  acier  non protégé   sur   solives   béton   ou   solives acier (protégées ou non)</td>'
                   								+'<td>d°La  nature  des  dispositifs d obturation     est     sans influence   sur   le   classe- ment du plancher</td>'
                   								+'<td>La nature des matériaux constitutifs des parois de la cage   d escalier,   et   celle   des   portes   sont   sans influence sur le classement du plancher</td>'
                   						     	+'<td>------</td>'+ 
                   						     	'<td>------</td>'
                   								+'<td colspan="2">P3</td></tr>' 
                   								+'  </tbody></table>');
                           		   $('#head1').css("color","black");
                            	      
                            	     }
                         	     if($('#select'+(l+2)).val()=="P4"){
                            	      
                             		   $('#head1').html('<table class="table table-bordered"><thead><tr><th colspan="2" rowspan="2">Protection des communications Nature des matériaux consicutifs du plancher</th><th>Communications DIRECTES</th>'+
                								'<th colspan="3">Communications ENCAGEES</th>'+
                						'<th  rowspan="2">Catégorie</th></tr><tr>'+
                								'<th>Dispositifd d obturation (portes ou trappes)</th><th>Matériaux consicutifs des parios de la cage d escalier</th>'+
                								'<th>Portes</th></tr></thead><tbody>'+
                								'<tr><td colspan="2" >  Plancher  bois  (non  protégé)  sur  solives tous types<br> Planchers  tous  types  sur  solives  bois non protégées</td>'
                								+'<td>d° ci-dessus</td>'
                								+'<td>d° ci-dessus</td><td>d° ci-dessus </td>'
                								+'<td colspan="2">P4</td></tr>' 
                								+'  </tbody></table>');
                              	      $('#head1').css("color","black");
                              	      
                              	     }
                         	     
                         	  });
         
                         	});
                         
                         $(document).ready(function(){
                         	var l=parseInt($('#txtNameconst').val());
                         	
                       	  $('#select'+(l+3)).change(function(){
                       	    
                       	    if($('#select'+(l+4)).val()==""){
                       	   
                       	    }else{
         
                       	    }
         
                       	    if($('#select'+(l+3)).val()=="A"){
                       	    	$('#head').show();
                       	      $('#head1').html("1 niveau (quelle que soit la hauteur du bâtiment)");
                       	      $('#head1').css("color","black");
                       	    }else{
                       	 
                       	    }
                       	     
                       	     if($('#select'+(l+3)).val()=="B"){
                       	     // $('#Me2').show();
                       	     $('#head').show();
                       	      $('#head1').html( 
                       	    		"2,  3,  4  et  5  niveaux  et  bâtiments  dont  le  plancher  bas  du  dernier  niveau  est  au  plus  à 28 mètres du niveau du sol le plus haut utilisable pour les engins des services de secours et de lutte contre l'incendie (1) ");
                       	      $('#head1').css("color","black");
                       	     }else{
                       	     // $('#female').hide();
                       	     }
         
                       	     if($('#select'+(l+3)).val()=="C"){
                       	      
                       	      $('#head1').html(" plus de 5 niveaux ou bâtiments dont le plancher bas du dernier niveau est à plus de 28 mètres du  niveau  du  sol  le  plus  haut  utilisable  pour  les  engins  des  services  de  secours  et  de  lutte  contre l'incendie(1)");
                       	      $('#head1').css("color","black");
                       	      
                       	     }
                       	    
                       	  });
         
                       	});
                         
                         
                         $(document).ready(function(){
                         	var l=parseInt($('#txtNameconst').val());
                       	  $('#select'+(l+4)).change(function(){
                       	    
                       	    if($('#select'+(l+4)).val()==""){
                       	   
                       	    }else{
         
                       	    }
         
                       	    if($('#select'+(l+4)).val()=="Co1"){
                       	    	$('#head').show();
                       	      $('#head1').html("¤  Acier, aluminium, zinc, fibre-ciment ('couverture sèche')<br>"+
                       	    		  " isolant minéral (avec ou sans parement, quel que soit le parement)<br>"+
                       	    		  "Béton + isolant minéral (avec ou sans parement, quel que soit le parement) + étanchéité<br>"+
                       	    		  "Ardoises ou tuiles sur supports non combustibles<br>"+
                       	    		  "Béton + isolant du type mousses matières plastiques + étanchéité<br>"+
                       	    		  " Vitrages<br>" 
                       	    		 );
                       	      $('#head1').css("color","black");
                       	    }else{
                       	  
                       	    }
                       	     
                       	     if($('#select'+(l+4)).val()=="Co2"){
                       	     // $('#Me2').show();
                       	     $('#head').show();
                       	      $('#head1').html( 
                       	    		" Béton + isolant du type mousses matières plastiques + étanchéité<br>"+
                       	    		"Couverture isolante en bac acier revêtue d'étanchéité conforme aux exigences de l’assureur<br>"
                       	    		 );
                       	      $('#head1').css("color","black");
                       	     }else{
                       	     // $('#female').hide();
                       	     }
         
                       	     if($('#select'+(l+4)).val()=="Co3"){
                       	      
                       	      $('#head1').html("   isolant minéral (avec ou sans parement, quel que soit le parement) + étanchéité<br>"+
                       	    		  " isolant du type mousses matières plastiques<br>"+
                       	    		  " Couverture en revêtement souple sur supports bois conforme aux exigences de l’assureur<br>"+
                       	    		  "Couverture réalisée conformément aux exigences de l’assureur***, au moyen de : <br>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; -  de plaques ou rouleaux de polyester armé de fibres de verre relevant dudit cahier,<br>&nbsp;&nbsp;&nbsp;&nbsp;de plaques de P.V.C. portant la marque P.V.C.  N.P. (polychlorure de vinyle non plastifié)<br> "+
                       	    		  " Ardoises ou tuiles sur supports combustibles");
                       	      $('#head1').css("color","black");
                       	      
                       	     }
                       	   if($('#select'+(l+4)).val()=="Co4"){
                        	      
                        	      $('#head1').html("   isolant du type mousses matières plastiques + étanchéité"+" isolant du type mousses matières plastiques + étanchéité<br>"+"Matières plastiques<br>");
                        	      $('#head1').css("color","black");
                        	      
                        	     }
                       	     else{
                       	     }
                       	  });
         
                       	});
                         $(document).ready(function(){
                         	var l=parseInt($('#txtNameconst').val());
                       	  $('#select'+(l+5)).change(function(){
                       	    
                       	    if($('#select6').val()==""){
                       	   
                       	    }else{
         
                       	    }
         
                       	    if($('#select'+(l+5)).val()=="A1"){
                       	    	$('#head').show();
                       	      $('#head1').html("- <h1class='text-center'>A1</h1> Bâtiment sans aménagement ou revêtement intérieur<br>"+
                       	    		"-  Plaques à base de fibre-ciment<br>"+
                       	    		"-  Panneaux de fibres minérales (de verre, de roche ou céramique), de mousse de verre, sans parement ou avec parement apparent incombustible du type kraft aluminium<br>"+
                       	    		"-  Panneaux de fibragglo<br>"+
                       	    		"-  Plaques de plâtre (cartonnées ou non)<br>"+
                       	    		"-  Staff<br>"+
                       	    		"-  Tôles métalliques<br>"+
                       	    		"-  Vitrages, verre armé<br>");
                       	      $('#head1').css("color","black");
                       	    } 
                       	     
                       	     if($('#select'+(l+5)).val()=="A2"){
                       	     // $('#Me2').show();
                       	     $('#head').show();
                       	      $('#head1').html( "-  Panneaux de fibres minérales, de mousse de verre avec parement apparent combustible (papier kraft ordinaire, film de PVC, etc.)<br>"+
                       	   " -  Bois (panneaux de contreplaqué, de fibres, de particules, planches, etc.)<br>"+
                       	  "-  Lin (panneaux d'anas, de particules, etc.)<br>"+
                       	 " -  Matières plastiques :<br>"+
                       	  ".       plaques (de polyester, polyvinyle, etc.)<br>"+
                       	  ".      films<br>"+
                       	  ".      mousses, etc.<br>"
                       	    		
         );
                       	      $('#head1').css("color","black");
                       	    
                       	     
                       	     }
                       	      
                       	  });
         
                       	});
                         
                         
                         
                         
                         
                         
                         
                         
                         
          
                     
      </script>
</body>
</html>