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
    
    func getThermalCameraItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        return [
            Item(itemName: "Camera 1", itemDescription: "Temperature and time",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["ir1_tmax"]!),
            Item(itemName: "Camera 2", itemDescription: "Temperature and time",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["ir2_tmax"]!),
            Item(itemName: "Camera 3", itemDescription: "Temperature and time",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["ir3_tmax"]!),
        ]
    }
    
    func getSpectralAnalysisItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        return [
            Item(itemName: "Camera 1", itemDescription: "Pixels above threshold",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["rgb1_pix_abvthl"]!),
            Item(itemName: "Camera 2", itemDescription: "Pixels above threshold",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["rgb2_pix_abvthl"]!),
            Item(itemName: "Camera 3", itemDescription: "Pixels above threshold",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["rgb3_pix_abvthl"]!),
        ]
    }
    
    func getSmokeItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        return [
            Item(itemName: "CO", itemDescription: "Value per time",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["tgs5141_co"]!),
            Item(itemName: "CO2", itemDescription: "Value per time",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["scd41_co2"]!),
            Item(itemName: "VOC", itemDescription: "Value per time",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["sgp40_raw"]!),
        ]
    }
    
    func getTemperatureHumidityItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        return [
            Item(itemName: "Temperature", itemDescription: "Temperature and time",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["aht20_t"]!),
            Item(itemName: "Humidity", itemDescription: "Humidity and time",
                 lineChartParameters: SessionManager.shared.deviceAnalytics[SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id]![timespan.stringSpan]!["aht20_h"]!)
        ]
    }
    
    var body: some View {
        if (SessionManager.shared.deviceAnalytics.keys.contains(SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].detectors[SessionManager.shared.selectedDetectorIndex].id)) {
            
            var thermalCameraItems: [Item] = getThermalCameraItems(timespan: timespanSelection)
            
            var spectralAnalysisItems: [Item] = getSpectralAnalysisItems(timespan: timespanSelection)
            
            var smokeItems: [Item] = getSmokeItems(timespan: timespanSelection)
            
            var temperatureHumidityItems: [Item] = getTemperatureHumidityItems(timespan: timespanSelection)
            
            VStack {
                ZStack {
                    HStack {
                        AccountBackButton()
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
                            ForEach(thermalCameraItems) { item in
                                AnalyticsCellView(item: item, action: {
                                    print("dropdown clicked")
                                })
                            }
                        } else if (segmentationSelection == .spectralAnalysis) {
                            ForEach(spectralAnalysisItems) { item in
                                AnalyticsCellView(item: item, action: {
                                    print("dropdown clicked")
                                })
                            }
                        } else if (segmentationSelection == .smoke) {
                            ForEach(smokeItems) { item in
                                AnalyticsCellView(item: item, action: {
                                    print("dropdown clicked")
                                })
                            }
                        } else if (segmentationSelection == .temperatureHumidity) {
                            ForEach(temperatureHumidityItems) { item in
                                AnalyticsCellView(item: item, action: {
                                    print("dropdown clicked")
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
        }
    }
}

#Preview {
    AnalyticsSwiftUIView()
}
