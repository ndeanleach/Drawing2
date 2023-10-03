//
//  challenges.swift
//  Drawing2
//
//  Created by Nathan Leach on 1/18/23.
//

import SwiftUI
import Foundation

struct Arrow: Shape{
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 100, y: 170))
        path.addLine(to: CGPoint(x: 100, y: 50))
        path.addLine(to: CGPoint(x: 60, y: 125))
        path.move(to: CGPoint(x: 100, y: 50))
        path.addLine(to: CGPoint(x: 140, y: 125))
        
        return path
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 180
    var body: some View{
        ZStack{
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: UnitPoint(x: 2, y: 1),
                            endPoint: UnitPoint(x: 0, y: 0)
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

struct ArrowView: View {
    
    @State private var width = 1.0
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack{
            Arrow()
                .stroke(Color.blue,
                        style: StrokeStyle(lineWidth: 5 * width, lineCap: .round, lineJoin: .round)
                )
                .frame(width: 200, height: 200)
            Slider(value: $width)
                .padding()
            VStack{
                ColorCyclingRectangle(amount: colorCycle)
                Slider(value: $colorCycle)
            }
            .padding()
        }
    }
}

struct ArrowView_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
