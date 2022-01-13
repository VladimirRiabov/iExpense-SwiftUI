//
//  ContentView.swift
//  iExpense SwiftUI
//
//  Created by Владимир Рябов on 13.01.2022.
//

import SwiftUI


struct ContentView: View {
    @AppStorage("TapCount") private var tapCount = 0
    var body: some View {
        Button("Tap me \(tapCount)") {
            tapCount += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
