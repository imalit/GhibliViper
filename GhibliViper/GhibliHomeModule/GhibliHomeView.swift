//
//  ContentView.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-19.
//

import SwiftUI

struct GhibliHomeView: View {
    @ObservedObject var presenter: GhibliHomePresenter
    @State var state: ViewState
    
    var body: some View {
        List {
            ForEach(presenter.movies) { movie in
                Text("\(movie.ghibliMovie.title)")
                
            }
        }.onAppear{
            presenter.fetchMovies(viewState: .all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let service = GhibliService(
            urlString: "")
        
        let interactor = GhibliHomeInteractor(service: service)
        
        let presenter = GhibliHomePresenter(
            interactor: interactor
        )
        GhibliHomeView(presenter: presenter, state: .all)
    }
}
