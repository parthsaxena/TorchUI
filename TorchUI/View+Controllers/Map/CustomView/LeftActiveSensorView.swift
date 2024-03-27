//
//  LeftActiveSensorView.swift
//  TorchUI
//
//  Created by Parth Saxena on 1/7/24.
//

import SwiftUI

// Custom Shape for the Beam
//struct BeamShape: Shape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var beamWidth: CGFloat
//
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let adjustment = Angle.degrees(90) // Adjust for SwiftUI's default 0 degrees being the right side
//        let modifiedStart = startAngle - adjustment
//        let modifiedEnd = endAngle - adjustment
//
//        // Define the center and radius based on the rect
//        let center = CGPoint(x: rect.midX, y: rect.midY)
//        let radius = min(rect.width, rect.height) / 2
//
//        // Draw the outer arc
//        path.addArc(center: center, radius: radius, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: false)
//
//        // Draw the inner arc in reverse
//        path.addArc(center: center, radius: radius - beamWidth, startAngle: modifiedEnd, endAngle: modifiedStart, clockwise: true)
//
//        return path
//    }
//}

struct LeftCombinedShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let height: CGFloat = rect.height
        let radius: CGFloat = height / 2
        
        // Start from the top-right corner of the rectangle
        path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        // Draw the top line to the start of the semi-circle on the left
        path.addLine(to: CGPoint(x: radius, y: rect.minY))
        
        // Draw the semi-circle on the left
        path.addArc(center: CGPoint(x: radius, y: radius),
                    radius: radius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 90),
                    clockwise: true)
        
        // Draw the bottom line back to the right side
        path.addLine(to: CGPoint(x: rect.maxX, y: height))

        return path
    }
}

struct LeftCustomAnnotationView: View {
    var text: String
    @Binding var beams: [[Double]]
    var redImageIcon: String = "DetectorIcons/ThreatRed"
    var yellowImageIcon: String = "DetectorIcons/ThreatYellow"
    var imageIcon: String
    var beamColor: Color = Color.red
    var showText: Bool = false
    @StateObject var sessionManager = SessionManager.shared
    var detectorIdx: Int
    @Binding var annotationsStatus: DetectorInfoStatus
//    @Binding var beamWidth: CGFloat
    
