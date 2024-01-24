//
//  NickNameUIView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 24/01/2024.
//

import SwiftUI

struct NickNameUIView: View {
    
    @Environment(\.colorScheme) var colorScheme
        
    @Binding var name: String
    
    // place holder text color
    @State var fieldTextColor: Color = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)
    
    // disabled button color
    @State var nextButtonColor: Color = Color(red: 0.78, green: 0.81, blue: 0.82)
    @State var nextButtonEnabled: Bool = false

    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.name
        }, set: {
            self.name = $0
            
            // update textfield color
            if $0 != "Enter your name" {
                fieldTextColor = colorScheme == .dark ? Color.white : CustomColors.TorchGreen
            } else {
                fieldTextColor = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)
            }
            
            if !self.name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                // enabled button color
                nextButtonEnabled = true
                nextButtonColor = Color(red: 0.18, green: 0.21, blue: 0.22)
            } else {
                // disabled button color
                nextButtonEnabled = false
                nextButtonColor = Color(red: 0.78, green: 0.81, blue: 0.82)
            }
        })
        
        VStack {
            // Heading
            ZStack {
                
                HStack {
                    Button(action: {
                        // Handle button action here
                    }) {
                        Image(systemName: "")
                            .foregroundColor(.red)
                            .font(.system(size: 24))
                            .padding(10)
                            .background(.clear)
                            .clipShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
                    Spacer()
                    Text("Give your sensor a nickname")
                        .font(Font.custom("Manrope-SemiBold", size: 18.0))
                        .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                    Spacer()
                    Button(action: {
                        // Handle button action here
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .font(.system(size: 24))
                            .padding(10)
                            .background(.clear)
                            .clipShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.top, 10)
            .padding(.horizontal, 15)
            
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
                        .onAppear {
                            self.focusedField = .field
                        }
                    
                    Text("Name your Torch Sensor to easily search for it later. E.g. 'North 1' or 'Barn 2'")
                        .font(Font.custom("Manrope-Medium", size: 16.0))
                        .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                        .padding(.top, 5.0)
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
//                        AuthenticationManager.shared.authState = .accountEmail
                    }
                }) {
                    Text("Done")
                    .font(.custom("Manrope-SemiBold", size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .foregroundColor(colorScheme == .dark ? CustomColors.TorchGreen : .white)
                    .background(
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(self.nextButtonColor)
                    )
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
                }
                .disabled(!nextButtonEnabled)
            }
            .padding(.top, 60)
            HStack {
                Spacer()
                
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    withAnimation {
//                        AuthenticationManager.shared.authState = .accountEmail
                    }
                }) {
                    Text("Skip")
                    .font(.custom("Manrope-SemiBold", size: 16))
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .foregroundColor(colorScheme == .dark ? .gray : .white)
                    .background(
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(.clear)
                    )
                    .padding(.horizontal, 16)
                    .padding(.bottom, 20)
                }
            }
        }
        .background(colorScheme == .dark ? CustomColors.DarkModeBackground : Color.white)
    }
}

struct NickNameUIView_Previews: PreviewProvider {
    
    @State static var name = ""
    
    static var previews: some View {
        NickNameUIView(name: $name)
    }
}
