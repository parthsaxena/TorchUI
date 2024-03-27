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
    
    @State var selectedOptions: AnalyticsTimespanSelection = .oneHour
    @State var segmentationSelection : AnalyticsTypeSelection
    
    @State private var isDropdownExpanded = false
    
    var timeIntervals: [AnalyticsTimespanSelection] = [.oneHour, .oneDay, .oneWeek, .oneMonth, .oneYear] //.tenMinutes,
    var item: Item
    var circleIndex: Int
    var action: (_ selectedOption: AnalyticsTimespanSelection) -> Void
    
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
                    Text("\(selectedOptions.stringTimeSpan)")
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
//                    let _ = item.graphLineParam.map { analyticDatapoint in
//                        analyticDatapoint.datapoint
//                    }
                    let graphLineParam = self.sortListAccordingToDate()
                    CustomGraphView(dataPoints: graphLineParam, selectedOption: selectedOptions.stringTimeSpan, circleIndex: circleIndex, segmentationSelection: segmentationSelection)
                    .frame(height: 180)
                    Text("\(selectedOptions.stringTimeSpan)")
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
                                        Text(option.stringTimeSpan)
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
