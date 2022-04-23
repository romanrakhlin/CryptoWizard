//
//  File.swift
//  
//
//  Created by Roman Rakhlin on 4/13/22.
//

import SwiftUI

struct HeaderTextView: View {
    
    var headerText: String
    
    var body: some View {
        VStack {
            Text(headerText)
                .font(.system(size: 56, weight: .bold, design: .rounded))
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .lineLimit(4)
                .padding()
        }
        .background(Color(hex: "ABA8FD").opacity(0.2))
        .cornerRadius(16)
        .padding(.top, 40)
        .padding(.horizontal, 20)
    }
}
