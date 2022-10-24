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
    var router: GhibliHomeRouter { get set }
    func fetchMovies(viewState: ViewState)
}
@available(iOS 15.0, *)
class GhibliHomePresenter: GhibliHomePresenterProtocol, ObservableObject {
    var router: GhibliHomeRouter
    var interactor: GhibliHomeInteractorProtocol
    @Published var movies = [PersonalizedMovie]()
    private var cancellables = Set<AnyCancellable>()
    
    init(interactor: GhibliHomeInteractorProtocol, router: GhibliHomeRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    func fetchMovies(viewState: ViewState) {
        interactor.fetchMovies(viewState: viewState).sink(
            receiveValue: { [weak self] personalizedMovies in
                self?.movies = personalizedMovies
            }
        ).store(in: &cancellables)
    }
    
    func linkBuilder<Content: View>(movie: PersonalizedMovie, @ViewBuilder content: () -> Content) -> some View {
        NavigationLink(destination: router.routeToPage(data: movie)) {
            content()
        }
    }
}
