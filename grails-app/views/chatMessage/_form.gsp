<%@ page import="com.kathsoftware.ChatMessage" %>



<div class="fieldcontain ${hasErrors(bean: chatMessageInstance, field: 'dateTimeSent', 'error')} required">
	<label for="dateTimeSent">
		<g:message code="chatMessage.dateTimeSent.label" default="Date Time Sent" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateTimeSent" precision="day"  value="${chatMessageInstance?.dateTimeSent}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: chatMessageInstance, field: 'fromUser', 'error')} required">
	<label for="fromUser">
		<g:message code="chatMessage.fromUser.label" default="From User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fromUser" required="" value="${chatMessageInstance?.fromUser}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatMessageInstance, field: 'message', 'error')} required">
	<label for="message">
		<g:message code="chatMessage.message.label" default="Message" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="message" required="" value="${chatMessageInstance?.message}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chatMessageInstance, field: 'toUser', 'error')} required">
	<label for="toUser">
		<g:message code="chatMessage.toUser.label" default="To User" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="toUser" required="" value="${chatMessageInstance?.toUser}"/>

</div>

