import Foundation

/**
 The factory method pattern defines an interface for creating an object.
 But let subclasses decide which class to instantiate.
 Factory method let subclasses defer instanciation to subclasses.
 */

protocol ResourceServer {
    var pathURL: String { get }
}

struct ProductionResourceServer: ResourceServer {
    var pathURL: String {
        return "https://prod.api"
    }
}

struct DevelopmentResourceServer: ResourceServer {
    var pathURL: String {
        return "https://dev.api"
    }
}

protocol Factory {
    func createResourceServer() -> ResourceServer
}

struct ResourceServerFactory: Factory {
    enum Environment {
        case prod
        case dev
    }
    
    private var environment: Environment
    
    init(environment: Environment) {
        self.environment = environment
    }
    
    func createResourceServer() -> ResourceServer {
        switch environment {
        case .prod:
            return ProductionResourceServer()
        case .dev:
            return DevelopmentResourceServer()
        }
    }
}

let factory = ResourceServerFactory(environment: .prod)
let resourceServer = factory.createResourceServer()
print("Factory creates path url", resourceServer.pathURL)
