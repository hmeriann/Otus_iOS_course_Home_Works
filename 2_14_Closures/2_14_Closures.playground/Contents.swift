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
print(luckyNumberForName(name: "Mr. Roboto", funLottery.lotteryHandler))

// MARK: - Функция с несколькими замыканиями

let printAction = { (action: String) in
    print("Look how I can \(action)")
}

let printSum = { (x: Int, y: Int) in
    print("The sum of X and Y is \(String(x+y))")
}

func abilities(printAction: () -> Void, printSum: () -> Void) {
    printAction((action: "run") -> Void)
    printSum(4, 8)
}




// MARK: - Функция с autoclosure
// MARK: - Использование внутренних функций
// MARK: - Дженерик-функция с условием
