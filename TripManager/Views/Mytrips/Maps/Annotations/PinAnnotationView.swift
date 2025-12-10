//  PinAnnotationView.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import MapKit
import RswiftResources
// Vue d'annotation pour les pins de la map
class PinAnnotationView: MKMarkerAnnotationView {
    static let kIdentifier = "Pin" // Identifiant statique pour la réutilisation

    override var annotation: MKAnnotation? { // Override de la propriété annotation
        didSet { // Lorsqu'elle est définie
            // On vérifie si l'annotation est de type MapItem
            guard let mapItem = annotation as? MapItem else { return }
            image = mapItem.image // On assigne l'image de l'annotation
            clusteringIdentifier = PinAnnotationView.kIdentifier // On assigne l'identifiant de clustering
        }
    }
}
