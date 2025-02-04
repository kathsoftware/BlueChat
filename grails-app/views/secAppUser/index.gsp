
<%@ page import="com.kathsoftware.SecAppUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secAppUser.label', default: 'SecAppUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-secAppUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-secAppUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'secAppUser.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'secAppUser.password.label', default: 'Password')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'secAppUser.accountExpired.label', default: 'Account Expired')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'secAppUser.accountLocked.label', default: 'Account Locked')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'secAppUser.enabled.label', default: 'Enabled')}" />
					
						<g:sortableColumn property="passwordExpired" title="${message(code: 'secAppUser.passwordExpired.label', default: 'Password Expired')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${secAppUserInstanceList}" status="i" var="secAppUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${secAppUserInstance.id}">${fieldValue(bean: secAppUserInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: secAppUserInstance, field: "password")}</td>
					
						<td><g:formatBoolean boolean="${secAppUserInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${secAppUserInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${secAppUserInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${secAppUserInstance.passwordExpired}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${secAppUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
