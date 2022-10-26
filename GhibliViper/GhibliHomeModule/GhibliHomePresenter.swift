//
//  GhibliHomePresenter.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-19.
//

import Foundation
import Combine
import SwiftUI

enum MovieState: Equatable {
    case watched, toWatch, none
}

enum ViewState {
    case all, toWatch, watched
}

@available(iOS 15.0, *)
protocol GhibliHomePresenterProtocol {
    var interactor: GhibliHomeInteractorProtocol { get set }
    var router: GhibliHomeRouter? { get set }
    func fetchMovies()
    func refreshView(viewState: ViewState)
}
@available(iOS 15.0, *)
class GhibliHomePresenter: GhibliHomePresenterProtocol, ObservableObject {
    var router: GhibliHomeRouter?
    var interactor: GhibliHomeInteractorProtocol
    @Published var movies = [PersonalizedMovie]()
    private var cancellables = Set<AnyCancellable>()
    private var viewState = ViewState.all
    
    init(interactor: GhibliHomeInteractorProtocol, router: GhibliHomeRouter? = nil) {
        self.interactor = interactor
        self.router = router
    }
    
    func fetchMovies() {
        if movies.isEmpty {
            interactor.fetchMovies().sink(
                receiveValue: { [weak self] personalizedMovies in
                    self?.movies = personalizedMovies
                }
            ).store(in: &cancellables)
        } else {
            refreshView(viewState: viewState)
        }
    }
    
    func refreshView(viewState: ViewState) {
        self.viewState = viewState
        switch viewState {
        case .all:
            movies = interactor.getMovies(movieState: nil)
        case .toWatch:
            movies = interactor.getMovies(movieState: .toWatch)
        case .watched:
            movies = interactor.getMovies(movieState: .watched)
        }
    }
    
    func linkBuilder<Content: View>(movie: PersonalizedMovie, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router?.routeToPage(data: movie)) {
            content()
        }
    }
}
