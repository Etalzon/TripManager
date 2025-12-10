//  MapItem.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import MapKit
import RswiftResources
import UIKit

// MapItem représente une annotation cartographique pour une activité.
class MapItem: NSObject, MKAnnotation {
   var id: String // Identifiant unique de l'annotation
   let item: ActivityModel // Modèle d'activité associé à l'annotation
   var coordinate: CLLocationCoordinate2D // Coordonnées géographiques de l'annotation
   var image: UIImage // Image personnalisée pour l'annotation
   
   // Initialisassions de MapItem avec un modèle d'activité.
   init(item: ActivityModel) {
      self.item = item // Stocke le modèle d'activité
      // Définit les coordonnées en utilisant la latitude et la longitude de l'activité
      coordinate = CLLocationCoordinate2D(latitude: item.location?.latitude ?? 0,
                                          longitude: item.location?.longitude ?? 0)
      // Génère un identifiant unique ou utilise celui fourni
      id = item.id ?? UUID().uuidString // Génère un UUID si l'id est nil
      // Charge l'image de l'annotation à partir des ressources
      //        image = UIImage(named: R.image.mappin.name) ?? UIImage()
      image = UIImage(named: "appPin") ?? UIImage()
      super.init() // Appelle le constructeur de la super classe NSObject
   }
}
