//
//  SwipeButton.swift
//  CryptoWizard
//
//  Created by Roman Rakhlin on 4/14/22.
//

import SwiftUI

struct SwipeButton: View {
    
    // Public Property
    var sliderTopBottomPadding: CGFloat = 10
    var thumbnailTopBottomPadding: CGFloat = 10
    var thumbnailLeadingTrailingPadding: CGFloat = 10
    var textLabelLeadingPadding: CGFloat = 10
    var text: String = "Swipe to Confirm"
    var textFont: Font = .system(size: 24, weight: .bold, design: .default)
    var textColor = Color.black
    var thumbnailColor = Color(hex: "ABA8FD")
    var thumbnailBackgroundColor: Color = .clear
    var sliderBackgroundColor = Color(.sRGB, red: 0.1, green: 0.64, blue: 0.84, opacity: 0.1)
    var resetAnimation: Animation = .easeIn(duration: 0.3)
    var iconName = "next"
    var didReachEndAction: ((SwipeButton) -> Void)?
    
    // Private Property
    @State private var draggableState: DraggableState = .ready
    
    private enum DraggableState {
        case ready
        case dragging(offsetX: CGFloat, maxX: CGFloat)
        case end(offsetX: CGFloat)
        
        var reachEnd: Bool {
            switch self {
            case .ready, .dragging(_):
                return false
            case .end(_):
                return true
            }
        }
        
        var isReady: Bool {
            switch self {
            case .dragging(_), .end(_):
                return false
            case .ready:
                return true
            }
        }
        
        var offsetX: CGFloat {
              switch self {
              case .ready:
                return 0.0
              case .dragging(let (offsetX,_)):
                  return offsetX
              case .end(let offsetX):
                  return offsetX
              }
          }
        
        var textColorOpacity: Double {
            switch self {
            case .ready:
                return 1.0
            case.dragging(let (offsetX,maxX)):
                return 1.0 - Double(offsetX / maxX)
            case .end(_):
                return 0.0
            }
        }
        
    }
    
    var body: some View {
        return GeometryReader { geometry in
            self.setupView(geometry: geometry)
        }
    }
    
    private func setupView(geometry: GeometryProxy) -> some View {
        let frame = geometry.frame(in: .global)
        let width = frame.size.width
        let height = frame.size.height
        let drag = DragGesture()
            .onChanged({ (drag) in
                let maxX = width - height - self.thumbnailLeadingTrailingPadding * 2 + self.thumbnailTopBottomPadding * 2
                let currentX = drag.translation.width
                if currentX >= maxX {
                    self.draggableState = .end(offsetX: maxX)
                    self.didReachEndAction?(self)
                } else if currentX <= 0 {
                    self.draggableState = .dragging(offsetX: 0, maxX: maxX)
                } else {
                    self.draggableState = .dragging(offsetX: currentX, maxX: maxX)
                }
            })
            .onEnded(onDragEnded)
        let sliderCornerRadius = (height - sliderTopBottomPadding * 2) / 2
        return HStack {
                ZStack(alignment: .leading, content: {
                    HStack {
                        Text(self.text)
                        .frame(maxWidth: .infinity)
                        .font(textFont)
                        .padding([.leading], textLabelLeadingPadding)
                        .foregroundColor(self.textColor)
                        .opacity(self.draggableState.textColorOpacity)
                        .animation(self.draggableState.isReady ? self.resetAnimation : nil)
                        .padding()
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(self.sliderBackgroundColor)
                    .cornerRadius(sliderCornerRadius)
                    .padding([.top, .bottom], self.sliderTopBottomPadding)
                    
                    Image(iconName)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .aspectRatio(1.0, contentMode: .fit)
                    .background(self.thumbnailColor)
                    .clipShape(Circle())
                    .padding([.top, .bottom], self.thumbnailTopBottomPadding)
                    .padding([.leading, .trailing], self.thumbnailLeadingTrailingPadding)
                    .background(self.thumbnailBackgroundColor)
                    .cornerRadius(sliderCornerRadius)
                    .offset(x: self.self.draggableState.offsetX)
                    .animation(self.draggableState.isReady ? self.resetAnimation : nil)
                    .gesture(self.draggableState.reachEnd ? nil : drag)
                  })
                }
                .background(Color.white)
    }
    
    private func onDragEnded(drag: DragGesture.Value) {
        switch draggableState {
        case .end(_), .dragging(_):
            draggableState = .ready
            break
        case .ready:
            break
        }
    }
    
    private func resetState(_ animated: Bool = true) {
        self.draggableState = .ready
    }
}
