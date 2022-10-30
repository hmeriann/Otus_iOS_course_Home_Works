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
    
    func printName() {
        print("The name is \(self.name).")
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
    
    override func printName() {
        print("⚠️ This is the overrided function from the class called RawProduct⚠️\nThe products name is \(name) and it is a \(self.rawProductType).")
    }
}


class Clothes: Product {
    enum ClothesType {
        case dress
        case pant
        case shirt
        case longsleeve
    }
    
    enum Size: Int {
        case xSmall=1, small, medium, large, xLarge
        
        func getCurrentSize() -> String {
            return Size.getSize(index: rawValue)
        }
        
        static func getSize(index: Int) -> String {
            switch index {
            case 1:
                return "XS"
            case 2:
                return "S"
            case 3:
                return "M"
            case 4:
                return "L"
            case 5:
                return "XL"
            default:
                return "free size"
            }
        }
    }
    
    var clothesType: ClothesType
    var size: Size
    
    init(
        with clothesType: ClothesType,
        of size: Size
    ) {
        self.clothesType = clothesType
        self.size = size
        super.init(kind: .thing, name: "🥻")
    }
    
    func getFullInfo(of thing: Clothes) {
        print("Full info of \(thing.name):\n▪️ Type: \(thing.clothesType)\n▪️ Size \(thing.size)\n▪️ Is it edible: \(thing.isEdible())")
    }
}

//print("\n🌀 Check Parent class object creation")
//let banana = Product(kind: .food, name: "Banana")
//if banana.kind == Product.Kind.food {
//    print("\(banana.name) is a 🍌 food. And its name contains \(banana.nameLength(of: banana.name)) characters.")
//}
//
//print("\n🌀 Check Parent class object creation only with name")
//let box = Product(name: "Box")
//print("This is a 📦 \(box.name) and it is a \(box.kind). By the way, is it edible? - \(box.isEdible())")
//
//print("\n🌀 Check Child class RawProduct object creation")
//let berry = RawProduct(with: "Strawberry", and: .berry)
//berry.printName(with: berry.name)
//
//print("\n🌀 Check Child class Clothes object creation")
//let jeans = Clothes(with: .pant, of: .medium)
//jeans.getFullInfo(of: jeans)


func demonstratePolymorphism() {
    let products: [Product] = [Product(name: "donut"), RawProduct(with: "Mushroom", and: .mushroom), Clothes(with: .dress, of: .small)]
    products.forEach { $0.printName() }
}

demonstratePolymorphism()
