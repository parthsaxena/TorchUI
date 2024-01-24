//
//  ActiveSensorView.swift
//  TorchUI
//
//  Created by Parth Saxena on 1/6/24.
//

import SwiftUI

// Custom Shape for the Beam
struct BeamShape: Shape {
    var startAngle: Angle
    var endAngle: Angle
//    var beamWidth: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let adjustment = Angle.degrees(90) // Adjust for SwiftUI's default 0 degrees being the right side
        let modifiedStart = startAngle - adjustment
        let modifiedEnd = endAngle - adjustment

        // Define the center and radius based on the rect
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
//        let x = print("BEAM: \(radius) \(beamWidth)")

        // Draw the outer arc
        path.addArc(center: center, radius: 75, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: false)

        // Draw the inner arc in reverse
        path.addArc(center: center, radius: 1, startAngle: modifiedEnd, endAngle: modifiedStart, clockwise: true)

        return path
    }
}

struct RightCombinedShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width: CGFloat = rect.width
        let height: CGFloat = rect.height
        let radius: CGFloat = height / 2
        
        // Start from the top-left corner of the rectangle
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        // Draw the top line to the start of the semi-circle
        path.addLine(to: CGPoint(x: width - radius, y: rect.minY))
        
        // Draw the semi-circle on the right
        path.addArc(center: CGPoint(x: width - radius, y: radius),
                    radius: radius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        
        // Draw the bottom line back to the left side
        path.addLine(to: CGPoint(x: rect.minX, y: height))

        return path
    }
}

struct RightCustomAnnotationView: View {
//    var threat: Threat
    var text: String
    var beams: [[Double]] = []
    var imageIcon: String
    var beamColor: Color = Color.red
//    @Binding var beamWidth: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) { // Align items to the leading edge
            
            RightCombinedShape()
                .fill(Color.white)
                .frame(width: 38, height: 25)
                .offset(x: 30)
            
            HStack(spacing: 0) {
                // The icon and beam
                ZStack {
                    ForEach(beams, id: \.self) { beam in
                        BeamShape(startAngle: Angle(degrees: beam[0]), endAngle: Angle(degrees: beam[1]))
                        //                        .fill(Color.red.opacity(0.5))
                            .fill(LinearGradient(
                                gradient: .init(colors: [beamColor.opacity(0.5), beamColor.opacity(0.0)]),
                                startPoint: .init(x: 0.5, y: 0),
                                endPoint: .init(x: 0.5, y: 0.6)
                            ))
                        //                        .offset(x: 15, y: 15)
                            .frame(width: 100, height: 100)
                    }
                    
                    Image(imageIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30) // Adjust the size as needed
                }
                .frame(width: 50, height: 50) // Adjust the frame size as needed
                
                // The number label
                Text(text)
                    .font(.custom("Manrope-SemiBold", size: 16))
                    .foregroundColor(CustomColors.TorchGreen)
                    .frame(width: 35, height: 23) // Adjust the width and height as needed
                    .offset(x: -17)
            }
        }
        .frame(width: 50, height: 17) // Set the frame for the entire view
        .compositingGroup()
        .shadow(radius: 10)
        .background(Color.clear) // Use a clear background for the actual view
    }
}

// SwiftUI Preview
//struct CustomAnnotationView_Previews: PreviewProvider {
//    static var previews: some View {
//        @State var beamWidth: CGFloat = 50.0
//        RightCustomAnnotationView(text: "3", startAngle: Angle(degrees: 168.75), endAngle: Angle(degrees: 180))
//            .previewLayout(.sizeThatFits)
//            .padding()
//    }
//}

