//
//  File.swift
//  
//
//  Created by Roman Rakhlin on 4/15/22.
//

import SwiftUI

struct ConsensusView: View {
    
    @Binding var currentChapter: Int

    @State var showNextChapterIntro: Bool = false
    @State var ableToSkipNext: Bool = false
    @State var currentScreen: Int = 0
    @State var showNextButton: Bool = false
    
    var body: some View {
        ZStack {
            Color(hex: "E9E8FF")
               
            if currentScreen < consensusScreens.count {
                VStack {
                    HeaderTextView(headerText: consensusScreens[currentScreen].text)
                                
                    BodytImageView(imageName: consensusScreens[currentScreen].image)
                                
                    VStack {
                        if currentScreen < consensusScreens.count && ableToSkipNext {
                            ContinueText()
                        }
                    }
                    .padding(.bottom, 20)
                }
            } else {
                TitleView(currentChapter: $currentChapter, title: "Proof of Work (POW)")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                ableToSkipNext = true
            }
        }
        .onTapGesture {
            if ableToSkipNext {
                currentScreen += 1
                ableToSkipNext = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                    ableToSkipNext = true
                }
            }
        }
        .foregroundColor(Color.black)
        .animation(.spring(response: 0.4, dampingFraction: 0.6))
        .edgesIgnoringSafeArea(.all)
    }
}
