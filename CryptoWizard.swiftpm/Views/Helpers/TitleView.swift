//
//  TitleView.swift
//  CryptoWizard
//
//  Created by Roman Rakhlin on 4/10/22.
//

import SwiftUI

struct TitleView: View {
    
    @State var textIsOut = false
    @State var skipFurther = false
    
    @Binding var currentChapter: Int
    
    var title: String
    
    var body: some View {
        ZStack {
            Color(hex: "E9E8FF")
            
            if textIsOut {
                Text(title)
                    .textCase(.uppercase)
                    .font(.system(size: 82, weight: .heavy, design: .rounded))
                    .minimumScaleFactor(0.5)
                    .lineLimit(4)
                    .multilineTextAlignment(.center)
            }
            
            VStack {
                Spacer()
                
                if skipFurther {
                    Text("Tap to contiue")
                        .textCase(.uppercase)
                        .font(.system(size: 32, weight: .light, design: .rounded))
                        .opacity(0.6)
                        .padding(.bottom, 20)
                }
            }
        }
        .ignoresSafeArea(.all)
        .animation(Animation.easeInOut(duration: 2.4))
        .onTapGesture {
            if skipFurther {
                withAnimation(.spring()) {
                    currentChapter += 1
                }
            }
        }
        .onAppear {
            textIsOut = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                skipFurther = true
            }
        }
    }
}
