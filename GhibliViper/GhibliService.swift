//
//  GhibliService.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-20.
//

import Foundation
import Combine

protocol ServiceProtocol {
    var session: URLSession { get set }
    var urlString: String { get set }
    func fetchMovies<T: Decodable>() -> AnyPublisher<T, Error>
}

class GhibliService: ServiceProtocol {
    var session: URLSession
    var urlString: String
    
    init(urlString: String, session: URLSession = URLSession.shared) {
        self.urlString = urlString
        self.session = session
    }
    
    func fetchMovies<T>() -> AnyPublisher<T, Error> where T : Decodable {
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
