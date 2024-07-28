//
//  AddNewSensor.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 21/07/2024.
//

import SwiftUI
import CodeScanner

struct AddNewSensor: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var sensorIdNumber: String
    @Binding var addSensorViewState: AddSensorViewState
    var onCrossButtonTap: () -> Void
    
    @State var fieldTextColor: Color = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0) // place holder text color
    @State var nextButtonColor: Color = Color(red: 0.78, green: 0.81, blue: 0.82) // disabled button color
    @State var nextButtonEnabled: Bool = false
    @State var isPresentingScanner: Bool = false
    
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.sensorIdNumber
        }, set: {
            self.sensorIdNumber = $0

            if $0 != "Sensor ID name" {
                fieldTextColor = colorScheme == .dark ? Color.white : CustomColors.TorchGreen
            } else {
                fieldTextColor = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)
            }
            
            if !self.sensorIdNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                nextButtonEnabled = true
                nextButtonColor = Color(red: 0.18, green: 0.21, blue: 0.22)
            } else {
                nextButtonEnabled = false
                nextButtonColor = Color(red: 0.78, green: 0.81, blue: 0.82)
            }
        })
        
        VStack {
            HStack(spacing: 4.0) {
                let progressItemWidth = (UIScreen.main.bounds.width - 50) / 3
                
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width: progressItemWidth, height: 4)
                    .foregroundColor(CustomColors.TorchGreen)
                
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width: progressItemWidth, height: 4)
                    .foregroundColor(Color(red: 227/255, green: 231/255, blue: 232/255))
                
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width: progressItemWidth, height: 4)
                    .foregroundColor(Color(red: 227/255, green: 231/255, blue: 232/255))
            }
            .padding(.top, 10)
            
            // Heading
            ZStack {
                HStack {
                    Circle()
                        .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                        .frame(width: 40, height: 40)
                        .padding()
                        .overlay(
                            Image("home-cross")
                                .background(.white)
                        )
                        .background(.clear)
                        .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 5)
                        .onTapGesture {
                            onCrossButtonTap()
                        }
                        .opacity(0.0)
                    Spacer()
                    VStack {
                        Text("Add new sensor")
                            .font(Font.custom("Manrope-SemiBold", size: 18.0))
                            .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                        Text("Step 1: Sensor ID number")
                            .font(Font.custom("Manrope-Regular", size: 16))
                            .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                    }
                    Spacer()
                    Circle()
                        .stroke(CustomColors.lightGrayBorder, lineWidth: 1)
                        .frame(width: 40, height: 40)
                        .padding()
                        .overlay(
                            Image("home-cross")
                                .background(.white)
                        )
                        .background(.clear)
                        .shadow(color: Color.black.opacity(0.1), radius: 20, x: 0, y: 5)
                        .onTapGesture {
                            onCrossButtonTap()
                        }
                }
            }
            .padding(.top, 10)
            .padding(.leading, 15)
            
            Spacer()
            
            HStack {
                Spacer()
                VStack {
                    TextField("Sensor ID name", text: binding)
                        .font(Font.custom("Manrope-SemiBold", size: 30))
                        .minimumScaleFactor(0.7)
                        .foregroundColor(fieldTextColor)
                        .multilineTextAlignment(.center)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled()
                        .focused($focusedField, equals: .field)
                        .onAppear {
//                            self.focusedField = .field
                        }
                    
                    Text("Enter the sensor id number or scan with the camera")
                        .font(Font.custom("Manrope-Medium", size: 16.0))
                        .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                        .padding(.top, 5.0)
                    Button(action: {
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                        withAnimation {
                            isPresentingScanner = true
                        }
                    }) {
                        HStack {
                            Image("qrCode")
                                .frame(width: 20, height: 20)
//                                .padding(.trailing, 10)
                            Text("Scan QR code")
                                .font(.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(colorScheme == .dark ? CustomColors.TorchGreen : .white)
                        }
                        .frame(width: 170, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 250)
                                .foregroundColor(CustomColors.TorchRed)
                        )
                    }
                    .padding(.top, 10)
                }
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    addSensorViewState = .addSensorProperty
                    
                }) {
                    Text("Next")
                    .font(.custom("Manrope-SemiBold", size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .foregroundColor(colorScheme == .dark ? CustomColors.TorchGreen : .white)
                    .background(
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(self.nextButtonColor)
                    )
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                }
                .disabled(!nextButtonEnabled)
                Spacer()
            }
            .padding(.top, 60)
        }
        .background(colorScheme == .dark ? CustomColors.DarkModeBackground : Color.white)
        .onAppear {

            if self.sensorIdNumber != "Sensor ID name" {
                fieldTextColor = colorScheme == .dark ? Color.white : CustomColors.TorchGreen
            } else {
                fieldTextColor = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)
            }
            
            if !self.sensorIdNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                nextButtonEnabled = true
                nextButtonColor = Color(red: 0.18, green: 0.21, blue: 0.22)
            } else {
                nextButtonEnabled = false
                nextButtonColor = Color(red: 0.78, green: 0.81, blue: 0.82)
            }
        }
        .sheet(isPresented: $isPresentingScanner) {
            VStack {
                HStack {
                    Spacer()
                    Text("Scan the QR code on your Torch device")
                        .font(Font.custom("Manrope-Medium", fixedSize: 20))
                        .foregroundColor(CustomColors.TorchGreen)
                        .padding(.top, 20)
                    Spacer()
                }
                
                CodeScannerView(codeTypes: [.qr], showViewfinder: true) { response in
                    if case let .success(result) = response {
                        
//                        let impactMed = UIImpactFeedbackGenerator(style: .heavy)
//                        impactMed.impactOccurred()
//                        isPresentingScanner = false
//                        shouldHideOnPositionSelection = true
//                        let index = SessionManager.shared.selectedPropertyIndex
//                        let properties = SessionManager.shared.properties
//                        let isAlreadyAdded = properties[index].detectors.contains(where: { $0.id == result.string })
//                        if isAlreadyAdded {
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                                shouldHideOnPositionSelection = false
//                                showingAlert = true
//                            }
//                            return
//                        }
//                        // create detector model
//                        var detector = Detector(id: result.string, deviceName: String((SessionManager.shared.properties[index].detectors.count) + 1), deviceBattery: 0.0, coordinate: nil, selected: true, sensorIdx: SessionManager.shared.properties[index].detectors.count + 1)
//                        detector.isNewlyInstalled = true
//                        self.newDetector = detector
//                        self.newDetectorIndex = SessionManager.shared.properties[index].detectors.count
//                        needsLocationPin = true
//                        // manually appending since selected==False already for all other detectors
//                        SessionManager.shared.properties[index].detectors.append(detector)
//                        SessionManager.shared.selectedDetectorIndex = SessionManager.shared.properties[index].detectors.count - 1
//                        sessionManager.selectedProperty?.detectors.append(detector)
                    }
                }
                .ignoresSafeArea(.container)
            }
        }
    }
}

//#Preview {
//    AddNewSensor()
//}
