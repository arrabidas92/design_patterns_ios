import Foundation

/**
 The decorator pattern attaches additional responsabilities to an object dynamically.
 We don't need to modify the behavior at compile time instead it changes at runtime.
 Decorators provides flexible alternative to subclassing for extending functionnality.
 */

protocol Beverage {
    func getCost() -> Int
    func getDescription() -> String
}

protocol BeverageDecorator: Beverage {
    var beverage: Beverage { get set }
}

final class CaramelDecorator: BeverageDecorator {
    var beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func getCost() -> Int {
        return beverage.getCost() + 2
    }
    
    func getDescription() -> String {
        return beverage.getDescription() + "\nDecorated with Caramel"
    }
}

final class ChocolateDecorator: BeverageDecorator {
    var beverage: Beverage
    
    init(beverage: Beverage) {
        self.beverage = beverage
    }
    
    func getCost() -> Int {
        return beverage.getCost() + 3
    }
    
    func getDescription() -> String {
        return beverage.getDescription() + "\nDecorated with Chocolate"
    }
}

final class Espresso: Beverage {
    func getCost() -> Int {
        return 1
    }
    
    func getDescription() -> String {
        return "It's an Espresso"
    }
}

let espresso = Espresso()
print(espresso.getDescription())
print(espresso.getCost())

let espressoWithCaramel = CaramelDecorator(beverage: espresso)
print(espressoWithCaramel.getDescription())
print(espressoWithCaramel.getCost())

let espressoWithChocolate = ChocolateDecorator(beverage: espresso)
print(espressoWithChocolate.getDescription())
print(espressoWithChocolate.getCost())

let espressoWithChocolateCaramel = ChocolateDecorator(beverage: espressoWithCaramel)
print(espressoWithChocolateCaramel.getDescription())
print(espressoWithChocolateCaramel.getCost())

let espressoWithCaramelChocolate = CaramelDecorator(beverage: espressoWithChocolate)
print(espressoWithCaramelChocolate.getDescription())
print(espressoWithCaramelChocolate.getCost())
