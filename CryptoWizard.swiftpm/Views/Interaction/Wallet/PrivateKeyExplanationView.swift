//
//  PrivateKeyExplanationView.swift
//  CryptoWizard
//
//  Created by Roman Rakhlin on 4/13/22.
//

import SwiftUI

struct PrivateKeyExplanationView: View {
    
    @Binding var currentScreen: Int
    @Binding var wallet: Wallet
    
    @State var currentScene: Int = 0
    @State var privateKey: String = ""
    @State var ableToSkipNext = false

    var body: some View {
        ZStack {
            Color(hex: "E9E8FF")
            
            VStack {
                if currentScene == 0 {
                    HeaderTextView(headerText: "We wanna disguise our private key so anybody will recognise it")
                } else if currentScene == 1 {
                    HeaderTextView(headerText: "Also add some glue so if anyone get it, he can’t take off that disguise")
                }
        
                ZStack {
                    VStack {
                        Spacer()
                        
                        Text(privateKey)
                            .font(.system(size: 64, weight: .bold, design: .rounded))
                            .lineLimit(4)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer()
                    }
                    
                    if currentScene == 0 {
                        Image("mask")
                            .resizable()
                            .frame(idealWidth: 250, maxWidth: 400, maxHeight: 500)
                            .scaledToFill()
                    } else if currentScene == 1 {
                        Image("mask")
                            .resizable()
                            .frame(idealWidth: 250, maxWidth: 400, maxHeight: 500)
                            .scaledToFill()
                        
                        Image("glue")
                            .resizable()
                            .frame(idealWidth: 250, maxWidth: 400, maxHeight: 500)
                            .scaledToFill()
                    }
                }
                
                Spacer()
                
                if ableToSkipNext {
                    Text("Tap to continue")
                        .font(.system(size: 32, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                        .padding()
                }
            }
        }
        .ignoresSafeArea(.all)
        .onAppear {
            privateKey = wallet.privateKey!
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                ableToSkipNext = true
            }
        }
        .onTapGesture {
            if currentScene == 1 {
                currentScreen += 1
            }
            
            if ableToSkipNext {
                currentScene += 1
                ableToSkipNext = false
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                    ableToSkipNext = true
                }
            }
        }
    }
}
