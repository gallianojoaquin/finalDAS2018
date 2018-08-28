<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="lang" value="${lang}"/>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etq" scope="session"/>

<br><br>
<div class="card mb-12 col-md-12">
	<div class="card-header">
	  <i class="fa fa-table"></i> <fmt:message key="sorteo" bundle="${etq}"/>
  	</div>
	<div class="card-body">
		<div class="card mb-8 col-md-8">
			<div class="card-body">
				<div class="table-responsive">
					<div class="table-responsive">
						<table id="dtResumen" class="table table-striped table-bordered" style="width:100%">
							<c:if test="${empty requestScope.Resumen}">
								<tr><td align="center" colspan="3"><fmt:message key="no_data" bundle="${etq}"/></td></tr>
							</c:if>
							<c:if test="${!empty requestScope.Resumen}">
								<thead>
									<tr>
										<th><fmt:message key="fecha_ult_sorteo" bundle="${etq}"/></th>
										<th><fmt:message key="estado" bundle="${etq}"/></th>
										<th><fmt:message key="ganador" bundle="${etq}"/></th>
										<th><fmt:message key="concesionaria" bundle="${etq}"/></th>
									</tr>
								</thead>
								<tbody>
								<c:forEach var="resumen" items="${requestScope.Resumen}" varStatus="status">
									<tr class="text-center">	
										<td>${resumen.fecha_ult_sorteo}</td>							
										<td>${resumen.estado}</td>		
										<td>${resumen.nombre_ganador}</td>	
										<td>${resumen.razon_social_concesionaria}</td>		
									</tr>
								</c:forEach>
								</tbody>
							</c:if>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<div class="card mb-4 col-md-4">
			<div class="card-body">
				<div class="table-responsive">
					<div class="table-responsive">
						<table id="dtResumen" class="table table-striped table-bordered" style="width:100%">
							<c:if test="${empty requestScope.Resumen}">
								<tr><td align="center" colspan="3"><fmt:message key="no_data" bundle="${etq}"/></td></tr>
							</c:if>
							<c:if test="${!empty requestScope.Resumen}">
								<thead>
									<tr>
										<th><fmt:message key="proximo_sorteo" bundle="${etq}"/></th>
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
		</div>
	</div>
</div>
<div class="card mb-12 col-md-12"></div>
<div class="card mb-12 col-md-12">
	<div class="card-header">
	  <i class="fa fa-table"></i> <fmt:message key="concesionarias" bundle="${etq}"/>
  	</div>
	<div class="card-body">
		<div class="card-body">
			<div class="table-responsive">
				<div class="table-responsive">
					<table id="dtResumen" class="table table-striped table-bordered" style="width:100%">
						<c:if test="${empty requestScope.ActualizacionConcesionarias}">
							<tr><td align="center" colspan="3"><fmt:message key="no_data" bundle="${etq}"/></td></tr>
						</c:if>
						<c:if test="${!empty requestScope.ActualizacionConcesionarias}">
							<thead>
								<tr>
									<th><fmt:message key="razonSocial" bundle="${etq}"/></th>
									<th><fmt:message key="cuit" bundle="${etq}"/></th>
									<th><fmt:message key="telefono" bundle="${etq}"/></th>
									<th><fmt:message key="direccion" bundle="${etq}"/></th>
									<th><fmt:message key="estado" bundle="${etq}"/></th>
									<th><fmt:message key="estado_actualizacion" bundle="${etq}"/></th>
									<th><fmt:message key="ult_actualizacion" bundle="${etq}"/></th>
									<th><fmt:message key="intentos_fallidos" bundle="${etq}"/></th>
									<th><fmt:message key="cantidad_clientes" bundle="${etq}"/></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="concesionarias" items="${requestScope.ActualizacionConcesionarias}" varStatus="status">
									<tr class="text-center">
										<td>${concesionarias.razon_social}</td>
										<td>${concesionarias.cuit}</td>
										<td>${concesionarias.telefono}</td>
										<td>${concesionarias.direccion}</td>
										<c:choose>
											<c:when test="${concesionarias.estado_autorizacion == 'a'}">                            
							                   <td> <fmt:message key="aceptada" bundle="${etq}" /> </td>                                
							                </c:when>
							                <c:when test="${concesionarias.estado_autorizacion == 'd'}">                            
							                   <td> <fmt:message key="rechazada" bundle="${etq}" /> </td>                                
							                </c:when>
							                <c:when test="${concesionarias.estado_autorizacion == 'p'}">                            
							                   <td> <fmt:message key="pendiente" bundle="${etq}" /> </td>                                
							                </c:when>
										</c:choose>	
										<td>${concesionarias.estado_actualizacion}</td>
										<td>${concesionarias.fecha_actualizacion}</td>	
										<td>${concesionarias.cantidad}</td>		
										<td>${concesionarias.cantidad_clientes}</td>				
									</tr>
								</c:forEach>
							</tbody>
						</c:if>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="card mb-12 col-md-12"></div>



