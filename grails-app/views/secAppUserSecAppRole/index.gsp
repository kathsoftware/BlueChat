
<%@ page import="com.kathsoftware.SecAppUserSecAppRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-secAppUserSecAppRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-secAppUserSecAppRole" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="secAppUserSecAppRole.secAppRole.label" default="Sec App Role" /></th>
					
						<th><g:message code="secAppUserSecAppRole.secAppUser.label" default="Sec App User" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${secAppUserSecAppRoleInstanceList}" status="i" var="secAppUserSecAppRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${secAppUserSecAppRoleInstance.id}">${fieldValue(bean: secAppUserSecAppRoleInstance, field: "secAppRole")}</g:link></td>
					
						<td>${fieldValue(bean: secAppUserSecAppRoleInstance, field: "secAppUser")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${secAppUserSecAppRoleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
