//
//  CustomGraphView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 02/01/2024.
//

import SwiftUI

struct CustomGraphView: View {
    
    var dataPoints: [CGFloat]
    init(dataPoints: [CGFloat]) {
        self.dataPoints = dataPoints
    }
    var body: some View {
        GraphView(dataPoints: dataPoints)
    }
}

#Preview {
    CustomGraphView(dataPoints: [])
}

struct GraphView: View {
    
    @State private var showToast = false
    @State private var toastMessage = ""
    @State private var circlePosition: CGPoint = CGPoint(x: 27, y: 0)
    @State private var circleColor: Color = .green
    @State private var isImageVisible: Bool = false
    @State private var currentDataPoint: CGFloat = 0.0
    
    let dataPoints: [CGFloat]
    let yAxisRange: ClosedRange<CGFloat> = 0...1000
    let yAxisStep: CGFloat = 200 // Adjust as needed
    let lineColor: Color = .green // Adjust the line color
    let gradientColors: [Color] = [.green, .red]
    
    init(dataPoints: [CGFloat]) {

        let lastPoint = dataPoints.last ?? 0
        currentDataPoint = lastPoint
        let yCoordinate = (180 - lastPoint * 0.18) + 30
        let point = CGPoint(x: CGFloat(27), y: yCoordinate)
        circlePosition = point
        circleColor = lineColor
        self.dataPoints = dataPoints
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Left side with background lines and numbers
                VStack {
                    ForEach(0..<6) { index in
                        let yAxisValue = CGFloat(index) * yAxisStep
                        let yCoordinate = getYCoordinate(for: yAxisValue, in: yAxisRange, with: 30)
                        
                        Text("\(Int(Int(yAxisStep) * (5 - index)))")
                            .frame(width: 27, alignment: .leading)
                            .padding(.trailing, 0)
                            .position(x: 10, y: yCoordinate)
                            .font(Font.custom("Manrope-SemiBold", size: 10.0))
                        // Horizontal lines
                        Path { path in
                            path.move(to: CGPoint(x: 27, y: yCoordinate - 20))
                            path.addLine(to: CGPoint(x: geometry.size.width, y: yCoordinate - 20))
                        }
                        .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                    }
                }
                .frame(height: 240)
                GraphLine(dataPoints: dataPoints, yAxisRange: yAxisRange, lineColor: lineColor) { point in
                    circlePosition = point
                }
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [.green, .red]),
                        startPoint: .bottom,
                        endPoint: .top
                    ),
                    lineWidth: 3
                )
                .frame(height: 180)
                //                .padding(.leading, 27)
                
                if isImageVisible {
                    Image("horizontalLine")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 180)
                        .position(x: circlePosition.x, y: 120)
                        .animation(.easeInOut)
                }
                Circle()
                    .fill(circleColor)
                    .frame(width: 15, height: 15)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 2)
                    .position(x: circlePosition.x, y: circlePosition.y + 30)
                    .opacity(dataPoints.count > 0 ? 1.0 : 0.0)
                    .gesture(DragGesture()
                        .onChanged { value in
                            let touchLocation = CGPoint(x: value.location.x, y: 0)
                            let nearestPoint = findNearestPoint(on: dataPoints, at: touchLocation, in: geometry.size)
                            circlePosition = nearestPoint
                            let nearestColor = getGradientColor(dataPoints: dataPoints, touchX: value.location.x, totalWidth: geometry.size.width)
                            circleColor = nearestColor
                            isImageVisible = true
                        }
                        .onEnded { _ in
                            // Perform any additional actions after dragging ends
                            showToast = false
                            isImageVisible = false
                        }
                    )
                    .onTapGesture {
                        showToast = true
                        toastMessage = "14:15 - \(currentDataPoint) C"
                    }
                    .toast(isPresented: $showToast, duration: 2, message: toastMessage, coordinates: circlePosition)
                    .onAppear {
                        updatePostion(x: CGFloat(geometry.size.width - 2.5))
                    }
            }
            .padding(.top, -30)
        }
    }
    
    func findNearestPoint(on dataPoints: [CGFloat], at touchLocation: CGPoint, in size: CGSize) -> CGPoint {
        let xScale = size.width / CGFloat(dataPoints.count - 1)
        var index = Int((touchLocation.x) / xScale)
        index = index >= dataPoints.count ? (dataPoints.count - 1) : index
        index = index < 0 ? 0 : index
        currentDataPoint = dataPoints[index]
        let y = getYCoordinate(for: dataPoints[index], in: yAxisRange, with: size.height)
        return CGPoint(x: CGFloat(index) * xScale, y: y)
    }
    
    func getYCoordinate(for value: CGFloat, in range: ClosedRange<CGFloat>, with height: CGFloat) -> CGFloat {
        let normalizedValue = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        return height - normalizedValue * height
    }
    
    func getDataPointFromYCoordinate(_ yCoordinate: CGFloat, in range: ClosedRange<CGFloat>, with height: CGFloat) -> CGFloat {
        let normalizedValue = (height - yCoordinate) / height
        return normalizedValue * (range.upperBound - range.lowerBound) + range.lowerBound
    }
    
    func updatePostion(x: CGFloat) {
        
        let lastPoint = dataPoints.last ?? 0
        let yCoordinate = (180 - lastPoint * 0.18)
        let point = CGPoint(x: x, y: yCoordinate)
        circlePosition = point
    }
    
    func getGradientColor(dataPoints: [CGFloat], touchX: CGFloat, totalWidth: CGFloat) -> Color {
        let xScale = totalWidth / CGFloat(dataPoints.count - 1)
        let index = Int((touchX) / xScale)
        return index >= 0 && index < dataPoints.count ? interpolateColor(dataPoints[index], gradientColors: [.blue, .purple]) : lineColor
    }
    
    func interpolateColor(_ value: CGFloat, gradientColors: [Color]) -> Color {
        let normalizedValue = value / yAxisRange.upperBound
        let fraction = Double(normalizedValue) * Double(gradientColors.count - 1)
        let lowerIndex = Int(floor(fraction))
        let upperIndex = Int(ceil(fraction))
        
        let lowerColor = gradientColors[lowerIndex]
        let upperColor = gradientColors[upperIndex]
        
        let fractionComplete = fraction - Double(lowerIndex)
        
        return blendColors(lowerColor, upperColor, fraction: fractionComplete) as? Color ?? .red
    }
    
    // Separate blendColors function for clarity
    func blendColors(_ color1: Color, _ color2: Color, fraction: Double) -> some View {
        let invertedFraction = 1.0 - fraction
        
        return Rectangle()
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [color1, color2]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .opacity(invertedFraction)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [color2, color1]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .opacity(fraction)
                .frame(width: 1, height: 1)
            )
    }
}

