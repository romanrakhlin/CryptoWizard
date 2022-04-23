//
//  File.swift
//  
//
//  Created by Roman Rakhlin on 4/14/22.
//

import SwiftUI

struct TransactionsView: View {
    
    @Binding var currentChapter: Int

    @State var showNextChapterIntro: Bool = false
    @State var ableToSkipNext: Bool = false
    @State var currentScreen: Int = 0
    @State var showNextButton: Bool = false
    
    var body: some View {
        ZStack {
            Color(hex: "E9E8FF")
               
            if currentScreen < transactionsScreens.count {
                if transactionsScreens[currentScreen] == nil && currentScreen == 2 {
                    ChooseItemView(currentScreen: $currentScreen, ableToSkipNext: $ableToSkipNext)
                } else {
                    VStack {
                        HeaderTextView(headerText: transactionsScreens[currentScreen]!.text)
                                    
                        BodytImageView(imageName: transactionsScreens[currentScreen]!.image)
                                    
                        VStack {
                            if currentScreen < transactionsScreens.count && ableToSkipNext {
                                ContinueText()
                            }
                        }
                        .padding(.bottom, 20)
                    }
                }
            } else {
                TitleView(currentChapter: $currentChapter, title: "Network")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                ableToSkipNext = true
            }
        }
        .onTapGesture {
            if ableToSkipNext && currentScreen != 2 {
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
