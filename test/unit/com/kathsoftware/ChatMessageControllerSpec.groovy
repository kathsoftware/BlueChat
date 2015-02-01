package com.kathsoftware

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(ChatMessageController)
@Mock([SecAppUser, SecAppUserSecAppRole, ChatMessage])
class ChatMessageControllerSpec extends Specification {

	
    def setup() {
		
		def users = ["jkath", "mcaldas", "sjang"]
		def passwords = ["pwd1", "pwd2", "pwd3"]
		
		for(def x = 0; x < users.size(); x++){
		
			SecAppUser p = new SecAppUser()
			
			p.username = users[x]
			p.password = passwords[x]
			
			if (!p.save(flush: true)) {
				println "Error Registering User: " + users[x]
				break
			}
	
			SecAppUserSecAppRole.create p, servletContext.userRole, true

			println "Success Registering User: " + users[x]
		}
		
		controller.springSecurityService = [currentUser:[id:1]]
		
		ChatMessage msg = new ChatMessage()
		
		msg.fromUser = "jkath"
		msg.toUser = "mcaldas"
		msg.message = "This is a unit test message"
		msg.dateTimeSent = new Date()

		if (!msg.save(flush: true)) {
			println "Error Saving Setup Message."
			msg.errors.each {
				println "Error: " + it
			}
		}else{
			println "Success setting up sent message"
		}
		
    }

    def cleanup() {
    }

    void "test getUserList"() {
		
		when:
		controller.getUserList()

		then:
		println "======================================="
		println response.text
		println "======================================="
		
		response.text.contains("sjang")
		!response.text.contains("jkath")  //Since this is the currentUser, it shouldn't be in the list
		response.text.contains("mcaldas")
		!response.text.contains("bob")
	}
	
	void "test sendMessage"() {
		
		when:
		controller.sendMessage("This is a unit test message", "mcaldas")

		then:
		println "======================================="
		println response.text
		println "======================================="
		
		response.text == "Message Sent!"
	}
	
	void "test getMessages()"() {
		
		when:
		controller.getMessages("mcaldas")
		
		then:
		println "======================================="
		println response.text
		println "======================================="

		response.text.contains("This is a unit test message")
		!response.text.contains("Error Sending Message")
		
	}

}
