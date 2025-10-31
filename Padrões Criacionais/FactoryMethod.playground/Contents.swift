import Foundation


// Aqui eu crio o Produto abstrato
protocol Veiculo{
    var nome: String { get }
    
    func dirigir()
}

//Agora criar o Produto concreto
class Carro: Veiculo{
    var nome = "Corolla"
    
    func dirigir() {
        print("Dirigindo \(nome)")
    }
}

class Moto: Veiculo{
    var nome = "MT03"
    
    func dirigir() {
        print("Dirigindo \(self.nome)")
    }
}

//Criar a fabrica abstrata que vai servir como contrato
protocol FactoryMethod{
    func criarVeiculo(tipo: String) -> Veiculo
}

//Fabrica Concreta que vai receber o parametro e passar para o objeto o veiculo desejado
class FactoryConcreta: FactoryMethod{
    func criarVeiculo(tipo: String) -> any Veiculo {
        switch tipo.lowercased(){
        case "carro":
            return Carro()
        case "moto":
            return Moto()
        default:
            fatalError("Tipo de veiculo desconhecido")
        }
    }
    
}

//Teste
let fabrica = FactoryConcreta()

var veiculo1 = fabrica.criarVeiculo(tipo: "carro")
var veiculo2 = fabrica.criarVeiculo(tipo: "moto")

veiculo1.dirigir()
veiculo2.dirigir()


