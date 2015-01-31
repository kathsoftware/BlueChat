package com.kathsoftware



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SecAppUserSecAppRoleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SecAppUserSecAppRole.list(params), model:[secAppUserSecAppRoleInstanceCount: SecAppUserSecAppRole.count()]
    }

    def show(SecAppUserSecAppRole secAppUserSecAppRoleInstance) {
        respond secAppUserSecAppRoleInstance
    }

    def create() {
        respond new SecAppUserSecAppRole(params)
    }

    @Transactional
    def save(SecAppUserSecAppRole secAppUserSecAppRoleInstance) {
        if (secAppUserSecAppRoleInstance == null) {
            notFound()
            return
        }

        if (secAppUserSecAppRoleInstance.hasErrors()) {
            respond secAppUserSecAppRoleInstance.errors, view:'create'
            return
        }

        secAppUserSecAppRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), secAppUserSecAppRoleInstance.id])
                redirect secAppUserSecAppRoleInstance
            }
            '*' { respond secAppUserSecAppRoleInstance, [status: CREATED] }
        }
    }

    def edit(SecAppUserSecAppRole secAppUserSecAppRoleInstance) {
        respond secAppUserSecAppRoleInstance
    }

    @Transactional
    def update(SecAppUserSecAppRole secAppUserSecAppRoleInstance) {
        if (secAppUserSecAppRoleInstance == null) {
            notFound()
            return
        }

        if (secAppUserSecAppRoleInstance.hasErrors()) {
            respond secAppUserSecAppRoleInstance.errors, view:'edit'
            return
        }

        secAppUserSecAppRoleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SecAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), secAppUserSecAppRoleInstance.id])
                redirect secAppUserSecAppRoleInstance
            }
            '*'{ respond secAppUserSecAppRoleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SecAppUserSecAppRole secAppUserSecAppRoleInstance) {

        if (secAppUserSecAppRoleInstance == null) {
            notFound()
            return
        }

        secAppUserSecAppRoleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SecAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), secAppUserSecAppRoleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'secAppUserSecAppRole.label', default: 'SecAppUserSecAppRole'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
