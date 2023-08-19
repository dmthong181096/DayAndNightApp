//
//  HomeScreen.swift
//  DayAndNightApp
//
//  Created by FE-Thong on 13/08/2023.
//

import SwiftUI

struct HomeScreen: View {
    @Environment(\.colorScheme) var colorScheme
    var widthBG: CGFloat = 180
    var heightBG : CGFloat {
        widthBG / 3
    }
    var sizeCircle : CGFloat = 50
    var padding: Float = 20
    @State var isLightMode: Bool
    @State var isChangeIcon: Bool = true
    var body: some View {
        @State var posX : Double =  isLightMode ? widthBG/3 : -widthBG/3
        ZStack {
            Image( isLightMode ? "day" : "night")
                .resizable()
                .ignoresSafeArea()
            RoundedRectangle(cornerRadius: 30)
                .fill(colorBG.shadow(.inner(color: .gray, radius: 1, x: 0, y: 4)), style: FillStyle())
                .frame(width: widthBG, height: heightBG, alignment: .center)
            RoundedRectangle(cornerRadius: 30)
                .fill(colorCircle.shadow(.drop(color: .gray, radius: 4, x: 0, y: 0)), style: FillStyle())
                .frame(width: sizeCircle, height: sizeCircle, alignment: .center)
//                .overlay {
//                    Image(systemName: isLightMode ? "sun.max" : "moon.stars" )
//                        .foregroundStyle(colorIcon)
//                        .contentTransition(.symbolEffect(.replace))
//                }
                .offset(x: posX, y: 0)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)){
                        isLightMode = !isLightMode
//                        isChangeIcon = !isChangeIcon
                    }
                }
            Image(systemName: isLightMode ? "sun.max" : "moon.stars" )
                .foregroundStyle(colorIcon)
                .contentTransition(.symbolEffect(.replace))
                .offset(x: posX, y: 0)

         

        }
        .environment(\.colorScheme , isLightMode ? .light : .dark)
    }
}
#Preview {
    HomeScreen( isLightMode: true)
}
