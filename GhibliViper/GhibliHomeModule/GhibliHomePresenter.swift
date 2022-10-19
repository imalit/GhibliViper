//
//  GhibliHomePresenter.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-19.
//

import Foundation

enum MovieState: Equatable {
    case watched, toWatch, none
}

enum ViewState {
    case all, toWatch, watched
}

protocol GhibliHomePresenterProtocol {
    var interactor: GhibliHomeInteractorProtocol { get set }
}

class GhibliHomePresenter: GhibliHomePresenterProtocol {
    var interactor: GhibliHomeInteractorProtocol
    
    init(interactor: GhibliHomeInteractorProtocol) {
        self.interactor = interactor
    }
}

extension GhibliHomePresenter: ObservableObject {
    
}
