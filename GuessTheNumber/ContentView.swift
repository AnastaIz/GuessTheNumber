//
//  ContentView.swift
//  GuessTheNumber
//
//  Created by Anastasia Izmaylova on 26.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 3.0
    @State private var targetValue = Int.random(in: 1...100)
    
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 30){
            GameSlider(currentValue: $currentValue, targetValue: targetValue, color: .red, alpha: computeScore())
            
            Button("Проверь меня") {
                showAlert.toggle()
            }
            .padding()
            .alert("Это число: ", isPresented: $showAlert, actions: {}) {
                Text("\(computeScore())")
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 1...100)
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
