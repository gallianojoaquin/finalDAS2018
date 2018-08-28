<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="lang" value="${lang}"/>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etq" scope="session"/>

<br><br>
<div class="card mb-3 col-md-3">
	<div class="card-header">
	  <i class="fa fa-table"></i> <fmt:message key="proximo_sorteo" bundle="${etq}"/>
  	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table id="dtResumen" class="table table-striped table-bordered" style="width:100%">
				<c:if test="${empty requestScope.Resumen}">
					<tr>
						<td align="center" colspan="3">No existen datos para listar.</td>
					</tr>
				</c:if>
				<c:if test="${!empty requestScope.Resumen}">
					<thead>
						<tr>
							<th><fmt:message key="fecha_sorteo" bundle="${etq}"/></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="resumen" items="${requestScope.Resumen}" varStatus="status">
						<tr class="text-center">
							<td>${resumen.prox_sorteo}</td>						
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
</div>
<div class="col-md-1"></div>
<div class="card mb-3 col-md-3" >
	<div class="card-header">
	  <i class="fa fa-table"></i> <fmt:message key="comparacion_sorteos" bundle="${etq}"/>
  	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table id="dtResumen" class="table table-striped table-bordered" style="width:100%">
				<c:if test="${empty requestScope.Resumen}">
					<tr>
						<td align="center" colspan="3">No existen datos para listar.</td>
					</tr>
				</c:if>
				<c:if test="${!empty requestScope.Resumen}">
					<thead>
						<tr>
							<th><fmt:message key="sorteos_pendientes" bundle="${etq}"/></th>
							<th><fmt:message key="sorteos_atrasados" bundle="${etq}"/></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="resumen" items="${requestScope.Resumen}" varStatus="status">
						<tr class="text-center">	
							<td>${resumen.cant_sorteos_pendientes}</td>							
							<td>${resumen.cant_sorteos_atrasados}</td>			
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
</div>
<div class="col-md-1"></div>
<div class="card mb-3 col-md-4" >
	<div class="card-header">
	  <i class="fa fa-table"></i> <fmt:message key="ganadores_sorteos" bundle="${etq}"/>
  	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table id="dtGanadores" class="table table-striped table-bordered" style="width:100%">
				<c:if test="${empty requestScope.Ganadores}">
					<tr>
						<td align="center" colspan="3">No existen datos para listar.</td>
					</tr>
				</c:if>
				<c:if test="${!empty requestScope.Ganadores}">
					<thead>
						<tr>
							<th><fmt:message key="nombre" bundle="${etq}"/></th>
							<th><fmt:message key="concesionaria" bundle="${etq}"/></th>
							<th><fmt:message key="fecha" bundle="${etq}"/></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="ganador" items="${requestScope.Ganadores}" varStatus="status">
						<tr class="text-center">	
							<td>${ganador.nombre_ganador}</td>							
							<td>${ganador.razon_social_concesionaria}</td>		
							<td>${ganador.fecha_ganador}</td>		
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
</div>

<div class="card mb-3 col-md-4">
	<div class="card-header">
	  <i class="fa fa-table"></i> Actualizaciones Concesionarias
  	</div>
    <div class="card-body">
   		<div class="table-responsive">
        	<table id="dtActualizaciones" class="table table-striped table-bordered" style="width:100%">
				<c:if test="${empty requestScope.FechaActualizacionConcesionarias}">
					<tr>
						<td align="center" colspan="3">No existen datos para listar.</td>
					</tr>
				</c:if>
				<c:if test="${!empty requestScope.FechaActualizacionConcesionarias}">
					<thead>
						<tr>
							<th><fmt:message key="razonSocial" bundle="${etq}"/></th>
							<th><fmt:message key="telefono" bundle="${etq}"/></th>
							<th><fmt:message key="fecha" bundle="${etq}"/></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="concesionarias" items="${requestScope.FechaActualizacionConcesionarias}" varStatus="status">
						<tr class="text-center">
							<td>${concesionarias.razon_social}</td>
							<td>${concesionarias.telefono}</td>
							<td>${concesionarias.fecha_actualizacion}</td>							
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
    	</div>
	</div>
</div>
<div class="col-md-1"></div>
<div class="card mb-3 col-md-4">
	<div class="card-header">
	  <i class="fa fa-table"></i> Estados Concesionarias
  	</div>
    <div class="card-body">
   		<div class="table-responsive">
        	<table id="dtEstados" class="table table-striped table-bordered" style="width:100%">
				<c:if test="${empty requestScope.CantConcesionarias}">
					<tr>
						<td align="center" colspan="3">No existen datos para listar.</td>
					</tr>
				</c:if>
				<c:if test="${!empty requestScope.CantConcesionarias}">
					<thead>
						<tr>
							<th><fmt:message key="estado" bundle="${etq}"/></th>
							<th><fmt:message key="cantidad" bundle="${etq}"/></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="estados" items="${requestScope.CantConcesionarias}" varStatus="status">
						<tr class="text-center">
						<c:if test="${estados.estado_autorizacion == 'a'}">
							<td>Aceptadas</td>
						</c:if>
						<c:if test="${estados.estado_autorizacion == 'p'}">
							<td>Pendientes</td>
						</c:if>
						<c:if test="${estados.estado_autorizacion == 'd'}">
							<td>Rechazadas</td>
						</c:if>							
							<td>${estados.cantidad}</td>						
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
</div>
<div class="col-md-1"></div>
<div class="card mb-3 col-md-2">
	<div class="card-header">
	  <i class="fa fa-table"></i> <fmt:message key="cantidad_clientes" bundle="${etq}"/>
  	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table id="dtResumen" class="table table-striped table-bordered" style="width:100%">
				<c:if test="${empty requestScope.Resumen}">
					<tr>
						<td align="center" colspan="3">No existen datos para listar.</td>
					</tr>
				</c:if>
				<c:if test="${!empty requestScope.Resumen}">
					
					<tbody>
					<c:forEach var="resumen" items="${requestScope.Resumen}" varStatus="status">
						<tr class="text-center">							
							<td>${resumen.cantidad_clientes}</td>			
						</tr>
					</c:forEach>
					</tbody>
				</c:if>
			</table>
		</div>
	</div>
</div>


