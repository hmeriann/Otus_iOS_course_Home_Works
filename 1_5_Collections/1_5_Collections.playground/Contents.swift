import Foundation

// Есть произвольный массив чисел
var array: [Int] = []
for _ in 0..<20 {
    array.append(Int.random(in: -20...100))
}
//print(array)


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
