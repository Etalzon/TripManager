//  NotificationsConstants.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import Foundation

enum NotificationsConstants: String {
  case didCreateTrip

  var notificationName: Notification.Name {
    Notification.Name(rawValue: self.rawValue)
  }

  var publisher: NotificationCenter.Publisher {
    NotificationCenter.default.publisher(for: notificationName)
  }

  func post(object: Any? = nil) {
    NotificationCenter.default.post(name: notificationName, object: object)
  }
}
