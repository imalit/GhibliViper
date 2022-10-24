//
//  GhibliHomeRouter.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-24.
//

import Foundation
import SwiftUI

//protocol GhibliHomeRouterProtocol {
//    func routeToPage<Content: View>(data: GhibliElement) -> some View
//}

@available(iOS 15.0, *)
class GhibliHomeRouter { //: GhibliHomeRouterProtocol {
    func routeToPage(data: PersonalizedMovie) -> some View {
        let interactor = GhibliMoviePageInteractor(data: data)
        let presenter = GhibliMoviePagePresenter(interactor: interactor)
        return GhibliMoviePageView(presenter: presenter, movieState: data.state)
    }
}
