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
    @State var timespanSelection: AnalyticsTimespanSelection = .oneHour
    
    @State private var thermalCameraItems: [Item] = []
    @State private var spectralAnalysisItems: [Item] = []
    @State private var smokeItems: [Item] = []
    @State private var temperatureHumidityItems: [Item] = []
    @Binding var viewAnalytics: Bool
    
    @State private var termalCameraTimeSpam: [AnalyticsTimespanSelection] = [.oneHour , .oneHour, .oneHour]
    @State private var spectralAnalysisTimeSpam: [AnalyticsTimespanSelection] = [.oneHour , .oneHour, .oneHour]
    @State private var smokeTimeSpam: [AnalyticsTimespanSelection] = [.oneHour , .oneHour, .oneHour]
    @State private var temperatureHumidityTimeSpam: [AnalyticsTimespanSelection] = [.oneHour , .oneHour]
    
    func getThermalCameraItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        
        var list: [Item] = []
        if let lineChartParameter = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["ir1_tmax"] {
            let item = Item(itemName: "Camera 1", itemDescription: "Temperature and time", selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter)
            list.append(item)
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append(lineChartParameter.count - 1)
        }
        
        if let lineChartParameter1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["ir2_tmax"] {
            let item1 = Item(itemName: "Camera 2", itemDescription: "Temperature and time",
                             selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter1)
            list.append(item1)
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append(lineChartParameter1.count - 1)
        }
        
        if let lineChartParameter2 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["ir3_tmax"] {
            let item2 = Item(itemName: "Camera 3", itemDescription: "Temperature and time",
                             selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter2)
            list.append(item2)
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append(lineChartParameter2.count - 1)
        }
        return list
    }
    
    func updateThermalCameraItems(timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
        
        var list = thermalCameraItems
        if list.count > 0 {
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
        }
        return list
    }
    
    func getSpectralAnalysisItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        
        var list: [Item] = []
        if let lineChart1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["rgb1_pix_abvthl"] {
            let item = Item(itemName: "Camera 1", itemDescription: "Pixels above threshold",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart1)
            list.append(item)
            GraphCirclePositionManager.shared.spectralAnalysisCirclePositions.append(lineChart1.count - 1)
        }
        
        if let lineChart2 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["rgb2_pix_abvthl"] {
            let item2 = Item(itemName: "Camera 2", itemDescription: "Pixels above threshold",
                             selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart2)
            list.append(item2)
            GraphCirclePositionManager.shared.spectralAnalysisCirclePositions.append(lineChart2.count - 1)
        }
        
        if let lineChart3 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["rgb3_pix_abvthl"] {
            let item3 = Item(itemName: "Camera 3", itemDescription: "Pixels above threshold",
                             selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart3)
            list.append(item3)
            GraphCirclePositionManager.shared.spectralAnalysisCirclePositions.append(lineChart3.count - 1)
        }
        return list
    }
    
    func updateSpectralAnalysisItems(timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
        
        var list = spectralAnalysisItems
        if list.count > 0 {
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
        }
        return list
    }
    
    func getSmokeItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        
        var list: [Item] = []
        if let lineChart1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["tgs5141_co"] {
            let item = Item(itemName: "CO", itemDescription: "Value per time",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart1)
            list.append(item)
            GraphCirclePositionManager.shared.smokeCirclePositions.append(lineChart1.count - 1)
        }
        
        if let lineChart2 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["scd41_co2"] {
            let item2 = Item(itemName: "CO2", itemDescription: "Value per time",
                             selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart2)
            list.append(item2)
            GraphCirclePositionManager.shared.smokeCirclePositions.append(lineChart2.count - 1)
        }
        
        if let lineChart3 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["sgp40_raw"] {
            let item3 = Item(itemName: "VOC", itemDescription: "Value per time",
                             selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart3)
            list.append(item3)
            GraphCirclePositionManager.shared.smokeCirclePositions.append(lineChart3.count - 1)
        }
        return list
    }
    
    func updateSmokeItems(timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
        var list = smokeItems
        if list.count > 0 {
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
        }
        return list
    }
    
    func getTemperatureHumidityItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        
        var list: [Item] = []
        
        if let lintChart = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["aht20_t"] {
            let item = Item(itemName: "Temperature", itemDescription: "Temperature and time",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lintChart)
            list.append(item)
            GraphCirclePositionManager.shared.temperatureHumidityCirclePositions.append(lintChart.count - 1)
        }
        
        if let lintChart1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["aht20_h"] {
            let item1 = Item(itemName: "Humidity", itemDescription: "Humidity and time",
                             selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lintChart1)
            list.append(item1)
            GraphCirclePositionManager.shared.temperatureHumidityCirclePositions.append(lintChart1.count - 1)
        }
        return list
    }
    
    func updateTemperatureHumidityItems(timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
        var list = temperatureHumidityItems
        if list.count > 0 {
            if selectedIndex == 0 {
                let item = self.setupCustomAnalyticsList(itemName: "Temperature", itemDescription: "Temperature and time", timespan: timespan, tableBasisOnTabAndIndex: "aht20_t")
                list[selectedIndex] = item
            } else if selectedIndex == 1 {
                let item = self.setupCustomAnalyticsList(itemName: "Humidity", itemDescription: "Humidity and time", timespan: timespan, tableBasisOnTabAndIndex: "aht20_h")
                list[selectedIndex] = item
            }
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
                        AnalyticsBackButton(viewAnalytics: $viewAnalytics)
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
                                AnalyticsCellView(selectedOptions: self.termalCameraTimeSpam[index], segmentationSelection: segmentationSelection, item: item, circleIndex: index, action: { selectedOption in
                                    
                                    self.termalCameraTimeSpam[index] = selectedOption
                                    GraphCirclePositionManager.shared.termalCameraCirclePositions[index] = item.graphLineParam.count - 1
                                    thermalCameraItems = updateThermalCameraItems(timespan: self.termalCameraTimeSpam[index], selectedIndex: index)
                                })
                            }
                        } else if (segmentationSelection == .spectralAnalysis) {
                            ForEach(Array(spectralAnalysisItems.enumerated()), id: \.element) { index, item in
                                AnalyticsCellView(selectedOptions: self.spectralAnalysisTimeSpam[index], segmentationSelection: segmentationSelection, item: item, circleIndex: index, action: { selectedOption in

                                    self.spectralAnalysisTimeSpam[index] = selectedOption
                                    GraphCirclePositionManager.shared.spectralAnalysisCirclePositions[index] = item.graphLineParam.count - 1
                                    spectralAnalysisItems = updateSpectralAnalysisItems(timespan: self.spectralAnalysisTimeSpam[index], selectedIndex: index)
                                })
                            }
                        } else if (segmentationSelection == .smoke) {
                            ForEach(Array(smokeItems.enumerated()), id: \.element) { index, item in
                                AnalyticsCellView(selectedOptions: self.smokeTimeSpam[index], segmentationSelection: segmentationSelection, item: item, circleIndex: index, action: { selectedOption in

                                    self.smokeTimeSpam[index] = selectedOption
                                    GraphCirclePositionManager.shared.smokeCirclePositions[index] = item.graphLineParam.count - 1
                                    smokeItems = updateSmokeItems(timespan: self.smokeTimeSpam[index], selectedIndex: index)
                                })
                            }
                        } else if (segmentationSelection == .temperatureHumidity) {
                            ForEach(Array(temperatureHumidityItems.enumerated()), id: \.element) { index, item in
                                AnalyticsCellView(selectedOptions: self.temperatureHumidityTimeSpam[index], segmentationSelection: segmentationSelection, item: item, circleIndex: index, action: { selectedOption in
                                    
                                    self.temperatureHumidityTimeSpam[index] = selectedOption
                                    GraphCirclePositionManager.shared.temperatureHumidityCirclePositions[index] = item.graphLineParam.count - 1
                                    temperatureHumidityItems = updateTemperatureHumidityItems(timespan: self.temperatureHumidityTimeSpam[index], selectedIndex: index)
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
            .onReceive(NotificationCenter.default.publisher(for: NSNotification.updatedData)) { obj in
                if !GraphCirclePositionManager.shared.isMoveCircle {
                    updateGraphData()
                }
            }
        }
    }
    
    func loadGraphData() {

        thermalCameraItems = getThermalCameraItems(timespan: timespanSelection)
        spectralAnalysisItems = getSpectralAnalysisItems(timespan: timespanSelection)
        smokeItems = getSmokeItems(timespan: timespanSelection)
        temperatureHumidityItems = getTemperatureHumidityItems(timespan: timespanSelection)
    }
    
    func updateGraphData() {
        
        for (index, termalCameraTime) in termalCameraTimeSpam.enumerated() {
            thermalCameraItems = updateThermalCameraItems(timespan: termalCameraTime, selectedIndex: index)
        }

        for (index, spectralAnalysisTime) in spectralAnalysisTimeSpam.enumerated() {
            spectralAnalysisItems = updateSpectralAnalysisItems(timespan: spectralAnalysisTime, selectedIndex: index)
        }
        
        for (index, smokeTime) in smokeTimeSpam.enumerated() {
            smokeItems = updateSmokeItems(timespan: smokeTime, selectedIndex: index)
        }
        
        for (index, temperatureHumidityTime) in temperatureHumidityTimeSpam.enumerated() {
            temperatureHumidityItems = updateTemperatureHumidityItems(timespan: temperatureHumidityTime, selectedIndex: index)
        }
    }
}

//#Preview {
//    AnalyticsSwiftUIView(, viewAnalytics: <#Binding<Bool>#>)
//}
