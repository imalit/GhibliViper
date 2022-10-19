//
//  GhibliHomeInteractor.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-19.
//

import Foundation
import Combine

protocol ServiceProtocol {
    var session: URLSession { get set }
    func fetchMovies<T: Decodable>(urlString: String) -> AnyPublisher<T, Error>
}

protocol GhibliHomeInteractorProtocol {
    var urlString: String { get set }
}

class GhibliHomeInteractor: GhibliHomeInteractorProtocol {
    var urlString: String
    var session: URLSession
    
    init(urlString: String, session: URLSession = URLSession.shared) {
        self.urlString = urlString
        self.session = session
    }
}

extension GhibliHomeInteractor: ServiceProtocol {
    func fetchMovies<T>(urlString: String) -> AnyPublisher<T, Error> where T : Decodable {
        guard let url = URL(string: urlString) else {
            fatalError("Invalid URL")
        }
        
        return session.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
