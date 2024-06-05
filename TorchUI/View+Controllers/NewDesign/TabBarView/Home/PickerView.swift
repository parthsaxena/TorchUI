//
//  PickerView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 23/05/2024.
//

import SwiftUI

struct PickerView: View {
    
    @State private var selectedSegment = 0
    @State private var frames = Array<CGRect>(repeating: .zero, count: 2)
    
    var segmentButtonTap: (_ selectedSegment: Int) -> Void
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width - 10
            ZStack {
                HStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("My Properties").tag(0)
                            .font(.custom("Manrope-SemiBold", size: 14))
                            .foregroundColor(selectedSegment == 0 ? CustomColors.darkGray: CustomColors.lightGrayText)
                            .frame(width: width / 2, height: 36)
                            .background(
                              GeometryReader { geo in
                                  Color.clear.onAppear {
                                      self.setFrame(index: 0, frame: geo.frame(in: .global))
                                  }
                              }
                            )
                            .cornerRadius(8)
                            .shadow(color: Color.gray.opacity(0.25), radius: 8, x: 0, y: 0)
                            .padding(.leading, 4)
                            .onTapGesture {
                                selectedSegment = 0
                                segmentButtonTap(selectedSegment)
                            }
                        Text("My Sensors").tag(1)
                            .font(.custom("Manrope-SemiBold", size: 14))
                            .foregroundColor(selectedSegment == 1 ? CustomColors.darkGray: CustomColors.lightGrayText)
                            .frame(width: width / 2, height: 36)
                            .background(
                              GeometryReader { geo in
                                  Color.clear.onAppear {
                                      self.setFrame(index: 1, frame: geo.frame(in: .global))
                                  }
                              }
                            )
                            .cornerRadius(8)
                            .shadow(color: Color.gray.opacity(0.25), radius: 8, x: 0, y: 0)
                            .padding(.trailing, 4)
                            .onTapGesture {
                                selectedSegment = 1
                                segmentButtonTap(selectedSegment)
                            }
                    }
                    .background(
                        Rectangle().fill(.white)
                            .cornerRadius(8)
                            .frame(width: width / 2, height: 36, alignment: .topLeading)
                            .offset(x: self.frames[self.selectedSegment].minX - self.frames[0].minX)
                            .padding(.horizontal, 4)
                      , alignment: .leading)
                }
                .frame(height: 44)
                .background(CustomColors.pickerBackgroundGray)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(CustomColors.tabBarBackground, lineWidth: 1)
                )
            }
            .animation(.default.speed(1.5))
        }
    }
    
    func setFrame(index: Int, frame: CGRect) {
      self.frames[index] = frame
    }
}

//#Preview {
//    PickerView(segmentButtonTap: 0)
//}
