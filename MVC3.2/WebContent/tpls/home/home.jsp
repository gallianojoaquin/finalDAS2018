<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="lang" value="${lang}"/>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etq" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="../img/logo.ico">

<title>
	<c:forEach var="home" items="${requestScope.home}">
		${home.titulo}
	</c:forEach>
</title>

<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/main.css">
<link rel="stylesheet" href="../../css/icomoon.css">
<link rel="stylesheet" href="../../css/animate-custom.css" >

	<link rel="stylesheet" href="../../css/footer-distributed-with-address-and-phones.css">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">


<script type="text/javascript" src="../../js/jquery.min.js"></script>
<script type="text/javascript" src="../../js/modernizr.custom.js"></script>

</head>
<body>
<body data-spy="scroll" data-offset="0" data-target="#navbar-main">


	<div id="navbar-main">
		<!-- Fixed navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="container" >
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-collapse">
						<span class="icon icon-shield"
							style="font-size: 30px; color: #3498db;"></span>
					</button>
					<a class="navbar-brand hidden-xs hidden-sm"><span
						class="icon icon-shield" style="font-size: 18px; color: #3498db;"></span></a>
				</div>
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a href="#home" class="smoothScroll"><fmt:message key="inicio" bundle="${etq}"/></a></li>
						<li><a href="#planes" class="smoothScroll"><fmt:message key="planes" bundle="${etq}"/></a></li>
						<li><a href="#novedades" class="smoothScroll"><fmt:message key="novedades" bundle="${etq}"/></a></li>
						<li><a href="#noticias" class="smoothScroll"><fmt:message key="noticias" bundle="${etq}"/></a></li>
						<li><a href="#ganadores" class="smoothScroll"><fmt:message key="ganador" bundle="${etq}"/></a></li>
						<li><a href="#contacto" class="smoothScroll"><fmt:message key="contacto" bundle="${etq}"/></a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li><a href="/admin/Login.do?lang=<c:out value="${lang}"/>" class="smoothScroll"><fmt:message key="ingresar" bundle="${etq}"/></a></li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li role="presentation" class="dropdown"><a
							class="dropdown-toggle" data-toggle="dropdown" href="#"
							role="button" aria-haspopup="true" aria-expanded="false">
								<fmt:message key="idioma" bundle="${etq}"/><span class="caret"></span>
						</a>
							<ul class="dropdown-menu">
								<li><a href="/admin/Home.do?lang=es" class="smoothScroll">Espa&ntilde;ol</a></li>
								<li><a href="/admin/Home.do?lang=en" class="smoothScroll">English</a></li>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>



	<!-- ==== HEADERWRAP ==== -->
	<div id="headerwrap">
		<header class="clearfix" id="home">
			<h1>
				<span class="icon"><img alt="Logo Nacional" src="../img/logo.png"> </span>
			</h1>
			<p>	
				<c:forEach var="home" items="${requestScope.home}">
					${home.titulo}
				</c:forEach>
			</p>
		</header>
	</div>
	<!-- /headerwrap -->

	<!-- ==== GREYWRAP ==== -->
	<div id="greywrap">
		<div class="row">
			<div class="col-lg-4 callout">
				<span class="icon glyphicon glyphicon-gift"></span>
				<h2><fmt:message key="ultimoganador" bundle="${etq}"/></h2>				
				
				<p>UTLIMO GANADOR</p>
			</div>
			<!-- col-lg-4 -->

			<div class="col-lg-4 callout">
				<span class="icon glyphicon glyphicon-bullhorn"></span>
				<h2><fmt:message key="proximosorteo" bundle="${etq}"/></h2>
				<p>	
					<c:forEach var="home" items="${requestScope.home}">
						${home.sorteo}
					</c:forEach>
				</p>
			</div>
			<!-- col-lg-4 -->

			<div class="col-lg-4 callout">
				<span class="icon glyphicon glyphicon-flash"></span>
				<h2><fmt:message key="avisos" bundle="${etq}"/></h2>
				<p>
					<c:forEach var="home" items="${requestScope.home}">
						${home.aviso}
					</c:forEach>
				</p>
			</div>
			<!-- col-lg-4 -->
		</div>
		<!-- row -->
	</div>
	<!-- greywrap -->

	<!-- ==== PLANES ==== -->
	<div class="container" id="planes">
	<div class="row white"><br> <br></div>
		<div class="row white">
			<br>
			<h1 class="centered" id="titPlanes"><fmt:message key="info" bundle="${etq}"/></h1>
			<hr>
			<div class="col-lg-12">			
				<p>
					<c:forEach var="home" items="${requestScope.home}">
						${home.informacion}
					</c:forEach>
				</p>
			</div>
		</div>		
	</div>
	
	
	
	<section class="section-divider textdivider divider1" id="novedades">
		<div class="row white"><br></div>
	
		<div class="container" id="divNovedades">
	<div class="row white"><br> <br></div>
		<div class="row white">
			<br>
			<h1 class="centered" id="titNovedades"><fmt:message key="novedades2" bundle="${etq}"/></h1>
			<hr>
			<div class="col-lg-12">			
				<p>
					<c:forEach var="home" items="${requestScope.home}">
						${home.novedad}
					</c:forEach>
				</p>
			</div>
		</div>		
	</div>
	<br>
	<br>
	</section>
	
		<section class="section-divider textdivider divider1" id="noticias">
		<div class="row white"><br></div>
	
		<div class="container" id="divNoticias">
	<div class="row white"><br> <br></div>
		<div class="row white">
			<br>
			<h1 class="centered" id="titNoticias"><fmt:message key="noticias2" bundle="${etq}"/></h1>
			<hr>
			<div class="col-lg-12 centered">
				<br>
				<h4>
					<b><fmt:message key="noticias2" bundle="${etq}"/></b>
				</h4>
				<a href="#" class="icon icon-twitter"></a> <a href="#"
					class="icon icon-facebook"></a> <a href="#"
					class="icon icon-flickr"></a>
				<p>
					<c:forEach var="home" items="${requestScope.home}">
						${home.noticiaPrincipal}
					</c:forEach>
				</p>
			</div>
		</div>		
	</div>
	<br>
	<br>
	</section>

	
	<section class="section-divider textdivider divider1" id="ganadores">
		<div class="row white"><br></div>
	
		<div class="container" id="divGanadores">
	<div class="row white"><br> <br></div>
		<div class="row white">
			<br>
			<h1 class="centered" id="titGanadores"><fmt:message key="ganadores" bundle="${etq}"/></h1>
			<hr>
			<div class="col-lg-12">			
				<p>
					<c:forEach var="ganadores" items="${requestScope.ganadores}">
						${ganadores.cliente}
						<br>
					</c:forEach>
				</p>
			</div>
		</div>		
	</div>
	<br>
	<br>
	</section>


