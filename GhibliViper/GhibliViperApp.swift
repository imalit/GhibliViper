//
//  GhibliViperApp.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-19.
//

import SwiftUI

@available(iOS 15.0, *)
@main
struct GhibliViperApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

@available(iOS 15.0, *)
struct ContentView: View {
    
    var body: some View {
        NavigationView {
            let urlString = "https://ghibliapi.herokuapp.com/films"
            let service = GhibliService(urlString: urlString)
            let interactor = GhibliHomeInteractor(service: service)
            let router = GhibliHomeRouter()
            let presenter = GhibliHomePresenter(interactor: interactor, router: router)
            GhibliHomeView(presenter: presenter, state: .all)
        }
    }
}
