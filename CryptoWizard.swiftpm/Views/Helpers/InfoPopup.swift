//
//  InfoPopup.swift
//  CryptoWizard
//
//  Created by Roman Rakhlin on 4/20/22.
//

import SwiftUI

struct InfoPopup: View {
    
    @Binding var currentChapter: Int
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Menu {
                    Group {
                        Button(action: {
                            currentChapter = 1
                        }) {
                            Label("1. " + String(currentChapter > 1 ? "I̶n̶t̶r̶o̶d̶u̶c̶t̶i̶o̶n̶" : "Introduction"), systemImage: "")
                        }
                        
                        Button(action: {
                            currentChapter = 2
                        }) {
                            Label("2. " + String(currentChapter > 2 ? "W̶a̶l̶l̶e̶t̶" : "Wallet"), systemImage: "")
                        }
                    
                        Button(action: {
                            currentChapter = 3
                        }) {
                            Label("3. " + String(currentChapter > 3 ? "T̶r̶a̶n̶s̶a̶c̶t̶i̶o̶n̶s̶" : "Transactions"), systemImage: "")
                        }
                        
                        Button(action: {
                            currentChapter = 4
                        }) {
                            Label("4. " + String(currentChapter > 4 ? "N̶e̶t̶w̶o̶r̶k̶" : "Network"), systemImage: "")
                        }
                        
                        Button(action: {
                            currentChapter = 5
                        }) {
                            Label("5. " + String(currentChapter > 5 ? "M̶i̶n̶e̶r̶s̶" : "Miners"), systemImage: "")
                        }

                        Button(action: {
                            currentChapter = 6
                        }) {
                            Label("6. " + String(currentChapter > 6 ? "B̶l̶o̶c̶k̶c̶h̶a̶i̶n̶" : "Blockchain"), systemImage: "")
                        }
                                  
                        Button(action: {
                            currentChapter = 7
                        }) {
                            Label("7. " + String(currentChapter > 7 ? "C̶o̶n̶s̶e̶n̶s̶u̶s̶" : "Consensus"), systemImage: "")
                        }
                         
                        Button(action: {
                            currentChapter = 8
                        }) {
                            Label("8. " + String(currentChapter > 8 ? "P̶r̶o̶o̶f̶-o̶f̶-W̶o̶r̶k̶ (̶P̶O̶W̶)̶" : "Proof of Work (POW)"), systemImage: "")
                        }
                        
                        Button(action: {
                            currentChapter = 9
                        }) {
                            Label("9. " + String(currentChapter > 9 ? "R̶e̶c̶a̶p̶" : "Recap"), systemImage: "")
                        }
                    }
                    .font(.system(size: 21))
                    .foregroundColor(Color.green)
                    .padding()
                } label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 35, height: 35, alignment: .center)
                }
            }
            
            Spacer()
        }
        .onAppear {
            print(currentChapter > 1)
        }
        .padding(.horizontal, 40)
        .padding(.top, 40)
    }
}
