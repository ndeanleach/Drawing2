//
//  AnimatingSimpleShapes.swift
//  Drawing2
//
//  Created by Nathan Leach on 1/18/23.
//

import SwiftUI
import Foundation

struct Trapezoid: Shape {
    
    var animatableData: Double {
        get { insetAmount }
        set{ insetAmount = newValue }
    }
    
    var insetAmount: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
}

struct AnimatingSimpleShapes: View{
    
    @State private var trapAmount = 0.0
    
    var body: some View{
        VStack{
            Spacer()
            Trapezoid(insetAmount: trapAmount)
                .frame(width: 200, height: 100)
                .onTapGesture {
                    withAnimation{
                        trapAmount = Double.random(in: 10...90)
                    }
                }
            Text("Click to animate the shape")
            Spacer()
            Section{
                NavigationLink{
                    AnimatingComplexShapes()
                }label: {
                    Text("Click here to see animating complex shapes")
                }
                NavigationLink{
                    SpirographView()
                }label: {
                    Text("Click here to see a Spirograph")
                }
            }
            Spacer()
        }
    }
}

struct AnimatingSimpleShapes_Previews: PreviewProvider {
    static var previews: some View {
        AnimatingSimpleShapes()
    }
}
