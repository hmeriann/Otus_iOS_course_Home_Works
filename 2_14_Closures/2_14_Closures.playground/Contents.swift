import Foundation

//Функция, принимающая функцию как параметр
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
print(luckyNumberForName(name: "Mr. Roboto", funLottery.lotteryHandler))

//Функция с несколькими замыканиями


//Функция с autoclosure
//Использование внутренних функций
//Дженерик-функция с условием
//В Playground добавьте пример для демонстрации работы.
