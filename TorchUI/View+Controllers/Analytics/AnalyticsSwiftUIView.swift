//
//  AnalyticsSwiftUIView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 22/12/2023.
//

import SwiftUI

struct AnalyticsSwiftUIView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.colorScheme) var colorScheme
    @State var segmentationSelection : AnalyticsTypeSelection = .thermalCameras
    @State var timespanSelection: AnalyticsTimespanSelection = .oneHour
    
    @State private var thermalCameraItems: [Item] = []
    @State private var spectralAnalysisItems: [Item] = []
    @State private var smokeItems: [Item] = []
    @State private var temperatureHumidityItems: [Item] = []
    @Binding var viewAnalytics: Bool
    @State private var isForeground: Bool = true
    
    @State private var termalCameraTimeSpam: [AnalyticsTimespanSelection] = [.oneHour , .oneHour, .oneHour]
    @State private var spectralAnalysisTimeSpam: [AnalyticsTimespanSelection] = [.oneHour , .oneHour, .oneHour]
    @State private var smokeTimeSpam: [AnalyticsTimespanSelection] = [.oneHour , .oneHour, .oneHour]
    @State private var temperatureHumidityTimeSpam: [AnalyticsTimespanSelection] = [.oneHour , .oneHour]
    
    func getThermalCameraItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        
        var list: [Item] = []
        let propertyIndex = SessionManager.shared.selectedPropertyIndex
        let detectorIndex = SessionManager.shared.selectedDetectorIndex
        let id = SessionManager.shared.properties[propertyIndex].detectors[detectorIndex].id
        let description = "Temperature and time"
        
        let lineChartParameter = SessionManager.shared.deviceAnalytics[id]?[timespan.stringSpan]?["ir1_tmax"]
        let item = Item(itemName: "Camera 1", itemDescription: description, selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter ?? [])
        list.append(item)
        
        if (lineChartParameter?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append((lineChartParameter?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append(0)
        }
        
        let lineChartParameter1 = SessionManager.shared.deviceAnalytics[id]?[timespan.stringSpan]?["ir2_tmax"]
        let item1 = Item(itemName: "Camera 2", itemDescription: description, selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter1 ?? [])
        list.append(item1)

        if (lineChartParameter1?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append((lineChartParameter1?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append(0)
        }
        
        let lineChartParameter2 = SessionManager.shared.deviceAnalytics[id]?[timespan.stringSpan]?["ir3_tmax"]
        let item3 = Item(itemName: "Camera 3", itemDescription: description, selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter2 ?? [])
        list.append(item3)
        if (lineChartParameter2?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append((lineChartParameter2?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append(0)
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
        let lineChart1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["rgb1_pix_abvthl"]
            let item = Item(itemName: "Camera 1", itemDescription: "Pixels above threshold",
                            selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart1 ?? [])
            list.append(item)
        
        if (lineChart1?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.spectralAnalysisCirclePositions.append((lineChart1?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.spectralAnalysisCirclePositions.append(0)
        }
        
        let lineChart2 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["rgb2_pix_abvthl"]
        let item2 = Item(itemName: "Camera 2", itemDescription: "Pixels above threshold",
                             selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart2 ?? [])
        list.append(item2)
        if (lineChart2?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.spectralAnalysisCirclePositions.append((lineChart2?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.spectralAnalysisCirclePositions.append(0)
        }
        
        let lineChart3 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["rgb3_pix_abvthl"]
        let item3 = Item(itemName: "Camera 3", itemDescription: "Pixels above threshold",
                             selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart3 ?? [])
        list.append(item3)
        if (lineChart3?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.spectralAnalysisCirclePositions.append((lineChart3?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.spectralAnalysisCirclePositions.append(0)
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
        let lineChart1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["tgs5141_co"]
        let item = Item(itemName: "CO", itemDescription: "Value per time", selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart1 ?? [])
        list.append(item)
        
        if (lineChart1?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.smokeCirclePositions.append((lineChart1?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.smokeCirclePositions.append(0)
        }
        
        let lineChart2 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["scd41_co2"]
        let item2 = Item(itemName: "CO2", itemDescription: "Value per time",
                         selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart2 ?? [])
        list.append(item2)
        
        if (lineChart2?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.smokeCirclePositions.append((lineChart2?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.smokeCirclePositions.append(0)
        }
        
        let lineChart3 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["sgp40_raw"]
        let item3 = Item(itemName: "VOC", itemDescription: "Value per time",
                             selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChart3 ?? [])
        list.append(item3)

        if (lineChart3?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.smokeCirclePositions.append((lineChart3?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.smokeCirclePositions.append(0)
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
        
        let lintChart = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["aht20_t"]
        let item = Item(itemName: "Temperature", itemDescription: "Temperature and time",
                        selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lintChart ?? [])
        list.append(item)
        
        if (lintChart?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.temperatureHumidityCirclePositions.append((lintChart?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.temperatureHumidityCirclePositions.append(0)
        }
        
        let lintChart1 = SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]?[timespan.stringSpan]?["aht20_h"]
        let item1 = Item(itemName: "Humidity", itemDescription: "Humidity and time",
                         selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lintChart1 ?? [])
        list.append(item1)
        
        if (lintChart1?.count ?? 0) > 0 {
            GraphCirclePositionManager.shared.temperatureHumidityCirclePositions.append((lintChart1?.count ?? 0) - 1)
        } else {
            GraphCirclePositionManager.shared.temperatureHumidityCirclePositions.append(0)
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
        GeometryReader { geometry in
            let propertyIndex = SessionManager.shared.selectedPropertyIndex
            let detectorIndex = SessionManager.shared.selectedDetectorIndex
            let analyticsId = SessionManager.shared.properties[propertyIndex].detectors[detectorIndex].id
            if (SessionManager.shared.deviceAnalytics.keys.contains(analyticsId)) {
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
                        ScrollView(showsIndicators: false) {
                            if (segmentationSelection == .thermalCameras) {
                                ForEach(Array(thermalCameraItems.enumerated()), id: \.element) { index, item in
                                    AnalyticsCellView(selectedOptions: self.termalCameraTimeSpam[index], segmentationSelection: segmentationSelection, item: item, circleIndex: index, action: { selectedOption in
                                        
                                        self.termalCameraTimeSpam[index] = selectedOption
                                        thermalCameraItems = updateThermalCameraItems(timespan: self.termalCameraTimeSpam[index], selectedIndex: index)
                                        print("graph length: \(item.graphLineParam.count - 1)")
                                        GraphCirclePositionManager.shared.termalCameraCirclePositions[index] = thermalCameraItems[index].graphLineParam.count - 1 // item.graphLineParam.count - 1
                                    })
                                }
                            } else if (segmentationSelection == .spectralAnalysis) {
                                ForEach(Array(spectralAnalysisItems.enumerated()), id: \.element) { index, item in
                                    AnalyticsCellView(selectedOptions: self.spectralAnalysisTimeSpam[index], segmentationSelection: segmentationSelection, item: item, circleIndex: index, action: { selectedOption in
                                        
                                        self.spectralAnalysisTimeSpam[index] = selectedOption
                                        spectralAnalysisItems = updateSpectralAnalysisItems(timespan: self.spectralAnalysisTimeSpam[index], selectedIndex: index)
                                        GraphCirclePositionManager.shared.spectralAnalysisCirclePositions[index] = spectralAnalysisItems[index].graphLineParam.count - 1
                                    })
                                }
                            } else if (segmentationSelection == .smoke) {
                                ForEach(Array(smokeItems.enumerated()), id: \.element) { index, item in
                                    AnalyticsCellView(selectedOptions: self.smokeTimeSpam[index], segmentationSelection: segmentationSelection, item: item, circleIndex: index, action: { selectedOption in
                                        
                                        self.smokeTimeSpam[index] = selectedOption
                                        smokeItems = updateSmokeItems(timespan: self.smokeTimeSpam[index], selectedIndex: index)
                                        GraphCirclePositionManager.shared.smokeCirclePositions[index] = smokeItems[index].graphLineParam.count - 1
                                    })
                                }
                            } else if (segmentationSelection == .temperatureHumidity) {
                                ForEach(Array(temperatureHumidityItems.enumerated()), id: \.element) { index, item in
                                    AnalyticsCellView(selectedOptions: self.temperatureHumidityTimeSpam[index], segmentationSelection: segmentationSelection, item: item, circleIndex: index, action: { selectedOption in
                                        
                                        self.temperatureHumidityTimeSpam[index] = selectedOption
                                        temperatureHumidityItems = updateTemperatureHumidityItems(timespan: self.temperatureHumidityTimeSpam[index], selectedIndex: index)
                                        GraphCirclePositionManager.shared.temperatureHumidityCirclePositions[index] = temperatureHumidityItems[index].graphLineParam.count - 1
                                    })
                                }
                            }
                        }
                        .padding([.top, .leading, .trailing])
                        .background(Color.gray.opacity(0.15))
                        .onChange(of: scenePhase) { newPhase in
                            switch newPhase {
                            case .active:
                                isForeground = true
                            case .inactive:
                                print("App is inactive")
                            case .background:
                                isForeground = false
                            @unknown default:
                                print("Unknown state")
                            }
                        }
                    }
                    .padding(.top, -8)
                    Spacer()
                }
                .background(colorScheme == .dark ? CustomColors.DarkModeBackground : Color.white)
                .onAppear {
                    setupWidth(width: geometry.size.width)
                    loadGraphData()
                }
                .onReceive(NotificationCenter.default.publisher(for: NSNotification.updatedData)) { obj in
                    if !GraphCirclePositionManager.shared.isMoveCircle, isForeground {
                        updateGraphData()
                    }
                }
                .navigationBarHidden(true)
                .navigationBarTitle("")
            }
        }
    }
    
    func setupWidth(width: Double) {
        GraphCirclePositionManager.shared.graphViewWidth = width
    }
    
    func loadGraphData() {
        
        GraphCirclePositionManager.shared.termalCameraCirclePositions = []
        GraphCirclePositionManager.shared.spectralAnalysisCirclePositions = []
        GraphCirclePositionManager.shared.smokeCirclePositions = []
        GraphCirclePositionManager.shared.temperatureHumidityCirclePositions = []
        
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
