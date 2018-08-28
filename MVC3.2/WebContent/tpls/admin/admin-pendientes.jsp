<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="lang" value="${lang}"/>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etq" scope="session"/>

<!-- DataTable Pendientes-->
<div class="card mb-3">
	<div class="card-header">
	  <i class="fa fa-table"></i> Concesionarias Pendientes de Aprobaci&oacute;n
  	</div>
    <div class="card-body">
   		<div class="table-responsive">
        	<table id="dtPendientes" class="table table-striped table-bordered" style="width:100%">
				<c:if test="${empty requestScope.Pendientes}">
					<tr>
						<td align="center" colspan="3">No existen datos para listar.</td>
					</tr>
				</c:if>
				<c:if test="${!empty requestScope.Pendientes}">
					<thead>
						<tr>
							<th><fmt:message key="razonSocial" bundle="${etq}"/></th>
							<th><fmt:message key="direccion" bundle="${etq}"/></th>
							<th><fmt:message key="url" bundle="${etq}"/></th>
							<th><fmt:message key="tecnologia" bundle="${etq}"/></th>
							<th colspan="2">&nbsp;</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="pendientes" items="${requestScope.Pendientes}" varStatus="status">
						<tr class="text-center">
							<td>${pendientes.razon_social}</td>
							<td>${pendientes.direccion}</td>
							<td>${pendientes.url} <input type="text" id="txtUrlWS" ></td>
							<td>${pendientes.sufijo} <input type="text" id="txtSufijoWS" ></td>
							<td><input type="button" id="btnAceptar_${pendientes.id_concesionaria}" class="aceptar" onclick="jAdmin.aceptarConcesionaria('${pendientes.id_concesionaria}','pendientes');" value="<fmt:message key="aceptar" bundle="${etq}"/>"></td>
							<td><input type="button" id="btnDeclinar_${pendientes.id_concesionaria}" class="declinar" onclick="jAdmin.declinarConcesionaria('${pendientes.id_concesionaria}','pendientes');" value="<fmt:message key="declinar" bundle="${etq}"/>" ></td>
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
          </div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>
<script src="../../jquery/jquery-3.3.1.js"></script>
<script>
	$(document).ready(function() {
	    $('#dtPendientes').DataTable();
	} );
</script>


