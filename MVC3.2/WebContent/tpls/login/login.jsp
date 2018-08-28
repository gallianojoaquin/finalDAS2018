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
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Login - PICOkm</title>
  <!-- Bootstrap core CSS-->
  <link href="../../css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="../../fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template-->
  <link href="../../css/sb-admin.css" rel="stylesheet">
</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header"><fmt:message key="ingresar" bundle="${etq}"/></div>
      <div class="card-body">
        <form>
	       	<%-- <div class="form-group">
	            <label for="exampleInputEmail1"><fmt:message key="documento" bundle="${etq}"/></label>
	            <input class="form-control" id="txtTipoDocumento" type="text" placeholder="Tipo Documento">
	         </div> --%>
	          <div class="form-group">
	            <label for="txtUsuario"><fmt:message key="usuario" bundle="${etq}"/></label>
	            <input class="form-control" id="txtUsuario" type="text" placeholder="Usuario">
	          </div>
	         <div class="form-group">
	           <label for="txtPassword"><fmt:message key="clave" bundle="${etq}"/></label>
	           <input class="form-control" id="txtPassword" type="password" placeholder="Password">
	         </div>
	         <%-- <div class="form-check">
			    <label class="form-check-label">
			      <input type="checkbox" class="form-check-input" id="chkAdmin" name="chkAdmin"	>
			      <fmt:message key="chkAdmin" bundle="${etq}"/>
			    </label>
			  </div> --%>
          <a class="btn btn-primary btn-block" href="#" onclick="jLogin.validar();"><fmt:message key="ingresar" bundle="${etq}"/></a>
        </form>
      </div>
      <div id="error" style="text-align:center; color:red;">
      </div>
    </div>
  </div>
  <input type="hidden" id="lang" value="${lang}">
  <!-- Bootstrap core JavaScript-->
  <script src="../../js/jquery.min.js"></script>
  <script src="../../js/popper.min.js"></script>
  <script src="../../js/bootstrap.min.js"></script>
  <script src="../../js/utils.js"></script> <!-- jquery de la pagina -->
  <script src="../../js/login.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="../../js/jquery.easing.min.js"></script>
</body>

</html>
