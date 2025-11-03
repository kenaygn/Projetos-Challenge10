import Foundation

// Sistema 1: Validação de E-mail
class EmailValidator {
    func isValid(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }
}

// Sistema 2: Montagem da Mensagem
class EmailBuilder {
    func buildMessage(to: String, content: String) -> String {
        return """
        Para: \(to)
        Assunto: Notificação
        Mensagem: \(content)
        """
    }
}

// Sistema 3: Envio do E-mail (simulando uma API externa)
class EmailService {
    func send(_ message: String) {
        print("Enviando e-mail...")
        print(message)
        print("E-mail enviado com sucesso!\n")
    }
}

// Facade — simplifica todo o processo para o cliente
class NotificationFacade {
    private let validator = EmailValidator()
    private let builder = EmailBuilder()
    private let service = EmailService()
    
    func sendEmail(to email: String, message content: String) {
        guard validator.isValid(email) else {
            print("E-mail inválido: \(email)")
            return
        }
        
        let message = builder.buildMessage(to: email, content: content)
        service.send(message)
    }
}


// Cliente — usa o Facade de forma simples em apenas uma linha
let notification = NotificationFacade()
notification.sendEmail(to: "kenay@email.com", message: "Olá Kenay, você recebeu uma nova mensagem!")



//Sem o Facade ficaria assim
 let validator = EmailValidator()
 let builder = EmailBuilder()
 let service = EmailService()

 if validator.isValid("kenay@email.com") {
     let msg = builder.buildMessage(to: "kenay@email.com", content: "Olá!")
     service.send(msg)
 }

