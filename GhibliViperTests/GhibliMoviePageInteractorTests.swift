import XCTest
import Combine
@testable import GhibliViper

class GhibliMoviePageInteractorTests: XCTestCase {
    
    var interactor: GhibliMoviePageInteractor?

    override func setUpWithError() throws {
        let data: PersonalizedMovie = PersonalizedMovie(
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
        interactor = GhibliMoviePageInteractor(data: data)
    }

    override func tearDownWithError() throws {
        interactor = nil
    }
    
    func testSetData() throws {
        interactor?.setState(movieState: .watched)
        XCTAssert(interactor?.data.state == .watched)
    }
}

