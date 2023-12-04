//
//  PropertyView.swift
//  TorchUI
//
//  Created by Parth Saxena on 6/28/23.
//

import Foundation
import SwiftUI
import SwiftUI_Shimmer

struct PropertyView: View, Equatable {
    
    static func == (lhs: PropertyView, rhs: PropertyView) -> Bool {
        
        let lhs_property = lhs.property
        let rhs_property = rhs.property
        
        if (lhs_property.id != rhs_property.id) {
            return false
        }
        
        if (lhs_property.threat != rhs_property.threat) {
            return false
        }
        
        if (lhs_property.propertyDescription != rhs_property.propertyDescription) {
            return false
        }
        
        if (lhs_property.detectors.count != rhs_property.detectors.count) {
            return false
        }
        
        for lhs_detector in lhs_property.detectors {
            for rhs_detector in rhs_property.detectors {
                if lhs_detector.id == rhs_detector.id {
                    if (lhs_detector.threat != rhs_detector.threat) {
                        return false
                    }
                }
            }
        }
        return true
    }
    
    var colorScheme = ColorScheme.light
    var property: Property
    var loading = false
    
    var body: some View {
        let x = print("Property loading: \(self.property.loadingData)")
        
        HStack {
            if loading {
                Rectangle()
                    .foregroundColor(CustomColors.LightGray)
                    .frame(width: 60, height: 60)
                    .cornerRadius(12)
                    .shimmering()
            } else {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 60, height: 60)
                    .background(
                        AsyncImage(url: URL(string: property.propertyImage)) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                    )
                    .cornerRadius(12)
            }
            
            Spacer()
                .frame(width: 15)
            // Red yellow image
            if let fireImageRed = UIImage(named: "FireRed")?.cgImage, let imageOrientation = UIImage(named: "FireRed")?.imageOrientation {
                let uiImageRed = UIImage(cgImage: (fireImageRed), scale: 4.2, orientation: imageOrientation)
                let imageFireRed = Image(uiImage: uiImageRed)
                VStack(alignment: .leading, spacing: 2) {
                    if loading {
                        Text("Loading")
                            .font(Font.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color(red: 0.27, green: 0.32, blue: 0.33))
                            .redacted(reason: .placeholder)
                            .shimmering()
                    } else if property.threat == Threat.Red {
                        Text("\(property.propertyName)   \(imageFireRed)")
                            .font(Font.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color(red: 0.27, green: 0.32, blue: 0.33))
                    } else {
                        Text("\(property.propertyName)")
                            .font(Font.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color(red: 0.27, green: 0.32, blue: 0.33))
                    }
                    
                    if loading {
                        Text("All sensors are normal")
                            .font(Font.custom("Manrope-Medium", size: 14))
                            .foregroundColor(Color(red: 0.56, green: 0.63, blue: 0.64))
                            .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .topLeading)
                            .redacted(reason: .placeholder)
                            .shimmering()
                    } else {
                        if (property.detectors.count > 0) {
                            Text(property.propertyDescription)
                                .font(Font.custom("Manrope-Medium", size: 14))
                                .foregroundColor(Color(red: 0.56, green: 0.63, blue: 0.64))
                                .frame(maxWidth: .infinity, minHeight: 20, maxHeight: 20, alignment: .topLeading)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            Spacer()
            
            let sensorSpacing = 4.0
            let sensorSize = 14.0
            
            if !loading {
                if self.property.loadingData {
                    ProgressView()
                } else {
                    VStack(spacing: sensorSpacing) {
                        // row 1
                        HStack(spacing: sensorSpacing) {
                            ForEach(0..<5, id: \.self) { i in
                                if i < property.detectors.count {
                                    if property.detectors[i].threat == Threat.Red {
                                        Circle().fill(CustomColors.TorchRed).frame(width: 14, height: 14)
                                    } else if property.detectors[i].threat == Threat.Yellow {
                                        Circle().fill(CustomColors.WarningYellow).frame(width: 14, height: 14)
                                    } else {
                                        Circle().fill(colorScheme == .dark ? Color(red: 44/255,green: 47/255, blue: 51/255) : CustomColors.NormalSensorGray).frame(width: 14, height: 14)
                                    }
                                } else {
                                    Circle().fill(Color.clear).frame(width: 14, height: 14)
                                }
                            }
                            Spacer()
                        }
                        .environment(\.layoutDirection, .rightToLeft)
                        
                        // row 2
                        HStack(spacing: sensorSpacing) {
                            ForEach(5..<10, id: \.self) { i in
                                if i < property.detectors.count {
                                    if property.detectors[i].threat == Threat.Red {
                                        Circle().fill(CustomColors.TorchRed).frame(width: 14, height: 14)
                                    } else if property.detectors[i].threat == Threat.Yellow {
                                        Circle().fill(CustomColors.WarningYellow).frame(width: 14, height: 14)
                                    } else {
                                        Circle().fill(colorScheme == .dark ? Color(red: 44/255,green: 47/255, blue: 51/255) : CustomColors.NormalSensorGray).frame(width: 14, height: 14)
                                    }
                                } else {
                                    Circle().fill(Color.clear).frame(width: 14, height: 14)
                                }
                            }
                            Spacer()
                        }
                        .environment(\.layoutDirection, .rightToLeft)
                        
                        // row 3
                        HStack(spacing: sensorSpacing) {
                            ForEach(10..<15, id: \.self) { i in
                                if i < property.detectors.count {
                                    if property.detectors[i].threat == Threat.Red {
                                        Circle().fill(CustomColors.TorchRed).frame(width: 14, height: 14)
                                    } else if property.detectors[i].threat == Threat.Yellow {
                                        Circle().fill(CustomColors.WarningYellow).frame(width: 14, height: 14)
                                    } else {
                                        Circle().fill(colorScheme == .dark ? Color(red: 44/255,green: 47/255, blue: 51/255) : CustomColors.NormalSensorGray).frame(width: 14, height: 14)
                                    }
                                } else {
                                    Circle().fill(Color.clear).frame(width: 14, height: 14)
                                }
                            }
                            Spacer()
                        }
                        .environment(\.layoutDirection, .rightToLeft)
                    }
                    .frame(maxWidth: sensorSize * 5 + 4 * sensorSpacing)
                    .padding(.trailing, 10)
                }
            }
        }
        .onAppear {
            print(">>>>>>>latitude\(property.coordinate?.latitude ?? 0)")
            print(">>>>>>>longitude\(property.coordinate?.longitude ?? 0)")
        }
    }
    
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        if let selectedProperty = SessionManager.shared.selectedProperty {
            PropertyView(property: selectedProperty)
        }
    }
}
