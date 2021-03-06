
<%@ page import="agenda_academica.Materia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materia.label', default: 'Materia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-materia" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-materia" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materia">
			
				<g:if test="${materiaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="materia.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${materiaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.professor}">
				<li class="fieldcontain">
					<span id="professor-label" class="property-label"><g:message code="materia.professor.label" default="Professor" /></span>
					
						<span class="property-value" aria-labelledby="professor-label"><g:fieldValue bean="${materiaInstance}" field="professor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.provas}">
				<li class="fieldcontain">
					<span id="provas-label" class="property-label"><g:message code="materia.provas.label" default="Provas" /></span>
					
						<g:each in="${materiaInstance.provas}" var="p">
						<span class="property-value" aria-labelledby="provas-label"><g:link controller="prova" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.trabalhos}">
				<li class="fieldcontain">
					<span id="trabalhos-label" class="property-label"><g:message code="materia.trabalhos.label" default="Trabalhos" /></span>
					
						<g:each in="${materiaInstance.trabalhos}" var="t">
						<span class="property-value" aria-labelledby="trabalhos-label"><g:link controller="trabalho" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:materiaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${materiaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
