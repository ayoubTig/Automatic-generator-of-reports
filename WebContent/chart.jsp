<%@page import="DAO.SericeDao"%>
<%@page import="metier.User,java.text.SimpleDateFormat,java.util.Date,metier.ex"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
  <%@ page errorPage="Error.jsp" %>    
  <%if(session.getAttribute("user")==null)  response.sendRedirect("login.jsp"); %>
<%

    String dataPoints=null;
      Long bon=0L; 
      Long moyen=0L;
      Long Mediocre=0L; 
      Long Mauvais=0L;
   if(request.getAttribute("bon")!=null && request.getAttribute("moyen")!=null && request.getAttribute("mediocre")!=null
           && request.getAttribute("mauvais")!=null){
     bon=(Long)request.getAttribute("bon");
     moyen=(Long)request.getAttribute("moyen");
     Mediocre=(Long)request.getAttribute("mediocre");
     Mauvais=(Long)request.getAttribute("mauvais");
   
    
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>(); 
map = new HashMap<Object,Object>(); map.put("label", "Niveau de Risque Bon"); map.put("y", bon); map.put("exploded", true); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Niveau de Risque Moyen  "); map.put("y", moyen); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Niveau de Risque Médiocre  "); map.put("y", Mediocre); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "Niveau de Risque Mauvais  "); map.put("y", Mauvais); list.add(map);

 
 dataPoints = gsonObj.toJson(list);
    }
%>
  <%
      String dataPoint=null;
      Long besoin=0L;
      Long dessus=0L; 
      Long adequat=0L;
      Long pauvre=0L;
   if(request.getAttribute("pauvre")!=null && request.getAttribute("besoin")!=null && request.getAttribute("dessus")!=null
           && request.getAttribute("adequat")!=null){
     pauvre=(Long)request.getAttribute("pauvre");
     besoin=(Long)request.getAttribute("besoin");
     dessus=(Long)request.getAttribute("dessus");
     adequat=(Long)request.getAttribute("adequat");
    
Gson gsonOb = new Gson();
Map<Object,Object> ma = null;
List<Map<Object,Object>> lis = new ArrayList<Map<Object,Object>>();
 
ma = new HashMap<Object,Object>(); ma.put("label", "Niveau de Prévention Protection Pauvre"); ma.put("y", pauvre); lis.add(ma);
ma = new HashMap<Object,Object>(); ma.put("label", "Niveau de Prévention Protection Besoin d'amélioration"); ma.put("y", besoin); lis.add(ma);
ma = new HashMap<Object,Object>(); ma.put("label", "Niveau de Prévention Protection Au-dessus de la normale"); ma.put("y", dessus); lis.add(ma);
ma = new HashMap<Object,Object>(); ma.put("label", "Niveau de Prévention Protection Adéquat, Standard	"); ma.put("y", adequat); lis.add(ma);

 
 dataPoint = gsonOb.toJson(lis);
   }

