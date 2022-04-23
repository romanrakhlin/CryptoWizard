//
//  PrivateKeyGenerationView.swift
//  CryptoWizard
//
//  Created by Roman Rakhlin on 4/12/22.
//

import SwiftUI

struct PrivateKeyGenerationView: View {
    
    @Binding var currentScreen: Int
    @Binding var ableToSkipNext: Bool
    @Binding var wallet: Wallet
    
    @State var slidingCount = 0
    @State var privateKey: String = ""
    @State var percentage: Double = 0
    @State var generationDone: Bool = false

    var body: some View {
        ZStack {
            Color(hex: "E9E8FF")
            
            VStack {
                HeaderTextView(headerText: "Generate yourselve a Private Key")
                
                if percentage != 0 {
                    Text(String(format: "%.2f", percentage) + " %")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                        .padding()
                }
                    
                Spacer()
                
                VStack {
                    Text(privateKey)
                        .font(.system(size: 64, weight: .bold, design: .rounded))
                        .lineLimit(4)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    if percentage == 100 {
                        Button {
                            wallet.savePrivateKey(key: privateKey)
                            currentScreen += 1
                            
                            ableToSkipNext = false
                                
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
                                ableToSkipNext = true
                            }
                        } label: {
                            VStack {
                                Text("Continue")
                                    .font(.system(size: 24, weight: .bold, design: .rounded))
                                    .padding()
                            }
                            .background(Color(hex: "ABA8FD").opacity(0.2))
                            .foregroundColor(Color.black)
                            .cornerRadius(16)
                        }
                    }
                }
                    
                Spacer()
                 
                VStack(spacing: 10) {
                    Text("Drag your finger around")
                        .font(.system(size: 32, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                    
                    Text("(This is to provide the maximum random, thus safety)")
                        .font(.system(size: 20, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                }
                .padding()
            }
            .contentShape(Rectangle())
            .gesture(
                DragGesture()
                    .onChanged { state in
                        if privateKey.count != 64 {
                            slidingCount += 1
                                
                            if slidingCount == 5 {
                                let randomHex = wallet.generateRandomHexLetter()
                                privateKey.append(randomHex)
                                percentage += 1.5625
                                slidingCount = 0
                            }
                        }
                    }
            )
        }
        .ignoresSafeArea(.all)
    }
}
