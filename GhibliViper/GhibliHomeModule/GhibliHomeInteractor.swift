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
    func fetchMovies() -> AnyPublisher<[PersonalizedMovie], Never>
    func filterMovies(movieState: MovieState?) -> [PersonalizedMovie]
}

class GhibliHomeInteractor: GhibliHomeInteractorProtocol {
    var service: ServiceProtocol
    var personalizedMovies = [PersonalizedMovie]()
    private var cancellables = Set<AnyCancellable>()
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchMovies() -> AnyPublisher<[PersonalizedMovie], Never> {
        service.fetchMovies()
            .map { self.setPersonalizedData(movies: $0) }
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
    
    func filterMovies(movieState: MovieState?) -> [PersonalizedMovie] {
        guard let movieState = movieState else {
            return personalizedMovies
        }
        
        return personalizedMovies.filter {
            $0.state == movieState
        }
    }
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

