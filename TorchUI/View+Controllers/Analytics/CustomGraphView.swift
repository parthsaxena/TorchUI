//
//  CustomGraphView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 02/01/2024.
//

import SwiftUI

struct CustomGraphView: View {
    
    var dataPoints: [AnalyticDatapoint]
    let selectedOption: String
    var circleIndex: Int
    @State var segmentationSelection: AnalyticsTypeSelection

    init(dataPoints: [AnalyticDatapoint], selectedOption: String, circleIndex: Int, segmentationSelection: AnalyticsTypeSelection) {
        self.dataPoints = dataPoints.reversed()
        self.selectedOption = selectedOption
        self.circleIndex = circleIndex
        self.segmentationSelection = segmentationSelection
    }
    
    var body: some View {
        GraphView(dataPoints: dataPoints, selectedOption: selectedOption, circleIndex: circleIndex, segmentationSelection: segmentationSelection)
    }
}

struct GraphView: View {
    
    @State private var showToast = true
    @State private var toastMessage = ""
    @State private var circlePosition: CGPoint = CGPoint(x: 27, y: 0)
    @State private var circleColor: Color = .green
    @State private var isImageVisible: Bool = false
    
    var dataPoints: [AnalyticDatapoint]
    let selectedOption: String
    @State var circleIndex: Int
    @State var segmentationSelection: AnalyticsTypeSelection
    let yAxisRange: ClosedRange<CGFloat> = 0...1000
    let yAxisStep: CGFloat = 200
    let lineColor: Color = .green
    let gradientColors: [Color] = [.green, .red]
    
