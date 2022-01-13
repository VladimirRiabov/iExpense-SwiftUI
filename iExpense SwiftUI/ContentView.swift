//
//  ContentView.swift
//  iExpense SwiftUI
//
//  Created by Владимир Рябов on 13.01.2022.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var expenses = Expenses()
       
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                HStack{
                    Button{
                        let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                        expenses.items.append(expense)
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    EditButton()
                }
                
            }
           
        }
    }
    
    func removeItem(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
