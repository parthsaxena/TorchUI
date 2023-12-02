//
//  VisualEffectView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct GlassyEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    var cornerRadius: CGFloat = 0
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
        uiView.layer.cornerRadius = cornerRadius
        uiView.clipsToBounds = true
        uiView.layer.borderWidth = 2
        uiView.layer.borderColor = CGColor(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
