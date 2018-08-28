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
	  <i class="fa fa-table"></i> <fmt:message key="participantes_sorteo" bundle="${etq}" />
  	</div>
  	<div class="card-body">
		<div id="tableSorteos" class="card-text">
			<c:set var="contador" scope="session" value="0" />
			<c:set var="sorteos" scope="session" value="${requestScope.participantesSorteos}" />	
			<c:if test="${empty requestScope.participantesSorteos}">
				<table>
					<tr>
						<td align="center" colspan="3"><fmt:message key="no_data" bundle="${etq}"/></td>
					</tr>
				</table>
			</c:if>
			<c:if test="${!empty requestScope.participantesSorteos}">  
				<c:set var="datosSorteo" scope="session" value="${requestScope.participantesSorteos[0]}" />
				<%-- <h3><fmt:message key="nro_sorteo" bundle="${etq}" /> : ${datosSorteo.id_sorteo}</h3>
				<h3><fmt:message key="fecha_sorteo" bundle="${etq}" /> : ${datosSorteo.fecha_original}</h3> --%>
				
				<table id="tablaSorteos" class="table table-striped table-bordered" style="width:100%">					
					<thead>            
					    <tr>
					    	<td> <fmt:message key="concesionaria" bundle="${etq}" /> </td>
					        <td> <fmt:message key="nombre" bundle="${etq}" /> </td>                  
					    </tr>            
					</thead>            
					<tbody>    
						<c:set var="razonSocialAnterior" scope="session" value="" />    
						<c:forEach var="participantes" items="${requestScope.participantesSorteos}">	
							<c:if test="${razonSocialAnterior !=  participantes.concesionaria}">
								<tr>                    
						            <td colspan="2"> ${participantes.concesionaria} </td>                        						            						            
					        	</tr> 
					        	<c:set var="razonSocialAnterior" scope="session" value="${participantes.concesionaria}" />
							</c:if>         
					        <tr>                    
					            <td> &nbsp; </td> 
					            <td> ${participantes.nombre}</td>                           						            						            
					        </tr>                    		            
						</c:forEach>	        
				    </tbody>	    
				</table>
			</c:if>
		</div>
	</div>
	<button type="button" id="btnVolver" class="btn btn-primary " onclick="jAdmin.detalleSorteos();"><fmt:message key="volver" bundle="${etq}"/></button>
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
	
	
	
	
	
	