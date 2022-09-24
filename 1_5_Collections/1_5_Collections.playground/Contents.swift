import Foundation

// создаем массив, заполняем рандомными int-ами
var array: [Int] = []
for _ in 0..<20 {
    array.append(Int.random(in: 0...19))
}
print(array)

// version A: O(N^2)

func indexOfFirstDuplicate(in array: [Int]) -> Int {

    for i in 0 ..< array.count {
        // сравниваем каждое i-тое значение только с оставшимися в массиве значениями
        for j in i + 1 ..< array.count {
            // если совпадение со значением по какому-либо из следующих индексов есть, возвращаем его
            if array[i] == array[j] {
                return i
            }
        }
    }
    //если совпадений не было, возвращаем -1
    return -1
}

//let result = indexOfFirstDuplicate(in: array)
//print(result)

// version B: O(N)

func indexOfFirstDuplicateLinear(in array: [Int]) -> Int {
    // в этом словаре по ключу будут храниться значения, а в значении будут индексы массива
    var dict: [Int: Int] = [:]
    
    //эта переменная для хранения минимального индекса
    var minInd = Int.max
    //за одну проходку по массиву
    for i in 0 ..< array.count {
        //получаем ключ(индекс) в переменную и если этот индекс самый левый, его сохраняем как минимум (это нужно, чтобы кейс [2, 4, 5, 5, 2] отработал корректно
        if let prevInd = dict[array[i]] {
            if minInd > prevInd {
                minInd = prevInd
            }
        }
        dict[array[i]] = i
    }
    return minInd == Int.max ? -1 : minInd
}
 
//let res2 = indexOfFirstDuplicateLinear(in: array)
//print(res2)
