 
  <%@ page errorPage="Error.jsp" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, metier.*,DAO.*,com.google.gson.Gson,com.google.gson.JsonObject"%>
	<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
    <%@ page errorPage="Error.jsp" %>  
    <%if(session.getAttribute("user")==null)  response.sendRedirect("login.jsp"); %>
<%

    String dataPoints1=null;

 String date="";
      Long bon=0L; 
      Long moyen=0L;
      Long Mediocre=0L; 
      Long Mauvais=0L;
  	if(request.getParameter("date")!=null){
  	date=(String)request.getParameter("date");

	////System.out.println("date-----_>"+date);
	 }else if(request.getParameter("date")==null){
		 date= String.valueOf(new Date().getYear()+1900); 
		 
	
	 }

  	 Long nbrGlobal=0L;
  	nbrGlobal=Dao.Global(date);
//	////System.out.println("date_________________>"+date+"__________nbrGlobal___________"+nbrGlobal);
/* 	////System.out.println("---------------------------------nbrGlobal   "+Dao.Global(date));
	if(date!=null)
	{
	
	 Long nbrPPS=0L;
	 Long nbrPPS1=0L;
	 Long nbrPPS2=0L;
	 Long nbrPPS3=0L;

	 
 	 
	 
		 nbrPPS+=Dao.Statis(1, date);
		 nbrPPS+=Dao.Statis(2, date);
		 nbrPPS+=Dao.Statis(3, date);
		 nbrPPS+=Dao.Statis(4, date);
	 
		 nbrPPS1+=Dao.Statis(5, date);
		 nbrPPS1+=Dao.Statis(6, date);
		 nbrPPS1+=Dao.Statis(7, date);
		 nbrPPS1+=Dao.Statis(8, date);
	  
		 nbrPPS2+=Dao.Statis(9, date);
		 nbrPPS2+=Dao.Statis(10, date);
		 nbrPPS2+=Dao.Statis(11, date);
		 nbrPPS2+=Dao.Statis(12, date);
	  
		 nbrPPS+=Dao.Statis(13, date);
		 nbrPPS+=Dao.Statis(14, date);
		 nbrPPS+=Dao.Statis(15, date);
		 nbrPPS+=Dao.Statis(16, date);
	 
  */
 
		 Long nbrNR=0L;
		Long nbrNR1=0L;
		Long nbrNR2=0L;
		Long nbrNR3=0L;
 
if(date!=null){
	
	 
	 
		 nbrNR+=Dao.Statis(1, date);
		 nbrNR+=Dao.Statis(5, date);
		 nbrNR+=Dao.Statis(9, date);
		 nbrNR+=Dao.Statis(13, date);
	 
 
		 nbrNR1+=Dao.Statis(2, date);
		 nbrNR1+=Dao.Statis(6, date);
		 nbrNR1+=Dao.Statis(10, date);
		 nbrNR1+=Dao.Statis(14, date);
 
		 nbrNR2+=Dao.Statis(3, date);
		 nbrNR2+=Dao.Statis(7, date);
		 nbrNR2+=Dao.Statis(11, date);
		 nbrNR2+=Dao.Statis(15, date);
	 
		 nbrNR3+=Dao.Statis(4, date);
		 nbrNR3+=Dao.Statis(8, date);
		 nbrNR3+=Dao.Statis(12, date);
		 nbrNR3+=Dao.Statis(16, date);
	 
	 
	 
	
	 
	 if(nbrGlobal!=0){

     bon=(long)((nbrNR/(float)nbrGlobal)*100);
    	//	 (Long)(nbrPPS/nbrGlobal)*100;
     ////System.out.println("bon-----"+bon);	
 
     moyen=(long)((nbrNR1/(float)nbrGlobal)*100);
     ////System.out.println("moyen-----"+moyen);	
     Mediocre=(long)((nbrNR2/(float)nbrGlobal)*100);
     ////System.out.println("Mediocre-------"+Mediocre);	 
     Mauvais=(long)((nbrNR3/(float)nbrGlobal)*100);
     ////System.out.println("Mauvais-----"+Mauvais);	
	 }		  
   
    
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>(); 
map = new HashMap<Object,Object>(); map.put("label", "Niveau  Bon"); map.put("y", bon); map.put("exploded", true); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Niveau  Moyen  "); map.put("y", moyen); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Niveau  Médiocre  "); map.put("y", Mediocre); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Niveau  Mauvais  "); map.put("y", Mauvais); list.add(map);

 
dataPoints1 = gsonObj.toJson(list);
    }
 
