//  main.swift
//  L6_Vakulenko
//  Created by Roman Vakulenko on 19.05.2022. guard
import Foundation

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//очередь наполняется слева направо (т.е. 1 на обслуживание справа)
struct Queue<T> {
    var elements: [T] = []
    mutating func getInQueue(_ value: T) {
        elements.insert(value, at: 0)
    }
    mutating func getOutQueue() -> T? {
        guard !elements.isEmpty else { //если массив не пустой, тогда выполнится строка №15. Иначе вернет nil (13string)
            return nil
        }
        return elements.removeLast() //удалится первый в очереди = тот, кто справа, если массив не пустой
    }
    var nextToServeInQueue: T? { // следующий на обслуживание в очереди
        return elements.last
    }
    var lastInQueue: T? { // последний в очереди
        return elements.first
    }
}
var line = Queue<Int> (elements: [2,34,44,15])
line.getInQueue(123)
line.getOutQueue()

//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов) - closures
let upwardSorting = line.elements.sorted { num1, num2 in
    return num1 < num2
}
let downSorting = line.elements.sorted(by: >)
//захват значений

print(line)
print(upwardSorting)
print(downSorting)

