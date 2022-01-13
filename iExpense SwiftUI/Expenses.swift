//
//  Expenses.swift
//  iExpense SwiftUI
//
//  Created by Владимир Рябов on 13.01.2022.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()

}
