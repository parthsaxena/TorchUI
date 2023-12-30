//
//  AnalyticsCellView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 24/12/2023.
//

import SwiftUI
import SwiftUICharts
import LineChartView

struct AnalyticsCellView: View {
    
    var item: Item
    var action: () -> Void
    
    let chartParameters = LineChartParameters(
        data: [
            LineChartData(10),
            LineChartData(12),
            LineChartData(13),
            LineChartData(12),
            LineChartData(25.8),
            LineChartData(15.19),
            LineChartData(15.0),
            LineChartData(18.0),
            LineChartData(35.0),
            LineChartData(32.0),
            LineChartData(33.0),
        ],
        labelColor: .primary,
        secondaryLabelColor: .secondary,
        labelsAlignment: .left,
        dataPrecisionLength: 0,
        dataPrefix: nil,
        dataSuffix: " C",
        indicatorPointColor: .red,
        indicatorPointSize: 15,
        lineColor: .green,
        lineSecondColor: .red,
        lineWidth: 3,
        dotsWidth: 0,
        displayMode: .default,
        dragGesture: true,
        hapticFeedback: false
    )
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.itemName)
                        .font(Font.custom("Manrope-SemiBold", size: 18.0))
                        .padding(EdgeInsets(top: -15, leading: -15, bottom: 0, trailing: 0))
                        .foregroundColor(CustomColors.TorchGreen)
                    Text(item.itemDescription)
                        .font(Font.custom("Manrope-SemiBold", size: 14.0))
                        .foregroundColor(.gray)
                        .padding(EdgeInsets(top: -15, leading: -15, bottom: 0, trailing: 0))
                }
                Spacer()
                HStack {
                    Text("60 min")
                        .background(.clear)
                        .foregroundColor(.gray)
                        .font(Font.custom("Manrope-SemiBold", size: 14.0))
                        .padding(EdgeInsets(top: -25, leading: 0, bottom: 0, trailing: 0))
                        .onTapGesture {
                            action()
                        }
                    Image("chevron-down")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(EdgeInsets(top: -25, leading: 0, bottom: 0, trailing: -20))
                        .onTapGesture {
                            action()
                        }
                }
            }
            .padding()
            LineChartView(lineChartParameters: chartParameters)
                .frame(height: 200)
            Text("60 min")
                .background(.clear)
                .foregroundColor(CustomColors.TorchGreen)
                .font(Font.custom("Manrope-SemiBold", size: 14.0))
                .multilineTextAlignment(.center)
//                .padding(EdgeInsets(top: -25, leading: 0, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    
    AnalyticsCellView(item: Item(itemName: "Item 1", itemDescription: "Description for Item 1"), action: {})
}
