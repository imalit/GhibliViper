//
//  GhibliHomeListCellPresenter.swift
//  GhibliViper
//
//  Created by Isiah Marie Ramos Malit on 2022-10-21.
//

import Foundation

protocol GhibliHomeListCellPresenterProtocol {
    var interactor: GhibliHomeListCellInteractorProtocol { get set }
    func getData() -> PersonalizedMovie
}

class GhibliHomeListCellPresenter: GhibliHomeListCellPresenterProtocol, ObservableObject {
    var interactor: GhibliHomeListCellInteractorProtocol
    
    init(interactor: GhibliHomeListCellInteractorProtocol) {
        self.interactor = interactor
    }
    
    func getData() -> PersonalizedMovie {
        return interactor.data
    }
}
