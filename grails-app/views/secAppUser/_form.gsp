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

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="secAppUser.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${secAppUserInstance?.accountExpired}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="secAppUser.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${secAppUserInstance?.accountLocked}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="secAppUser.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${secAppUserInstance?.enabled}" />

</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="secAppUser.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${secAppUserInstance?.passwordExpired}" />

</div>

