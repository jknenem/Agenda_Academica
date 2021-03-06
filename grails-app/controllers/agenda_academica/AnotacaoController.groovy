package agenda_academica

import grails.transaction.Transactional

@Transactional(readOnly = true)
class AnotacaoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Anotacao.list(params), model:[anotacaoInstanceCount: Anotacao.count()]
    }

    def show(Anotacao anotacaoInstance) {
        respond anotacaoInstance
    }

    def create() {
        respond new Anotacao(params)
    }

    @Transactional
    def save(Anotacao anotacaoInstance) {
        if (anotacaoInstance == null) {
            notFound()
            return
        }

        if (anotacaoInstance.hasErrors()) {
            respond anotacaoInstance.errors, view:'create'
            return
        }

        anotacaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'anotacao.label', default: 'Anotacao'), anotacaoInstance.id])
                redirect anotacaoInstance
            }
            '*' { respond anotacaoInstance, [status: CREATED] }
        }
    }

    def edit(Anotacao anotacaoInstance) {
        respond anotacaoInstance
    }

    @Transactional
    def update(Anotacao anotacaoInstance) {
        if (anotacaoInstance == null) {
            notFound()
            return
        }

        if (anotacaoInstance.hasErrors()) {
            respond anotacaoInstance.errors, view:'edit'
            return
        }

        anotacaoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Anotacao.label', default: 'Anotacao'), anotacaoInstance.id])
                redirect anotacaoInstance
            }
            '*'{ respond anotacaoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Anotacao anotacaoInstance) {

        if (anotacaoInstance == null) {
            notFound()
            return
        }

        anotacaoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Anotacao.label', default: 'Anotacao'), anotacaoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'anotacao.label', default: 'Anotacao'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
