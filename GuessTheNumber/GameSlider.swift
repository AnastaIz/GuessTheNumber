//
//  GameSlider.swift
//  GuessTheNumber
//
//  Created by Anastasia Izmaylova on 01.03.2022.
//

import SwiftUI

struct GameSlider: View {
    @Binding var currentValue: Double
    
    let targetValue: Int
    let color: UIColor
    let alpha: Int
    
    var body: some View {
        VStack{
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            HStack{
                Text("0")
                SliderView(value: $currentValue, color: color, alpha: alpha)
                Text("100")
            }
            .padding()
        }
    }
}

struct GameSlider_Previews: PreviewProvider {
    static var previews: some View {
        GameSlider(currentValue: .constant(100), targetValue: 100, color: .red, alpha: 100)
    }
}