%>



















  <%

	 String dataPoints=null; 	 
   
      int besoin=0;
      int dessus=0; 
      int adequat=0;
      int pauvre=0;
 	 
/*    if(request.getAttribute("pauvre")!=null && request.getAttribute("besoin")!=null && request.getAttribute("dessus")!=null
           && request.getAttribute("adequat")!=null){ */
	if(date!=null){
		
		 
		 Long nbrPPS=0L;
		 Long nbrPPS1=0L;
		 Long nbrPPS2=0L;
		 Long nbrPPS3=0L;

		 
	 	 
		 
			 nbrPPS+=Dao.Statis(1, date);
			 nbrPPS+=Dao.Statis(2, date);
			 nbrPPS+=Dao.Statis(3, date);
			 nbrPPS+=Dao.Statis(4, date);
		 
			 nbrPPS1+=Dao.Statis(5, date);
			 nbrPPS1+=Dao.Statis(6, date);
			 nbrPPS1+=Dao.Statis(7, date);
			 nbrPPS1+=Dao.Statis(8, date);
		  
			 nbrPPS2+=Dao.Statis(9, date);
			 nbrPPS2+=Dao.Statis(10, date);
			 nbrPPS2+=Dao.Statis(11, date);
			 nbrPPS2+=Dao.Statis(12, date);
		  
			 nbrPPS3+=Dao.Statis(13, date);
			 nbrPPS3+=Dao.Statis(14, date);
			 nbrPPS3+=Dao.Statis(15, date);
			 nbrPPS3+=Dao.Statis(16, date);
		 
		
		
			 if(nbrGlobal!=0){	
		  
     pauvre=(int)((nbrPPS/(float)nbrGlobal)*100);
     ////System.out.println("pauvre-----"+pauvre);
    		 //(Long)request.getAttribute("pauvre");
     besoin=(int)((nbrPPS1/(float)nbrGlobal)*100);
     ////System.out.println("besoin-----"+besoin);
 
     dessus=(int)((nbrPPS2/(float)nbrGlobal)*100);
     ////System.out.println("dessus-----"+dessus);
     adequat=(int)((nbrPPS3/(float)nbrGlobal)*100);
     ////System.out.println("adequat-----"+adequat);
}
    
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
//ma = new HashMap<Object,Object>(); 
if(besoin==0) besoin=0;
if(pauvre==0) pauvre=0;
if(dessus==0) dessus=0;
if(adequat==0) adequat=0;
map = new HashMap<Object,Object>(); map.put("label", "Niveau Besoin d'amélioration"); map.put("y", besoin); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Niveau  Au-dessus de la normale  "); map.put("y",dessus); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Niveau  Pauvre"); map.put("y", pauvre); list.add(map);
 
map = new HashMap<Object,Object>(); map.put("label", "Niveau  Adéquat, Standard	"); map.put("y", adequat ); list.add(map);


/* 
ma = new HashMap<Object,Object>(); ma.put("label", "Niveau Besoin d'amélioration"); ma.put("y", besoin); lis.add(ma);
ma = new HashMap<Object,Object>(); ma.put("label", "Niveau  Au-dessus de la normale"); ma.put("y", dessus); lis.add(ma);
ma = new HashMap<Object,Object>();ma.put("label", "Niveau  Pauvre"); ma.put("y", pauvre); lis.add(ma);
ma = new HashMap<Object,Object>(); ma.put("label", "Niveau  Adéquat, Standard	"); ma.put("y", adequat); lis.add(ma); */

 
dataPoints = gsonObj.toJson(list);
   }

%>  


<!doctype html>
<html lang="fr">
   
<head>
<title>RMA</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet"
	href="assets/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/vendor/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/vendor/linearicons/style.css">
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
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<%
       request.setCharacterEncoding("UTF-8");
       out.print(request.getParameter("mydata"));
       HttpSession sission=request.getSession();
     %>
</head>


<body
	<% if(sission.getAttribute("Urldoss")!=null){ out.print("class='layout-fullwidth' "); } %>>
	<!-- WRAPPER -->
