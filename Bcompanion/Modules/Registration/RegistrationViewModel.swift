//
//  RegistrationViewModel.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/25/21.
//

import Foundation

class RegistrationViewModel : NSObject {
    private var dataManager: DataManager
    
    private(set) var citiesArray : [String]? {
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
        dataManager.callingCitiesList { (cities) in
            self.citiesArray = cities
            print("Cities", self.citiesArray as Any)
        }
    }
}
