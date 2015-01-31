<%@ page import="com.kathsoftware.SecAppUserSecAppRole" %>



<div class="fieldcontain ${hasErrors(bean: secAppUserSecAppRoleInstance, field: 'secAppRole', 'error')} required">
	<label for="secAppRole">
		<g:message code="secAppUserSecAppRole.secAppRole.label" default="Sec App Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secAppRole" name="secAppRole.id" from="${com.kathsoftware.SecAppRole.list()}" optionKey="id" required="" value="${secAppUserSecAppRoleInstance?.secAppRole?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: secAppUserSecAppRoleInstance, field: 'secAppUser', 'error')} required">
	<label for="secAppUser">
		<g:message code="secAppUserSecAppRole.secAppUser.label" default="Sec App User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="secAppUser" name="secAppUser.id" from="${com.kathsoftware.SecAppUser.list()}" optionKey="id" required="" value="${secAppUserSecAppRoleInstance?.secAppUser?.id}" class="many-to-one"/>

</div>

