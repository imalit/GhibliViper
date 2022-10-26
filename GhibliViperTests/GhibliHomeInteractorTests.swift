//
//  GhibliViperTests.swift
//  GhibliViperTests
//
//  Created by Isiah Marie Ramos Malit on 2022-10-19.
//

import XCTest
import Combine
@testable import GhibliViper

class GhibliHomeInteractorTests: XCTestCase {
    
    let service = MockService()
    var anyCancellable: AnyCancellable?
    var interactor: GhibliHomeInteractor?

    override func setUpWithError() throws {
        interactor = GhibliHomeInteractor(service: service)
    }

    override func tearDownWithError() throws {
        interactor = nil
        anyCancellable?.cancel()
    }

    func testFetchMovies() throws {
        let expectation = self.expectation(description: "Interactor fetch movies")
        var personalizedMovies = [PersonalizedMovie]()
        anyCancellable = interactor?.fetchMovies().sink{ movies in
            personalizedMovies = movies
            expectation.fulfill()
        }
        waitForExpectations(timeout: 10)
        XCTAssert(personalizedMovies.count == 4)
    }
    
    func testGetMovies() throws {
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
        let movies = [personalizedMovie, personalizedMovie2]
        interactor?.personalizedMovies = movies
        
        let toWatchMovies = interactor?.getMovies(movieState: .toWatch)
        let watchedMovies = interactor?.getMovies(movieState: .watched)
        
        XCTAssert(toWatchMovies?.count == 1)
        XCTAssert(watchedMovies?.count == 0)
    }
}
