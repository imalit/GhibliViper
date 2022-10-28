import XCTest
import Combine
@testable import GhibliViper

@available(iOS 15.0, *)
class GhibliMoviePagePresenterTests: XCTestCase {
    
    var presenter: GhibliMoviePagePresenter?

    override func setUpWithError() throws {
        let interactor = MockMovieInteractor()
        presenter = GhibliMoviePagePresenter(interactor: interactor)
    }

    override func tearDownWithError() throws {
        presenter = nil
    }
    
    func testSetData() throws {
        let movie = presenter?.getData()
        XCTAssert(movie?.state == MovieState.none)
        
        presenter?.setState(movieState: .toWatch)
        let updatedMovie = presenter?.getData()
        XCTAssert(updatedMovie?.state == MovieState.toWatch)
    }
}

class MockMovieInteractor: GhibliMoviePageInteractorProtocol {
    var data = PersonalizedMovie(
        movie: GhibliElement(
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
        ),
        state: .none
    )
    
    func setState(movieState: MovieState) {
        data.state = movieState
    }
}


