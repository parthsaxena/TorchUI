//
//  CustomSegmentView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 20/07/2024.
//

import SwiftUI

struct CustomSegmentView: View {
    
    @State private var selectedSegment = 0
    @State private var frames = Array<CGRect>(repeating: .zero, count: 2)
    
    @Binding var opacity: CGFloat
    var segmentButtonTap: (_ selectedSegment: Int) -> Void
    
    var body: some View {
            ZStack {
                HStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("My Sensors").tag(0)
                            .font(.custom("Manrope-SemiBold", size: 14))
                            .foregroundColor(selectedSegment == 1 ? CustomColors.darkGray: .white)
                            .frame(width: 110, height: 36)
                            .background(
                              GeometryReader { geo in
                                  Color.clear.onAppear {
                                      self.setFrame(index: 0, frame: geo.frame(in: .global))
                                  }
                              }
                            )
                            .cornerRadius(20)
                            .shadow(color: Color.gray.opacity(0.25), radius: 20, x: 0, y: 0)
                            .padding(.leading, 4)
                            .onTapGesture {
                                selectedSegment = 0
                                segmentButtonTap(selectedSegment)
                            }
                        Text("All Torch Sensors").tag(1)
                            .font(.custom("Manrope-SemiBold", size: 14))
                            .foregroundColor(selectedSegment == 0 ? CustomColors.darkGray: .white)
                            .frame(width: 140, height: 36)
                            .background(
                              GeometryReader { geo in
                                  Color.clear.onAppear {
                                      self.setFrame(index: 1, frame: geo.frame(in: .global))
                                  }
                              }
                            )
                            .cornerRadius(20)
                            .shadow(color: Color.gray.opacity(0.25), radius: 20, x: 0, y: 0)
                            .padding(.trailing, 4)
                            .onTapGesture {
                                selectedSegment = 1
                                segmentButtonTap(selectedSegment)
                            }
                    }
                    .background(
                        Rectangle().fill(CustomColors.TorchRed)
                            .cornerRadius(20)
                            .frame(width: selectedSegment == 1 ? 140 : 110, height: 34, alignment: .topLeading)
                            .offset(x: self.frames[self.selectedSegment].minX - self.frames[0].minX)
                            .padding(.horizontal, 4)
                      , alignment: .leading)
                    .opacity(opacity)
                }
                .frame(height: 40)
                .background(.white)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(CustomColors.tabBarBackground, lineWidth: 1)
                )
            }
    }
    
    func setFrame(index: Int, frame: CGRect) {
      self.frames[index] = frame
    }
}

//#Preview {
//    SegmentView()
//}
