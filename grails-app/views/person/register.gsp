<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	</head>
	<body>
	
		<div style="margin-top: 20px; text-align: center;">
			<g:img absolute="false" dir="/assets" file="bluechatlogo.png"/>		
		</div>
	
		<a href="#create-secAppUser" class="skip" tabindex="-1"></a>
		<div id="create-secAppUser">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${secAppUserInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${secAppUserInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:secAppUserInstance, action:'register']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<center><g:actionSubmit value="Register" action="register"/></center>
			</g:form>
			<g:remoteLink class="logout" controller="logout" method="post" asynchronous="false" onSuccess="window.location='/BlueChat'" onFailure="window.location='/BlueChat'"><g:img absolute="false" dir="/assets" file="loginbutton.png"/>
</g:remoteLink>
			
		</div>
	</body>
</html>
