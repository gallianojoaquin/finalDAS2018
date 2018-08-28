<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="lang" value="${lang}"/>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etq" scope="session"/>

<!-- DataTable Declinados-->
<div class="card mb-3">
	<div class="card-header">
	  <i class="fa fa-table"></i> Concesionarias Declinadas
  	</div>
    <div class="card-body">
   		<div class="table-responsive">
        	<table id="dtDeclinadas" class="table table-striped table-bordered" style="width:100%">
				<c:if test="${empty requestScope.Declinadas}">
					<tr>
						<td align="center" colspan="3">No existen datos para listar.</td>
					</tr>
				</c:if>
				<c:if test="${!empty requestScope.Declinadas}">
					<thead>
						<tr>
							<th><fmt:message key="razonSocial" bundle="${etq}"/></th>
							<th><fmt:message key="direccion" bundle="${etq}"/></th>
							<th><fmt:message key="url" bundle="${etq}"/></th>
							<th><fmt:message key="tipo_ws" bundle="${etq}"/></th>
							<th>&nbsp;</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="declinadas" items="${requestScope.Declinadas}" varStatus="status">
						<tr class="text-center">
							<td>${declinadas.razon_social}</td>
							<td>${declinadas.direccion}</td>
							<td>${declinadas.url}</td>
							<td>${declinadas.sufijo}</td>
							<td><input type="button" id="btnAceptar_${declinadas.id_concesionaria}" class="aceptar" onclick="jAdmin.aceptarConcesionaria('${declinadas.id_concesionaria}','declinadas');" value="<fmt:message key="aceptar" bundle="${etq}"/>"></td>
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
          </div>
        </div>
        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
</div>

<script>
	$(document).ready(function() {
	    $('#dtDeclinadas').DataTable();
	} );
</script>


