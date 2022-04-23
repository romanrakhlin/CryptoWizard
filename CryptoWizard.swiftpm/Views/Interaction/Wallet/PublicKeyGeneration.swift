//
//  File.swift
//  
//
//  Created by Roman Rakhlin on 4/13/22.
//

import SwiftUI

struct PublicKeyGeneration: View {
    
    @Binding var currentScreen: Int
    @Binding var wallet: Wallet
    
    @State var privateKey: String = ""
    @State var publicKey: String = ""
    @State var address: String = ""

    var body: some View {
        ZStack {
            Color(hex: "E9E8FF")
            
            VStack {
                HeaderTextView(headerText: "Еncrypt your Private Key")
                
                Spacer()
                
                VStack(spacing: 20) {
                    VStack {
                        Text("Your Private Key:")
                            .font(.system(size: 52, weight: .bold, design: .rounded))
                        Text(privateKey)
                            .font(.system(size: 64, weight: .medium, design: .rounded))
                            .lineLimit(4)
                            .multilineTextAlignment(.center)
                    }
                    .minimumScaleFactor(0.5)
                    .padding()
                    
                    VStack {
                        Text("Your Public Key:")
                            .font(.system(size: 52, weight: .bold, design: .rounded))
                        Text(publicKey)
                            .font(.system(size: 64, weight: .medium, design: .rounded))
                            .lineLimit(4)
                            .multilineTextAlignment(.center)
                    }
                    .minimumScaleFactor(0.5)
                    .padding()
                    
                    VStack {
                        Text("Your Address:")
                            .font(.system(size: 52, weight: .bold, design: .rounded))
                        Text(address)
                            .font(.system(size: 64, weight: .medium, design: .rounded))
                            .lineLimit(4)
                            .multilineTextAlignment(.center)
                    }
                    .minimumScaleFactor(0.5)
                    .padding()
                }
                .padding()
                    
                Spacer()
                 
                Button {
                    wallet.generatePublicKey()
                    wallet.generateAddress()
                    
                    publicKey = wallet.publicKey!
                    address = wallet.address!
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
                        currentScreen += 1
                    }
                } label: {
                    VStack {
                        Text("Generate")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                            .padding()
                    }
                    .background(Color(hex: "ABA8FD").opacity(0.2))
                    .foregroundColor(Color.black)
                    .cornerRadius(16)
                }
                .padding()
            }
            .onAppear {
                privateKey = wallet.privateKey!
            }
        }
        .ignoresSafeArea(.all)
    }
}
