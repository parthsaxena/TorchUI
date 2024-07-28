//
//  AddSensorNickname.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 22/07/2024.
//

import SwiftUI

struct AddSensorNickname: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @Binding var nickName: String
    @Binding var addSensorViewState: AddSensorViewState
    var onCrossButtonTap: () -> Void
    
    @State var fieldTextColor: Color = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0) // place holder text color
    @State var nextButtonColor: Color = Color(red: 0.78, green: 0.81, blue: 0.82) // disabled button color
    @State var nextButtonEnabled: Bool = false

    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.nickName
        }, set: {
            self.nickName = $0
            
            // update textfield color
            if $0 != "Enter nickname" {
                fieldTextColor = colorScheme == .dark ? Color.white : CustomColors.TorchGreen
            } else {
                fieldTextColor = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)
            }
            
            if !self.nickName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
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
                    .foregroundColor(CustomColors.TorchGreen)
                
                RoundedRectangle(cornerRadius: 5.0)
                    .frame(width: progressItemWidth, height: 4)
                    .foregroundColor(CustomColors.TorchGreen)
            }
            .padding(.top, 10)
            
            // Heading
            ZStack {
                HStack {
                    CustomRoundButton(imageName: "backButtonIcon", onCustomButtonTap: {
                        addSensorViewState = .addSensorProperty
                    })
                    Spacer()
                    VStack {
                        Text("Add new sensor")
                            .font(Font.custom("Manrope-SemiBold", size: 18.0))
                            .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                        Text("Step 3: Enter nickname")
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
                    TextField("Enter nickname", text: binding)
                        .font(Font.custom("Manrope-SemiBold", size: 30))
                        .minimumScaleFactor(0.7)
                        .foregroundColor(fieldTextColor)
                        .multilineTextAlignment(.center)
                        .textInputAutocapitalization(.words)
                        .autocorrectionDisabled()
                        .focused($focusedField, equals: .field)
                    Text("Name your Torch Sensor to easily search for it later. E.g. 'North 1' or 'Barn 2'")
                        .font(Font.custom("Manrope-Medium", size: 16.0))
                        .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                        .padding(.top, 5.0)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    withAnimation {
                        dismiss()
                        addSensorViewState = .addSensorName
                    }
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
                }
                .disabled(!nextButtonEnabled)
                Spacer()
            }
            .padding(.top, 60)
            HStack {
                Spacer()
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    withAnimation {
                       
                    }
                }) {
                    Text("Skip")
                    .font(.custom("Manrope-SemiBold", size: 16))
                    .frame(height: 50)
                    .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                    .padding(.horizontal)
                }
                Spacer()
            }
        }
        .background(colorScheme == .dark ? CustomColors.DarkModeBackground : Color.white)
    }
}

//#Preview {
//    AddSensorNickname()
//}
