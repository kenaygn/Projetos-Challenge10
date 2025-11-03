import Foundation

//Exemplo de API de enviar emial
class EmailAPI {
    func sendEmail(to email: String, subject: String, body: String) -> Bool {
        // Simulando o envio de e-mail
        if email.isEmpty {
            print("❌ Erro: destinatário inválido.")
            return false
        } else {
            print("📨 Enviando e-mail para \(email)...")
            print("Assunto: \(subject)")
            print("Mensagem: \(body)")
            print("✅ E-mail enviado com sucesso!\n")
            return true
        }
    }
}

//Adapter para nao depender da API externa
protocol SendEmail{
    func sendEmail(to email: String, subject: String, body: String) -> Bool
}

class EmailAdapter: SendEmail{
    private var emailAPI = EmailAPI()
    
    
    func sendEmail(to email: String, subject: String, body: String) -> Bool {
        return emailAPI.sendEmail(to: email, subject: subject, body: body)
    }
}


//Aplicação que em vez de usar a API utiliza apenas a classe Adapter e evita dependecia direta
var emailAdapter = EmailAdapter()

print(emailAdapter.sendEmail(to: "kenay@teste.com", subject: "Titulo teste para o email", body: "Testando o Adapter criado no teste de API"))
