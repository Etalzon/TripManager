//
//  MapItem.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import MapKit
import RswiftResources

class MapItem: NSObject, MKAnnotation {

  let id: String
  let item: ActivityModel
  var coordinate: CLLocationCoordinate2D
  var image: UIImage

  init(item: ActivityModel) {
    self.item = item
    self.coordinate = CLLocationCoordinate2D(latitude: item.location?.latitude ?? 0,
                                             longitude: item.location?.longitude ?? 0)
    self.id = item.id ?? UUID().uuidString
    self.image = UIImage(named: R.image.mapPin.name) ?? UIImage()
    super.init()
  }
}
