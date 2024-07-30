//
//  AddNewPropertyPhoto.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 29/07/2024.
//

import SwiftUI

struct AddNewPropertyPhoto: View {
    
    @Environment(\.colorScheme) var colorScheme

    @Binding var addPropertyViewState: AddPropertyViewState
    
    @State var selectedIndex: Int
    var onCrossButtonTap: () -> Void
    var onPhotoTypeViewTap: (_ index: Int) -> Void
    
    @State var fieldTextColor: Color = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)
    @State var nextButtonColor: Color = Color(red: 0.18, green: 0.21, blue: 0.22)
    @State var nextButtonEnabled: Bool = true
    
    @State private var image = UIImage(named: "AddPropertyPhotoIcon")
    @State private var shouldPresentImagePicker = false
    @State private var shouldPresentActionSheet = false
    @State private var shouldPresentCamera = false
    @State private var shouldShowSelectedImage = false
    @State private var didSelectCustomImage = false
    @State private var googleMapsImageSelected: Bool =  false //SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyImage.starts(with: "http")
    
    var body: some View {
        
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
                        Text("Add new property")
                            .font(Font.custom("Manrope-SemiBold", size: 18.0))
                            .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                        Text("Step 2: Address")
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
                    ZStack {
                        Image(uiImage: image!)
                            .frame(width: 120, height: 120)
                        if selectedIndex == 0 {
                            Image("blueTick")
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(selectedIndex == 0 ? .blue.opacity(0.3) : .clear, lineWidth: 5)
                    )
                    Text("Personal photo")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(CustomColors.lightGrayText)
                        .kerning(-0.3)
                }
                .frame(width: 120, height: 120)
                .padding(.trailing, 5)
                .onTapGesture {
                    onPhotoTypeViewTap(0)
                    selectedIndex = 0
                    shouldPresentActionSheet = true
                }
                VStack {
                    ZStack {
                        Image("schemeMap")
                            .frame(width: 120, height: 120)
                        if selectedIndex == 1 {
                            Image("blueTick")
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(selectedIndex == 1 ? .blue.opacity(0.3) : .clear, lineWidth: 5)
                    )
                    Text("Satellite photo")
                        .font(Font.custom("Manrope-SemiBold", size: 14))
                        .foregroundColor(CustomColors.lightGrayText)
                        .kerning(-0.3)
                }
                .frame(width: 120, height: 120)
                .padding(.leading, 5)
                .onTapGesture {
                    onPhotoTypeViewTap(1)
                    self.selectedIndex = 1
                }
                Spacer()
            }
            HStack {
                Spacer()
                Text("You can add a photo yourself or choose a suggested one from Google")
                    .font(Font.custom("Manrope-Medium", size: 16.0))
                    .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                    .multilineTextAlignment(.center)
                    .padding(.top, 5.0)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                    impactMed.impactOccurred()
                    addPropertyViewState = .addPropertyCreated
                    
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
        .sheet(isPresented: $shouldPresentImagePicker) {
            ImagePickerView(sourceType: self.shouldPresentCamera ? .camera : .photoLibrary, image: self.$image, didSelectCustomImage: self.$googleMapsImageSelected, isPresented: self.$shouldPresentImagePicker)
                .ignoresSafeArea()
        }.actionSheet(isPresented: $shouldPresentActionSheet) { () -> ActionSheet in
            ActionSheet(title: Text(""), buttons: [ActionSheet.Button.default(Text("Take photo"), action: {
                self.shouldPresentImagePicker = true
                self.shouldPresentCamera = true
            }), ActionSheet.Button.default(Text("Choose from library"), action: {
                self.shouldPresentImagePicker = true
                self.shouldPresentCamera = false
            }), ActionSheet.Button.cancel()])
        }
        .background(colorScheme == .dark ? CustomColors.DarkModeBackground : Color.white)
    }
}
