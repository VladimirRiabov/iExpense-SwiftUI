//
//  ContentView.swift
//  iExpense SwiftUI
//
//  Created by Владимир Рябов on 13.01.2022.
//

import SwiftUI


struct ContentView: View {
    
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var summOfAmount = 0.0
//comment
    var body: some View {
        NavigationView {
            List {
                Section {
                    
                    HStack {
                        Spacer()
                        
                        Text("Sum:")
                        Text(summOfAmount, format: .currency(code: "USD"))
                            
                            .onAppear(perform: summOfItemsAmount)
                        
                    }
                       
                    
                }
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                }
                
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExpense")
            .toolbar {
                HStack{
                    Button{
                        showingAddExpense = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                    EditButton()
                }
                
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }

           
        }
    }
    
    func removeItem(at offset: IndexSet) {
        expenses.items.remove(atOffsets: offset)
    }
    
    func summOfItemsAmount() {
        for item in expenses.items {
            summOfAmount += item.amount
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
