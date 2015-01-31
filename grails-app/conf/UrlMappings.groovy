class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")

        "/"(controller:'ChatMessage',action:'index')
        "500"(view:'/error')
	}
}
