//  MyTripScreenViewModel.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.
import RswiftResources
import Combine
import Foundation
import Observation

@Observable
class MyTripScreenViewModel {
    var myTrips: [TripModel] = []
    var cancellables: [AnyCancellable] = []

    init() {
        NotificationsConstants.didCreateTrip.publisher.sink { [weak self] notif in
            guard let tripModel = notif.object as? TripModel else { return }
            self?.myTrips.append(tripModel)
        }.store(in: &cancellables)
        myTrips = TripModel.sampleValues()
    }

    // Trip is considered "future" if its date is today or later.
    private func isFuture(_ trip: TripModel) -> Bool {
        guard let date = trip.date else { return false }
        let cal = Calendar.current
        return cal.isDateInToday(date) || date > Date()
    }

    var futureTrips: [TripModel] {
        myTrips.filter { isFuture($0) }
    }

    var pastTrips: [TripModel] {
        myTrips.filter { !isFuture($0) }
    }

    func timeAgo(for trip: TripModel) -> String? {
        guard let date = trip.date else { return nil }
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}
