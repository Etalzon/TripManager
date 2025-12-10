//  TripManager
//
//  Created by eric locci on 08/12/2025.

import MapKit
import RswiftResources
import UIKit

class ClusterAnnotationView: MKAnnotationView {
  override var annotation: MKAnnotation? {
    didSet {
      guard let cluster = annotation as? MKClusterAnnotation else { return }
      displayPriority = .defaultHigh
      image = UIGraphicsImageRenderer.image(for: cluster.memberAnnotations, in:
                                              CGRect(x: 0, y: 0, width: 40, height: 40))
    }
  }
}

extension UIGraphicsImageRenderer {
    static func image(for annotations: [MKAnnotation]?, in rect: CGRect) -> UIImage {
      let renderer = UIGraphicsImageRenderer(size: rect.size)

      return renderer.image { _ in
          // Draw circular background
          let bounds = CGRect(origin: .zero, size: rect.size)
          let circlePath = UIBezierPath(ovalIn: bounds)
          UIColor.systemBlue.setFill()
          circlePath.fill()

          // Draw inner lighter circle for a subtle ring effect
          let inset: CGFloat = 3
          let innerRect = bounds.insetBy(dx: inset, dy: inset)
          let innerPath = UIBezierPath(ovalIn: innerRect)
          UIColor.systemBlue.withAlphaComponent(0.85).setFill()
          innerPath.fill()

          // Draw count
          if let count = annotations?.count {
              String(count).drawForCluster(in: rect)
          }
      }
    }
}

extension String {
    func drawForCluster(in rect: CGRect) {
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 14)
        ]
        let textSize = self.size(withAttributes: attributes)
        let textRect = CGRect(x: (rect.width / 2) - (textSize.width / 2),
                              y: (rect.height / 2) - (textSize.height / 2),
                              width: textSize.width,
                              height: textSize.height)

        self.draw(in: textRect, withAttributes: attributes)
    }
}