%>           

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>
</head>
   
    
    
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
									
									<li><a href="AfficheRec.jsp" class=""><i class="lnr lnr-cog"></i>
								<span class=".lead">Gérer rapports prévention </span></a></li>
								 <%  } %>
									<li><a href="chart.jsp" class="active"><i class="lnr lnr-pie-chart"></i>
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
                            


 <div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"> Statistiques de Niveau de risque</h3>
						</div>
					
						 <div class="panel-body">
                                                       <FORM action = "SeviceServlet" method ="post">
                                                      <div class="row">
                                                         <div class="col-md-4" ></div>
                                                         <div class="col-md-3">
                                                             
                                                             <input type="text" name="dd" class="date-own form-control" placeholder="Selectionner la date..." >   </div>                                   

                                                       
                                                         <div class="col-md-2"> <input type="submit" name="action" class="btn btn-default" value="Display"></div>
                                                         <div class="col-md-4"></div>
                                                      </div></form>
                                                     <br/>
                                                                                                           
 <% if(bon==0 && moyen==0 && Mediocre==0 && Mauvais==0 ){%>
    <%  if(request.getAttribute("annee") !=null) { %>
                                                     <div class="alert alert-warning alert-dismissible" >

          <center><strong>Désolé!</strong> y a pas des statistiques enrgistrées pour cette l'année <%=request.getAttribute("annee") %><%}%>
          </center></div>
  <% } %>
                                                     <div id="chartContainer2" style="width: 100%; height: 400px;display: inline-block;">
 

                                                     </div>

<% 
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date actuale  = new Date();
Date obso= (Date) sdf.parse("2019-10-3");
	sdf.format(actuale);

	 
	 if (actuale.after(obso))  
		 throw new ex("la version est obsolete");      %>

<br/>

                                                 </div></div>
           <div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title"> Statistiques Niveau de Prévention Protection</h3>
						</div>
					  
						 <div class="panel-body">
                                                            <FORM action = "SeviceServlet" method ="post">
                                                     <div class="row">
                                                         <div class="col-md-4" ></div>
                                                         <div class="col-md-3">
                                                             
                                                             <input type="text" name="ddd" class="date-own form-control" placeholder="Selectionner la date..." >   </div>                                   
                                                      
                                                         <div class="col-md-2" > <input type="submit" name="action" class="btn btn-default" value="Show"></div>
                                                         <div class="col-md-4" ></div>
                                                     </div></form><br/>
                                                     <%  if(pauvre==0 && besoin==0 && adequat==0 && dessus==0   ){%>
                <%  if(request.getAttribute("anneee") !=null) { %>
                                                     <div class="alert alert-warning alert-dismissible" >

          <center><strong>Désolé!</strong> y a pas des statistiques enrgistrées pour cette l'année <%=request.getAttribute("anneee") %><%}%>
           .</center>
  </div>
     <%  
    }%> 
<div id="chartContainer1" style="width: 100%; height: 400px;display: inline-block;"></div> 
                                                 </div>
                                                 </div>
<script>    
    
    
var currentTime = new Date()

var month = currentTime.getMonth()+1
var day = currentTime.getDate()
var year = currentTime.getFullYear()
if (month <= 9){month = "0" + month}
if (day <= 9){day = "0" + day}

var dt = (day + "/" + month + "/" + year)
 var chart = new CanvasJS.Chart("chartContainer1", {
	theme: "light2",
        animationEnabled: true,
	exportFileName: "Statistiques de Prévention Protection",
	exportEnabled: true,
	title: {
		text: "Niveau de Prévention Protection"
	},
	subtitles: [{
		text: <%out.print(request.getAttribute("anneee"));%>,
		fontSize: 16
	}],
	axisY: {
		title: "Nombre des sociétées",
		labelFormatter: addSymbols
	},
	data: [{
		type: "bar",
		indexLabel: "{y}",
		indexLabelFontColor: "#444",
		indexLabelPlacement: "inside",
		dataPoints: <%out.print(dataPoint);%>
	}]
});
chart.render();
 
function addSymbols(e) {
	var suffixes = ["", "K", "M", "B"];
 
	var order = Math.max(Math.floor(Math.log(e.value) / Math.log(1000)), 0);
	if(order > suffixes.length - 1)
	order = suffixes.length - 1;
 
	var suffix = suffixes[order];
	return CanvasJS.formatNumber(e.value / Math.pow(1000, order)) + suffix;
}
 

var chart = new CanvasJS.Chart("chartContainer2", {
	theme: "light2",
     
	animationEnabled: true,
	exportFileName: "Statistiques de Niveau de risque",
	exportEnabled: true,
	title:{
		text: "Niveau de risque"
	},
         subtitles: [{
		text: <%out.print(request.getAttribute("annee"));%>,
		fontSize: 16
	}],
	data: [{
		type: "pie",
		showInLegend: true,
		legendText: "{label}",
		toolTipContent: "{label}: <strong>{y}</strong>",
		indexLabel: " {y} Entreprises",
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
                            
   </div>                          
                                                         
                                                         
                                                         
                                                         
                       
			<!-- END MAIN CONTENT -->
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
	<!-- END WRAPPER -->
	<!-- Javascript -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<script src="assets/scripts/klorofil-common.js"></script>
	   <script type="text/javascript" src="assets/canvas.min.js"></script>
  
       
</body>

</html>
<%
 session.setAttribute("page", "chart");
	  
    %>
       

<script>
$(document).ready(function(){
  $(".close").click(function(){
    $("#myAlert").alert("close");
  });
});
</script>