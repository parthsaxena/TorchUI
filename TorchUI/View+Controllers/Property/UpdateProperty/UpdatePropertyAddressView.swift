//
//  UpdatePropertyAddressView.swift
//  TorchUI
//
//  Created by Parth Saxena on 1/5/24.
//

import SwiftUI
import CoreLocation

struct UpdatePropertyAddressView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    @StateObject var vm: PropertyAddressViewModel
        
    var propertyName: String
    @Binding var propertyAddress: String
    @Binding var placemark: CLLocationCoordinate2D
    @State var enteredAddress: String = ""

    @State var fieldTextColor: Color = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)
    
    // disabled button color
    @State var nextButtonColor: Color = Color(red: 0.78, green: 0.81, blue: 0.82)
    @State var nextButtonEnabled: Bool = false
    
    @Binding var updatePropertyButtonColor: Color
    @Binding var updatePropertyButtonEnabled: Bool
    
    @FocusState private var focusedField: FocusField?
    
    @State var placeholderAddressSize: CGSize = .zero
    
    var searchResults: [SearchResult] = [SearchResult(address: "2237 Kamp Court, Pleasanton, CA 94588"), SearchResult(address: "4261 Diavila Ave, Pleassanton, CA 94588")]
    
    var body: some View {
        let binding = Binding<String>(get: {
            self.enteredAddress
        }, set: {
            self.enteredAddress = $0
            
            // update textfield color
            if $0 != "Enter your address" {
                fieldTextColor = CustomColors.TorchGreen
            } else {
                fieldTextColor = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)
            }
            
            if !self.enteredAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                // enabled button color
                nextButtonEnabled = true
                nextButtonColor = Color(red: 0.18, green: 0.21, blue: 0.22)
            } else {
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
                        Spacer()
                        
                        VStack {
                            Text("Location address")
                                .kerning(-0.5)
                                .font(Font.custom("Manrope-SemiBold", size: 18.0))
                                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0))
                                .font(Font.system(size: 18.0))
                        }
                        .padding(.trailing, 20.0)
                    }
                }
                .padding(.top, 20)
                
                if vm.searchableText.isEmpty || (focusedField != .field) {
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    VStack {
                        ZStack {
                            VStack {
                                ZStack {
                                    if self.vm.searchableText.isEmpty {
                                        ChildSizeReader(size: self.$placeholderAddressSize) {
                                            Text("Enter your address")
                                                .font(Font.custom("Manrope-SemiBold", size: 30))
                                                .foregroundColor(Color(red: 0.78, green: 0.81, blue: 0.82))
                                        }
                                    }
                                    TextField("", text: $vm.searchableText, axis: .vertical)
                                        .onChange(of: vm.searchableText) { newValue in
                                            guard let newValueLastChar = newValue.last else { return }
                                            if newValueLastChar == "\n" {
                                                vm.searchableText.removeLast()
                                                UIApplication.shared.endEditing()
                                            }
                                        }
                                        .frame(maxWidth: !self.vm.searchableText.isEmpty ? .infinity : self.placeholderAddressSize.width)
                                        .submitLabel(.done)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 15)
                                        .font(Font.custom("Manrope-SemiBold", size: 30))
                                        .foregroundColor(fieldTextColor)
                                        .multilineTextAlignment(!(focusedField != .field) ? .leading : .center)
                                        .autocorrectionDisabled()
                                        .textInputAutocapitalization(.never)
                                        .autocorrectionDisabled()
                                        .onReceive(
                                            vm.$searchableText.debounce(
                                                for: .seconds(0.1),
                                                scheduler: DispatchQueue.main
                                            )
                                        ) {
                                            self.enteredAddress = $0
                                            vm.searchAddress($0)
                                            
                                            // update textfield color
                                            if $0 != "Enter your address" {
                                                fieldTextColor = CustomColors.TorchGreen
                                            } else {
                                                fieldTextColor = Color(red: 171.0/255.0, green: 183.0/255.0, blue: 186.0/255.0)
                                            }
                                            
                                            if !self.vm.searchableText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                                                // enabled button color
                                                nextButtonEnabled = true
                                                nextButtonColor = Color(red: 0.18, green: 0.21, blue: 0.22)
                                            } else {
                                                // disabled button color
                                                nextButtonEnabled = false
                                                nextButtonColor = Color(red: 0.78, green: 0.81, blue: 0.82)
                                            }
                                        }
                                        .focused($focusedField, equals: .field)
                                        .onAppear {
                                            self.focusedField = .field
                                        }
                                        .background(
                                            !vm.searchableText.isEmpty && !(focusedField != .field)
                                            ? RoundedRectangle(cornerRadius: 20)
                                                .fill(Color.white)
                                                .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.03), radius: 4, x: 0, y: 8)
                                                .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.08), radius: 12, x: 0, y: 20)
                                            : RoundedRectangle(cornerRadius: 14)
                                                .fill(Color.clear)
                                                .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.03), radius: 4, x: 0, y: 8)
                                                .shadow(color: Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.08), radius: 12, x: 0, y: 20)
                                        )
                                        .padding(.top, !vm.searchableText.isEmpty ? 5.0 : 0.0)
                                        .padding(.horizontal, !vm.searchableText.isEmpty ? 5.0 : 0.0)
                                }
                                .padding(.top, vm.searchableText.isEmpty ? 10 : 0)
                                
                                // if user is typing address, show results
                                if !vm.searchableText.isEmpty && !(focusedField != .field){
                                    VStack {
                                        VStack {
                                            ForEach(vm.results) { searchResult in
                                                HStack {
                                                    SearchResultView(address: searchResult.address, userEntry: vm.searchableText)
                                                        .onTapGesture {
                                                            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                                                            impactMed.impactOccurred()
                                                            
                                                            vm.searchableText = searchResult.address
                                                            UIApplication.shared.endEditing()
                                                            
                                                            
                                                            nextButtonEnabled = true
                                                            nextButtonColor = Color(red: 0.18, green: 0.21, blue: 0.22)
                                                        }
                                                }
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 16)
                                    .padding(.top, 4)
                                    .padding(.bottom, 16)
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                }
                            }
                            .background(!vm.searchableText.isEmpty && !(focusedField != .field) ? Color(red: 0.95, green: 0.95, blue: 0.95) : Color.white)
                            .cornerRadius(24)
                        }
                        
                        if vm.searchableText.isEmpty || (focusedField != .field) {
                            Text("Please enter your address")
                                .font(Font.custom("Manrope-Medium", size: 16.0))
                                .foregroundColor(Color(red: 0.45, green: 0.53, blue: 0.55))
                        }
                        //                        .padding(.top, 5.0)
                    }
                    Spacer()
                }
                
                Spacer()
                
                // Next button
                HStack {
                    Spacer()
                    Button(action: {
                        let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()
                        
                        let geocoder = CLGeocoder()
                        
                        geocoder.geocodeAddressString(self.enteredAddress) {
                            placemarks, error in
                            let placemark = placemarks?.first                            
                            print("Update address: \(placemark)")
                            self.placemark = (placemark?.location!.coordinate)!
                        }
                        
                        self.propertyAddress = self.vm.searchableText
                        self.updatePropertyButtonColor = Color(red: 0.18, green: 0.21, blue: 0.22)
                        self.updatePropertyButtonEnabled = true
                        dismiss()
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
        }
        .ignoresSafeArea(vm.searchableText.isEmpty ? SafeAreaRegions.init() : .keyboard)
    }
}

//struct ContentView1: View {
//    @State private var showingSheet = true
//    
//    
//    var body: some View {
//        AddPropertySheetView()
//    }
//}
//
//struct PropertyAddressView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView1()
//    }
//}
//
//struct ChildSizeReader<Content: View>: View {
//    @Binding var size: CGSize
//    let content: () -> Content
//    var body: some View {
//        ZStack {
//            content()
//                .background(
//                    GeometryReader { proxy in
//                        Color.clear
//                            .preference(key: SizePreferenceKey.self, value: proxy.size)
//                    }
//                )
//        }
//        .onPreferenceChange(SizePreferenceKey.self) { preferences in
//            self.size = preferences
//        }
//    }
//}
//
//struct SizePreferenceKey: PreferenceKey {
//    typealias Value = CGSize
//    static var defaultValue: Value = .zero
//    
//    static func reduce(value _: inout Value, nextValue: () -> Value) {
//        _ = nextValue()
//    }
//}

