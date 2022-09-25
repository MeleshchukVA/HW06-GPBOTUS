import UIKit

/*
 Реализуйте дженерик-класс для структуры данных Stack, Deque или Queue.
 Класс должен содержать дженерик-методы согласно выбранному типу структуры данных.
 В Playground основном пространстве напишите пример с использованием созданного класса
 */

// MARK: - Stack

struct Stack<T> {
    
    fileprivate var stackData: [T] = []
    
    var isEmpty: Bool {
        stackData.isEmpty
    }
    var count: Int {
        stackData.count
    }
    
    mutating func append(_ text: T) {
        stackData.append(text)
    }
    mutating func popLast() -> T? {
        stackData.popLast()
    }
    func peek() -> T? {
        stackData.last
    }
}

var testStack = Stack<Any>()
testStack.append("hello")
testStack.append("Stack")
testStack.append(1)
testStack.append(3)
testStack.append(33.098)
testStack.peek()
testStack.popLast()
testStack.peek()

// MARK: - Queue

class Node<T> {
    
    var value: T
    var next: Node?
    var prev: Node?

    init(value: T) {
        self.value = value
    }
}

class Queue<T> {

    private var head: Node<T>?
    private var tail: Node<T>?

    var isEmpty: Bool {
        get {
            return head == nil
        }
    }

    func add(value: T) {
        if head == nil {
            let node = Node(value: value)
            head = node
            tail = node
            head?.next = tail
            tail?.prev = head
        }  else {
            let curr = tail
            tail = Node(value: value)
            curr?.next = tail
            tail?.prev = curr
        }
    }

    func peek() -> T? {
        return head?.value
    }

    func poll() -> T? {
        if let value = head?.value {
            head = head?.next
            return value
        }
        return nil
    }
}

let testQueue = Queue<Int>()
testQueue.add(value: 1)
testQueue.add(value: 2)
testQueue.add(value: 3)
testQueue.add(value: 4)
testQueue.add(value: 5)
testQueue.poll()
testQueue.poll()
testQueue.poll()
testQueue.poll()
testQueue.add(value: 6)
testQueue.isEmpty
testQueue.peek()
testQueue.poll()
testQueue.poll()
testQueue.poll()
testQueue.isEmpty
