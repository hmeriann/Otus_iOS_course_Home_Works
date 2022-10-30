import Foundation

// MARK: - STACK Implementation
/// Stack is an Abstract data type with LIFO principle (ex. like a stack of plates)
///
protocol IStack {
    associatedtype T
    
    var isEmpty: Bool { get }
    var peek: T? { get }
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
    
    var peek: T? {
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
        return "Peak item: \(String(describing: self.peek)); count: \(self.count); elements: \(self.storage)"
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


// MARK: - QUEUE Implementation
/// Queue is an Abstract data type with FIFO principle (ex. like a queue)
/// the protocol describes the core operations for queue
public protocol IQueue {
    associatedtype Element
    /// Check if the queue is empty.
    var isEmpty: Bool { get }
    /// Return the element at the front of the queue without removing it
    var peek: Element? { get }

    /// Insert an element at the back of the queue. Returns true if the operation was successful.
    mutating func enqueue(_ element: Element) -> Bool
    /// Remove the element at the front of the queue and return it.
    mutating func dequeue() -> Element?
}
