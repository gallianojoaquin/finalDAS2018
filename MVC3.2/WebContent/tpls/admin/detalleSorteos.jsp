<%@ page
    language="java"
    contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    
<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etq" scope="session"/>
<div class="card">
	<div class="card-header">
	  <i class="fa fa-table"></i> <fmt:message key="titulo_sorteo" bundle="${etq}" />
  	</div>
  	<div class="card-body">
		<div id="tableSorteos" class="card-text">
			<c:set var="contador" scope="session" value="0" />
			<c:set var="sorteos" scope="session" value="${requestScope.detalleSorteos}" />	
			<c:if test="${empty requestScope.detalleSorteos}">
				<table>
					<tr>
						<td align="center" colspan="3"><fmt:message key="no_data" bundle="${etq}"/></td>
					</tr>
				</table>
			</c:if>
			<c:if test="${!empty requestScope.detalleSorteos}">  
				<table id="tablaSorteos" class="table table-striped table-bordered" style="width:100%">
					<thead>            
					    <tr>
					    	<td> <fmt:message key="nro_sorteo" bundle="${etq}" /> </td>  
					        <td> <fmt:message key="fecha_original" bundle="${etq}" /> </td>                
					        <td> <fmt:message key="fecha_ejecucion" bundle="${etq}" /> </td>       
					        <td> <fmt:message key="fecha_fin_ejecucion" bundle="${etq}" /> </td>         
					        <td> <fmt:message key="estado" bundle="${etq}" /> </td>                
					        <td style="text-align:center;"> <fmt:message key="intentos_fallidos" bundle="${etq}" /> </td>
					        <td> <fmt:message key="ganador" bundle="${etq}" /> </td>          
					        <td> <fmt:message key="mail" bundle="${etq}" /> </td>
 							<td> <fmt:message key="concesionaria" bundle="${etq}" /> </td>        
 							<td> <fmt:message key="ver_participantes" bundle="${etq}" /> </td>             
					    </tr>            
					</thead>            
					<tbody>        
						<c:forEach var="sorteo" items="${requestScope.detalleSorteos}">		            
						        <tr class="sorteo${sorteo.estado}" id="${sorteo.idSorteo}">                    
						            <td> ${sorteo.idSorteo} </td> 
						            <td> ${sorteo.fechaOriginal} </td>                        
						            <td> ${sorteo.fechaEjecucion} </td>  
						            <td> ${sorteo.fechaFinEjecucion} </td>                       
						            <c:choose>
						                <c:when test="${sorteo.estado == 'pendiente'}">                            
						                   <td> <fmt:message key="pendiente" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'init'}">                            
						                   <td> <fmt:message key="iniciado" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'actualizar'}">                            
						                   <td> <fmt:message key="actualizar" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'actualizado'}">                            
						                   <td> <fmt:message key="actualizado" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'definir_participantes'}">                            
						                   <td> <fmt:message key="falta_procesar_participantes" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'ejecutar'}">                            
						                   <td> <fmt:message key="ejecutar" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'ejecutado'}">                            
						                   <td> <fmt:message key="ejecutado" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'notificar'}">                            
						                   <td> <fmt:message key="falta_notificar_concesionarias" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'notificado'}">                            
						                   <td> <fmt:message key="falta_enviar_mail" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'falloEnvioMail'}">                            
						                   <td> <fmt:message key="error_al_enviar_mail" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'mailEnviado'}">                            
						                   <td> <fmt:message key="mail_enviado" bundle="${etq}" /> </td>                                
						                </c:when>
						                <c:when test="${sorteo.estado == 'finalizado'}">                            
						                   <td> <fmt:message key="finalizado" bundle="${etq}" /> </td>                            
						                </c:when>                           
						            </c:choose>                        
						            <td style="text-align:center;"> ${sorteo.intentosFallidos} </td>
						            <td> ${sorteo.ganador} </td>
						            <td> ${sorteo.mail} </td>
						            <td> ${sorteo.concesionaria} </td>
						            <td><button type="button" id="btnParticopantes_${sorteo.idSorteo}" class="btn btn-primary " onclick="jAdmin.verParticipantesSorteo('${sorteo.idSorteo}');"><fmt:message key="ver" bundle="${etq}"/></button></td>
						        </tr>                    
						        <c:set var="contador" scope="session" value="${contador + 1}" />		            
						</c:forEach>	        
				    </tbody>	    
				</table>
			</c:if>
		</div>
	</div>
</div>


<script type="text/javascript">
	var dtMax = new Date('${ultimoSorteo.fechaOriginal}');
    dtMax.setDate(dtMax.getDate() + 30);

	$('.form_date').datetimepicker({
        language:  'es',
        weekStart: 0,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 1,
		locale: 'es',
		daysOfWeekDisabled: [0, 6],
		maxDate: '17-07-2018',
		clearBtn: 1,
		startDate: dtMax
    });
	</script>
	
<script>
	$(document).ready(function() {
	    $('#tablaSorteos').DataTable({
	    	"columnDefs": [
	            { "orderable": false, "targets": [4] },
	            { "orderable": true, "targets": [0, 1, 2,3] }
	        ],
	    	"order": [[ 0, "desc" ]],
	    	"language": {
	            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
	        }
	    });
	} );
</script>
	
	
	
	
	
	