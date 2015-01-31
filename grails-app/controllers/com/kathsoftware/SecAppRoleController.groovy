package com.kathsoftware



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SecAppRoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SecAppRole.list(params), model:[secAppRoleInstanceCount: SecAppRole.count()]
    }

    def show(SecAppRole secAppRoleInstance) {
        respond secAppRoleInstance
    }

    def create() {
        respond new SecAppRole(params)
    }

    @Transactional
    def save(SecAppRole secAppRoleInstance) {
        if (secAppRoleInstance == null) {
            notFound()
            return
        }

        if (secAppRoleInstance.hasErrors()) {
            respond secAppRoleInstance.errors, view:'create'
            return
        }

        secAppRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'secAppRole.label', default: 'SecAppRole'), secAppRoleInstance.id])
                redirect secAppRoleInstance
            }
            '*' { respond secAppRoleInstance, [status: CREATED] }
        }
    }

    def edit(SecAppRole secAppRoleInstance) {
        respond secAppRoleInstance
    }

    @Transactional
    def update(SecAppRole secAppRoleInstance) {
        if (secAppRoleInstance == null) {
            notFound()
            return
        }

        if (secAppRoleInstance.hasErrors()) {
            respond secAppRoleInstance.errors, view:'edit'
            return
        }

        secAppRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SecAppRole.label', default: 'SecAppRole'), secAppRoleInstance.id])
                redirect secAppRoleInstance
            }
            '*'{ respond secAppRoleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SecAppRole secAppRoleInstance) {

        if (secAppRoleInstance == null) {
            notFound()
            return
        }

        secAppRoleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SecAppRole.label', default: 'SecAppRole'), secAppRoleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppRole.label', default: 'SecAppRole'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
