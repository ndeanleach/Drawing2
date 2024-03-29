//
//  ContentView.swift
//  Drawing2
//
//  Created by Nathan Leach on 1/18/23.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    var body: some View{
        ZStack{
            ForEach(0..<steps) { value in
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    
    @State private var colorCycle = 0.0
    
    var body: some View {
        NavigationView{
            VStack {
                Spacer()
                ColorCyclingCircle(amount: colorCycle)
                    .frame(width: 300, height: 300)
                Slider(value: $colorCycle)
                Spacer()
                NavigationLink{
                    SpecEffects()
                } label: {
                    Text("See special effects page")
                }
                NavigationLink{
                    ArrowView()
                } label: {
                    Text("See animated arrow")
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
