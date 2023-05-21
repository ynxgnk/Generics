import UIKit

/*
 
 Обобщения(Generics) - обобщенные типы данных
 T - наименование типа
 
 Equatable - протокол для значений которые могут быть равны или не равны(true, true,...); (==, !=)
 
 Comparable - протокол для сравниваемых или сопоставляемых значений (>, <, <=, >=, ==, !=);
 
 CustomStringConvertible - значения, которые могут быть представленны в виду строки
 
 Numeric - все числа
 
 */

func addInts(a: Int, b: Int) -> Int {
    return a + b
}

func addDoubles(a: Double, b: Double) -> Double {
    return a + b
}

func add<T: Numeric>(a: T, b: T) -> T { /* Т может быть любым типом, который удовлетворяет протоколу Numeric */
    return a+b
}

add(a: 56, b: 23)
add(a: 56.4, b: 23)

protocol Storage {
    associatedtype Item
    func store(item: Item)
    func retrieve(index: Int) -> Item?
}

struct Book {
    let title: String
    let author: String
}

class Bookcase: Storage {
    typealias Item = Book
    
    var books = [Book]()
    
    func store(item: Book) {
        books.append(item)
    }
    
    func retrieve(index: Int) -> Book? {
        guard index < books.count else {
            return nil
        }
        
        return books[index]
    }
    
}

class Case<Item>: Storage {
    
    var items = [Item]()
    
    func store(item: Item) {
        items.append(item)
    }
    
    func retrieve(index: Int) -> Item? {
        guard index < items.count else {
            return nil
        }
        
        return items[index]
    }
}

struct Clothes {
    let brand: String
    let price: Int
    let size: String
}

let tShort = Clothes(brand: "versace", price: 1500, size: "L")
let shoes = Clothes(brand: "Nike", price: 100, size: "42")

let clothesCase = Case<Clothes>()

clothesCase.store(item: tShort)
clothesCase.store(item: shoes)

clothesCase.items.count
clothesCase.items.last?.price
clothesCase.items.last?.brand

//Stack

//Container - массив записей
//push - положить в стек
//pop - достать последний элемент из стека
//isEmpty - пустой ли стек
//size - размер стека
//top - верхний элемент стека
//Mutating - метод который приводит к изменению структуры

struct Stack<T> {
    private var container = [T]()
    
    var isEmpty: Bool {
        return self.container.isEmpty
    }
    
    var size: Int {
        return self.container.count
    }
    
    var top: T? {
        return self.container.last
    }
    
    mutating func push(_ element: T) {
        self.container.append(element)
    }
    
    mutating func pop() -> T? {
        if !self.isEmpty {
            return container.removeLast()
        } else {
            return nil
        }
    }
}
 
var stack = Stack<String>()
stack.push("One")
stack.push("Two")
stack.push("Three")
stack.push("Four")

stack.size
stack.isEmpty
stack.top
stack.pop()
stack.top
stack.size
stack.pop()
stack.pop()
stack.pop()
stack.size
stack.isEmpty
