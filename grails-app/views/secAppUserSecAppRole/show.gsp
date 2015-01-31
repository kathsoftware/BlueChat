
<%@ page import="com.kathsoftware.SecAppUserSecAppRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-secAppUserSecAppRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-secAppUserSecAppRole" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list secAppUserSecAppRole">
			
				<g:if test="${secAppUserSecAppRoleInstance?.secAppRole}">
				<li class="fieldcontain">
					<span id="secAppRole-label" class="property-label"><g:message code="secAppUserSecAppRole.secAppRole.label" default="Sec App Role" /></span>
					
						<span class="property-value" aria-labelledby="secAppRole-label"><g:link controller="secAppRole" action="show" id="${secAppUserSecAppRoleInstance?.secAppRole?.id}">${secAppUserSecAppRoleInstance?.secAppRole?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${secAppUserSecAppRoleInstance?.secAppUser}">
				<li class="fieldcontain">
					<span id="secAppUser-label" class="property-label"><g:message code="secAppUserSecAppRole.secAppUser.label" default="Sec App User" /></span>
					
						<span class="property-value" aria-labelledby="secAppUser-label"><g:link controller="secAppUser" action="show" id="${secAppUserSecAppRoleInstance?.secAppUser?.id}">${secAppUserSecAppRoleInstance?.secAppUser?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:secAppUserSecAppRoleInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${secAppUserSecAppRoleInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
