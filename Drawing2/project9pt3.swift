//
//  project9pt3.swift
//  Drawing2
//
//  Created by Nathan Leach on 1/18/23.
//
import SwiftUI
import Foundation

struct SpecEffects: View {
    
    @State private var amount = 0.0
    @State private var blurAmount = 0.0
    @State private var showingBlurSheet = false
    
    var body: some View{
            VStack{
                Spacer()
                ZStack{
                    Circle()
                        .fill(.red)
                        .frame(width: 200 * amount)
                        .offset(x: -50, y: -80)
                        .blendMode(.screen)
                    Circle()
                        .fill(.green)
                        .frame(width: 200 * amount)
                        .offset(x: 50, y: -80)
                        .blendMode(.screen)
                    Circle()
                        .fill(.blue)
                        .frame(width: 200 * amount)
                        .blendMode(.screen)
                }
                .frame(width: 300, height: 300)
                
                Slider(value: $amount)
                    .padding()
                NavigationLink{
                    AnimatingSimpleShapes()
                } label: {
                    Text("See animating simple shapes")
                }
                Spacer()
                Button("See photo effects"){
                    showingBlurSheet.toggle()
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
            .sheet(isPresented: $showingBlurSheet){
                VStack {
                    Image ("streetlights")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .saturation(blurAmount)
                        .blur(radius: (1 - blurAmount) * 20)
                    Slider(value: $blurAmount)
                        .padding()
                    Button("Dismiss"){
                        showingBlurSheet.toggle()
                    }
                }
            }
        }
}

struct SpecEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecEffects()
    }
}
