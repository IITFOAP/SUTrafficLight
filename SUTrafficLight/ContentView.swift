//
//  ContentView.swift
//  SUTrafficLight
//
//  Created by Рома Баранов on 08.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redOpacity = 0.5
    @State private var yellowOpacity = 0.5
    @State private var greenOpacity = 0.5
    @State private var hasStarted = true
    @State private var colorForComparison = SignalColor.red
    
    var body: some View {
        VStack {
            CircleView(color: .red, opacity: redOpacity)
                .padding(.bottom, 8)
            CircleView(color: .yellow, opacity: yellowOpacity)
                .padding(.bottom, 8)
            CircleView(color: .green, opacity: greenOpacity)
            
            Spacer()
            
            Button(action: changesColor) {
                Capsule()
                    .foregroundColor(.blue)
                    .frame(width: 150, height: 50)
                    .overlay(Capsule().stroke(Color.white, lineWidth: 4))
                    .overlay(
                        Text(hasStarted ? "START" : "NEXT")
                            .foregroundColor(.white)
                            .font(.title)
                    )
                    .shadow(radius: 10)
            }
        }
        
        .padding()
    }
    
    private func changesColor() {
        hasStarted = false
        
        switch colorForComparison {
        case .red:
            greenOpacity = 0.5
            redOpacity = 1
            colorForComparison = .yellow
        case .yellow:
            redOpacity = 0.5
            yellowOpacity = 1
            colorForComparison = .green
        case .green:
            yellowOpacity = 0.5
            greenOpacity = 1
            colorForComparison = .red
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    enum SignalColor {
        case red, yellow, green
    }
}
