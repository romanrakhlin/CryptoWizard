//
//  File.swift
//  
//
//  Created by Roman Rakhlin on 4/19/22.
//

import SwiftUI

struct BodytImageView: View {
    
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(minWidth: 400, idealWidth: 600, maxWidth: 800, minHeight: 600, idealHeight: 800, maxHeight: 1000, alignment: .center)
            .padding(.top, 20)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
    }
}
