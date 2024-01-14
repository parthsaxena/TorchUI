//
//  AnalyticsSwiftUIView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 22/12/2023.
//

import SwiftUI

struct AnalyticsSwiftUIView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var segmentationSelection : AnalyticsTypeSelection = .thermalCameras
    @State var timespanSelection: AnalyticsTimespanSelection = .tenMinutes
    
    @State private var thermalCameraItems: [Item] = []
    @State private var spectralAnalysisItems: [Item] = []
    @State private var smokeItems: [Item] = []
    @State private var temperatureHumidityItems: [Item] = []
    
    func getThermalCameraItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        
        var list: [Item] = []
        
        if let lineChartParameter = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["ir1_tmax"] {
            let item = Item(itemName: "Camera 1", itemDescription: "Temperature and time", selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter)
            list.append(item)
        }
        
        if let lineChartParameter1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["ir2_tmax"] {
            let item = Item(itemName: "Camera 2", itemDescription: "Temperature and time",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter1)
            list.append(item)
        }
        
        if let lineChartParameter2 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["ir3_tmax"] {
            let item = Item(itemName: "Camera 3", itemDescription: "Temperature and time",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter2)
            list.append(item)
        }
        return list
    }
    
    func updateThermalCameraItems(timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
        var list = thermalCameraItems
        if selectedIndex == 0 {
            let item = self.setupCustomAnalyticsList(itemName: "Camera 1", itemDescription: "Temperature and time", timespan: timespan, tableBasisOnTabAndIndex: "ir1_tmax")
            list[selectedIndex] = item
        } else if selectedIndex == 1 {
            let item = self.setupCustomAnalyticsList(itemName: "Camera 2", itemDescription: "Temperature and time", timespan: timespan, tableBasisOnTabAndIndex: "ir2_tmax")
            list[selectedIndex] = item
        } else if selectedIndex == 2 {
            let item = self.setupCustomAnalyticsList(itemName: "Camera 3", itemDescription: "Temperature and time", timespan: timespan, tableBasisOnTabAndIndex: "ir3_tmax")
            list[selectedIndex] = item
        }
        return list
    }
    
    func getSpectralAnalysisItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        
        var list: [Item] = []
        if let lineChart1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["rgb1_pix_abvthl"] {
            let item = Item(itemName: "Camera 1", itemDescription: "Pixels above threshold",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart1)
            list.append(item)
        }
        
        if let lineChart2 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["rgb2_pix_abvthl"] {
            let item = Item(itemName: "Camera 2", itemDescription: "Pixels above threshold",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart2)
            list.append(item)
        }
        
        if let lineChart3 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["rgb3_pix_abvthl"] {
            let item = Item(itemName: "Camera 3", itemDescription: "Pixels above threshold",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart3)
            list.append(item)
        }
        return list
    }
    
    func updateSpectralAnalysisItems(timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
        var list = spectralAnalysisItems
        if selectedIndex == 0 {
            let item = self.setupCustomAnalyticsList(itemName: "Camera 1", itemDescription: "VPixels above threshold", timespan: timespan, tableBasisOnTabAndIndex: "rgb1_pix_abvthl")
            list[selectedIndex] = item
        } else if selectedIndex == 1 {
            let item = self.setupCustomAnalyticsList(itemName: "Camera 2", itemDescription: "Pixels above threshold", timespan: timespan, tableBasisOnTabAndIndex: "rgb2_pix_abvthl")
            list[selectedIndex] = item
        } else if selectedIndex == 2 {
            let item = self.setupCustomAnalyticsList(itemName: "Camera 3", itemDescription: "Pixels above threshold", timespan: timespan, tableBasisOnTabAndIndex: "rgb3_pix_abvthl")
            list[selectedIndex] = item
        }
        return list
    }
    
    func getSmokeItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        
        var list: [Item] = []
        if let lineChart1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["tgs5141_co"] {
            let item = Item(itemName: "CO", itemDescription: "Value per time",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart1)
            list.append(item)
        }
        
        if let lineChart2 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["scd41_co2"] {
            let item = Item(itemName: "CO2", itemDescription: "Value per time",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart2)
            list.append(item)
        }
        
        if let lineChart3 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["sgp40_raw"] {
            let item = Item(itemName: "VOC", itemDescription: "Value per time",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart3)
            list.append(item)
        }
        return list
    }
    
    func updateSmokeItems(timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
        var list = smokeItems
        if selectedIndex == 0 {
            let item = self.setupCustomAnalyticsList(itemName: "CO", itemDescription: "Value per time", timespan: timespan, tableBasisOnTabAndIndex: "tgs5141_co")
            list[selectedIndex] = item
        } else if selectedIndex == 1 {
            let item = self.setupCustomAnalyticsList(itemName: "CO2", itemDescription: "Value per time", timespan: timespan, tableBasisOnTabAndIndex: "scd41_co2")
            list[selectedIndex] = item
        } else if selectedIndex == 2 {
            let item = self.setupCustomAnalyticsList(itemName: "VOC", itemDescription: "Value per time", timespan: timespan, tableBasisOnTabAndIndex: "sgp40_raw")
            list[selectedIndex] = item
        }
        return list
    }
    
    func getTemperatureHumidityItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        
        var list: [Item] = []
        
        if let lintChart = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["aht20_t"] {
            let item = Item(itemName: "Temperature", itemDescription: "Temperature and time",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lintChart)
            list.append(item)
        }
        
        if let lintChart1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["aht20_h"] {
            let item = Item(itemName: "Humidity", itemDescription: "Humidity and time",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lintChart1)
            list.append(item)
        }
        return list
    }
    
    func updateTemperatureHumidityItems(timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
        var list = temperatureHumidityItems
        if selectedIndex == 0 {
            let item = self.setupCustomAnalyticsList(itemName: "Temperature", itemDescription: "Temperature and time", timespan: timespan, tableBasisOnTabAndIndex: "aht20_t")
            list[selectedIndex] = item
        } else if selectedIndex == 1 {
            let item = self.setupCustomAnalyticsList(itemName: "Humidity", itemDescription: "Humidity and time", timespan: timespan, tableBasisOnTabAndIndex: "aht20_h")
            list[selectedIndex] = item
        }
        return list
    }
    
    func setupCustomAnalyticsList(itemName: String, itemDescription: String, timespan: AnalyticsTimespanSelection, tableBasisOnTabAndIndex: String) -> Item {
        
        let lintChart1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?[tableBasisOnTabAndIndex]
        return Item(itemName: itemName, itemDescription: itemDescription, selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lintChart1 ?? [])
    }
    
    var body: some View {
        if (SessionManager.shared.deviceAnalytics.keys.contains(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id)) {
            
            VStack {
                ZStack {
                    HStack {
                        AnalyticsBackButton()
                        Spacer()
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Text("Analytics")
                                .font(Font.custom("Manrope-SemiBold", size: 18.0))
                                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                                .padding(.top, 0)
                            Text("Sensor 3 hours Napa")
                                .font(Font.custom("Manrope-SemiBold", size: 14.0))
                                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.LightGray)
                                .padding(.top, 0)
                        }
                        Spacer()
                    }
                }
                .padding(.top, 10)
                .padding(.horizontal, 15)
                ScrollableSegmentsView(selectedSegment: $segmentationSelection)
                NavigationView {
                    List {
                        if (segmentationSelection == .thermalCameras) {
                            ForEach(Array(thermalCameraItems.enumerated()), id: \.element) { index, item in
                                AnalyticsCellView(selectedOptions: item.selectedTimeSpan, item: item, action: { selectedOption in
                                    
                                    let timeSpam = loadDropdownData(selectedOption: selectedOption)
                                    thermalCameraItems = updateThermalCameraItems(timespan: timeSpam, selectedIndex: index)
                                })
                            }
                        } else if (segmentationSelection == .spectralAnalysis) {
                            ForEach(Array(spectralAnalysisItems.enumerated()), id: \.element) { index, item in
                                AnalyticsCellView(selectedOptions: item.selectedTimeSpan, item: item, action: { selectedOption in
                                    
                                    let timeSpam = loadDropdownData(selectedOption: selectedOption)
                                    spectralAnalysisItems = updateSpectralAnalysisItems(timespan: timeSpam, selectedIndex: index)
                                })
                            }
                        } else if (segmentationSelection == .smoke) {
                            ForEach(Array(smokeItems.enumerated()), id: \.element) { index, item in
                                AnalyticsCellView(selectedOptions: item.selectedTimeSpan, item: item, action: { selectedOption in
                                    
                                    let timeSpam = loadDropdownData(selectedOption: selectedOption)
                                    smokeItems = updateSmokeItems(timespan: timeSpam, selectedIndex: index)
                                    print("check list smoke items \(smokeItems)")
                                })
                            }
                        } else if (segmentationSelection == .temperatureHumidity) {
                            ForEach(Array(temperatureHumidityItems.enumerated()), id: \.element) { index, item in
                                AnalyticsCellView(selectedOptions: item.selectedTimeSpan, item: item, action: { selectedOption in
                                    
                                    let timeSpam = loadDropdownData(selectedOption: selectedOption)
                                    temperatureHumidityItems = updateTemperatureHumidityItems(timespan: timeSpam, selectedIndex: index)
                                })
                            }
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowSpacing(20)
                    .listStyle(InsetGroupedListStyle())
                }
                .padding(.top, -8)
                Spacer()
            }
            .background(colorScheme == .dark ? CustomColors.DarkModeBackground : Color.white)
            .onAppear {
                loadGraphData()
            }
        }
    }
    
    func loadGraphData() {
        
        thermalCameraItems = getThermalCameraItems(timespan: timespanSelection)
        spectralAnalysisItems = getSpectralAnalysisItems(timespan: timespanSelection)
        smokeItems = getSmokeItems(timespan: timespanSelection)
        temperatureHumidityItems = getTemperatureHumidityItems(timespan: timespanSelection)
    }
    
    func loadDropdownData(selectedOption: String) -> AnalyticsTimespanSelection {
        if selectedOption == "10 Min" {
            return .tenMinutes
        } else if selectedOption ==  "1 Hour" {
            return .oneHour
        } else if selectedOption == "1 Day" {
            return .oneDay
        } else if selectedOption == "1 Week" {
            return .oneWeek
        } else if selectedOption == "1 Month" {
            return .oneMonth
        } else if selectedOption == "1 Year" {
            return .oneYear
        }
        return .tenMinutes
    }
}

#Preview {
    AnalyticsSwiftUIView()
}
