//
//  MyTripsScreenViewModel.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import RswiftResources
import Observation
import Combine
import Foundation

@Observable
class MyTripsScreenViewModel {
  var myTrips: [TripModel] = []
  var cancellables: [AnyCancellable] = []
   var selectedTrip: TripModel?

  init() {
    NotificationsConstants.didCreateTrip.publisher.sink { [weak self] notif in
      guard let tripModel = notif.object as? TripModel else { return }
      self?.myTrips.append(tripModel)
    }.store(in: &cancellables)
    myTrips = TripModel.sampleValues()
  }

  var futureTrips: [TripModel] {
    myTrips.filter({ ($0.date ?? Date()) >= Date() || Calendar.current.isDateInToday($0.date ?? Date()) })
  }

  var pastTrips: [TripModel] {
    myTrips.filter({ !futureTrips.contains($0) })
  }

  func timeAgo(trip: TripModel) -> String? {
    guard let date = trip.date else { return nil }
    let formatter = RelativeDateTimeFormatter()
    formatter.unitsStyle = .full
    return formatter.localizedString(for: date, relativeTo: Date())
  }
}
