//
//  СircleView.swift
//  SUTrafficLight
//
//  Created by Рома Баранов on 08.06.2023.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            . foregroundColor(color)
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
            .opacity(opacity)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red, opacity: 0.5)
    }
}
