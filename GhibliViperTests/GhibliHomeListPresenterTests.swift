import XCTest
import Combine
@testable import GhibliViper

class GhibliHomeListCellPresenterTests: XCTestCase {

    var presenter: GhibliHomeListCellPresenter?

    override func setUpWithError() throws {
        let interactor = MockListInteractor()
        presenter = GhibliHomeListCellPresenter(interactor: interactor)
    }

    override func tearDownWithError() throws {
        presenter = nil
    }

    func testGetData() throws {
        let data = presenter?.getData()

        XCTAssert(data?.ghibliMovie.title == "Ghibli 1")
        XCTAssert(data?.state == MovieState.none)
        XCTAssert(data?.ghibliMovie.id == "123")
    }
}

class MockListInteractor: GhibliHomeListCellInteractorProtocol {
    var data: PersonalizedMovie = PersonalizedMovie(
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
}
