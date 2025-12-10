//  GridCellMofifier.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import SwiftUI

struct GridCellModifier: ViewModifier {
    let width: CGFloat

    enum ModifierStyles {
        static let gridItemCornerSize = CGSize(width: 20, height: 20)
    }

    func body(content: Content) -> some View {
        content
            .clipShape(RoundedRectangle(cornerSize: ModifierStyles.gridItemCornerSize))
            .frame(height: GridCellModifier.gridSquareHeight(availableFullWidth: width))
    }

    static func gridSquareHeight(availableFullWidth: CGFloat, totalColumns: Int = 2, spacing: CGFloat = AppStyles.Padding.small16.rawValue) -> CGFloat {
        let formattedColumns = CGFloat(totalColumns)
        return (availableFullWidth -
            (2 + formattedColumns - 1) * spacing) / formattedColumns
    }
}

extension View {
    func gridCellModifier(width: CGFloat) -> ModifiedContent<Self, GridCellModifier> {
        return modifier(GridCellModifier(width: width))
    }
}