extension View {
    func toast(isPresented: Binding<Bool>, duration: Double = 2, message: String, coordinates: CGPoint) -> some View {
        GeometryReader { geometry in
            ZStack {
                self
                if isPresented.wrappedValue {
                    VStack {
                        HStack {
                            ToastView(message: message)
                                .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.5)))
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                                        isPresented.wrappedValue = false
                                    }
                                }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
                    .position(x: CGFloat(coordinates.x - 30), y: coordinates.y)
                }
            }
        }
    }
}

struct GraphLine: Shape {
    var dataPoints: [CGFloat]
    var yAxisRange: ClosedRange<CGFloat>
    var lineColor: Color
    var onTap: (CGPoint) -> Void
    
    func point(for value: CGFloat, at index: Int, in rect: CGRect) -> CGPoint {
        let xScale = rect.width / CGFloat(dataPoints.count - 1)
        let x = CGFloat(index) * xScale
        let y = getYCoordinate(for: value, in: yAxisRange, with: rect.height)
        return CGPoint(x: x, y: y)
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard dataPoints.count > 1 else { return path }
        
        let xScale = rect.width / CGFloat(dataPoints.count - 1)
        let yScale = rect.height / 1000//dataPoints.max()!
        path.move(to: CGPoint(x: 0, y: rect.height - dataPoints[0] * yScale))
        
        for i in 1..<dataPoints.count {
            path.addLine(to: CGPoint(x: CGFloat(i) * xScale, y: rect.height - dataPoints[i] * yScale))
        }
        
        return path
    }
    
    func body(in rect: CGRect) -> some View {
        let tapGesture = TapGesture()
            .onEnded { _ in
                let touchLocation = CGPoint(x: 0, y: 0) // Get the touch location
                let xScale = rect.width / CGFloat(dataPoints.count - 1)
                let index = Int((touchLocation.x) / xScale)
                
                if index >= 0 && index < dataPoints.count {
                    onTap(point(for: dataPoints[index], at: index, in: rect))
                }
            }
        
        return Rectangle()
            .fill(Color.clear)
            .overlay(GeometryReader { geometry in
                self.path(in: rect)
                    .contentShape(Rectangle())
                    .gesture(tapGesture)
            })
    }
    
    func getYCoordinate(for value: CGFloat, in range: ClosedRange<CGFloat>, with height: CGFloat) -> CGFloat {
        let normalizedValue = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        return height - normalizedValue * height
    }
}

struct ToastView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .padding(.all, 7)
            .font(Font.custom("Manrope-SemiBold", size: 14.0))
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .frame(height: 50)
    }
}
