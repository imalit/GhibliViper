//
//  GhibliHomeInteractor.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-19.
//

import Foundation
import Combine

protocol GhibliHomeInteractorProtocol {
    var service: ServiceProtocol { get set }
    func fetchMovies(viewState: ViewState) -> AnyPublisher<[PersonalizedMovie], Never>
}

class GhibliHomeInteractor: GhibliHomeInteractorProtocol {
    var service: ServiceProtocol
    private var personalizedMovies = [PersonalizedMovie]()
//    private var filteredMovies = [PersonalizedMovie]()
    private var cancellables = Set<AnyCancellable>()
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchMovies(viewState: ViewState) -> AnyPublisher<[PersonalizedMovie], Never> {
        service.fetchMovies()
            .map { self.setPersonalizedData(movies: $0) }
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
    
//    func filterMovies(viewState: ViewState) -> [PersonalizedMovie] {
//        switch viewState {
//        case .all:
//            return personalizedMovies
//        case .toWatch:
//            return personalizedMovies.filter{ $0.state == .toWatch }
//        case .watched:
//            return personalizedMovies.filter{ $0.state == .watched }
//        case .none:
//            return [PersonalizedMovie]()
//        }
//    }
    
//    func refreshView() {
//        min = 0
//        scrollableMovies = []
//        fetchMore()
//    }
}

private extension GhibliHomeInteractor {
    private func setPersonalizedData(movies: Ghibli) -> [PersonalizedMovie] {
        for movie in movies {
            let personalizedMovie = PersonalizedMovie(
                movie: movie,
                state: .none
            )
            personalizedMovies.append(personalizedMovie)
        }
        return personalizedMovies
    }
}

