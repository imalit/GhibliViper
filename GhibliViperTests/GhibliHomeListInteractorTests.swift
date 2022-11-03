import XCTest
import Combine
@testable import GhibliViper

class GhibliHomeListCellInteractorTests: XCTestCase {
    
    var interactor: GhibliHomeListCellInteractor?

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
        interactor = GhibliHomeListCellInteractor(data: data)
    }

    override func tearDownWithError() throws {
        interactor = nil
    }
    
    func testData() throws {
        XCTAssert(interactor?.data.ghibliMovie.id == "123")
    }
}
