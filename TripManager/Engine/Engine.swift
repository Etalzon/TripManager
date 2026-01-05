//  Engine.swift
//  TripManager
//
//  Created by eric locci on 24/12/2025.

final class Engine {
  let networkClient = NetworkClient(server: .dev)
  let cityService: CityService

  init(mock: Bool) {
    self.cityService = mock ? CityServiceMock() : CityServiceNetwork(networkClient: networkClient)
  }
}
