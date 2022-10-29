import Foundation
import CoreGraphics
import Darwin

// ✅ В Playground реализуйте некоторый базовый класс из выбранной вами области описания (тематики).
// ✅ Добавьте в него свойства и методы, а также несколько инициализаторов. Класс должен содержать свойства и методы разной области видимости (private, fileprivate, internal или public)
// ✅ Создайте несколько классов-наследников. Переопределите при необходимости свойства и методы родителя. А также добавьте свои.
// ✅ В основном пространстве Playground создайте функцию для демонстрации полиморфизма.

/// any product - Parent class
class Product {
    /// internal property (by default)
    enum Kind {
        case food
        case thing
    }
    
    var kind: Kind
    var name: String
    
    init(
        kind: Kind,
        name: String
    ){
        self.kind = kind
        self.name = name
    }
    
    convenience init(
        name: String
    ) {
        self.init(kind: .thing, name: name)
    }
    
    func isEdible() -> Bool {
        return kind == .food
    }
    
    func nameLength(of name: String) -> Int {
        return name.count
    }
    
    func printName(with name: String) {
        print("The name is \(name).")
    }
}

/// Child class which inherits from the Parent class Product. Final means that it's impossible to inherit from this calss
final class RawProduct: Product {
    
    /// child class' internal property
    enum RawProductType {
        case fruit
        case berry
        case vegetable
        case mushroom
        case seed
    }
    
    var rawProductType: RawProductType
    
    init(
        with name: String,
        and rawProductType: RawProductType
    ) {
        self.rawProductType = rawProductType
        super.init(kind: .food, name: name)
    }
    
    convenience init(
        for fruit: String
    ) {
        self.init(with: fruit, and: .fruit)
    }
    
    override func printName(with name: String) {
        print("⚠️ This is the overrided function from the class called RawProduct⚠️\nThe products name is \(name) and it is a \(self.rawProductType).")
    }
}




let banana = Product(kind: .food, name: "Banana")
if banana.kind == Product.Kind.food {
    print("\(banana.name) is a 🍌 food. And its name contains \(banana.nameLength(of: banana.name)) characters.")
}

let box = Product(name: "Box")
print("This is a 📦 \(box.name) and it is a \(box.kind). By the way, is it edible? - \(box.isEdible())")

let berry = RawProduct(with: "Strawberry", and: .berry)
berry.printName(with: berry.name)
