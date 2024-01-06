//
//  UpdatePropertyView.swift
//  TorchUI
//
//  Created by Parth Saxena on 1/4/24.
//

import SwiftUI
import CoreLocation
//import AmplifyImage

struct UpdatePropertyView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State private var showingSheet = false
    
    @State var placemark: CLLocationCoordinate2D = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].coordinate!
    var propertyName: String = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName
    @State var propertyAddress: String = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyAddress
    var propertyImage: String =
        SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyImage
    
    @State var fieldTextColor: Color = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)

    @State var nextButtonColor: Color = Color(red: 0.78, green: 0.81, blue: 0.82)
    @State var nextButtonEnabled: Bool = false
    
    @State var googleMapsImageSelected: Bool = true
    
    @State private var locationName: String = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyName
    private var locationAddress: String = SessionManager.shared.properties[SessionManager.shared.selectedPropertyIndex].propertyAddress
    
    let imageApiUrl = "https://maps.googleapis.com/maps/api/staticmap?key=AIzaSyBevmebTmlyD-kftwvRqqRItgh07CDiwx0&size=180x180&scale=2&maptype=satellite&zoom=19&center="
    
    var body: some View {
        let nameBinding = Binding<String>(get: {
            self.locationName
        }, set: {
            self.locationName = $0
            
            if self.locationName != self.propertyName {
                // enabled button color
                nextButtonEnabled = true
                nextButtonColor = Color(red: 0.18, green: 0.21, blue: 0.22)
            } else if (self.propertyAddress == self.locationAddress) {
                // disabled button color
                nextButtonEnabled = false
                nextButtonColor = Color(red: 0.78, green: 0.81, blue: 0.82)
            }
        })
        
        GeometryReader { geometry in
            VStack {
                // Heading
                ZStack {
                    HStack {
                        ZStack {
                            Circle()
                                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                                .frame(width: 48.0, height: 48.0)
                            Image(systemName: "chevron.backward")
                                .frame(width: 48.0, height: 48.0)
                                .foregroundColor(colorScheme == .dark ? Color.white : Color(red: 0.271, green: 0.318, blue: 0.329))
                            Button {
                                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                impactMed.impactOccurred()
                                
                                SessionManager.shared.appState = .viewProperty
                            } label: {
                                Circle()
                                    .fill(Color.clear)
                                    .frame(width: 60.0, height: 60.0)
                            }
                        }
                        .shadow(color: CustomColors.LightGray.opacity(0.3), radius: 10.0, x: 0.0, y: 10.0)
                        .padding(.leading)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Text("Edit location")
                            .font(.custom("Manrope-SemiBold", size: 20))
                            .foregroundColor(Color(red: 0.271, green: 0.318, blue: 0.329))
                            .kerning(-1)
                        
                        Spacer()
                    }
                                        
                }
                .padding(.top, 15)
                Spacer()
                    .frame(height: 30)
                HStack {
                    Spacer()
                    VStack {
                        HStack {
                            Spacer()
                            // custom photo / add photo
                            VStack {
                                if self.propertyImage.starts(with: "http") {
                                    RoundedRectangle(cornerRadius: 24)
                                        .fill(Color(red: 0.945, green: 0.953, blue: 0.953))
                                        .frame(width: 120, height: 120)
                                        .overlay(
                                            ZStack {
                                                Circle()
                                                    .fill(Color.white)
                                                    .frame(width: 32, height: 32)
                                                                                        
                                                Image(systemName: "plus")
                                                    .foregroundColor(Color(red: 143.0/255.0, green: 160.0/255.0, blue: 163.0/255.0))
                                            }
                                        )
                                } else {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 120, height: 120)
                                        .background(self.googleMapsImageSelected ? Color(red: 0.08, green: 0.44, blue: 0.94).opacity(0.1) : Color.clear)
                                        .background(
                                            
    //                                        AmplifyImage(key: self.propertyImage)
    //                                            .kfImage.placeholder({
    ////                                                    Image("Property")
    ////                                                        .opacity(0.6)
    //                                                ProgressView()
    //                                            })
    //                                            .resizable()
    //                                            .aspectRatio(contentMode: .fill)
    //                                            .frame(width: 60, height: 60)
    //                                            .clipped()
                                        )
                                        .cornerRadius(24)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 24)
                                                .inset(by: 1)
                                                .stroke(.white, lineWidth: 2)
                                        )
                                }
                                
                                Text("Personal photo")
                                    .font(.custom("Manrope", size: 14))
                                    .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                                    .padding(.top, 4)
                            }
                            
                            Spacer()
                                .frame(width: 25)
                            
                            // satellite photo
                            VStack {
                                ZStack {
                                    let urlString = "\(imageApiUrl)\(self.propertyAddress)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                                                                        
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .frame(width: 120, height: 120)
                                        .background(self.googleMapsImageSelected ? Color(red: 0.08, green: 0.44, blue: 0.94).opacity(0.1) : Color.clear)
                                        .background(
                                            
                                            AsyncImage(url: URL(string: urlString)) { image in
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 120, height: 120)
                                                    .clipped()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                        )
                                        .cornerRadius(24)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 24)
                                                .inset(by: 1)
                                                .stroke(.white, lineWidth: 2)
                                        )
                                        .onTapGesture {
                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                            impactMed.impactOccurred()
                                            
                                            self.googleMapsImageSelected.toggle()
                                            
                                            if self.googleMapsImageSelected {
                                                nextButtonEnabled = true
                                                nextButtonColor = Color(red: 0.18, green: 0.21, blue: 0.22)
                                            } else {
                                                nextButtonEnabled = false
                                                nextButtonColor = Color(red: 0.78, green: 0.81, blue: 0.82)
                                            }
                                            
                                        }
                                    
                                    if (self.googleMapsImageSelected) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(Font.system(size: 24))
                                            .foregroundStyle(Color.white, Color.blue)
                                            .clipped()
                                    }
                                }
                                .shadow(color: self.googleMapsImageSelected ? Color(red: 0.08, green: 0.44, blue: 0.94).opacity(0.6) : Color.clear, radius: 4, x: 0, y: 0)
                                
                                Text("Satellite photo")
                                    .font(.custom("Manrope", size: 14))
                                    .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                                    .padding(.top, 4)
                            }
                            Spacer()
                        }
                    }
                    Spacer()
                }
                
                Spacer()
                    .frame(height: 30)
                
                // Location name + Location address
                VStack(alignment: .leading) {
                    Text("Location name")
                        .font(.custom("Manrope-Medium", size: 14))
                        .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                        .padding(.leading)

                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 241.0/255.0, green: 243.0/255.0, blue: 243.0/255.0))
                            .frame(height: 48)
                        TextField(self.propertyName, text: nameBinding)
                            .font(.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(Color(red: 0.271, green: 0.318, blue: 0.329))
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                        .frame(height: 30)

                    Text("Location address")
                        .font(.custom("Manrope-Medium", size: 14))
                        .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                        .padding(.leading)

                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(red: 241.0/255.0, green: 243.0/255.0, blue: 243.0/255.0))
                            .frame(height: 48)
                        HStack {
                            Text(self.propertyAddress)
                                .font(.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(Color(red: 0.271, green: 0.318, blue: 0.329))
                                .padding(.leading)
                            
                            Spacer()
                            
                            ZStack {
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(Color(red: 0.671, green: 0.718, blue: 0.729))
                                Button {
                                    let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                    impactMed.impactOccurred()
                                    
                                    self.showingSheet = true
                                } label: {
                                    Circle()
                                        .fill(Color.clear)
                                        .frame(width: 28, height: 28)
                                }
                            }
                            .padding(.trailing, 12)
                        }
                    }
                }
                .padding()
                
                Spacer()
                
                
                // Next button
                HStack {
                    Spacer()
                    Button(action: {
//                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
//                        impactMed.impactOccurred()
//                        
//                        let urlString = "\(imageApiUrl)\(self.propertyAddress)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//                        SessionManager.shared.newProperty?.propertyImage = urlString
//                        SessionManager.shared.newProperty?.loadingData = true
//                        state = .promptInstallation
//                        
//                        SessionManager.shared.uploadNewProperty()
                        SessionManager.shared.updateProperty(propertyIndex: SessionManager.shared.selectedPropertyIndex, propertyName: self.locationName, propertyAddress: self.propertyAddress, placemark: self.placemark)
                        SessionManager.shared.lastAppState = .updateProperty
                        SessionManager.shared.appState = .viewProperty
                    }) {
                        Text("Save")
                            .font(.custom("Manrope-SemiBold", size: 16))
                            .frame(maxWidth: .infinity)
                            .frame(height: 60)
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 100)
                                    .foregroundColor(self.nextButtonColor)
                            )
                            .padding(.horizontal, 16)
                            .padding(.bottom, 20)
                    }
                    .disabled(!nextButtonEnabled)
                    Spacer()
                }
                .padding(.top, 60)
            }
            .sheet(isPresented: $showingSheet) {
                UpdatePropertyAddressView(vm: PropertyAddressViewModel(), propertyName: self.propertyName, propertyAddress: self.$propertyAddress, placemark: self.$placemark, updatePropertyButtonColor: self.$nextButtonColor, updatePropertyButtonEnabled: self.$nextButtonEnabled)
                    .presentationCornerRadius(25)
            }
        }
    }
}

//struct ContentView3: View {
//    
//    @State private var showingSheet = true
//    @State var state = OnboardingState.propertyPhoto
//
//    var body: some View {
//        PropertyPhotoView(state: $state, propertyName: "Mom's house", propertyAddress: "USA Pacific Coast Hwy, Malibu, CA 90265aa")
//    }
//}
//
//struct PropertyPhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView3()
//    }
//}