<% 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date actuale  = new Date();
Date obso= (Date) sdf.parse("2019-10-3");
	sdf.format(actuale);

	 
	 if (actuale.after(obso))  
		 throw new ex("la version est obsolete");      %>

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
			 
						<li><a href="index.jsp" class=" "><i
								class=" lnr lnr-layers "></i> <span>Espace
									d'Evaluation</span></a></li>
						<li><a href="tables.jsp" class="active"><i class="lnr lnr-database"></i>
								<span>Consultation des rapports</span></a></li>
							 
									<li><a href="recommandation.jsp" class=""><i class="lnr lnr-book"></i>
								<span class=".lead">Rapport de prévention </span></a></li>
									<% User u=null;
									if(session.getAttribute("user")!=null)
										  u=(User)session.getAttribute("user");
										//if(  u==null)  response.sendRedirect("login.jsp");
									
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
				<div class="container-fluid">

					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">consultation</h3>
							<p class="panel-subtitle">les informations de la base des
								données des rapports réaliser</p>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button>
							</div>
						</div>
						<div class="panel-body">

							<div class="row">
 
								<div class="col-md-12">
									<div class="col-md-3"></div>
									<div class="col-md-6">
										<h2 class="text-center">Chercher</h2>
										<p class="text-center">Tapez quelque chose dans ce champ   pour filtrer les résultats</p>
										<input class="form-control" id="myInput" type="text"
											placeholder="Search.."> <br>
									</div>
									<table class="table table-bordered">
										<thead>

											<%ArrayList<String> pp=new ArrayList<String>();
											String MESS="vous n'avez pas terminer la redaction de votre rapport" ;							 											
pp.add("Pauvre");
pp.add("Besoin d'amélioration");
pp.add("Adéquat, Standard");
pp.add("Au-dessus de la normale");

ArrayList<String> NR=new ArrayList<String>();

NR.add("bon");
NR.add("Moyen");
NR.add("Médiocre");
NR.add("Mauvais");
String pps="";
String nr="";

%>
											<tr>
												<th>id</th>
												<th>Numero de police</th>
												<th>le nom de raison social</th>

												<th>date de Visite</th>

												<th>Capital</th>
												<th>Famille d’activité</th>
												<th>-Niveau de Prévention Protection et de Risque</th>
												<th>Adresse</th>
												<th>Url de document</th>

											</tr>
										</thead>
										<tbody id="myTable">
											<%ArrayList<Document> lista=new ArrayList<Document>();
										 
										lista=Dao.getAllDocuemnt();
									 
										for(Document doc:lista){
											int val=doc.getNbrRe();
									 
										 if(val==1||val==2||val==3||val==4)
											 pps=pp.get(0);
										 if(val==5||val==6||val==7||val==8)
											 pps=pp.get(1);
										 if(val==9||val==10||val==11||val==12)
											 pps=pp.get(2);
										 if(val==13||val==14||val==15||val==16)
											 pps=pp.get(3);
										 
										 if(val==1||val==5||val==9||val==13)
											 nr=NR.get(0);
										 if(val==2||val==6||val==10||val==14)
											 nr=NR.get(1);
										 if(val==3||val==7||val==11||val==15)
											 nr=NR.get(2);
										 if(val==4||val==8||val==12||val==16)
											 nr=NR.get(3);
										 nr=" - "+nr;
										 pps="- "+pps;
										 if(val==0) {pps="****"+MESS+"****"; nr="";}
									
										%>
											<tr>
												<td><%=doc.getIdDoc() %></td>
												<td><%=doc.getNumPolice() %></td>
												<td><%=doc.getNom_entreprise() %></td>


												<td><%=doc.getDate_Viste() %></td>
												<td><%=doc.getCapitale() %></td>
												<td><%=doc.getActivite()%></td>
												<td style="color:Maroon;"><%=pps%><br><%=nr%></td>
												<td><%=doc.getAdresse() %></td>
												<td><%=doc.getUrl_Doc() %></td>


											</tr>
											<%}%>

										</tbody>
									</table>
								</div>


							</div>

						</div>
					</div>
				</div>


			
					<div class="container-fluid">

						<div class="panel panel-headline">
							<div class="panel-heading">
								<h3 class="panel-title"> Statistique </h3>
								<p class="panel-subtitle">
							Analyse et statistique en se basons sur le niveau de risque et  de Prévention Protection
								</p>
								<div class="right">
									<button type="button" class="btn-toggle-collapse">
										<i class="lnr lnr-chevron-up"></i>
									</button>
									<button type="button" class="btn-remove">
										<i class="lnr lnr-cross"></i>
									</button>
								</div>
							</div>
							<div class="panel-body">

								<div class="row">
	<form action="#" method="get">
 <div class="col-md-12  " >
  <div class="col-md-4" ></div>
   <div class="col-md-4" >
 
