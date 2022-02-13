import UIKit

/**
 The abstract factory method provides an interface for creating families of related or dependent objects.
 Without specifying their concrete classes.
 */

protocol AbstractFactory {
    func createProductA() -> AbstractProductA
    func createProductB() -> AbstractProductB
}

protocol AbstractProductA {
    func usefulFunctionA() -> String
}

protocol AbstractProductB {
    func usefulFunctionB() -> String
    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String
}

struct ConcreteProductA1: AbstractProductA {
    func usefulFunctionA() -> String {
        return "The result of the product A1."
    }
}

struct ConcreteProductA2: AbstractProductA {
    func usefulFunctionA() -> String {
        return "The result of the product A2."
    }
}

class ConcreteProductB1: AbstractProductB {
    func usefulFunctionB() -> String {
        return "The result of the product B1."
    }

    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String {
        let result = collaborator.usefulFunctionA()
        return "The result of the B1 collaborating with the (\(result))"
    }
}

class ConcreteProductB2: AbstractProductB {
    func usefulFunctionB() -> String {
        return "The result of the product B2."
    }

    func anotherUsefulFunctionB(collaborator: AbstractProductA) -> String {
        let result = collaborator.usefulFunctionA()
        return "The result of the B2 collaborating with the (\(result))"
    }
}

class ConcreteFactory1: AbstractFactory {

    func createProductA() -> AbstractProductA {
        return ConcreteProductA1()
    }

    func createProductB() -> AbstractProductB {
        return ConcreteProductB1()
    }
}

class ConcreteFactory2: AbstractFactory {

    func createProductA() -> AbstractProductA {
        return ConcreteProductA2()
    }

    func createProductB() -> AbstractProductB {
        return ConcreteProductB2()
    }
}

class Client {

    static func someClientCode(factory: AbstractFactory) {
        let productA = factory.createProductA()
        let productB = factory.createProductB()

        print(productB.usefulFunctionB())
        print(productB.anotherUsefulFunctionB(collaborator: productA))
    }
}

print("Client: Testing client code with the first factory type:")
Client.someClientCode(factory: ConcreteFactory1())

print("Client: Testing the same client code with the second factory type:")
Client.someClientCode(factory: ConcreteFactory2())
