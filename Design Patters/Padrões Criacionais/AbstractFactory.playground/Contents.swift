import Foundation

// =========================================================
// PROTOCOLO PRINCIPAL — GUIFactory
// ---------------------------------------------------------
// Aqui definimos a *família de produtos* que nossas fábricas
// concretas (Windows e Mac) deverão produzir.
// Cada fábrica precisa saber criar botões e checkboxes.
// =========================================================

protocol GUIFactory {
    func createButton() -> Button
    func createCheckBox() -> CheckBox
}



// =========================================================
// FABRICAS CONCRETAS — WinFactory e MacFactory
// ---------------------------------------------------------
// Cada uma implementa o protocolo GUIFactory, ou seja,
// sabe como criar os produtos específicos do seu "mundo".
// =========================================================

class WinFactory: GUIFactory {
    func createButton() -> Button {
        return WinButton()
    }
    
    func createCheckBox() -> CheckBox {
        return WinCheck()
    }
}

class MacFactory: GUIFactory {
    func createButton() -> Button {
        return MacButton()
    }
    
    func createCheckBox() -> CheckBox {
        return MacCheck()
    }
}



// =========================================================
// PRODUTOS ABSTRATOS — Button e CheckBox
// ---------------------------------------------------------
// Definimos as interfaces (protocolos) dos produtos que
// todas as fábricas devem produzir.
// Assim, o código do cliente pode usar esses produtos
// sem saber qual é a implementação concreta.
// =========================================================

protocol Button {
    func paint()
}

protocol CheckBox {
    func mark()
}



// =========================================================
// PRODUTOS CONCRETOS — Windows e Mac
// ---------------------------------------------------------
// Aqui criamos as implementações específicas para cada
// sistema operacional. Cada fábrica concreta retornará
// instâncias dessas classes.
// =========================================================

// Produtos da família Windows
class WinButton: Button {
    func paint() {
        print("Pintando o botão no estilo Windows")
    }
}

class WinCheck: CheckBox {
    func mark() {
        print("Marcando o checkbox no estilo Windows")
    }
}

// Produtos da família Mac
class MacButton: Button {
    func paint() {
        print("Pintando o botão no estilo Mac")
    }
}

class MacCheck: CheckBox {
    func mark() {
        print("Marcando o checkbox no estilo Mac")
    }
}



// =========================================================
// CLASSE CLIENTE — Application
// ---------------------------------------------------------
// A classe Application usa uma fábrica (GUIFactory),
// mas não precisa saber se ela é Mac ou Windows.
// Isso garante baixo acoplamento e facilita a escalabilidade.
// =========================================================

class Application {
    private let factory: GUIFactory
    private let button: Button
    private let checkBox: CheckBox
    
    init(factory: GUIFactory) {
        self.factory = factory
        self.button = factory.createButton()
        self.checkBox = factory.createCheckBox()
    }
    
    func actions() {
        button.paint()
        checkBox.mark()
    }
}



// =========================================================
// CÓDIGO CLIENTE — Selecionando a fábrica adequada
// ---------------------------------------------------------
// Aqui simulamos a escolha da fábrica com base no sistema
// operacional. O resto do código não precisa mudar!
// =========================================================

var OS = "Mac"
var factory: GUIFactory

switch OS {
case "Mac":
    factory = MacFactory()
case "Win":
    factory = WinFactory()
default:
    fatalError("Sistema operacional não suportado.")
}

// Inicializando a aplicação com a fábrica escolhida
let application = Application(factory: factory)
application.actions()