<label>La date des Statistiques </label>
<div class="input-group"> 
										<input class="date-own form-control" type="text"  name="date" placeholder="L'année de statistique">
										<span class="input-group-btn"> <button type="submit"   class="btn btn-primary" >chercher!</button>  </span>
</div>

<br><br>
</div>
 <div class="col-md-12" >
 <% if(bon==0 && moyen==0 && Mediocre==0 && Mauvais==0 ){%>
    <%  if(request.getParameter("date") !=null) { %>
                                                     <div class="alert alert-warning alert-dismissible" >

          <center><strong>Désolé!</strong> y a pas des statistiques enrgistrées pour cette l'année <%=request.getParameter("date") %>
          <%}%>
          </center></div>
  <% } %></div>
  <div class="col-md-4" > 
  
  
  
  
  
  
  
  
  
  </div>
</div>  
	</form>









<div id="chartContainer2" style="width: 100%; height: 400px;display: inline-block;">
  <br><br><br>  </div><br>
    <br>
     <%  if(pauvre==0 && besoin==0 && adequat==0 && dessus==0   ){%>
                <%  if(request.getAttribute("date") !=null) { %>
                                                     <div class="alert alert-warning alert-dismissible" >

          <center><strong>Désolé!</strong> y a pas des statistiques enrgistrées pour cette l'année <%=request.getAttribute("date") %><%}%>
           .</center>
  </div>
     <%  
    }%> 
	<div id="chartContainer1" style="height: 370px; width: 100%;"></div>
	
	
	
	
	
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                                                  


									 
								</div>


							</div>
						</div>
					</div>
			

			</div>

<!-- 			<form action="RMA" method="get">
				<div class="container-fluid">

					<div class="panel panel-headline">
						<div class="panel-heading">
						<h3 class="panel-title"> Statistique </h3>
								<p class="panel-subtitle">
							Analyse et statistique en se basons sur le  Niveau de Prévention Protection
								</p>
							<div class="right">
								<button type="button" class="btn-toggle-collapse">
									<i class="lnr lnr-chevron-up"></i>
								</button>
								<button type="button" class="btn-remove">
									<i class="lnr lnr-cross"></i>
								</button>
							</div>
						</div>
						<div class="panel-body">

							<div class="row">

 
							</div>

						</div>
					</div>
				</div>
			</form> -->












		</div>
		<!-- END MAIN -->
		<div class="clearfix"></div>
			<footer>
			<div class="container-fluid">
				<p class="copyright">&copy; 2019/2020 <a href="https://www.rmaassurance.com" target="_blank">RMA Assurance</a>.
Tous les droits sont réservés.</p>
			</div>
		</footer>
	</div>

<script type="text/javascript">
 
 
var chart = new CanvasJS.Chart("chartContainer2", {
	theme: "light2",
	animationEnabled: true,
	exportFileName: "percentage des Niveaux  de Risque",
	exportEnabled: true,
 
	
	title: {
		text: "Les Niveaux  de Risque"
	},
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}%</strong>",
		indexLabel: "{label} {y}%",
		dataPoints : <%out.print(dataPoints1);%>
	}]
});
 
chart.render();

 




  
	 
	var chart = new CanvasJS.Chart("chartContainer1", {
		animationEnabled: true,
		theme: "light1", // "light1", "dark1", "dark2"
		title: {
			text: "     Les Niveaux  Prévention Protection "
		},
		subtitles: [{
			text: "le percentage de chaque  Niveau  ",
			fontSize: 16
		}],
		axisY: {
	/*   	scaleBreaks: {
				type: "wavy",
				autoCalculate: true
			} */  
		},
		data: [{
			type: "column",
			indexLabel: "{y}",
			dataPoints : <%out.print(dataPoints);%>
		}]
	});
	chart.render();
	 
	 
</script>


	
	  <script type="text/javascript">
      $('.date-own').datepicker({
         minViewMode: 2,
         format: 'yyyy'
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
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
		<!-- <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>    -->
</body>

</html>
