//
//  GraphLine.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 23/04/2024.
//

import SwiftUI

struct GraphLine: Shape {
   
   var selectedOption: String
   var dataPoints: [AnalyticDatapoint]
   var yAxisRange: ClosedRange<CGFloat>
   var lineColor: Color
   var onTap: (CGPoint) -> Void
   var startPoint: CGFloat = 27.0
   
   func point(for value: CGFloat, at index: Int, in rect: CGRect) -> CGPoint {
       
       let totalTimeRange = self.setTotalSeconds(selectedOptions: selectedOption)
       let xAxisLength = rect.width - startPoint
       let x = self.getSecondsIntoDate(dataPoints[index].timestamp, totalSeconds: totalTimeRange)  // CGFloat(index) * xScale
       let xPosition = ((xAxisLength / totalTimeRange) * CGFloat(x)) + startPoint
       
       let y = getYCoordinate(for: value, in: yAxisRange, with: rect.height)
       return CGPoint(x: xPosition, y: y)
   }
   
   func path(in rect: CGRect) -> Path {
       var path = Path()
       
       guard dataPoints.count > 1 else { return path }

       let yScale = rect.height / 1000

       let totalTimeRange = self.setTotalSeconds(selectedOptions: selectedOption) // CGFloat(currentTime - pastTime)
       let xAxisLength = rect.width - startPoint
       let x = self.getSecondsIntoDate(dataPoints[0].timestamp, totalSeconds: totalTimeRange)
       
       path.move(to: CGPoint(x: ((xAxisLength / totalTimeRange) * CGFloat(x)) + startPoint, y: rect.height - dataPoints[0].datapoint * yScale))
       
       for i in 1..<dataPoints.count {
           
           let x = self.getSecondsIntoDate(dataPoints[i].timestamp, totalSeconds: totalTimeRange)
           let xPosition = (xAxisLength / totalTimeRange) * CGFloat(x) // CGFloat(i) * xScale
           path.addLine(to: CGPoint(x: xPosition + startPoint, y: rect.height - dataPoints[i].datapoint * yScale))
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
