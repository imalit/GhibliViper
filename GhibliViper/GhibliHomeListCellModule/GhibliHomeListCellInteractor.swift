//
//  GhibliHomeListCellInteractor.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-21.
//

import Foundation

protocol GhibliHomeListCellInteractorProtocol {
    var data: PersonalizedMovie { get set }
}

class GhibliHomeListCellInteractor: GhibliHomeListCellInteractorProtocol {
    var data: PersonalizedMovie

    init(data: PersonalizedMovie) {
        self.data = data
    }
}
