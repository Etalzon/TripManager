//  ContentViewModel.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import RswiftResources
import Combine
import SwiftUI

/* Stub minimal pour ContentViewModel pour
 la démo de l'interface utilisateur de recherche. */
class ContentViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var users: [GitHubUser] = []

    // Méthode de recherche simulée
    func search() {
        // Dans une vraie application, le code réseau va ici
        /* Cela crée simplement quelques exemples d'utilisateurs
         correspondant au texte de recherche */
        guard !searchText.isEmpty else {
            users = []
            return
        }
        users = [
            GitHubUser(id: 1, login: searchText, avatarUrl:
                "https://avatars.githubusercontent.com/u/1?v=4"),
            GitHubUser(id: 2, login: searchText + "2", avatarUrl:
                "https://avatars.githubusercontent.com/u/2?v=4")
        ]
    }
}

/* Fournissez un modèle d'utilisateur minimal
 correspondant à votre utilisation de la liste */
struct GitHubUser: Identifiable {
    let id: Int
    let login: String
    let avatarUrl: String
}
