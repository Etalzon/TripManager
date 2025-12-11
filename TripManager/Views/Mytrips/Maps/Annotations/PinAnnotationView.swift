//
//  PinAnnotationView.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import RswiftResources
import MapKit

class PinAnnotationView: MKAnnotationView {
  static let kIdentifier = "Pin"

  override var annotation: MKAnnotation? {
    didSet {
      guard let mapItem = annotation as? MapItem else { return }
      image = mapItem.image
      clusteringIdentifier = PinAnnotationView.kIdentifier
    }
  }
}
