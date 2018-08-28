<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="lang" value="${lang}"/>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etq" scope="session"/>
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etqSalir" scope="session"/>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>PICOkm</title>
  <!-- Bootstrap core CSS-->
  <link href="../../bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="../../css/sb-admin.css" rel="stylesheet">
  <!-- Bootstrap for datatables -->
  <link href="../../datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <link href="../../datatables/bootstrapDataTables.css" rel="stylesheet">
  <!-- Bootstrap for calendar -->
  <link href="../../css-calendar/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" style="font-size:30px;" href="/admin/Home.do">PICOkm</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
      	<li class="nav-item" style="font-size:14px;">
       		<a class="nav-link" id="liFechas" onclick="jAdmin.resumen();" >
         		<i class="glyphicon glyphicon-scale"></i>
         		<span class="nav-link-text"><fmt:message key="resumen" bundle="${etq}"/></span>		
       		</a>       		
     	</li>
        <li class="nav-item" style="font-size:14px;" data-toggle="tooltip" data-placement="right" title="Datos personales">
          <a class="nav-link" href="#" onclick="jAdmin.aceptadas();">
            <i class="fa fa-address-card-o"></i>
            <span class="nav-link-text" ><fmt:message key="config_concesionarias" bundle="${etq}"/></span>
          </a>
        </li>        
		<li class="nav-item" style="font-size:14px;">
       		<a class="nav-link" id="liFechas" onclick="jAdmin.obtenerFechas();" >
         		<i class="fa fa-fw fa-wrench"></i>
         		<span class="nav-link-text"><fmt:message key="sorteo" bundle="${etq}"/></span>		
       		</a>       		
     	</li>
     	<li class="nav-item" style="font-size:14px;">
       		<a class="nav-link" id="liFechas" onclick="jAdmin.detalleSorteos();" >
         		<i class="fa fa-fw fa-wrench"></i>
         		<span class="nav-link-text"><fmt:message key="detalle_sorteos" bundle="${etq}"/></span>		
       		</a>       		
     	</li>
     	<li class="nav-item" style="font-size:14px;">
       		<a class="nav-link" id="liNominaClientes" onclick="jAdmin.listarClientes();" >
         		<i class="glyphicon glyphicon-user"></i>
         		<span class="nav-link-text"><fmt:message key="detalle_cuentas_clientes" bundle="${etq}"/></span>		
       		</a>       		
     	</li>
      </ul>	  
		<ul class="navbar-nav ml-auto">
			
		</ul>
      <ul class="navbar-nav ml-auto">
		<li role="presentation" class="dropdown nav-item">			
			<a class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="font-size:14px;">
				<span class="glyphicon glyphicon-globe"></span>&nbsp;
				<fmt:message key="idioma" bundle="${etq}"/>
				<span class="caret"></span>
			</a>
			<ul class="dropdown-menu">
				<li><a href="/admin/Dashboard.do?lang=es" class="smoothScroll">Espa&ntilde;ol</a></li>
				<li><a href="/admin/Dashboard.do?lang=en" class="smoothScroll">English</a></li>
			</ul>
		</li>       
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal" style="font-size:14px;">
            <i class="fa fa-fw fa-sign-out"></i><fmt:message key="salir" bundle="${etq}"/></a>
        </li>
      </ul>
	  
    </div>
  </nav>
  <div class="content-wrapper">
    <div class="container-fluid">
      <div  id="divCentral"></div> <!-- muestro el resultado -->
    </div>
    
    <div id="message"></div> <!-- div para mostrar mensaje de error -->
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright - DuxinSoft 2017</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>   
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel"><fmt:message key="tituloMensajeSalir" bundle="${etqSalir}"/></h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body"><fmt:message key="mensajeSalir" bundle="${etqSalir}"/></div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal"><fmt:message key="cancelar" bundle="${etqSalir}"/></button>
            <a class="btn btn-primary" href="/admin/Login.do"><fmt:message key="salir" bundle="${etqSalir}"/></a>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Bootstrap core JavaScript-->
    <script src="../../jquery/jquery.min.js"></script>
    <script src="../../popper/popper.min.js"></script>
    <script src="../../bootstrap-3.3.7/js/bootstrap.min.js"></script>
    <!-- Bootstrap javascript for datatables -->
    <script src="../../datatables/jquery.dataTables.js"></script>
    <script src="../../datatables/dataTables.bootstrap4.js"></script>
        
    <!-- Core plugin JavaScript-->
    <script src="../../jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="../../jquery/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <!-- Toggle between fixed and static navbar-->
    
    <script src="../../js/utils.js"></script> <!-- jquery de la pagina -->
    <script src="../../js/Admin.js"></script> <!-- jquery de la pagina -->
    
    <script type="text/javascript" src="../../js-calendar/bootstrap-datetimepicker.js" charset="UTF-8"></script>
	<script type="text/javascript" src="../../js-calendar/locales/bootstrap-datetimepicker.es.js" charset="UTF-8"></script>

  </div>
</body>
<script>
		$(document).ready(function() {
			jAdmin.resumen();
		} );
</script>
</html>
