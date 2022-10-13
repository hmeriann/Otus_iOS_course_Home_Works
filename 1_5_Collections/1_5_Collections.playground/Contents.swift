import Foundation
import CoreGraphics

// Есть произвольный массив чисел
var array: [Int] = []
for _ in 0..<20 {
    array.append(Int.random(in: -20...100))
}
//print(array)

// MARK: ex01 - Swap min with max
// найти максимальное и минимальное число и поменять их местами
func swapMinWithMax(in array: [Int]) -> [Int] {
    var minInd: Int = 0
    var minValue: Int = Int.max
    var maxInd: Int = 0
    var maxValue: Int = Int.min
    var newArray = array
//ищу индекс и запоминаю число для дальнейшего сравнения
    for i in 0 ..< array.count {
        if array[i] < minValue {
            minInd = i
            minValue = array[i]
        }
        if array[i] > maxValue {
            maxInd = i
            maxValue = array[i]
        }
    }
    //просто меняю местами в новом массиве (старый константа)
    newArray[minInd] = array[maxInd]
    newArray[maxInd] = array[minInd]
    return newArray
}


//for i in 0 ..< array.count {
//    print(array[i], terminator: ", ")
//}
//
//print("\n")
//var newArr = swapMinWithMax(in: array)
//
//for i in 0 ..< newArr.count {
//    print(newArr[i], terminator: ", ")
//}


// MARK: ex02 - Intersection
// собрать результирующее множество из символов, что повторяются в 2х массивах
// Есть два массива символов:
let arrayOne: [Character] = ["h", "e", "l", "l", "o", "u", "y", "m"]
let arrayTwo: [Character] = ["s", "u", "m", "m", "e", "r", "l", "l", "k"]

func intersection(of arrayOne: [Character], with arrayTwo: [Character]) -> Set<Character> {
    
    return Set(arrayOne).intersection(Set(arrayTwo))
}

let mySet = intersection(of: arrayOne, with: arrayTwo)
for i in 0 ..< Array(mySet).count {
    print(Array(mySet)[i], terminator: " ")
}
