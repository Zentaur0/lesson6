//
//  main.swift
//  lesson6
//
//  Created by Антон Сивцов on 08.01.2021.
//

import Foundation

struct Journal {
    var name: String
    var mark: Int
}

extension Journal: CustomStringConvertible {
    var description : String {
        return "Имя: \(name), Оценка: \(mark)"
    }
}

struct Queue <T> {
    private var elements: [T] = []
    
    public var isEmpty: Bool {
        return elements.count == 0
    }
    
    mutating func addElement(element: T) {
        elements.append(element)
    }
    mutating func deleteFirstElement() -> T {
        return elements.removeFirst()
    }
    
    public var head: T? {
        if isEmpty {
            print("Ничего не найдено. Список пуст.")
            return nil
        } else {
            print("Последний элемент \(elements.last!).")
            return elements.last
        }
    }
    
    public var front: T? {
        if isEmpty {
            print("Ничего не найдено. Список пуст.")
            return nil
        } else {
            print("Первый элемент \(elements.first!).")
            return elements.first
        }
    }
    
    func printMyQueue() {
        print(elements)
    }
}

extension Queue {
    func filter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

var students = Queue<Journal>()
students.addElement(element: .init(name: "Рита", mark: 4))
students.addElement(element: .init(name: "Стив", mark: 5))
students.addElement(element: .init(name: "Ваня", mark: 5))
students.addElement(element: .init(name: "Борис", mark: 3))
students.addElement(element: .init(name: "Мария", mark: 4))
students.addElement(element: .init(name: "Егор", mark: 3))
students.addElement(element: .init(name: "Даниил", mark: 4))
students.addElement(element: .init(name: "Брук", mark: 3))

students.printMyQueue()
students.head
students.front

students.deleteFirstElement()

let honoursStudents = students.filter(predicate: {$0.mark == 5})
print(honoursStudents)
