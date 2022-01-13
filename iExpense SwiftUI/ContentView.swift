//
//  ContentView.swift
//  iExpense SwiftUI
//
//  Created by Владимир Рябов on 13.01.2022.
//

import SwiftUI


struct ContentView: View {
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(numbers, id: \.self) {
                        Text("Row\($0)")
                    }
//                    .onDelete(perform: removeRows)
                }
                
                Button("Tap") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
                
            }
            .navigationTitle("onDelete")
            .toolbar {
                EditButton()
            }
        }
        
    }
    //offset смещение, свайпинг строки
    func removeRows(at offset: IndexSet) {
        numbers.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
