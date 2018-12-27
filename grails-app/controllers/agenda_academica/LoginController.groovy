package agenda_academica

import grails.transaction.Transactional

@Transactional(readOnly = true)
class LoginController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Login.list(params), model:[loginInstanceCount: Login.count()]
    }

    def show(Login loginInstance) {
        respond loginInstance
    }

    def preLogin() {
        render view: '/aluno/login'
    }

    def create() {
        respond new Login(params)
    }

    @Transactional
    def save(Login loginInstance) {
        if (loginInstance == null) {
            notFound()
            return
        }

        if (loginInstance.hasErrors()) {
            respond loginInstance.errors, view:'create'
            return
        }

        loginInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'login.label', default: 'Login'), loginInstance.id])
                redirect loginInstance
            }
            '*' { respond loginInstance, [status: CREATED] }
        }
    }

    def edit(Login loginInstance) {
        respond loginInstance
    }

    @Transactional
    def update(Login loginInstance) {
        if (loginInstance == null) {
            notFound()
            return
        }

        if (loginInstance.hasErrors()) {
            respond loginInstance.errors, view:'edit'
            return
        }

        loginInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Login.label', default: 'Login'), loginInstance.id])
                redirect loginInstance
            }
            '*'{ respond loginInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Login loginInstance) {

        if (loginInstance == null) {
            notFound()
            return
        }

        loginInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Login.label', default: 'Login'), loginInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'login.label', default: 'Login'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    def login (){
        def aluno = Aluno.findByEmail(params.email)
        if(aluno && (aluno.senha == params.senha)){
            session.usuario = aluno
            render view: "/templates/_header"
        } else {
            render view:"/templates/_login"
        }
    }
}
