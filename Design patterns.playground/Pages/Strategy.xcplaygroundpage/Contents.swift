import Cocoa

/**
 The strategy pattern is used to create an interchangeable family of algorithms from which the required process is chosen at run-time.
 It's an entry point to composition versus inheritance.
 When you feel that the inheritance hierarchy is not only going downards but also horizontally, you may have to choose composition over inheritance.
 Use dependency injection into the client to reach max flexibility
 */

protocol FillableStrategy {
    func fillUp()
}

struct DieselStrategy: FillableStrategy {
    func fillUp() {
        print("\(DieselStrategy.self) engine must be filled up with diesel")
    }
}

struct ElectricStrategy: FillableStrategy {
    func fillUp() {
        print("\(ElectricStrategy.self) engine must be filled up with electricity")
    }
}

struct GasolineStrategy: FillableStrategy {
    func fillUp() {
        print("\(GasolineStrategy.self) engine must be filled up with gasoline")
    }
}

struct Client {
    private let strategy: FillableStrategy
    
    init(strategy: FillableStrategy) {
        self.strategy = strategy
    }
    
    func fillUp() {
        strategy.fillUp()
    }
}

let clientA = Client(strategy: DieselStrategy())
clientA.fillUp()

let clientB = Client(strategy: ElectricStrategy())
clientB.fillUp()

let clientC = Client(strategy: GasolineStrategy())
clientC.fillUp()

