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
    
    var body: some View {
        VStack(spacing: 30){
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            HStack{
                Text("0")
                SliderView(currentValue: $currentValue, targetValue: $targetValue)
                    .opacity(Double(computeScore())/100)
                Text("100")
            }
            CheckButton(value: $currentValue, number: $targetValue)
            Button("Начать заново") {
                targetValue = Int.random(in: 1...100)
            }
        }
        .padding()
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
