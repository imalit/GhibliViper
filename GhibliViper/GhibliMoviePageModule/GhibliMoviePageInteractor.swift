//
//  GhibliMoviePageInteractor.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-24.
//

import Foundation

protocol GhibliMoviePageInteractorProtocol {
    var data: PersonalizedMovie { get set }
}

class GhibliMoviePageInteractor: GhibliMoviePageInteractorProtocol {
    var data: PersonalizedMovie
    
    init(data: PersonalizedMovie) {
        self.data = data
    }
}
