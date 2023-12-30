//
//  AnalyticsCellView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 24/12/2023.
//

import SwiftUI
//import SwiftUICharts
import LineChartView

struct AnalyticsCellView: View {
    
    @State private var isDropdownExpanded = false
    @State private var selectedOptions: String = "Option 1"

    let options = ["Option 1", "Option 2", "Option 3"]
    
    var item: Item
    var action: () -> Void
    
    let chartParameters = LineChartParameters(
        data: [
            LineChartData(100),
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
                            dropDownAction()
                        }
                    Image("chevron-down")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(EdgeInsets(top: -25, leading: 0, bottom: 0, trailing: -20))
                        .onTapGesture {
                            dropDownAction()
                        }
                }
            }
            .padding()
            ZStack {
                VStack {
                    LineChartView(lineChartParameters: chartParameters)
                        .frame(height: 150)
                    Text("60 min")
                        .background(.clear)
                        .foregroundColor(CustomColors.TorchGreen)
                        .font(Font.custom("Manrope-SemiBold", size: 14.0))
                        .multilineTextAlignment(.center)
                }
                //                .padding(EdgeInsets(top: -25, leading: 0, bottom: 0, trailing: 0))
                if isDropdownExpanded {
                    HStack {
                        Spacer()
                        VStack(spacing: 8) {
                            ForEach(options, id: \.self) { option in
                                Button(action: {
//                                    selectedOptions = option
                                }) {
                                    HStack {
                                        Text(option)
                                            .padding(.trailing, 10)
                                            .background(.clear)
                                            .foregroundColor(CustomColors.TorchGreen)
                                            .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                        Spacer()
                                        Image(selectedOptions == option ? "Checkbox-selected" : "Checkbox-unselected")
                                            .resizable()
                                            .frame(width: 18, height: 18)
                                    }
                                    .frame(width: 120, height: 35)
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                    }
                }
            }
        }
        .onTapGesture {
            dropDownAction()
        }
    }
    
    func dropDownAction() {
        isDropdownExpanded.toggle()
    }
}

#Preview {
    
    AnalyticsCellView(item: Item(itemName: "Item 1", itemDescription: "Description for Item 1"), action: {})
}
