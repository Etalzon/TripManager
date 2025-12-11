//
//  Untitled.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

extension Collection {
  subscript(safe index: Index) -> Element? {
    indices.contains(index) ? self[index] : nil
  }
}