    init(dataPoints: [AnalyticDatapoint], selectedOption: String, circleIndex: Int, segmentationSelection: AnalyticsTypeSelection) {
        
        self.dataPoints = dataPoints
        self.selectedOption = selectedOption
        self.circleIndex = circleIndex
        self.segmentationSelection = segmentationSelection
        let lastPoint = dataPoints.last ?? AnalyticDatapoint(datapoint: 0.0, timestamp: getCurrentDateInUTC())
        let yCoordinate = (180 - lastPoint.datapoint * 0.18) + 30
        let point = CGPoint(x: CGFloat(27), y: yCoordinate)
        self.circlePosition = point
        self.circleColor = lineColor
        
        if let datePoint = dataPoints.first?.datapoint {
            let date = AnalyticDatapoint(datapoint: datePoint, timestamp: self.addInitialPoint())
            self.dataPoints.insert(date, at: 0)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    ForEach(0..<6) { index in
                        let yAxisValue = CGFloat(index) * yAxisStep
                        let yCoordinate = getYCoordinate(for: yAxisValue, in: yAxisRange, with: 30)
                        
                        Text("\(Int(Int(yAxisStep) * (5 - index)))")
                            .frame(width: 27, alignment: .leading)
                            .padding(.trailing, 0)
                            .position(x: 10, y: yCoordinate)
                            .font(Font.custom("Manrope-SemiBold", size: 10.0))
                        Path { path in
                            path.move(to: CGPoint(x: 27, y: yCoordinate - 20))
                            path.addLine(to: CGPoint(x: geometry.size.width, y: yCoordinate - 20))
                        }
                        .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
                    }
                }
                .frame(height: 240)
                GraphLine(selectedOption: selectedOption, dataPoints: dataPoints, yAxisRange: yAxisRange, lineColor: lineColor) { point in
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
                
                if isImageVisible {
                    Image("horizontalLine")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 180)
                        .position(x: circlePosition.x, y: 120)
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

                            let returnRespone = findNearestPoint(on: dataPoints, at: touchLocation, in: geometry.size)
                            let nearestPoint = returnRespone.0
                            print("Circle Index findNearestPoint \(returnRespone.1)")
                            if segmentationSelection == .thermalCameras {
                                GraphCirclePositionManager.shared.termalCameraCirclePositions[circleIndex] = returnRespone.1
                            } else if segmentationSelection == .spectralAnalysis {
                                GraphCirclePositionManager.shared.spectralAnalysisCirclePositions[circleIndex] = returnRespone.1
                            } else if segmentationSelection == .smoke {
                                GraphCirclePositionManager.shared.smokeCirclePositions[circleIndex] = returnRespone.1
                            } else if segmentationSelection == .temperatureHumidity {
                                GraphCirclePositionManager.shared.temperatureHumidityCirclePositions[circleIndex] = returnRespone.1
                            }
                            circlePosition = nearestPoint
                            let nearestColor = getGradientColor(touchX: value.location.x, totalWidth: geometry.size.width)
                            circleColor = nearestColor
                            isImageVisible = true
                            GraphCirclePositionManager.shared.isMoveCircle = true
                        }
                        .onEnded { _ in
                            isImageVisible = false
                            GraphCirclePositionManager.shared.isMoveCircle = false
                        }
                    )
                    .animation(nil)
                    .toast(isPresented: $showToast, message: toastMessage, coordinates: circlePosition)
                    .onAppear {
                        if dataPoints.count > 0 {
                            
                            var index = 0
                            if segmentationSelection == .thermalCameras {
                                index = GraphCirclePositionManager.shared.termalCameraCirclePositions[circleIndex]
                            } else if segmentationSelection == .spectralAnalysis {
                                index = GraphCirclePositionManager.shared.spectralAnalysisCirclePositions[circleIndex]
                            } else if segmentationSelection == .smoke {
                                index = GraphCirclePositionManager.shared.smokeCirclePositions[circleIndex]
                            } else if segmentationSelection == .temperatureHumidity {
                                index = GraphCirclePositionManager.shared.temperatureHumidityCirclePositions[circleIndex]
                            }
                            let totalTimeRange = self.setTotalSeconds(selectedOptions: selectedOption)
                            let x = self.getSecondsIntoDate(dataPoints[index].timestamp, totalSeconds: totalTimeRange)
                            let xAxisLength = geometry.size.width
                            let xPosition = (xAxisLength / totalTimeRange) * CGFloat(x)
                            updatePostion(x: xPosition, circleIndex: circleIndex) // CGFloat(geometry.size.width - 2.5)
                        }
                    }
            }
            .padding(.top, -30)
        }
    }
    
    func addInitialPoint() -> Date {
        
        let totalSeconds = self.setTotalSeconds(selectedOptions: selectedOption)
        let initialDatePoint = self.getInitialDate(totalSeconds: totalSeconds)
        return initialDatePoint // dataPoints.insert(dataPoint, at: 0)
    }
    
    func getInitialDate(totalSeconds: CGFloat) -> Date {

        let currentDate = getCurrentDateInUTC()

        var dateComponents = DateComponents()
        dateComponents.second = -Int(totalSeconds)

        var calendar = Calendar.current
        
        calendar.timeZone = TimeZone(identifier: "UTC")!
        let startTime = calendar.date(byAdding: dateComponents, to: currentDate) ?? currentDate
        return startTime
    }
    
    func findNearestPoint(on dataPoints: [AnalyticDatapoint], at touchLocation: CGPoint, in size: CGSize) -> (CGPoint, Int) {
        
        let xScale = size.width / CGFloat(dataPoints.count - 1)
        
        var index = Int((touchLocation.x) / xScale)
        index = index >= dataPoints.count ? (dataPoints.count - 1) : index
        index = index < 0 ? 0 : index
        updateMessage(point: dataPoints[index])
        
        let totalTimeRange = self.setTotalSeconds(selectedOptions: selectedOption)
        let x = self.getSecondsIntoDate(dataPoints[index].timestamp, totalSeconds: totalTimeRange)  // CGFloat(index) * xScale
        let y = getYCoordinate(for: dataPoints[index].datapoint, in: yAxisRange, with: size.height)
        
        let xAxisLength = size.width
        let xPosition = (xAxisLength / totalTimeRange) * CGFloat(x)
        
        return (CGPoint(x: xPosition, y: y), index)
    }
    
    func getSecondsIntoDate(_ xAxisAsTime: Date, totalSeconds: CGFloat) -> CGFloat {

        let currentDate = getCurrentDateInUTC()

        var dateComponents = DateComponents()
        dateComponents.second = -Int(totalSeconds)

        var calendar = Calendar.current
        
        calendar.timeZone = TimeZone(identifier: "UTC")!
        if let startTime = calendar.date(byAdding: dateComponents, to: currentDate) {
            let secondsBetweenDates = xAxisAsTime.timeIntervalSince(startTime)
            return secondsBetweenDates
        }
        return 0.0
    }
    
    func getCurrentDateInUTC() -> Date {
        let currentDate = Date()
        let localTimeZone = TimeZone.current
        let utcTimeZone = TimeZone(identifier: "UTC")!
        let currentOffset = localTimeZone.secondsFromGMT(for: currentDate)
        let utcOffset = utcTimeZone.secondsFromGMT(for: currentDate)
        let interval = TimeInterval(utcOffset - currentOffset)
        let utcDate = currentDate.addingTimeInterval(interval)
        return utcDate
    }
    
    func getYCoordinate(for value: CGFloat, in range: ClosedRange<CGFloat>, with height: CGFloat) -> CGFloat {
        let normalizedValue = (value - range.lowerBound) / (range.upperBound - range.lowerBound)
        return height - normalizedValue * height
    }
    
    func getDataPointFromYCoordinate(_ yCoordinate: CGFloat, in range: ClosedRange<CGFloat>, with height: CGFloat) -> CGFloat {
        let normalizedValue = (height - yCoordinate) / height
        return normalizedValue * (range.upperBound - range.lowerBound) + range.lowerBound
    }
    
    func updatePostion(x: CGFloat, circleIndex: Int) {
        
        if dataPoints.count > 0 {
            
            var index = 0
            if segmentationSelection == .thermalCameras {
                index = GraphCirclePositionManager.shared.termalCameraCirclePositions[circleIndex]
            } else if segmentationSelection == .spectralAnalysis {
                index = GraphCirclePositionManager.shared.spectralAnalysisCirclePositions[circleIndex]
            } else if segmentationSelection == .smoke {
                index = GraphCirclePositionManager.shared.smokeCirclePositions[circleIndex]
            } else if segmentationSelection == .temperatureHumidity {
                index = GraphCirclePositionManager.shared.temperatureHumidityCirclePositions[circleIndex]
            }
            
            let lastPoint = dataPoints[index].datapoint
            let yCoordinate = (180 - lastPoint * 0.18)
            let point = CGPoint(x: x, y: yCoordinate)
            circlePosition = point
            let last = dataPoints[index]
            updateMessage(point: last)
        }
    }
    
    func updateMessage(point: AnalyticDatapoint) {
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let timeString = timeFormatter.string(from: point.timestamp)
        toastMessage = "\(timeString) - \(Double(point.datapoint).rounded(toPlaces: 2)) C"
    }
    
    func getGradientColor(touchX: CGFloat, totalWidth: CGFloat) -> Color {
        let xScale = totalWidth / CGFloat(dataPoints.count - 1)
        let index = Int((touchX) / xScale)
        return index >= 0 && index < dataPoints.count ? interpolateColor(dataPoints[index].datapoint, gradientColors: [.green, .red]) : lineColor
    }
    
    func interpolateColor(_ value: CGFloat, gradientColors: [Color]) -> Color {
        let normalizedValue = value / yAxisRange.upperBound
        let fraction = Double(normalizedValue) * Double(gradientColors.count - 1)
        let lowerIndex = max(0, Int(floor(fraction)))
        let upperIndex = max(0, Int(ceil(fraction)))
        
        let lowerColor = gradientColors[lowerIndex]
        let upperColor = gradientColors[upperIndex < gradientColors.count ? upperIndex : gradientColors.count - 1]
        
        let fractionComplete = fraction - Double(lowerIndex)
        
        return blendColors(lowerColor, upperColor, fraction: fractionComplete)
    }
    
    func blendColors(_ color1: Color, _ color2: Color, fraction: Double) -> Color {
        let cgColor1 = UIColor(color1).cgColor
        let cgColor2 = UIColor(color2).cgColor

        guard let components1 = cgColor1.components, let components2 = cgColor2.components else {
            return .clear // Default color if components are not available
        }

        let blendedColor = Color(
            red: CGFloat(components1[0] * (1.0 - fraction) + components2[0] * fraction),
            green: CGFloat(components1[1] * (1.0 - fraction) + components2[1] * fraction),
            blue: CGFloat(components1[2] * (1.0 - fraction) + components2[2] * fraction),
            opacity: CGFloat(components1[3] * (1.0 - fraction) + components2[3] * fraction)
        )

        return blendedColor
    }
    
    func setTotalSeconds(selectedOptions: String) -> Double {
            
        if selectedOptions == "10 Min" {
            return 600
        } else if selectedOptions == "1 Hour" {
            return 3600
        } else if selectedOptions == "1 Day" {
            return 3600 * 24
        } else if selectedOptions == "1 Week" {
            return 3600 * 24 * 7
        } else if selectedOptions == "1 Month" {
            return 3600 * 24 * 31
        } else if selectedOptions == "1 Year" {
            return 3600 * 24 * 365
        }
        return 0
    }
}

