<%@ page import="com.kathsoftware.SecAppRole" %>



<div class="fieldcontain ${hasErrors(bean: secAppRoleInstance, field: 'authority', 'error')} required">
	<label for="authority">
		<g:message code="secAppRole.authority.label" default="Authority" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="authority" required="" value="${secAppRoleInstance?.authority}"/>

</div>

