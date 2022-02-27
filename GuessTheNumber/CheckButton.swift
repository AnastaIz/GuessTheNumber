//
//  CheckButton.swift
//  GuessTheNumber
//
//  Created by Anastasia Izmaylova on 26.02.2022.
//

import SwiftUI

enum AlertType {
    case right, wrong
}

struct CheckButton: View {
    @Binding var value: Double
    @Binding var number: Int
    
    @State private var showAlert = false
    @State private var alertType: AlertType = .right
    
    var body: some View {
        Button("Проверь меня") {
            showAlert.toggle()
            
            if Int(value) == number {
                alertType = .right
            }
            alertType = .wrong
        }
        .alert(isPresented: $showAlert) {
            switch alertType {
            case .right:
                return Alert(title: Text("Это число: \(Int(value))"), message: Text("Ты угадал! Это верное число."))
            case .wrong:
                return Alert(title: Text("Это число: \(Int(value))"), message: Text("Ты не угадал. Возможно, повезет в другой раз"))
            }
        }
    }
}

struct CheckButton_Previews: PreviewProvider {
    static var previews: some View {
        CheckButton(value: .constant(100), number: .constant(99))
    }
}
