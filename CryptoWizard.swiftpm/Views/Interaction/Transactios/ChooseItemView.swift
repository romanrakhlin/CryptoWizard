//
//  File.swift
//  
//
//  Created by Roman Rakhlin on 4/14/22.
//

import SwiftUI

struct ChooseItemView: View {
    
    @Binding var currentScreen: Int
    @Binding var ableToSkipNext: Bool
    
    @State var choosenItem: String = ""
    
    let itemsMatrix = [["pizza", "dool",], ["ball", "dragon"]]

    var body: some View {
        ZStack {
            Color(hex: "E9E8FF")
            
            VStack {
                HeaderTextView(headerText: "Choose Item you want to buy")
                
                Spacer()
                
                VStack(spacing: 40) {
                    VStack {
                        ForEach(itemsMatrix, id: \.self) { items in
                            HStack {
                                ForEach(items, id: \.self) { item in
                                    Button {
                                        choosenItem = item
                                        
                                    } label: {
                                        Image(item)
                                            .resizable()
                                            .frame(width: 250, height: 250, alignment: .center)
                                    }
                                    .cornerRadius(16)
                                    .padding()
                                }
                            }
                        }
                    }

                    Text("Everything here costs 2 BTC")
                        .font(.system(size: 32, weight: .medium, design: .rounded))
                        .multilineTextAlignment(.center)
                        .opacity(0.5)
                }
                    
                Spacer()
            }
            
            if choosenItem != "" {
                withAnimation {
                    SwipeButton(didReachEndAction: { button in
                        currentScreen += 1
                        ableToSkipNext = false
                            
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            ableToSkipNext = true
                        }
                    })
                    .frame(width: 420, height: 120)
                    .background(Color.yellow)
                    .cornerRadius(28)
                }
            }
        }
        .ignoresSafeArea(.all)
    }
}
