
//  GhibliViperTests.swift
//  GhibliViperTests
//
//  Created by Isiah Marie Ramos Malit on 2022-10-19.
//

import XCTest
import Combine
@testable import GhibliViper

@available(iOS 15.0, *)
class GhibliHomePresenterTests: XCTestCase {
    
    var presenter: GhibliHomePresenter?

    override func setUpWithError() throws {
        let service = MockService()
        let interactor = MockInteractor(service: service)
        presenter = GhibliHomePresenter(interactor: interactor, router: nil)
    }

    override func tearDownWithError() throws {
        presenter = nil
    }

    func testFetchMovies() throws {
        presenter?.movies = []
        presenter?.fetchMovies()
        XCTAssert(presenter?.movies.count == 2)
    }
    
    func testRefreshView() throws {
        presenter?.fetchMovies()
        presenter?.refreshView(viewState: .toWatch)

        
        XCTAssert(presenter?.movies.count == 1)
        
        presenter?.refreshView(viewState: .watched)
        XCTAssert(presenter?.movies.count == 0)
        
        presenter?.refreshView(viewState: .all)
        XCTAssert(presenter?.movies.count == 2)
    }
}

class MockInteractor: GhibliHomeInteractorProtocol {
    var service: ServiceProtocol
    var movies = [PersonalizedMovie]()
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func fetchMovies() -> AnyPublisher<[PersonalizedMovie], Never> {
        let ghibliMovie = GhibliElement(
            id: "123",
            title: "Ghibli 1",
            originalTitle: "",
            originalTitleRomanised: "",
            image: "",
            movieBanner: "",
            ghibliDescription: "",
            director: "",
            producer: "",
            releaseDate: "",
            runningTime: "",
            rtScore: "",
            people: [],
            species: [],
            locations: [],
            vehicles: [],
            url: ""
        )
        
        let ghibliMovie2 = GhibliElement(
            id: "234",
            title: "Ghibli 2",
            originalTitle: "",
            originalTitleRomanised: "",
            image: "",
            movieBanner: "",
            ghibliDescription: "",
            director: "",
            producer: "",
            releaseDate: "",
            runningTime: "",
            rtScore: "",
            people: [],
            species: [],
            locations: [],
            vehicles: [],
            url: ""
        )
        
        let personalizedMovie = PersonalizedMovie(movie: ghibliMovie, state: .none)
        let personalizedMovie2 = PersonalizedMovie(movie: ghibliMovie2, state: .toWatch)
        movies = [personalizedMovie, personalizedMovie2]
        
        return Just(movies).eraseToAnyPublisher()
    }
    
    func filterMovies(movieState: MovieState?) -> [PersonalizedMovie] {
        guard let movieState = movieState else {
            return movies
        }
        
        return movies.filter {
            $0.state == movieState
        }
    }
}

