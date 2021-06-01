//
//  PlacesViewModel.swift
//  Bcompanion
//
//  Created by Didar Bakhitzhanov on 5/31/21.
//

import Foundation

class PlacesViewModel: NSObject {
    private var dataManager: DataManager
    
    private(set) var placesArray : [Place]? {
        didSet {
            self.bindPlacesToController()
        }
    }
    
    
    var bindPlacesToController : (() -> ()) = {}
    
    init(dataManager: DataManager) {
        self.dataManager = dataManager
        super.init()
        callToDataManager()
    }
    
    private func callToDataManager(){
        let queque = DispatchQueue.global(qos: .utility)
        queque.async {
            self.dataManager.callingPlaces(city: "Алматы") { [weak self]
                (places) in
                self?.placesArray = places
            }
        }
    }
}
