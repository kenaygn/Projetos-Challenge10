import Foundation

protocol InstrumentSound {
    func makeSound() -> String
}

//Instrumento musical TEM UM som logo eu implemento um protocolo com composicao
class MusicalInstrument: InstrumentSound{
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() -> String {
       return "Som generico"
   }
    
}

//Bateria é um Instrumento, logo eu herdo atributos da classe acima
class Bateria: MusicalInstrument{
    override func makeSound() -> String {
        return "Som bateria"
    }
}


class Musico{
    func play(instrumento: MusicalInstrument) -> String{
       return instrumento.makeSound()
    }
}

let Drum: Bateria = Bateria(name: "Bateria1")
let Musico1: Musico = Musico()
print(Musico1.play(instrumento: Drum))


