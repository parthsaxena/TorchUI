//
//  AnalyticsDataManager.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 23/04/2024.
//

import Foundation


class AnalyticsDataManager {
    
    static var shared = AnalyticsDataManager()
    
    func getThermalCameraItems(timespan: AnalyticsTimespanSelection) -> [Item] {
        
        var list: [Item] = []
        let propertyIndex = SessionManager.shared.selectedPropertyIndex
        let detectorIndex = SessionManager.shared.selectedDetectorIndex
        let id = SessionManager.shared.properties[propertyIndex].detectors[detectorIndex].id
        let description = "Temperature and time"
        
        if let lineChartParameter = SessionManager.shared.deviceAnalytics[id]?[timespan.stringSpan]?["ir1_tmax"] {
            let item = Item(itemName: "Camera 1", itemDescription: description, selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter)
            list.append(item)
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append(lineChartParameter.count - 1)
        }
        
        if let lineChartParameter1 = SessionManager.shared.deviceAnalytics[id]?[timespan.stringSpan]?["ir2_tmax"] {
            let item = Item(itemName: "Camera 2", itemDescription: description, selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter1)
            list.append(item)
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append(lineChartParameter1.count - 1)
        }
        
        if let lineChartParameter2 = SessionManager.shared.deviceAnalytics[id]?[timespan.stringSpan]?["ir3_tmax"] {
            let item = Item(itemName: "Camera 3", itemDescription: description, selectedTimeSpan: timespan.stringTimeSpan, graphLineParam: lineChartParameter2)
            list.append(item)
            GraphCirclePositionManager.shared.termalCameraCirclePositions.append(lineChartParameter2.count - 1)
        }
        return list
    }
    
    func updateThermalCameraItems(thermalCameraItems: [Item], timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
        
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
    
    func updateSpectralAnalysisItems(spectralAnalysisItems: [Item],timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
        
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
    
    func updateSmokeItems(smokeItems: [Item], timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
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
    
    func updateTemperatureHumidityItems(temperatureHumidityItems: [Item], timespan: AnalyticsTimespanSelection, selectedIndex: Int) -> [Item] {
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
}
