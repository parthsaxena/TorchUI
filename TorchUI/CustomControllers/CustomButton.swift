//
//  CustomButton.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

struct BackButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedDetector: Detector?
    @Binding var showDetectorDetails: Bool
    @Binding var dragOffset: CGSize
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image(systemName: "chevron.backward")
                .frame(width: 48.0, height: 48.0)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                withAnimation(.easeIn(duration: 2.0)) {
                    self.dragOffset = .zero
                }
                withAnimation {
                    showDetectorDetails.toggle(); dragOffset = .zero
                }
                selectedDetector = nil
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray, radius: 15.0)
    }
}

struct PropertiesBackButton: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var showDetectorDetails: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image(systemName: "chevron.backward")
                .frame(width: 48.0, height: 48.0)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                withAnimation {
                    SessionManager.shared.appState = .properties
                }
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray, radius: 15.0)
    }
}

struct HamburgerButton: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var hideOverlay: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image(systemName: "line.3.horizontal")
                .frame(width: 48.0, height: 48.0)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                withAnimation {
                }
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray, radius: 15.0)
    }
}

struct LocationlatitudelongitudeView: View{
    
    var latitude: Double
    var longitude: Double
    var action: () -> Void
    private let pastboard = UIPasteboard.general
    
    //@State private var showToast: Bool = false
    
    var body: some View{
        VStack{
            HStack {
                Button {
                    pastboard.string = "\(latitude), \(longitude)"
                    print("Copy Location!>>>>>>>>\(pastboard.string ?? "")")
                    action() 
                } label: {
                    Text("\(latitude), \(longitude)")
                        .font(Font.custom("Manrope-Medium", fixedSize: 15))
                        .foregroundColor(Color.black.opacity(0.6))
                        .padding([.top,.bottom,.leading], 12)
                }
                  
                Button {
                    print("Share location!")
                    shareText(str: "\(latitude), \(longitude)")

                } label: {
                    Image("btnShare")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .foregroundColor(Color.black.opacity(0.6))
                        .frame(width: 20, height: 20)
                        .padding([.top,.bottom,.trailing], 12)
                }
            }
            .background(Color.white)
        }
        .cornerRadius(12.0)
        .shadow(color: (Color(red: 46.0/255.0, green: 54.0/255.0, blue: 56.0/255.0, opacity: 0.08)), radius: 8, x: 0, y: 4)
        .padding(.top, 80)
    }
}

func shareText(str: String) {
    
    let activityViewController = UIActivityViewController(activityItems: [str], applicationActivities: nil)
    
    // On iPad, you need to present the activityViewController in a popover
    if let popoverController = activityViewController.popoverPresentationController {
        popoverController.sourceView = UIApplication.shared.windows.first?.rootViewController?.view
    }
    
    UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
}

struct ToastView: View {
    var text: String
    @Binding var isPresented: Bool

    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(.white)
                .font(Font.custom("Manrope-Medium", fixedSize: 15))
                .padding(10)
                .background(Color.black)
                .cornerRadius(10)
        }
//        .transition(.offset(CGSize(width: width, height: height)))
//        .animation(.default)
        .frame(maxWidth: width, maxHeight: height, alignment: .center)
        .background(Color.black.opacity(0.2))
        .onAppear {
            // Automatically hide the toast after 1 second
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    isPresented = false
                }
            }
        }
    }
}


struct ZoomInButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var zoomLevel: CGFloat
    @Binding var zoomChanged: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image(systemName: "plus")
                .frame(width: 48.0, height: 48.0)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                zoomLevel = min(zoomLevel + 1, 20)
                zoomChanged = true
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray, radius: 15.0)
    }
}

struct ZoomOutButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var zoomLevel: CGFloat
    @Binding var zoomChanged: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image(systemName: "minus")
                .frame(width: 48.0, height: 48.0)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                zoomLevel = max(zoomLevel - 1, 1)
                zoomChanged = true
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray, radius: 15.0)
    }
}

struct LayersButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image("Layers")
                .resizable()
                .renderingMode(.template)
                .frame(width: 20.0, height: 20.0)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray.opacity(0.5), radius: 15.0)
    }
}

struct LocationButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var moveToUserTapped: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image("Location")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                moveToUserTapped = true
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray.opacity(0.5), radius: 15.0)
    }
}

struct ExitButton: View {
    
    @Binding var showingOptions: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .frame(width: 48.0, height: 48.0)
            Image(systemName: "multiply")
                .frame(width: 48.0, height: 48.0)
                .foregroundColor(CustomColors.TorchGreen)
            Button {
                withAnimation {
                    showingOptions = true
                }
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray.opacity(0.5), radius: 15.0)
    }
}

struct AddPropertyBackButton: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    @Binding var state: OnboardingState
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image(systemName: "chevron.backward")
                .frame(width: 48.0, height: 48.0)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                UIApplication.shared.endEditing()
                
                if self.state == OnboardingState.propertyName {
                    dismiss()
                } else {
                    if let state = OnboardingState(rawValue: self.state.rawValue - 1) {
                        self.state = state
                    }
                }
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray.opacity(0.3), radius: 5.0)
    }
}

struct AccountBackButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image(systemName: "chevron.backward")
                .frame(width: 48.0, height: 48.0)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                UIApplication.shared.endEditing()
                
                if AuthenticationManager.shared.authState == AuthState.accountName || AuthenticationManager.shared.authState == AuthState.login {
                    AuthenticationManager.shared.authState = .welcome
                } else {
                    if let authState = AuthState(rawValue: AuthenticationManager.shared.authState.rawValue - 1) {
                        AuthenticationManager.shared.authState = authState
                    }
                }
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray.opacity(0.3), radius: 5.0)
    }
}
