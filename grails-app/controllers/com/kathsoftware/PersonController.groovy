package com.kathsoftware

class PersonController {

	def welcome(){}
	
    def showregister(){
		[secAppUserInstance: new SecAppUser()]
		render(view: "register")
	}
	
	def register(){
		
		SecAppUser p = new SecAppUser()
		
		p.password = params.password
		p.username = params.username
		
		if (!p.save(flush: true)) {
			render(view: "register", model: [secAppUserInstance: p])
			flash.message = "Error Registering, Please complete all fields!"
			return
		}

		SecAppUserSecAppRole.create p, servletContext.userRole, true
				
		redirect(controller: "ChatMessage", action: "index")
	}

}
