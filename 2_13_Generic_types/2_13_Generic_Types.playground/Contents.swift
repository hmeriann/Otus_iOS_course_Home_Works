import Foundation

// MARK: - STACK Implementation
/// Stack is an Abstract data type with LIFO principle (ex. like a stack of plates)
///
protocol IStack {
    associatedtype T
    
    var isEmpty: Bool { get }
    var peak: T? { get }
    var count: Int { get }
    
    mutating func pop() -> T?
    mutating func push(element: T)
}

struct Stack<T> {
    fileprivate var storage: [T]
    init(
        storage: [T] = []
    ) {
        self.storage = storage
    }
}

// MARK: - IStack
extension Stack: IStack {
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    var peak: T? {
        return storage.last
    }
    
    var count: Int {
        return storage.count
    }
    
    mutating func pop() -> T? {
        return storage.popLast()
    }
    
    mutating func push(element: T) {
        storage.append(element)
    }
}

/// for printing the stack w/o cicle
extension Stack: CustomStringConvertible {
    var description: String {
        return "Peak item: \(String(describing: self.peak)); count: \(self.count); elements: \(self.storage)"
    }
}

/// Type eliciation (compiler knows that the stack is made with array of ints and can understand because of it the type of the stack elements)
var stack = Stack(storage: [1, 2, 7])
stack.push(element: 9)

print(stack)
//
//while let lastElement = stack.pop() {
//    print(lastElement)
//}

//var stack: Stack<Int> = Stack()
//stack.push(element: 1)
//stack.push(element: 2)
//stack.push(element: 7)
