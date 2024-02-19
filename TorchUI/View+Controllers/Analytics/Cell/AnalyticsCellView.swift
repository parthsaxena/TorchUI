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
    @State var selectedOptions: String = ""

    var timeIntervals: [String] = ["10 Min", "1 Hour", "1 Day", "1 Week", "1 Month", "1 Year"]
    var item: Item
    var action: (_ selectedOption: String) -> Void

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
                    Text("\(selectedOptions)")
                        .background(.clear)
                        .foregroundColor(.gray)
                        .font(Font.custom("Manrope-SemiBold", size: 14.0))
                        .padding(EdgeInsets(top: -25, leading: 0, bottom: 0, trailing: 0))
                    Image("chevron-down")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(EdgeInsets(top: -25, leading: 0, bottom: 0, trailing: -20))
                }
                .onTapGesture {
                    dropDownAction()
                }
            }
            .padding()
            ZStack {
                VStack {
                    let data = item.graphLineParam.map { analyticDatapoint in
                        analyticDatapoint.datapoint
                    }
//                    let analytics = [AnalyticDatapoint(datapoint: 500.0, timestamp: Date()),
//                                     AnalyticDatapoint(datapoint: 200.0, timestamp: Date()),
//                                     AnalyticDatapoint(datapoint: 400.0, timestamp: Date()),
//                                     AnalyticDatapoint(datapoint: 700.0, timestamp: Date()),
//                                     AnalyticDatapoint(datapoint: 800.0, timestamp: Date()),
//                                     AnalyticDatapoint(datapoint: 500.0, timestamp: Date()),
//                                     AnalyticDatapoint(datapoint: 500.0, timestamp: Date())]
                    var graphLineParam = self.sortListAccordingToDate()
                    CustomGraphView(dataPoints: graphLineParam)
                        .frame(height: 180)
                    Text("\(selectedOptions)")
                        .background(.clear)
                        .foregroundColor(CustomColors.TorchGreen)
                        .font(Font.custom("Manrope-SemiBold", size: 14.0))
                        .multilineTextAlignment(.center)
                        .padding(.top, 10)
                }
                if isDropdownExpanded {
                    HStack {
                        Spacer()
                        VStack(spacing: 5) {
                            ForEach(timeIntervals, id: \.self) { option in
                                Button(action: {

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
                                    .frame(width: 90, height: 30)
                                    .onTapGesture {
                                        selectedOptions = option
                                        action(selectedOptions)
                                        dropDownAction()
                                    }
                                }
                            }
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .shadow(radius: 5)
                    }
                    .padding(.top, -125)
                    .padding(.trailing, -10)
                }
            }
        }
    }
    
    func dropDownAction() {
        isDropdownExpanded.toggle()
    }
    
    func sortListAccordingToDate() -> [AnalyticDatapoint] {
        var list = item.graphLineParam
        list.sort { $0.timestamp > $1.timestamp }
        return list
    }
}

//#Preview {
//    
//    AnalyticsCellView(item: Item(itemName: "Item 1", itemDescription: "Description for Item 1"), action: {})
//}
