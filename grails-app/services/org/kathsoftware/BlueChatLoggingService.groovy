package org.kathsoftware

import grails.transaction.Transactional

@Transactional
class BlueChatLoggingService {

    def logDebugMessage(String msg) {
		
		if(System.getProperty("bluechat.logging") != "DEBUG"){
			return
		}
		
		log.debug msg

    }
}
