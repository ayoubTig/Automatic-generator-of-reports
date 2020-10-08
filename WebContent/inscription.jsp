
  <%@ page errorPage="Error.jsp" %>   
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html>
<html lang="en" class="fullscreen-bg">

<head>
<title>Login | se connecter à RMA ASSURENCE APPLICATION</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- VENDOR CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
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
</head>

<body>
	<%	request.getSession().removeAttribute("user"); %>
	<%HttpSession sission=request.getSession(); %>
	<!-- WRAPPER -->
	<div id="wrapper">
		<div class="vertical-align-wrap">
			<div class="vertical-align-middle">
				<div class="auth-box ">
					<div class="left">
						<div class="content">
							<div class="header">
								<div class="logo text-center">
									<img src="assets/img/logo_front.png" alt="Klorofil Logo">
								</div>
								<p class="lead">Sign up</p>
								<%if( sission.getAttribute("erreur_Mot_pass")!=null){ out.print("<h3 Style='color:red;'>"+(String)sission.getAttribute("erreur_Mot_pass")+"</h3>");}%>
							</div>
							<form class="form-auth-small" action="RMA2" method="post">
								<div class="form-group">
									<label for="signin-email" class="control-label sr-only">Nom
										Complet</label> <input type="text" name="nom" class="form-control"
										id="signin-email" placeholder="Nom complet">
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">Email</label>
									<input type="email" name="email" class="form-control"
										id="signin-password" placeholder="ayoub.gold@domain.com">
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">Password</label>
									<input type="password" name="pass" class="form-control"
										id="signin-password" placeholder="Password">
								</div>
								<div class="form-group">
									<label for="signin-password" class="control-label sr-only">confirm
										password</label> <input type="password" name="Confpass"
										class="form-control" id="signin-password"
										placeholder="Confirm Password">
								</div>
<div class="form-group">
								<label class="radio-inline"><input type="radio" name="ad" value="admin" checked>Administrateur</label>
<label class="radio-inline"><input type="radio" value="user" name="ad">Utilisateur</label></div>
								<button type="submit" name="login" value="login1"
									class="btn btn-primary btn-lg btn-block">S'inscrire</button>
								<div class="bottom">
									<span class="helper-text"><i class="fa fa-lock"></i> <a
										href="login.jsp"> remplire le formulaire pour inscrire<!-- Vous n'avez pas un compte?demander à la admine de vous  Inscrire -->
									</a></span>
								</div>
							</form>
						</div>
					</div>
					<div class="right">
						<div class="overlay"></div>
						<div class="content text">
							<h3 class="heading">
								Merci de s'inscrire pour continuer... <br />
								<br />
							</h3>
							<p>RMA ASSURENCE</p>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- END WRAPPER -->
</body>

</html>

</html>
<% session.setAttribute("page", "inscrire");
	  
    %>
