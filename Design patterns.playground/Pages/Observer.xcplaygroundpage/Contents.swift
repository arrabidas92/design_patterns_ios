import Foundation
import CoreGraphics

/**
 The observer pattern is used to allow an object to publish changes to its state. Other objects subscribe to be immediately notified of any changes.
 It's a push strategy versus a poll strategy meaning that new states are pushed instead of asked again and again.
 */

protocol IObservable {
    func add(_ observer: IObserver)
    func remove(_ observer: IObserver)
    func notify()
    func getState() -> Int
    func setState(_ number: Int)
}

protocol IObserver {
    var id: String { get set }
    func update()
}

class ConcreteObservable: IObservable {
    private var _observers = [IObserver]()
    private var _state = 0 {
        didSet {
            notify()
        }
    }
    
    func add(_ observer: IObserver) {
        _observers.append(observer)
    }
    
    func remove(_ observer: IObserver) {
        _observers.removeAll { $0.id == observer.id }
    }
    
    func notify() {
        _observers.forEach { observer in
            observer.update()
        }
    }
    
    func getState() -> Int {
        return _state
    }
    
    func setState(_ number: Int) {
        _state = number
    }
}

class ConcreteObserver: IObserver {
    private let observable: IObservable
    
    var id: String
    
    init(_ id: String, _ observable: IObservable) {
        self.id = id
        self.observable = observable
    }
    
    func update() {
        print("Observer \(id) received state", observable.getState())
    }
}

let observable = ConcreteObservable()
let firstObserver = ConcreteObserver("1", observable)
let secondObserver = ConcreteObserver("2", observable)

observable.add(firstObserver)
observable.add(secondObserver)

observable.setState(1)
observable.setState(2)

observable.remove(firstObserver)

observable.setState(3)

observable.remove(secondObserver)

observable.setState(4)
