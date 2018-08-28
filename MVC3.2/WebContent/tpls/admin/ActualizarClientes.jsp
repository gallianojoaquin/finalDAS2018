<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="lang" value="${lang}"/>
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="ar.edu.ubp.das.src.admin.properties.etiquetas" var="etq" scope="session"/>
<div class="card mb-3">
	<div class="card-header">
	  <i class="fa fa-table"></i> Clientes Actualizados
  	</div>
  	<c:if test="${!empty requestScope.ActualizarClientes}">

		<p>${requestScope.ActualizarClientes}</p>

	</c:if>
</div>