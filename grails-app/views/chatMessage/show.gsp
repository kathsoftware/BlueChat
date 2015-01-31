
<%@ page import="com.kathsoftware.ChatMessage" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chatMessage.label', default: 'ChatMessage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-chatMessage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-chatMessage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list chatMessage">
			
				<g:if test="${chatMessageInstance?.dateTimeSent}">
				<li class="fieldcontain">
					<span id="dateTimeSent-label" class="property-label"><g:message code="chatMessage.dateTimeSent.label" default="Date Time Sent" /></span>
					
						<span class="property-value" aria-labelledby="dateTimeSent-label"><g:formatDate date="${chatMessageInstance?.dateTimeSent}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatMessageInstance?.fromUser}">
				<li class="fieldcontain">
					<span id="fromUser-label" class="property-label"><g:message code="chatMessage.fromUser.label" default="From User" /></span>
					
						<span class="property-value" aria-labelledby="fromUser-label"><g:fieldValue bean="${chatMessageInstance}" field="fromUser"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatMessageInstance?.message}">
				<li class="fieldcontain">
					<span id="message-label" class="property-label"><g:message code="chatMessage.message.label" default="Message" /></span>
					
						<span class="property-value" aria-labelledby="message-label"><g:fieldValue bean="${chatMessageInstance}" field="message"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chatMessageInstance?.toUser}">
				<li class="fieldcontain">
					<span id="toUser-label" class="property-label"><g:message code="chatMessage.toUser.label" default="To User" /></span>
					
						<span class="property-value" aria-labelledby="toUser-label"><g:fieldValue bean="${chatMessageInstance}" field="toUser"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chatMessageInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chatMessageInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
