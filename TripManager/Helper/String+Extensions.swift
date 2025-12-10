//  String+Extensions.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import Foundation
import SwiftUI
import RswiftResources

extension String {

  func textView(style: AppStyles.TextStyles, overrideColor: Color? = nil,
                multiligneAlignment: TextAlignment = .leading, lineLimit: Int? = nil) -> some View {
    Text(self)
      .foregroundStyle(overrideColor ?? style.defaultColor)
      .font(style.font)
      .lineLimit(lineLimit)
      .multilineTextAlignment(multiligneAlignment)
  }
}
