//
//  ContentView.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-19.
//

import SwiftUI

struct GhibliHomeView: View {
    @ObservedObject var presenter: GhibliHomePresenter
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let interactor = GhibliHomeInteractor(
            urlString: ""
        )
        
        let presenter = GhibliHomePresenter(
            interactor: interactor
        )
        GhibliHomeView(presenter: presenter)
    }
}
