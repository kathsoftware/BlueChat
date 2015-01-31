<%@ page import="com.kathsoftware.SecAppUser" %>



<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="secAppUser.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${secAppUserInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="secAppUser.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${secAppUserInstance?.password}"/>

</div>

