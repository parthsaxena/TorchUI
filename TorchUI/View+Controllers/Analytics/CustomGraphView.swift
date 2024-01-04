//
//  CustomGraphView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 02/01/2024.
//

import SwiftUI

struct CustomGraphView: View {
    var body: some View {
        GraphView()
    }
}

#Preview {
    CustomGraphView()
}

struct GraphView: View {
    
    @State private var showToast = false
    @State private var toastMessage = ""
    
    let dataPoints: [CGFloat] = [0, 20, 60, 20, 50, 20, 40]
    let yAxisRange: ClosedRange<CGFloat> = 0...1000
    let yAxisStep: CGFloat = 200 // Adjust as needed
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Left side with background lines and numbers
                VStack {
                    ForEach(0..<6) { index in
                        let yAxisValue = CGFloat(index) * yAxisStep
                        let yCoordinate = getYCoordinate(for: yAxisValue, in: yAxisRange, with: 30)

                        Text("\(Int(yAxisValue))")
                            .frame(width: 35, alignment: .trailing)
                            .padding(.trailing, 0)
                            .position(x: 0, y: yCoordinate)
                            .font(Font.custom("Manrope-SemiBold", size: 12.0))

                        // Horizontal lines
                        Path { path in
                            path.move(to: CGPoint(x: 35, y: yCoordinate - 17))
                            path.addLine(to: CGPoint(x: geometry.size.width, y: yCoordinate - 17))
                        }
                        .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                    }
                }
                .frame(height: 30)
                GraphLine(dataPoints: dataPoints)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [.green, .red]),
                            startPoint: .bottom,
                            endPoint: .top
                        ),
                        lineWidth: 3
                    )
                    .frame(height: 180)
                    .padding()
                
                if let lastPoint = dataPoints.last {
                    let yCoordinate = 180 - lastPoint * (180 / dataPoints.max()!)
                    let _ = print("circle y point: \(yCoordinate)")
                    Circle()
                        .fill(Color.red)
                        .frame(width: 15, height: 15)
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(color: Color.black.opacity(0.5), radius: 3, x: 0, y: 2)
                        .position(x: CGFloat(geometry.size.width - 17.5), y: yCoordinate + 15)
                        .onTapGesture {
                            showToast = true
                            toastMessage = "14:15 - 599 C"
                        }
                        .toast(isPresented: $showToast, duration: 2, message: toastMessage, yCoordinate: yCoordinate)
                }
            }
        }
    }
    
    func getYCoordinate(for value: CGFloat, in range: ClosedRange<CGFloat>, with height: CGFloat) -> CGFloat {
        let normalizedValue = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        return height - normalizedValue * height
    }
}

extension View {
    func toast(isPresented: Binding<Bool>, duration: Double = 2, message: String, yCoordinate: CGFloat) -> some View {
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
                    .position(x: CGFloat(geometry.size.width - 50), y: yCoordinate - 20)
                }
            }
        }
    }
}

struct GraphLine: Shape {
    var dataPoints: [CGFloat]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard dataPoints.count > 1 else { return path }
        
        let xScale = rect.width / CGFloat(dataPoints.count - 1)
        let yScale = rect.height / dataPoints.max()!
        path.move(to: CGPoint(x: 0, y: rect.height - dataPoints[0] * yScale))
        
        for i in 1..<dataPoints.count {
            path.addLine(to: CGPoint(x: CGFloat(i) * xScale, y: rect.height - dataPoints[i] * yScale))
        }
        
        return path
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
