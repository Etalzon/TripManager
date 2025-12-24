//  CityService.swift
//  TripManager
//
//  Created by eric locci on 24/12/2025.
//

protocol CityService {
  func cities() async -> APIResponse<[CityModel]>
}

final class CityServiceNetwork: CityService {
  let networkClient: NetworkClient

  init(networkClient: NetworkClient) {
    self.networkClient = networkClient
  }

  func cities() async -> APIResponse<[CityModel]> {
    await networkClient.call(endPoint: .cities)
  }
}

final class CityServiceMock: MockService, CityService {
  func cities() async -> APIResponse<[CityModel]> {
    await randomWait()
    return .success(CityModel.sampleValues)
  }
}
