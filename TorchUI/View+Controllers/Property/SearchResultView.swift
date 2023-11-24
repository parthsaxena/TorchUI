//
//  SearchResultView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 15/11/2023.
//

import SwiftUI

struct SearchResultView: View {
    
    @State var address: String
    var userEntry: String
    
    private struct HighlightedText: View {
        
        var text: String
        var highlighted: String

        var body: some View {
            Text(attributedString)
        }
        
        func findLengthOfCommonPrefix(str1: String, str2: String) -> Int {
            for (idx, _) in str1.enumerated() {
                if idx >= str2.count || str1[idx].lowercased() != str2[idx].lowercased() {
                    return idx
                }
            }
            return 0
        }

        private var attributedString: AttributedString {
            
            var attributedString = AttributedString(text)
            let prefixIdx = findLengthOfCommonPrefix(str1: text.lowercased(), str2: highlighted.lowercased())
            let highLight = highlighted[min(prefixIdx, highlighted.count - 1)]
            if let firstIndex = highlighted.firstIndex(of: highLight) {
                let h = highlighted.substring(to: firstIndex)
                if let range = AttributedString(text.lowercased()).range(of: h.lowercased()) {
                    attributedString[range].backgroundColor = Color(red: 0.18, green: 0.21, blue: 0.22).opacity(0.1)
                }
            }
            return attributedString
        }
    }
    
    var body: some View {
        HStack {
            Image("LocationMarker")
                .resizable()
                .frame(width: 16, height: 16)
            HighlightedText(text: address, highlighted: userEntry)
                .font(Font.custom("Manrope-Medium", fixedSize: 14.0))
            Spacer()
        }
        .padding(.vertical, 8)
    }
}
