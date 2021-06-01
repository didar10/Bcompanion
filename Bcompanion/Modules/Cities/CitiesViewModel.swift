//
//  CitiesViewModel.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import Foundation

class CitiesViewModel: NSObject {
    private var dataManager: DataManager
    
    private(set) var citiesArray : [City]? {
        didSet {
            self.bindCitiesToController()
        }
    }
    
    
    var bindCitiesToController : (() -> ()) = {}
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init()
        callToDataManager()
    }
    
    private func callToDataManager(){
        let queque = DispatchQueue.global(qos: .utility)
        queque.async {
            self.dataManager.callingCitiesWithPhoto { [weak self]
                (cities) in
                self?.citiesArray  = cities
            }
        }
    }
}
