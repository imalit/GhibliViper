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
            Text("Title Here")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .center)

            HStack {
                Text("All").onTapGesture {
                    presenter.refreshView(viewState: .all)
                }
                 Text("To Watch").onTapGesture {
                     presenter.refreshView(viewState: .toWatch)
                 }
                 Text("Watched").onTapGesture {
                     presenter.refreshView(viewState: .watched)
                 }
            }

            ForEach(presenter.movies) { movie in
                presenter.linkBuilder(movie: movie) {
                    let interactor = GhibliHomeListCellInteractor(data: movie)
                    let presenter = GhibliHomeListCellPresenter(interactor: interactor)
                    GhibliHomeListCellView(presenter: presenter)
                }
            }
        }.onAppear {
            presenter.fetchMovies()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        let service = MockService()
        let interactor = GhibliHomeInteractor(service: service)

        let presenter = GhibliHomePresenter(
            interactor: interactor
        )
        GhibliHomeView(presenter: presenter, state: .all)
    }
}
