import Foundation
//3.
//4. функция принимает число на вход (год), проверить високосный ли он

// Есть произвольный массив чисел
var array: [Int] = []
for _ in 0..<20 {
    array.append(Int.random(in: -20...100))
}
//print(array)

// MARK: ex01 - Sum of two Ints
// функция складывает две целочисленных переменных - отдает на выходе сумму
func twoIntsSum(first: Int, second: Int) -> Int {
    return first + second
}

//print(twoIntsSum(first: 0, second: -98765643))


// MARK: ex02 - String from tuple
// функция принимает кортеж из числа и строки приводит число к строке и ввыводит в консоль результат

func makeStringFromTuple(from pair:(Int, String)) -> String {
    return String(pair.0) + " " + pair.1
}

//print(makeStringFromTuple(from: (5, "мороженок")))

// MARK: ex03 - Optional closure
// функция принимает на вход опциональное замыкание и целое число, выполняет замыкание только в случае если число больше 0

var dict = ["ann": "password",
            "lizzy": "Access7forbidden",
            "john404": "File not found",
            "cole500": "Internal server error"]

func findUsernameWithLongerPassword(from dict: [String: String]) -> [String] {
    var result: [String] = []
    
    for v in dict.values {
        if v.count >= 10 {
            result.append(v)
        }
    }
    
    return result
}

//var arr = findUsernameWithLongerPassword(from: dict)
//
//dict.forEach { print($0) }
//print()
//
//arr.forEach { print($0) }
//print()
