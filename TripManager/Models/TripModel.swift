//
//  TripModel.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import Foundation

struct TripModel: Equatable, Hashable {
  var id: String?
  var city: String
  var activities: [ActivityModel]
  var date: Date?

  static func sampleValues() -> [TripModel] {
    [
      TripModel(id: UUID().uuidString, city: CityModel.sampleValues.first?.id ?? "",
                activities: ActivityModel.sampleValues(),
                date: Date().addingTimeInterval(24 * 60 * 60 * 5)),
      TripModel(id: UUID().uuidString, city: CityModel.sampleValues.last?.id ?? "",
                activities: ActivityModel.sampleValues(),
                date: Date()),
      TripModel(id: UUID().uuidString, city: CityModel.sampleValues.last?.id ?? "",
                activities: ActivityModel.sampleValues(),
                date: Date().addingTimeInterval(-24 * 60 * 60 * 12)),
      TripModel(id: UUID().uuidString, city: CityModel.sampleValues.first?.id ?? "",
                activities: ActivityModel.sampleValues(),
                date: Date().addingTimeInterval(-24 * 60 * 60 * 89)),
      TripModel(id: UUID().uuidString, city: CityModel.sampleValues.last?.id ?? "",
                activities: ActivityModel.sampleValues(),
                date: Date().addingTimeInterval(-24 * 60 * 60 * 380))
    ]
  }

  var cityModel: CityModel {
    let count = CityModel.sampleValues.count
    if count == 0 { return CityModel.sampleValues.first! }
    let index = Int.random(in: 0..<count)
    return CityModel.sampleValues[index]
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id ?? "" + city)
  }
}
