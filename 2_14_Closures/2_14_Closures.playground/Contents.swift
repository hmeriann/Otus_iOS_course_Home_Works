import Foundation

// MARK: - Функция, принимающая функцию как параметр
func luckyNumberForName(name: String, _ lotteryHandler: (String, Int) -> String) -> String {
    let luckyNumber = Int(arc4random() % 100)
    return lotteryHandler(name, luckyNumber)
}

class FunLottery {
    func lotteryHandler(name: String, luckyNumber: Int) -> String {
        return "\(name), your lucky number is \(luckyNumber)"
    }
}

let funLottery = FunLottery()
print("▪️Функция, принимающая функцию как параметр")
print(luckyNumberForName(name: "Hey there", funLottery.lotteryHandler))

// MARK: - Функция с несколькими замыканиями

let running = {
    print("I can run")
}

let swimming = {
    print("I can swim")
}

let flying = {
    print("I can fly")
}

func abilities(first: () -> Void, second: () -> Void) {
    running()
    swimming()
}

print("\n▪️ Функция с несколькими замыканиями")
abilities(first: running, second: swimming)
abilities(first: running, second: flying)

// MARK: - Функция с autoclosure
/// @autoclosure attribute can be applied to a closure parameter for a function, and automatically creates a closure from an expression you pass in
let persons = ["Batman", "Bob", "Betty"]

func superpower(power: @autoclosure () -> Void) {
    for person in persons {
        if person.count % 2 == 0 {
            print("🦹🏽 I'm \(person) and ")
            flying()
        } else {
            print("🤖 I'm \(person) and")
            running()
        }
    }
}

print("\n▪️Функция с autoclosure")
superpower(power: ())

// MARK: - Использование внутренних функций (nested functions)

func printSmthg(name: String) {

    print("1️⃣ The persons name is \(name)")
    
    func printTwice() {
        print("2️⃣ Print name second time - \(name)")
    }
    printTwice()
}

print("\n▪️Использование внутренних функций")
printSmthg(name: persons[0])

// MARK: - Дженерик-функция с условием

func compare<T: Comparable>(_ lhs: T, _ rhs: T) -> Bool {
    return lhs < rhs
}

print("\n▪️Дженерик-функция с условием")
print(compare(4, 6))
print(compare(4, 4))
print(compare(4, 0))
print(compare("a", "b"))
print(compare("f", "f"))
print(compare("z", "d"))