extension View {
    
    func toast(isPresented: Binding<Bool>, message: String, coordinates: CGPoint) -> some View {
        ZStack {
            self
            if isPresented.wrappedValue {
                VStack {
                    HStack {
                        ToastView(message: message)
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .position(x: CGFloat(coordinates.x + adjustLeadingTrailing(coordinates.x)), y: coordinates.y)
            }
        }
        .animation(nil)
    }
    
    func adjustLeadingTrailing(_ x: CGFloat) -> CGFloat {
        
        if x < 40 { return 30 }
        return (x * -0.11)
    }
}

struct GraphLine: Shape {
    
    var selectedOption: String
    var dataPoints: [AnalyticDatapoint]
    var yAxisRange: ClosedRange<CGFloat>
    var lineColor: Color
    var onTap: (CGPoint) -> Void
    
    func point(for value: CGFloat, at index: Int, in rect: CGRect) -> CGPoint {
        
        let totalTimeRange = self.setTotalSeconds(selectedOptions: selectedOption)
        let xAxisLength = rect.width
        let x = self.getSecondsIntoDate(dataPoints[index].timestamp, totalSeconds: totalTimeRange)  // CGFloat(index) * xScale
        let xPosition = (xAxisLength / totalTimeRange) * CGFloat(x)
        
        let y = getYCoordinate(for: value, in: yAxisRange, with: rect.height)
        return CGPoint(x: xPosition, y: y)
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard dataPoints.count > 1 else { return path }

        let yScale = rect.height / 1000

        let totalTimeRange = self.setTotalSeconds(selectedOptions: selectedOption) // CGFloat(currentTime - pastTime)
        let xAxisLength = rect.width
        let x = self.getSecondsIntoDate(dataPoints[0].timestamp, totalSeconds: totalTimeRange)
        
        path.move(to: CGPoint(x: ((xAxisLength / totalTimeRange) * CGFloat(x)), y: rect.height - dataPoints[0].datapoint * yScale))
        
        for i in 1..<dataPoints.count {
            
            let x = self.getSecondsIntoDate(dataPoints[i].timestamp, totalSeconds: totalTimeRange)
            let xPosition = (xAxisLength / totalTimeRange) * CGFloat(x) // CGFloat(i) * xScale
            path.addLine(to: CGPoint(x: xPosition, y: rect.height - dataPoints[i].datapoint * yScale))
        }
        
        return path
    }
    
    func getSecondsIntoDate(_ xAxisAsTime: Date, totalSeconds: CGFloat) -> CGFloat {

        let currentDate = getCurrentDateInUTC()

        var dateComponents = DateComponents()
        dateComponents.second = -Int(totalSeconds)

        var calendar = Calendar.current
        
        calendar.timeZone = TimeZone(identifier: "UTC")!
        if let startTime = calendar.date(byAdding: dateComponents, to: currentDate) {
            let secondsBetweenDates = xAxisAsTime.timeIntervalSince(startTime)
            return secondsBetweenDates
        }
        return 0.0
    }
    
    func getCurrentDateInUTC() -> Date {
        let currentDate = Date()
        let localTimeZone = TimeZone.current
        let utcTimeZone = TimeZone(identifier: "UTC")!
        let currentOffset = localTimeZone.secondsFromGMT(for: currentDate)
        let utcOffset = utcTimeZone.secondsFromGMT(for: currentDate)
        let interval = TimeInterval(utcOffset - currentOffset)
        let utcDate = currentDate.addingTimeInterval(interval)
        return utcDate
    }
    
    func body(in rect: CGRect) -> some View {
        let tapGesture = TapGesture()
            .onEnded { _ in
                let touchLocation = CGPoint(x: 0, y: 0) // Get the touch location
                let xScale = rect.width / CGFloat(dataPoints.count - 1)
                let index = Int((touchLocation.x) / xScale)
                
                if index >= 0 && index < dataPoints.count {
                    onTap(point(for: dataPoints[index].datapoint, at: index, in: rect))
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
    
    func setTotalSeconds(selectedOptions: String) -> Double {
            
        if selectedOptions == "10 Min" {
            return 600
        } else if selectedOptions == "1 Hour" {
            return 3600
        } else if selectedOptions == "1 Day" {
            return 3600 * 24
        } else if selectedOptions == "1 Week" {
            return 3600 * 24 * 7
        } else if selectedOptions == "1 Month" {
            return 3600 * 24 * 31
        } else if selectedOptions == "1 Year" {
            return 3600 * 24 * 365
        }
        return 0
    }
}

struct ToastView: View {
    let message: String
    
    var body: some View {
        Text(message)
            .padding(.all, 7)
            .font(Font.custom("Manrope-SemiBold", size: 14.0))
            .background(message == "" ? .clear : .black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .frame(height: 50)
    }
}
