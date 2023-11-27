//
//  BubblesView.swift
//  TorchUI
//
//  Created by Parth Saxena on 7/13/23.
//

import SwiftUI

struct BubbleView: View {
    
    @Binding var data: [DataItem]

    var spacing: CGFloat
    var startAngle: Int
    var clockwise: Bool
    
    @State private var mySize = ViewSize()
    
    var body: some View {
        
        let xSize = (mySize.xMax - mySize.xMin) == 0 ? 1 : (mySize.xMax - mySize.xMin)
        let ySize = (mySize.yMax - mySize.yMin) == 0 ? 1 : (mySize.yMax - mySize.yMin)
        
        GeometryReader { geo in
 
            let scale = 1.0
            ZStack {
                ForEach(data, id: \.id) { item in
                    ZStack {
                        Circle()
                            .strokeBorder(CustomColors.NormalSensorGray, lineWidth: 2)
                            .background(Circle().fill(.white))
                            .frame(width: CGFloat(item.size) * scale, height: CGFloat(item.size) * scale)
                        Text(item.title)
                            .font(Font.custom("Manrope-Medium", size: 18.0))
                            .foregroundColor(CustomColors.TorchGreen)
                        Button {
                        } label: {
                            Circle()
                                .fill(Color.clear)
                                .frame(width: CGFloat(item.size) * scale, height: CGFloat(item.size) * scale)
                        }
                    }
                    .offset(x: item.offset.width * scale, y: item.offset.height * scale)
                }
            }
            .offset(x: xOffset() * scale, y: yOffset() * scale)
        }
        .onAppear {
            setOffets()
            mySize = absoluteSize()
        }
    }

    func xOffset() -> CGFloat {
        let size = data[0].size
        let xOffset = mySize.xMin + size / 2
        return -xOffset
    }
    
    func yOffset() -> CGFloat {
        let size = data[0].size
        let yOffset = mySize.yMin + size / 2
        return -yOffset
    }

    func setOffets() {
        if data.isEmpty { return }
        data[0].offset = CGSize.zero
        if data.count < 2 { return }
        // second circle
        let b = (data[0].size + data[1].size) / 2 + spacing
        var alpha: CGFloat = CGFloat(startAngle) / 180 * CGFloat.pi
        data[1].offset = CGSize(width:  cos(alpha) * b, height: sin(alpha) * b)
        // other circles
        for i in 2..<data.count {
            // sides of the triangle from circle center points
            let c = (data[0].size + data[i-1].size) / 2 + spacing
            let b = (data[0].size + data[i].size) / 2 + spacing
            let a = (data[i-1].size + data[i].size) / 2 + spacing
            
            alpha += calculateAlpha(a, b, c) * (clockwise ? 1 : -1)
            
            let x = cos(alpha) * b
            let y = sin(alpha) * b
            
            data[i].offset = CGSize(width: x, height: y )
        }
    }
    
    // Calculate alpha from sides - 1. Cosine theorem
    func calculateAlpha(_ a: CGFloat, _ b: CGFloat, _ c: CGFloat) -> CGFloat {
        return acos(( pow(a, 2) - pow(b, 2) - pow(c, 2) ) / (-2 * b * c ) )
    }
    
    // calculate max dimensions of offset view
    func absoluteSize() -> ViewSize {
        let radius = data[0].size / 2
        let initialSize = ViewSize(xMin: -radius, xMax: radius, yMin: -radius, yMax: radius)
        
        let maxSize = data.reduce(initialSize, { partialResult, item in
            let xMin = min(
                partialResult.xMin,
                item.offset.width - item.size / 2 - spacing
            )
            let xMax = max(
                partialResult.xMax,
                item.offset.width + item.size / 2 + spacing
            )
            let yMin = min(
                partialResult.yMin,
                item.offset.height - item.size / 2 - spacing
            )
            let yMax = max(
                partialResult.yMax,
                item.offset.height + item.size / 2 + spacing
            )
            return ViewSize(xMin: xMin, xMax: xMax, yMin: yMin, yMax: yMax)
        })
        return maxSize
    }
    
}
