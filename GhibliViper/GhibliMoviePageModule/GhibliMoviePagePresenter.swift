//
//  GhibliMoviePagePresenter.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-24.
//

import Foundation

protocol GhibliMoviePagePresenterProtocol {
    var interactor: GhibliMoviePageInteractorProtocol { get set }
    func getData() -> PersonalizedMovie
}

class GhibliMoviePagePresenter: GhibliMoviePagePresenterProtocol, ObservableObject {
    var interactor: GhibliMoviePageInteractorProtocol
    
    init(interactor: GhibliMoviePageInteractorProtocol) {
        self.interactor = interactor
    }
    
    func getData() -> PersonalizedMovie {
        return interactor.data
    }
}