<br>
<br>
<br>
<br>

		<footer class="footer-distributed" id="contacto">

			<div class="footer-left">

				<h3>PICO<span>km</span></h3>

			</div>

			<div class="footer-center">

				<div>
					<i class="fa fa-map-marker"></i>
					<p><span>9 de julio 662</span>Bs As, Argentina</p>
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+54 011 5246789</p>
				</div>

				<div>
					<i class="fa fa-envelope"></i>
					<p><a href="mailto:support@company.com">informacion@picokm.com</a></p>
				</div>

			</div>

			<div class="footer-right">

				<p class="footer-company-about">
					<span><fmt:message key="acercaplan" bundle="${etq}"/></span>
					<fmt:message key="descacercaplan" bundle="${etq}"/> 
				</p>

				<div class="footer-icons">

					<a href="#"><i class="fa fa-facebook"></i></a>
					<a href="#"><i class="fa fa-twitter"></i></a>
					<a href="#"><i class="fa fa-linkedin"></i></a>

				</div>

			</div>
		</footer>
		<footer id="duxin">

				<fmt:message key="duxin" bundle="${etq}"/>

		</footer>

	<script src="../../js/popper.min.js"></script>
	<script type="text/javascript" src="../../js/bootstrap.min.js"></script>
	<script type="text/javascript" src="../../js/retina.js"></script>
	<script type="text/javascript" src="../../js/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="../../js/smoothscroll.js"></script>
	<script type="text/javascript" src="../../js/jquery-func.js"></script>
</body>
</html>