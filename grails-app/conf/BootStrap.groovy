import com.kathsoftware.SecAppRole

class BootStrap {

    def init = { servletContext ->
		def userRole = SecAppRole.findByAuthority("ROLE_USER") ?: new SecAppRole(authority: "ROLE_USER").save()
		def adminRole = SecAppRole.findByAuthority("ROLE_ADMIN") ?: new SecAppRole(authority: "ROLE_ADMIN").save()
    }
    def destroy = {
    }
}
