//
//  CircleGridView.swift
//  TorchUI
//
//  Created by Mubashir Mushir on 17/05/2024.
//

import SwiftUI

struct CircleGridView: View {
    let totalSensors: Int
    let circleColor: Color
//    let markedCircleColor: Color
    var cirlceSize: CGFloat = 10.0

    var body: some View {
        let numbers = generateNumbers(upTo: totalSensors)
        let columns = Int(sqrt(Double(numbers.count)).rounded(.up))
        let rows = (numbers.count + columns - 1) / columns
        HStack(spacing: 2) {
            ForEach(0..<(rows <= 7 ? rows : 7), id: \.self) { rowIndex in
                VStack(spacing: 2) {
                    Spacer()
                    ForEach((0..<(columns <= 7 ? columns : (columns + (columns - 6)))), id: \.self) { columnIndex in
                        if let number = numberFor(row: rowIndex, column: columnIndex, columns: columns, numbers: numbers) {
                            Circle()
                                .fill(circleColor)
                                .frame(width: cirlceSize, height: cirlceSize)
                        } else {
                            Circle()
                                .fill(Color.clear)
                                .frame(width: cirlceSize, height: cirlceSize)
                        }
                    }
                    Spacer()
                }
            }
        }
        .padding()
    }
    
    func generateNumbers(upTo limit: Int) -> [Int] {
        var numbers: [Int] = []
        let count = 1...limit
        
        for number in count {
            numbers.append(number)
        }
        return numbers
    }
    
    func numberFor(row: Int, column: Int, columns: Int, numbers: [Int]) -> Int? {
        let newColumns = (columns <= 7 ? columns : (columns + (columns - 6)))
        let index = row * newColumns + column
        return index < numbers.count ? numbers[index] : nil
    }
}

#Preview {
    CircleGridView(totalSensors: 8, circleColor: CustomColors.lightGrayBackground)
}
