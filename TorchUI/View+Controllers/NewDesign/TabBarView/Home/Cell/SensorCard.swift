//
//  SensorCard.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 08/05/2024.
//

import SwiftUI

struct SensorCard: View {
    
    @State var propertyState: PropertyStates
    var index = 0
    
    @State private var titleColor = CustomColors.darkGray
    @State private var subTitleColor = CustomColors.lightGrayText
    @State private var imageBackgroundColor = CustomColors.lightGrayBackground
    @State private var imageBorderColor = CustomColors.lightGrayBorder
    @State private var backgroundColor = Color.white
    @State private var textImage: UIImage?
    
    var body: some View {
        VStack {
            HStack {
                if let image = textImage {
                    Image(uiImage: image)
                        .resizable()
                        .background(imageBackgroundColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 26)
                                .stroke(imageBorderColor, lineWidth: 1)
                        )
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 52, height: 52)
                        .cornerRadius(26)
                        .padding(.horizontal, 8)
                        .opacity(propertyState == .disable ? 0.3 : 1.0)
                }
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        Text("Bard yard #3")
                            .font(.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(titleColor)
                            .opacity(propertyState == .disable ? 0.3 : 1.0)
                        Image("home-mute")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 0)
                            .foregroundColor(subTitleColor)
                            .opacity(propertyState == .disable ? 0.3 : 1.0)
                    }
                    Text("Neighborhood 1")
                        .font(.custom("Manrope-Regular", size: 14))
                        .foregroundColor(subTitleColor)
                }
                Spacer()
                HStack {
                    if propertyState != .disable {
                        Image("home-bettery")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .padding(.horizontal, 0)
                            .foregroundColor(subTitleColor)
                        Image("home-wifi")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 15)
                            .padding(.leading, 0)
                            .foregroundColor(subTitleColor)
                    } else if propertyState == .disable {
                        Button(action: {
                            print("Edit action")
                        }) {
                            Text("Edit")
                                .font(.custom("Manrope-SemiBold", size: 14))
                                .foregroundColor(CustomColors.darkGray)
                        }
                        .tint(.clear)
                        Button(action: {
                            print("Delete action")
                        }) {
                            Text("Delete")
                                .font(.custom("Manrope-SemiBold", size: 14))
                                .foregroundColor(CustomColors.TorchRed)
                        }
                        .tint(.clear)
                        Image("property-warning")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 15)
                            .padding(.leading, 0)
                            .foregroundColor(CustomColors.TorchRed)
                    }
                }
            }
            .frame(height: 76)
        }
//        .background(backgroundColor.opacity(propertyState == .disable ? 0.3 : 1.0))
        .background(backgroundColor.opacity(1.0))
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(CustomColors.tabBarBackground, lineWidth: 1)
        )
        .cornerRadius(22)
        .padding(.horizontal, -20)
        .listRowSeparator(.hidden)
        .padding(.vertical, -5)
        .listRowBackground(Color.clear)
        .onAppear {
            onAppearSetup()
        }
    }
    
    func onAppearSetup() {
        
        if propertyState == .normal {
            self.titleColor = CustomColors.darkGray
            self.subTitleColor = CustomColors.lightGrayText
            self.backgroundColor = .white
            self.imageBackgroundColor = CustomColors.lightGrayBackground
            self.imageBorderColor = CustomColors.lightGrayBorder
        } else if propertyState == .warning {
            self.titleColor = .white
            self.subTitleColor = .white
            self.backgroundColor = CustomColors.WarningYellow
            self.imageBackgroundColor = CustomColors.torchDarkYellow
            self.imageBorderColor = CustomColors.torchDarkYellow
        } else if propertyState == .highAlert {
            self.titleColor = .white
            self.subTitleColor = .white
            self.backgroundColor = CustomColors.TorchRed
            self.imageBackgroundColor = CustomColors.torchDardRed
            self.imageBorderColor = CustomColors.torchDardRed
        }
        self.textImage = self.textToImage(text: "12")
    }
    
    func textToImage(text: String) -> UIImage {
        let label = UILabel()
        label.text = text
        label.textColor = UIColor(subTitleColor)
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Manrope-SemiBold", size: 35)
        label.textAlignment = .center
        label.numberOfLines = 0
        
        label.sizeToFit()
        label.frame = label.frame.inset(by: UIEdgeInsets(top: -3, left: -15, bottom: 0, right: 0))
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 52, height: 52), false, 0.0)
        label.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return image
    }
}

//#Preview {
//    SensorCard(propertyState: <#PropertyStates#>)
//}
