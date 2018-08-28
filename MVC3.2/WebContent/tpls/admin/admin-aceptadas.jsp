<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="lang" value="${lang}"/>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etq" scope="session"/>
<!-- DataTable Aceptados-->
<div class="card mb-3">
	<div class="card-header">
	  <i class="fa fa-table"></i> <fmt:message key="config_concesionarias" bundle="${etq}"/>
  	</div>
    <div class="card-body">
    <br>
   		<div class="table-responsive">
        	<table id="dtAceptadas" class="table table-striped table-bordered" style="width:100%;">
				<c:if test="${empty requestScope.Aceptadas}">
					<tr>
						<td align="center" colspan="3"><fmt:message key="no_data" bundle="${etq}"/></td>
					</tr>
				</c:if>
				<c:if test="${!empty requestScope.Aceptadas}">
					<thead>
						<tr>
							<th><fmt:message key="razonSocial" bundle="${etq}"/></th>
							<th><fmt:message key="direccion" bundle="${etq}"/></th>
							<th><fmt:message key="url" bundle="${etq}"/></th>
							<th><fmt:message key="tipo_ws" bundle="${etq}"/></th>
							<th>&nbsp;</th>
							<th><fmt:message key="estado_ws" bundle="${etq}"/></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="aceptadas" items="${requestScope.Aceptadas}" varStatus="status">
						<tr class="text-center">
							<td>${aceptadas.razon_social}</td>
							<td>${aceptadas.direccion}</td>
							<td><input type="text" class="form-control" id="txtUrlWS_${aceptadas.id_concesionaria}" value="${aceptadas.url}" size="70"></td>
							<td>							
								<c:if test = "${aceptadas.id_tecnologia == '1'}">
									<select id="txtWS_${aceptadas.id_concesionaria}" class="btn btn-info">
								         	<option value="1" selected>Axis2</option>
											<option value="2" >CXF</option>
											<option value="3" >REST</option>						  
									</select>
								</c:if>
								
								<c:if test = "${aceptadas.id_tecnologia == '2'}">
									<select id="txtWS_${aceptadas.id_concesionaria}" class="btn btn-info">
								         	<option value="1" >Axis2</option>
											<option value="2" selected>CXF</option>
											<option value="3" >REST</option>						  
									</select>
								</c:if>
								
								<c:if test = "${aceptadas.id_tecnologia == '3'}">
									<select id="txtWS_${aceptadas.id_concesionaria}" class="btn btn-info">
								         	<option value="1" >Axis2</option>
											<option value="2" >CXF</option>
											<option value="3" selected>REST</option>						  
									</select>
								</c:if>
								
								<c:if test = "${aceptadas.id_tecnologia == '0'}">
									<select id="txtWS_${aceptadas.id_concesionaria}" class="btn btn-info">
								         	<option value="1" >Axis2</option>
											<option value="2" >CXF</option>
											<option value="3" >REST</option>						  
									</select>
								</c:if>
								<input type="hidden" value="${aceptadas.id_tecnologia}" >
							</td>
							<td>							
								<div class="btn-group" role="group" aria-label="...">									
									<button type="button" id="ping_${aceptadas.id_concesionaria}" class="btn btn-info " onclick="jAdmin.pingConcesionaria('${aceptadas.id_concesionaria}');" value="PING" >PING</button>								
								  	<div class="btn-group" role="group">							    										
										<c:if test = "${aceptadas.estado_autorizacion == 'p'}">
											<select id="selectStatus_${aceptadas.id_concesionaria}" class="btn btn-warning">
										         	<option value="p" selected>Pendiente</option>
													<option value="a" >Aceptada</option>
													<option value="d" >Rechazada</option>						  
											</select>
										</c:if>
										<c:if test = "${aceptadas.estado_autorizacion == 'a'}">
											<select id="selectStatus_${aceptadas.id_concesionaria}" class="btn btn-success">
										         	<option value="p" disabled>Pendiente</option>
													<option value="a" selected>Aceptada</option>
													<option value="d" >Rechazada</option>						  
											</select>
										</c:if>
										<c:if test = "${aceptadas.estado_autorizacion == 'd'}">
											<select id="selectStatus_${aceptadas.id_concesionaria}" class="btn btn-danger">
										         	<option value="p" disabled>Pendiente</option>
													<option value="a" >Aceptada</option>
													<option value="d" selected>Rechazada</option>						  
											</select>
										</c:if>
										
							 		 </div>
							 		 <button type="button" id="btnGuardar_${aceptadas.id_concesionaria}" class="btn btn-primary " onclick="jAdmin.guardarConfig('${aceptadas.id_concesionaria}','aceptadas');" value="<fmt:message key="guardar" bundle="${etq}"/>" ><fmt:message key="guardar" bundle="${etq}"/></button>
								</div>							
							</td>
							<td><div id="divPing_${aceptadas.id_concesionaria}" style="margin-right:5px;"></div></td>
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
	    $('#dtAceptadas').DataTable({
	    	"columnDefs": [
	            { "orderable": false, "targets": [2, 3, 5] },
	            { "orderable": true, "targets": [0, 1, 4] }
	        ],
	        "aLengthMenu": [[7, 14, 21, -1], [7, 14, 21, "All"]],
	        "iDisplayLength": 7
	    });
	} );
</script>
<script>
$('#test').on('click',function() {
	  alert($('#txtUrlWS').val());
	  console.log($('#txtUrlWS').val());
	});
</script>

