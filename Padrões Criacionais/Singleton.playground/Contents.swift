import Foundation

//Singleton
class AuthManager{
    //Primeiro passo garantir que exista apenas uma instacia
    @MainActor static let shared = AuthManager()
    
    //Criar um inicializado privado para que so tenha como chamar a class atraves da unica instancia dela
    private init(){}
    
    private var loggedInUser: String?
    
    func login(user: String){
        self.loggedInUser = user
        print("Login feito no usuario: \(user)")
    }
    
    func logout(){
        self.loggedInUser = nil
    }
    
    func getUser() -> String{
        return self.loggedInUser ?? "Nenhum usuario logado"
    }
    
}

//Testando Singleton
AuthManager.shared.login(user: "Kenay")
AuthManager.shared.logout()
AuthManager.shared.getUser()
