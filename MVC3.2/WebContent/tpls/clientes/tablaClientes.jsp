<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="lang" value="${lang}"/>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etq" scope="session"/>
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etqSalir" scope="session"/>
<!DOCTYPE html>
<div class="card mb-3">
	<div class="card-header">
	  <i class="fa fa-table"></i> <fmt:message key="nominaClientes" bundle="${etq}" />
  	</div>
    <div class="card-body">
   		<div class="table-responsive">
        	<table id="dtClientes" class="table table-striped table-bordered" style="width:100%">
				<c:if test="${empty requestScope.Clientes}">
					<tr>
						<td align="center" colspan="3"><fmt:message key="no_data" bundle="${etq}"/></td>
					</tr>
				</c:if>
				<c:if test="${!empty requestScope.Clientes}">
					<thead>
						<tr>
							<td> <fmt:message key="nombre" bundle="${etq}" /> </td>                
				            <td> <fmt:message key="dni" bundle="${etq}" /> </td>        
				            <td> <fmt:message key="mail" bundle="${etq}" /> </td>  
				            <td> <fmt:message key="concesionaria" bundle="${etq}" /> </td>   
				            <td> <fmt:message key="cuotas_pagas" bundle="${etq}" /> </td>
				            <td> <fmt:message key="al_dia" bundle="${etq}" /> </td>   
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cliente" items="${requestScope.Clientes}" varStatus="status">
							<tr class="rename" data-file="prueba 1">
								<td>  ${cliente.nombre} </td>                
					            <td>  ${cliente.dni}  </td>        
					            <td>  ${cliente.mail}  </td>     
					            <td>  ${cliente.concesionaria}  </td>            
					            <td style="text-align:center;">  ${cliente.cantCuotasPagas}  </td>	
					            <c:choose>
					                <c:when test="${cliente.alDia == 'Y'}">                            
					                   <td> <fmt:message key="si" bundle="${etq}" /> </td>                                
					                </c:when>
					                <c:otherwise>
									    <td> <fmt:message key="no" bundle="${etq}" /> </td>
									</c:otherwise>
				                </c:choose>
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
	    $('#dtClientes').DataTable({
	    	"order": [[ 0, "asc" ]]
	    });
	} );
</script>