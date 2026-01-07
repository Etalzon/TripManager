//  CityService.swift
//  TripManager
//
//  Created by eric locci on 24/12/2025.

protocol CityService {
  func cities() async -> APIResponse<[CityModel]>
}

final class CityServiceNetwork: CityService {
  let networkClient: NetworkClient

  init(networkClient: NetworkClient) {
    self.networkClient = networkClient
  }

  func cities() async -> APIResponse<[CityModel]> {
    // Utilise l'API async du NetworkClient pour éviter toute continuation manuelle
    await networkClient.call(endPoint: APIEndPoint.cities) as APIResponse<[CityModel]>
  }
}

final class CityServiceMock: MockService, CityService {
  func cities() async -> APIResponse<[CityModel]> {
    await randomWait()
    return .success(CityModel.sampleValues)
  }
}
