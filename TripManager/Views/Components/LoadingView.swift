//  LoadingView.swift
//  TripManager
//
//  Created by eric locci on 05/01/2026.

import RswiftResources
import SwiftUI

struct LoadingView: View {
    var body: some View {
      VStack {
        ProgressView()
          .padding(.top, AppStyles.Padding.medium24.rawValue)
        R.string.localizable.loaderDescription().textView(style: .sectionTitle)
        Spacer()
          .frame(width: 1, height: AppStyles.Padding.medium24.rawValue)
      }
    }
}

#Preview {
    LoadingView()
}
