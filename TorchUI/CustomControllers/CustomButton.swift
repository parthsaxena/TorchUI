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
    @Binding var showRedOverlay: Bool
    
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
                
                withAnimation(.easeIn(duration: 0.75)) {
                    self.dragOffset = .zero
//                }
//                withAnimation {
                    showDetectorDetails.toggle()
                    dragOffset = .zero
                    showRedOverlay = false
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
//    @Binding var showDetectorDetails: Bool
    
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
    var menuTapAction: () -> Void
    
//    var menuTapAction: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image("menu-01")
                .frame(width: 48.0, height: 48.0)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                menuTapAction()
                
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
                    .frame(width: 48.0, height: 48.0)
            }
        }
        .padding(4)
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
                    .frame(width: 48.0, height: 48.0)
            }
        }
        .padding(4)
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
                    .frame(width: 48.0, height: 48.0)
            }
        }
        .padding(4)
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

struct MapLayerButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var mapLayerTapped: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 48.0, height: 48.0)
            Image("Layers")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 20, height: 20)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                
                mapLayerTapped = true
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 48.0, height: 48.0)
            }
        }
        .padding(4)
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

struct AnalyticsBackButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var viewAnalytics: Bool
    
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
//                SessionManager.shared.appState = .viewProperty
                viewAnalytics = false
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 60.0, height: 60.0)
            }
        }
        .shadow(color: CustomColors.LightGray.opacity(0.3), radius: 5.0)
    }
}

struct CircleButtonWithAnimation: View {

    @State private var animate = false
    @Binding var isPresentingScanner: Bool
    
    var body: some View {
        HStack {
            Button(action: {
               
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                isPresentingScanner = true
            }) {
                ZStack {
                    Image(systemName: "plus")
                        .foregroundColor(.orange)
                        .font(.system(size: 24))
                        .frame(width: 44, height: 44)
                        .overlay(
                            Circle()
                                .stroke(Color.orange, lineWidth: 1)
                        )
                    ForEach(0..<3) { index in
                        Circle()
                            .stroke(Color.orange, lineWidth: 1)
                            .scaleEffect(animate ? 1.6 : 1.0)
                            .opacity(animate ? 0.0 : 1.0)
                            .frame(width: 44, height: 44)
                            .animation(
                                Animation.easeOut(duration: 2.0)
                                    .repeatForever(autoreverses: false)
                                    .delay(Double(index) * 0.7)
                            )
                    }
                }
                .frame(maxWidth: 44, maxHeight: 44)
            }
            .onAppear {
                self.animate = true
            }
            .padding(.leading, 10)
            Image("Tooltip")
                .foregroundColor(.orange)
                .font(.system(size: 24))
                .padding(.top, 5)
                .padding(.leading, -20)
            Spacer()
        }
    }
}

struct CustomRoundButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    var imageName: String
    var onCustomButtonTap: () -> Void
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colorScheme == .dark ? CustomColors.DarkModeOverlayBackground : Color.white)
                .frame(width: 40.0, height: 40.0)
            Image(imageName)
                .frame(width: 40.0, height: 40.0)
                .foregroundColor(colorScheme == .dark ? Color.white : CustomColors.TorchGreen)
            Button {
                
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
                UIApplication.shared.endEditing()
                onCustomButtonTap()
            } label: {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 50.0, height: 50.0)
            }
        }
        .shadow(color: CustomColors.LightGray.opacity(0.3), radius: 5.0)
    }
}
