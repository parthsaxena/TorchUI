//
//  AnalyticsCard.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 19/06/2024.
//

import SwiftUI

struct TagsModel {
    let name: String
    let unit: String
    let image: String
    let isRight: Bool
}

struct AnalyticsCard: View {
    
    @State private var alertTitle = "Psicologia Cognitiva"
    @State private var alertImage = "home-bettery"
    @State private var titleColor = CustomColors.darkGray
    @State private var subTitleColor = CustomColors.lightGrayText
    @State private var circleColor = CustomColors.tabBarBackground
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Circle()
                        .stroke(circleColor, lineWidth: 1)
                        .frame(width: 24, height: 24)
                        .overlay(
                            Text("N")
                                .font(.custom("Manrope-SemiBold", size: 16))
                                .foregroundColor(subTitleColor)
                        )
                        .background(CustomColors.lightGrayBackground)
                        .cornerRadius(15.0)
                        .padding(.leading)
                        .padding(.top, 10)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 0) {
                    HStack(spacing: 5) {
                        Text(alertTitle)
                            .font(.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(titleColor)
                            .kerning(-0.5)
                        Text("No Property")
                            .font(.custom("Manrope-SemiBold", size: 16))
                            .foregroundColor(subTitleColor)
                            .kerning(-0.5)
                    }
                }
                Spacer()
            }
            TagsView(tags: loadArray())
        }
        .background(.white)
        .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(CustomColors.tabBarBackground, lineWidth: 1)
        )
        .cornerRadius(22)
        .padding(.top, 0)
    }
    
    func loadArray() -> [TagsModel] {
        let arrayData = [
            TagsModel(name: "COF", unit: "88%", image: "", isRight: false),
            TagsModel(name: "THC", unit: "", image: "rightTick", isRight: false),
            TagsModel(name: "SPA", unit: "", image: "rightTick", isRight: false),
            TagsModel(name: "SMK", unit: "", image: "Fire", isRight: false),
            TagsModel(name: "", unit: "12°F", image: "Thermometer 1", isRight: true),
            TagsModel(name: "Data 3 min", unit: "", image: "", isRight: false),
            TagsModel(name: "GPS 9 min", unit: "", image: "", isRight: false),
            TagsModel(name: "Wifi 119 dBm", unit: "", image: "", isRight: false),
            TagsModel(name: "", unit: "12 мА", image: "speedometer", isRight: true),
            TagsModel(name: "Battery", unit: "82%", image: "", isRight: false)
        ]
        return arrayData
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        var height: CGFloat = 0
        var rowWidth: CGFloat = 0
        var rowHeight: CGFloat = 0
        
        for subview in subviews {
            let subviewSize = subview.sizeThatFits(ProposedViewSize(width: proposal.width, height: 28))
            if rowWidth + subviewSize.width + spacing > proposal.width ?? .infinity {
                height += rowHeight + spacing
                rowWidth = 0
                rowHeight = 0
            }
            rowWidth += subviewSize.width + spacing
            rowHeight = max(rowHeight, subviewSize.height)
        }
        
        height += rowHeight
        
        return CGSize(width: proposal.width ?? .infinity, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var x: CGFloat = 0
        var y: CGFloat = 0
        var rowHeight: CGFloat = 0
        
        for subview in subviews {
            let subviewSize = subview.sizeThatFits(ProposedViewSize(width: bounds.width, height: 28))
            if x + subviewSize.width + spacing > bounds.width {
                x = 0
                y += rowHeight + spacing
                rowHeight = 0
            }
            
            subview.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(width: subviewSize.width, height: subviewSize.height))
            x += subviewSize.width + spacing
            rowHeight = max(rowHeight, subviewSize.height)
        }
    }
}

struct TagsView: View {
    var tags: [TagsModel]
    
    var body: some View {
        ScrollView {
            FlowLayout(spacing: 4) {
                ForEach(Array(tags.enumerated()), id: \.offset) { index, tag in
                    HStack {
                        if tag.isRight, tag.image != "" {
                            Image(tag.image)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }
                        Text(tag.name)
                            .font(.custom("Manrope-SemiBold", size: 14))
                            .foregroundColor(CustomColors.darkGray) +
                        Text(" \(tag.unit)")
                            .font(.custom("Manrope-SemiBold", size: 14))
                            .foregroundColor(CustomColors.green)
                        if !tag.isRight, tag.image != "" {
                            Image(tag.image)
                                .frame(width: 16, height: 16)
                        }
                    }
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(CustomColors.lightGrayBackground)
                    .cornerRadius(8)
                }
            }
        }
        .padding([.horizontal, .bottom], 15)
        .background(.white)
    }
}
//#Preview {
//    AnalyticsCard()
//}
