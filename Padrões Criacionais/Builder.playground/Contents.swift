import Foundation

 class Person{
     var name: String?
     var age: Int?
 }

//Com Builder
class PersonBuilder{
    private var person = Person()
    
    func resetPerson(){
        self.person = Person()
    }
    
    
    func setName(name: String){
        self.person.name = name
    }
    
    func setAge(age: Int){
        self.person.age =  age
    }
    
    func getResult() -> Person{
        return person
    }
}

//Teste

let personBuilder = PersonBuilder()

personBuilder.setAge(age: 25)
var person1 = personBuilder.getResult()

personBuilder.resetPerson()

personBuilder.setAge(age: 45)
personBuilder.setName(name: "Aurelio")
var person2 = personBuilder.getResult()



