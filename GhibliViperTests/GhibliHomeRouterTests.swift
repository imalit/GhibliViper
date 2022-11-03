import XCTest
import Combine
import SwiftUI
@testable import GhibliViper

class GhibliHomeRouterTests: XCTestCase {
    
    var router: GhibliHomeRouter?

    override func setUpWithError() throws {
        router = GhibliHomeRouter()
    }

    override func tearDownWithError() throws {
        router = nil
    }
    
    func testSetData() throws {
        let data = PersonalizedMovie(
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
        let output = router?.routeToPage(data: data)
        
        XCTAssertNotNil(output)
    }
}


