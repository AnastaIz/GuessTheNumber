//
//  SliderView.swift
//  GuessTheNumber
//
//  Created by Anastasia Izmaylova on 27.02.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var currentValue: Double
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        slider.thumbTintColor = .red
        slider.value = Float(currentValue)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged(_:)),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

extension SliderView {
    class Coordinator : NSObject {
        var sliderView: SliderView
        
        init(_ sliderView: SliderView) {
            self.sliderView = sliderView
        }
        
        @objc func valueChanged(_ slider: UISlider) {
            sliderView.currentValue = Double(slider.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(100), targetValue: .constant(100))
    }
}
