//  MockService.swift
//  TripManager
//
//  Created by eric locci on 24/12/2025.
//

class MockService {
  func randomWait() async {
    try? await Task.sleep(nanoseconds: UInt64(Double.random(in: 0.1...3.0) * 1_000_000_000))
  }
}