    var body: some View {
        if (SessionManager.shared.selectedPropertyIndex >= 0 && SessionManager.shared.selectedPropertyIndex < $sessionManager.properties.count && detectorIdx >= 0 && detectorIdx < $sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors.count) {
            HStack(spacing: 0) {
                // The label background (pill shape)
                if showText {
                    LeftCombinedShape()
                        .fill(Color.white)
                        .frame(width: 38, height: 25)
                        .offset(x: 30)// Adjust the width as needed
                    
                    // The text label
                    Text(text)
                        .font(.custom("Manrope-SemiBold", size: 16))
                        .foregroundColor(CustomColors.TorchGreen) // Replace with your actual color
                        .offset(x: -3)
                        .padding(.leading, 8) // Adjust the padding as needed
                }
                
                // The icon and beam
                ZStack {
                    //                let x = print("LCAV Got beams: \(beams)")
                    ForEach($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].irHot, id: \.self) { beam in
                        BeamShape(startAngle: Angle(degrees: beam.wrappedValue[0]), endAngle: Angle(degrees: beam.wrappedValue[1]))
                            .fill($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].thermalStatus.wrappedValue == Threat.Red ? CustomColors.TorchRed.opacity(0.5) : CustomColors.WarningYellow.opacity(0.5))
                        //                            .fill(LinearGradient(
                        //                                gradient: .init(colors: [beamColor.opacity(0.5), beamColor.opacity(0.0)]),
                        //                                startPoint: .init(x: 0.5, y: 0),
                        //                                endPoint: .init(x: 0.5, y: 0.6)
                        //                            ))
                        //                        .offset(x: 15, y: 15)
                            .frame(width: 100, height: 100)
                    }
                    //                BeamShape(startAngle: startAngle, endAngle: endAngle)
                    //                    .fill(LinearGradient(
                    //                        gradient: .init(colors: [Color.red.opacity(0.5), Color.red.opacity(0.0)]),
                    //                        startPoint: .init(x: 0, y: 0),
                    //                        endPoint: .init(x: 100, y: -100)
                    //                      ))
                    ////                    .offset(x: 5, y: 5)
                    //                    .frame(width: 100, height: 100)
                    
                    if (self.annotationsStatus == DetectorInfoStatus.battery) {
                        if ($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].deviceBattery.wrappedValue < 10.0) {
                            // Red Battery
                            Image("DetectorIcons/BatteryRed")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        } else if ($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].deviceBattery.wrappedValue < 40.0) {
                            // Yellow Battery
                            Image("DetectorIcons/BatteryYellow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        } else {
                            // Green Battery
                            Image("DetectorIcons/BatteryGreen")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                    } else if (self.annotationsStatus == DetectorInfoStatus.connection) {
                        if ($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].connected.wrappedValue) {
                            // Green Connected
                            Image("DetectorIcons/ConnectionGreen")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        } else {
                            // Red Connected
                            Image("DetectorIcons/ConnectionRed")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                    } else if (self.annotationsStatus == DetectorInfoStatus.humidity) {
                        let humidity = Double($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].measurements["humidity"].wrappedValue!)
                        if (humidity! <= 20.0) {
                            // Red Humidity
                            Image("DetectorIcons/HumidityRed")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        } else if (humidity! <= 50.0) {
                            // Yellow Humidity
                            Image("DetectorIcons/HumidityYellow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        } else {
                            // Green Humidity
                            Image("DetectorIcons/HumidityGreen")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                    } else if (self.annotationsStatus == DetectorInfoStatus.temperature) {
                        let _ = print("XOOOO: \($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].measurements)")
                        if (Double($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].measurements["temperature"].wrappedValue!)! > 35.0) {
                            // Red Temperature
                            Image("DetectorIcons/TemperatureRed")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        } else if (Double($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].measurements["temperature"].wrappedValue!)! > 25.0) {
                            // Yellow Temperature
                            Image("DetectorIcons/TemperatureYellow")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        } else {
                            // Green Temperature
                            Image("DetectorIcons/TemperatureGreen")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                        }
                    } else if (self.annotationsStatus == DetectorInfoStatus.fire) {
                        Image($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].threat.wrappedValue == Threat.Red ? redImageIcon : ($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].threat.wrappedValue == Threat.Yellow ? yellowImageIcon : "DetectorIcons/\(max($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].sensorIdx.wrappedValue ?? 0, 1))"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                    }
                    
//                    Image($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].threat.wrappedValue == Threat.Red ? redImageIcon : ($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].threat.wrappedValue == Threat.Yellow ? yellowImageIcon : "DetectorIcons/\(max($sessionManager.properties[SessionManager.shared.selectedPropertyIndex].detectors[detectorIdx].sensorIdx.wrappedValue ?? 0, 1))"))
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 30, height: 30) // Adjust the size as needed
                }
                .frame(width: 30, height: 30) // Adjust the frame size as needed
            }
            .frame(width: 90, height: 17)
            .compositingGroup()
            .shadow(radius: 10)
            .background(Color.clear)
//            .ignoresSafeArea(.all)// Use a clear background for the actual view
        }
    }
}

// SwiftUI Preview
//struct LeftCustomAnnotationView_Previews: PreviewProvider {
//    static var previews: some View {
//        @State var beamWidth: CGFloat = 50.0
//        LeftCustomAnnotationView(text: "1", startAngle: .degrees(168.75), endAngle: .degrees(180))
////        LeftCustomAnnotationView(text: "1", startAngle: .degrees(0), endAngle: .degrees(11.25))
////            .previewLayout(.sizeThatFits)
////            .padding()
////            .background(Color.black) // Background for preview purposes
//    }
//}


