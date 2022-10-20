//
//  GhibliHomePresenter.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-19.
//

import Foundation
import Combine

enum MovieState: Equatable {
    case watched, toWatch, none
}

enum ViewState {
    case all, toWatch, watched
}

protocol GhibliHomePresenterProtocol {
    var interactor: GhibliHomeInteractorProtocol { get set }
    func fetchMovies(viewState: ViewState)
}

class GhibliHomePresenter: GhibliHomePresenterProtocol, ObservableObject {
    var interactor: GhibliHomeInteractorProtocol
    @Published var movies = [PersonalizedMovie]()
    private var cancellables = Set<AnyCancellable>()
    
    init(interactor: GhibliHomeInteractorProtocol) {
        self.interactor = interactor
    }
    
    func fetchMovies(viewState: ViewState) {
        interactor.fetchMovies(viewState: viewState).sink(
            receiveValue: { [weak self] personalizedMovies in
                self?.movies = personalizedMovies
            }
        ).store(in: &cancellables)
    }
}
