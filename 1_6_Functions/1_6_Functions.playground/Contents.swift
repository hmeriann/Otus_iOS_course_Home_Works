import Foundation

// MARK: ex01 - Sum of two Ints
// функция складывает две целочисленных переменных - отдает на выходе сумму
func twoIntsSum(first: Int, second: Int) -> Int {
    return first + second
}

print("1) функция складывает две целочисленных переменных - отдает на выходе сумму:")
print(twoIntsSum(first: 0, second: -9))


// MARK: ex02 - String from tuple
// функция принимает кортеж из числа и строки приводит число к строке и ввыводит в консоль результат

func makeStringFromTuple(from pair:(Int, String)) -> String {
    return String(pair.0) + " " + pair.1
}

print("\n2) функция принимает кортеж из числа и строки приводит число к строке и ввыводит в консоль результат:")
print(makeStringFromTuple(from: (5, "мороженок")))


// MARK: ex03 - Optional closure
// функция принимает на вход опциональное замыкание и целое число, выполняет замыкание только в случае если число больше 0

func exampleWithClosure(with closure: ( () -> Int )?, and number: Int) {
    if number > 0 {
        closure?()
    }
}

print("\n3) функция принимает на вход опциональное замыкание и целое число, выполняет замыкание только в случае если число больше 0")
var num = 10
// не выполнится
exampleWithClosure(with: nil, and: num)
//выполнится
exampleWithClosure(with: {print("The number passed id >= 10 and equals to: \(num)"); return 0}, and: num)


// MARK: ex04 - Optional closure
// функция принимает число на вход (год), проверить високосный ли он

func isYearLeap(with year: Int) -> Bool {
    return year % 4 == 0
}

print("\n4) функция принимает число на вход (год), проверить високосный ли он")
let leapYear = 1984
let year = 1989
print("Is the \(leapYear) a leap year? - \(isYearLeap(with: leapYear))")
print("Is the \(year) a leap year? - \(isYearLeap(with: year))")
