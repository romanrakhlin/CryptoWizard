//
//  File.swift
//  CryptoWizard
//
//  Created by Roman Rakhlin on 4/10/22.
//

import SwiftUI

struct WalletView: View {
    
    @Binding var currentChapter: Int
    @Binding var wallet: Wallet

    @State var showNextChapterIntro: Bool  = false
    @State var ableToSkipNext: Bool  = false
    @State var currentScreen: Int = 0
    @State var showNextButton: Bool = false
    
    var body: some View {
        ZStack {
            Color(hex: "E9E8FF")
               
            if currentScreen < walletScreens.count {
                if walletScreens[currentScreen] == nil && currentScreen == 1 {
                    PrivateKeyGenerationView(currentScreen: $currentScreen, ableToSkipNext: $ableToSkipNext, wallet: $wallet)
                } else if walletScreens[currentScreen] == nil && currentScreen == 4 {
                    PrivateKeyExplanationView(currentScreen: $currentScreen, wallet: $wallet)
                } else if walletScreens[currentScreen] == nil && currentScreen == 7 {
                    PublicKeyGeneration(currentScreen: $currentScreen, wallet: $wallet)
                } else {
                    VStack {
                        HeaderTextView(headerText: walletScreens[currentScreen]!.text)
                                    
                        BodytImageView(imageName: walletScreens[currentScreen]!.image)
                                    
                        VStack {
                            if currentScreen < walletScreens.count && ableToSkipNext {
                                ContinueText()
                            }
                        }
                        .padding(.bottom, 20)
                    }
                }
            } else {
                TitleView(currentChapter: $currentChapter, title: "Transactions")
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                ableToSkipNext = true
            }
        }
        .onTapGesture {
            if ableToSkipNext && currentScreen != 1 && currentScreen != 7 {
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
