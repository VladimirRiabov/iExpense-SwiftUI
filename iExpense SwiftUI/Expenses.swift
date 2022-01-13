//
//  Expenses.swift
//  iExpense SwiftUI
//
//  Created by Владимир Рябов on 13.01.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        //дидсет будет запускатсья каждый раз когда мы пытаемся изменить значение items путем append delete и тд, он каждый раз автоматически будет создавать энкодер кодировать вс> это в JSON и записывать в UserDefaults
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
            
        }
    }
    //инициализация этого класса
    init() {
        //читаем эти файлы
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
                //[ExpenseItem].self потому что мы обращаемся ко всему массиву
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        //если там ничего нет или чтото не получилось инициализируем как пустой массив
            items = []
    }
    

}
