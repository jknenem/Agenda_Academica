
<%@ page import="agenda_academica.Anotacao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'anotacao.label', default: 'Anotacao')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-anotacao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-anotacao" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'anotacao.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="texto" title="${message(code: 'anotacao.texto.label', default: 'Texto')}" />
					
						<g:sortableColumn property="data" title="${message(code: 'anotacao.data.label', default: 'Data')}" />
					
						<th><g:message code="anotacao.aluno.label" default="Aluno" /></th>
					
						<th><g:message code="anotacao.grupo.label" default="Grupo" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${anotacaoInstanceList}" status="i" var="anotacaoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${anotacaoInstance.id}">${fieldValue(bean: anotacaoInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: anotacaoInstance, field: "texto")}</td>
					
						<td><g:formatDate date="${anotacaoInstance.data}" /></td>
					
						<td>${fieldValue(bean: anotacaoInstance, field: "aluno")}</td>
					
						<td>${fieldValue(bean: anotacaoInstance, field: "grupo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${anotacaoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
