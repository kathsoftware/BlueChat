package com.kathsoftware

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import java.util.Date;


class ChatMessageController {

	//Inject Service with Spring DI
	def springSecurityService
	
	//Show default chat window.  If not logged in will display login page
	@Secured(['IS_AUTHENTICATED_FULLY'])
    def index() { }
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def getUserList() {

		def currentUser = SecAppUser.findById(springSecurityService.currentUser.id).username
		
		logDebugMessage("Getting User List For User: " + currentUser)
		
		def results = SecAppUser.findAll(sort:"username", order: "asc"){
			username != currentUser			
		}

		logDebugMessage("getUserList(): Returning " + results.size() + " users.")
						
		JSON.use('deep')
		render results as JSON
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def sendMessage(String message, String user){
		
		ChatMessage msg = new ChatMessage()
		
		msg.fromUser = SecAppUser.findById(springSecurityService.currentUser.id).username
		msg.toUser = user
		msg.message = message
		msg.dateTimeSent = new Date()

		logDebugMessage("Sending Message '" + msg.message + 
											"' From User '" + msg.fromUser + "' To User: '" + msg.toUser + "'")				
		String returnMessage = "Message Sent!"
		
		if (!msg.save(flush: true)) {
			logDebugMessage("Error Saving Message: ")
			msg.errors.each {
				logDebugMessage("Error: " + it)
			}
			
			returnMessage = "Error Sending Message"
		}
		
		render returnMessage
	}
	
	@Secured(['IS_AUTHENTICATED_FULLY'])
	def getMessages(String username){		
		
		String fromUserStr = SecAppUser.findById(springSecurityService.currentUser.id).username
		
		logDebugMessage("Returning Messages For User: " + username)
		
		def results = ChatMessage.where {
			(fromUser == fromUserStr && toUser == username) || (fromUser == username && toUser == fromUserStr)
		}.list()
		
		logDebugMessage("getMessages():Returning " + results.size() + " messages.")
			
		def msgList = []
		for(result in results){
			def dt = result.dateTimeSent.format("MM/dd/yyyy HH:mm:ss")
			def map = [dateTimeSent:dt, fromUser:result.fromUser, toUser:result.toUser, message:result.message]
			msgList.add(map)
		}
		
		JSON.use('deep')
		render msgList as JSON
	}
	
	private def logDebugMessage(String msg) {
		
		if(System.getProperty("bluechat.logging") != "DEBUG"){
			return
		}
		
		log.debug msg

	}
		
}
