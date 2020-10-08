<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.io.*" %>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">

<title>ERROR</title>
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">

</head>
<body>
	<style>
body { background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABZ0RVh0Q3JlYXRpb24gVGltZQAxMC8yOS8xMiKqq3kAAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzVxteM2AAABHklEQVRIib2Vyw6EIAxFW5idr///Qx9sfG3pLEyJ3tAwi5EmBqRo7vHawiEEERHS6x7MTMxMVv6+z3tPMUYSkfTM/R0fEaG2bbMv+Gc4nZzn+dN4HAcREa3r+hi3bcuu68jLskhVIlW073tWaYlQ9+F9IpqmSfq+fwskhdO/AwmUTJXrOuaRQNeRkOd5lq7rXmS5InmERKoER/QMvUAPlZDHcZRhGN4CSeGY+aHMqgcks5RrHv/eeh455x5KrMq2yHQdibDO6ncG/KZWL7M8xDyS1/MIO0NJqdULLS81X6/X6aR0nqBSJcPeZnlZrzN477NKURn2Nus8sjzmEII0TfMiyxUuxphVWjpJkbx0btUnshRihVv70Bv8ItXq6Asoi/ZiCbU6YgAAAABJRU5ErkJggg==);}
  .error-template {padding: 40px 15px;text-align: center;}  
  .error-actions {margin-top:15px;margin-bottom:15px;} 
  .error-actions .btn { margin-right:10px; }  
</style>



















 

					 

<div class="container">
    <div class="row">
      
            <div class="error-template">
                <h1>
                    Oops!</h1>
                <h2 style="color: red;">
                    ERREUR a été déclenché .
</h2>
                <div class="error-details">
                  Ces indications vont vous aider à résoudre cette exception :
               <div class="col-md-12">
                  <div class="col-md-3"></div>
          
                  <div class="col-md-6">  
                   <ul class="list-group">
  <li class="list-group-item">Assurez-vous que le moteur de gestion de base de données est lancé </li>
  <li class="list-group-item">Assurez-vous que le document à remplir a été fermé </li>
  <li class="list-group-item">Assurez-vous que le chemin de dossier des fichiers (images, fichier Docs, ...) sont justes  </li>

  
  </ul>
  
    <div class="ROW">
           <div class="col-md-12">
             
                    <a href="home.jsp" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-home"></span>
                        Page d'accueil   </a> &nbsp;&nbsp;&nbsp;&nbsp;<a href="contact.jsp" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-envelope"></span> Contact Support </a>
           </div>
            </div>
   </div> 
  
  
  
  <div class="col-md-3"></div>
       
         <br>
        </div>
        
     <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
Message:
<%=exception.getMessage()%>

StackTrace:
<%
	StringWriter stringWriter = new StringWriter();
	PrintWriter printWriter = new PrintWriter(stringWriter);
	exception.printStackTrace(printWriter);
	out.println(stringWriter);
	printWriter.close();
	stringWriter.close();
%>       
 
                
      
        <br></div>
      
         </div>
    </div>
</div>
 













 
	<!-- Error Page -->
	 
</body>
</html>